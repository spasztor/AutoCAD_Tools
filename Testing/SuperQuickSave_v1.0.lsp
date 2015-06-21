;;; SuperQuickSave.LSP -- Saves autoCAD drawing with everything but the 0 layer frozen and everything (including regaps) purged.
;;
;;; Copyright (C) 2014, Creative Commons License.
;;;
;;; Author: Szabolcs Pasztor <spasztor@goldsmithengineering.com>
;;; Created: 27 August 2014
;;; Modified: 02 March 2015
;;; Version: 1.0.2
;;; Keywords: sss, super, quick, save
;;;
;;; Commentary: This routine first purges everything from the drawing then 
;;;				continues to purge regapps. 
;;;				Finally, it freezes all the layers but the current, saves the
;;;				drawing and then restores the saved layer state. Followed with a regenall
;;;
;;; Code:
(defun c:SSS nil
	;; Purge file:
	(command "purge" "all" "*" "no")
	(command "purge" "regapp" "*" "no")
	
	;; Save Current Layer to 0 and freeze all layers and save.
	(command "layer" "set" "0" "freeze" "*" "")
	(command "qsave")
	
	;; Restore old layer state.
	(command "layerp")
	(command "layerp")
	(command "regenall")
	print "Super Quick Save Complete."
)
;;; SuperQuickSave.LSP