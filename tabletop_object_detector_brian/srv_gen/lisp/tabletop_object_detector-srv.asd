
(cl:in-package :asdf)

(defsystem "tabletop_object_detector-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :household_objects_database_msgs-msg
               :sensor_msgs-msg
               :tabletop_object_detector-msg
)
  :components ((:file "_package")
    (:file "TabletopObjectRecognition" :depends-on ("_package_TabletopObjectRecognition"))
    (:file "_package_TabletopObjectRecognition" :depends-on ("_package"))
    (:file "TabletopDetection" :depends-on ("_package_TabletopDetection"))
    (:file "_package_TabletopDetection" :depends-on ("_package"))
    (:file "SegmentObjectInHand" :depends-on ("_package_SegmentObjectInHand"))
    (:file "_package_SegmentObjectInHand" :depends-on ("_package"))
    (:file "AddModelExclusion" :depends-on ("_package_AddModelExclusion"))
    (:file "_package_AddModelExclusion" :depends-on ("_package"))
    (:file "NegateExclusions" :depends-on ("_package_NegateExclusions"))
    (:file "_package_NegateExclusions" :depends-on ("_package"))
    (:file "ClearExclusionsList" :depends-on ("_package_ClearExclusionsList"))
    (:file "_package_ClearExclusionsList" :depends-on ("_package"))
    (:file "TabletopSegmentation" :depends-on ("_package_TabletopSegmentation"))
    (:file "_package_TabletopSegmentation" :depends-on ("_package"))
  ))