
script align_scale_to_vel_update \{ObjID = Skater Bone = Bone_Board_Truck_Back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
		if ShouldEmit
			<ObjID> ::Obj_GetVelocity
			NormalizeVector <vel>
			<length> = (<length> / <base_vel>)
			SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
			SetSpeedRange min = (<min_vel_range> * <length>)Max = (<max_vel_range> * <length>)
			EmitRate RATE = (<length> * <base_emit_rate>)
			if NOT (<update_pos> = 0)
				<X> = 0
				<Y> = 0
				<z> = 0
				if GotParam \{ get_bone_script }
					<get_bone_script> ObjID = <parentId>
				endif
				<ObjID> ::Obj_GetBonePosition Bone = <Bone>
				<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
				setpos Pos = <pos_offset>
			endif
		else
			if (<base_emit_rate> > 0.0)
				<ObjID> ::Obj_GetVelocity
				NormalizeVector <vel>
				<length> = (<length> / <base_vel>)
				EmitRate RATE = (<length> * <base_emit_rate>)
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script align_scale_size_to_vel_update \{ObjID = Skater Bone = Bone_Board_Truck_Back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
		if ShouldEmit
			<ObjID> ::Obj_GetVelocity
			NormalizeVector <vel>
			<length> = (<length> / <base_vel>)
			SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
			SetSpeedRange min = (<min_vel_range> * <length>)Max = (<max_vel_range> * <length>)
			EmitRate RATE = (<length> * <base_emit_rate>)
			SetParticleSizeScale scaleSize = <length>
			if NOT (<update_pos> = 0)
				<X> = 0
				<Y> = 0
				<z> = 0
				if GotParam \{ get_bone_script }
					<get_bone_script> ObjID = <parentId>
				endif
				<ObjID> ::Obj_GetBonePosition Bone = <Bone>
				<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
				setpos Pos = <pos_offset>
			endif
		else
			if (<base_emit_rate> > 0.0)
				<ObjID> ::Obj_GetVelocity
				NormalizeVector <vel>
				<length> = (<length> / <base_vel>)
				EmitRate RATE = (<length> * <base_emit_rate>)
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script align_to_vel_update \{ObjID = Skater Bone = Bone_Board_Truck_Back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0)}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
		if ShouldEmit
			if CompositeObjectExists name = <ObjID>
				<ObjID> ::Obj_GetVelocity
				NormalizeVector <vel>
				SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
				if NOT (<update_pos> = 0)
					<X> = 0
					<Y> = 0
					<z> = 0
					if GotParam \{ get_bone_script }
						<get_bone_script> ObjID = <parentId>
					endif
					<ObjID> ::Obj_GetBonePosition Bone = <Bone>
					<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
					<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
					<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
					setpos Pos = <pos_offset>
				endif
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script align_to_obj_orient \{ObjID = Skater Bone = Bone_Board_Truck_Back update_pos = 0 pos_offset = (0.0, -2.0, 0.0) emit_scale = 1.0}
	pos0_offset = <pos_offset>
	begin
		if ShouldEmit
			<ObjID> ::Obj_GetOrientation
			<Orient> = ((<X> * (1.0, 0.0, 0.0))+ (<Y> * (0.0, 1.0, 0.0))+ (<z> * (0.0, 0.0, 1.0)))
			NormalizeVector <Orient>
			SetEmitTarget Target = ((<emit_scale> * <norm>))
			if NOT (<update_pos> = 0)
				<X> = 0
				<Y> = 0
				<z> = 0
				<ObjID> ::Obj_GetBonePosition Bone = <Bone>
				<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
				setpos Pos = <pos_offset>
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script emitRate_Speed \{ObjID = Skater minRate = 0 maxRate = 64 minSpeed = 0 maxSpeed = 12}
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	if (<ObjID> = PARENT)
		LockObj_GetParent
		PrintStruct <PARENT>
		ObjID = <PARENT>
	endif
	begin
		<ObjID> ::Obj_GetVelocity
		NormalizeVector <vel>
		if (<length> < <minSpeed>)
			newRate = <minRate>
		else
			if (<length> > <maxSpeed>)
				newRate = <maxRate>
			else
				factor = ((<length> - <minSpeed>)/ <speedDiff>)
				newRate = (<minRate> + (<factor> * <rateDiff>))
			endif
		endif
		EmitRate RATE = <newRate>
		wait \{ 1 Frame }
	repeat
endscript

script emitRate_Size_Speed \{ObjID = Skater minRate = 0 maxRate = 64 minStartSize = (0.4000000059604645, 0.4000000059604645) minEndSize = (1.5, 1.5) maxStartSize = (0.800000011920929, 0.800000011920929) maxEndSize = (3.0, 3.0) minSpeed = 0 maxSpeed = 12}
	JOW_Stars \{ 'emitRate_Size_Speed' }
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	JOW_Stars \{ 'calc size' }
	sizeDiffStart = (<maxStartSize> - <minStartSize>)
	sizeDiffEnd = (<maxEndSize> - <minEndSize>)
	PrintStruct <...>
	JOW_Stars \{ 'begin' }
	begin
		<ObjID> ::Obj_GetVelocity
		NormalizeVector <vel>
		if (<length> < <minSpeed>)
			newRate = <minRate>
			newSize = <minSize>
		else
			if (<length> > <maxSpeed>)
				newRate = <maxRate>
				newSize = <maxSize>
			else
				factor = ((<length> - <minSpeed>)/ <speedDiff>)
				newRate = (<minRate> + (<factor> * <rateDiff>))
				newStartSize = (<minStartSize> + (<factor> * <sizeDiffStart>))
				newEndSize = (<minEndSize> + (<factor> * <sizeDiffEnd>))
			endif
		endif
		EmitRate RATE = <newRate>
		SetParticleSize sw = (<newStartSize>.(1.0, 0.0))sh = (<newStartSize>.(0.0, 1.0))ew = (<newEndSize>.(1.0, 0.0))eh = (<newEndSize>.(0.0, 1.0))
		wait \{ 1 Frame }
	repeat
endscript

script rotDir_Turn \{ ObjID = Skater minRot = 0.0 maxRot = 0.3 }
	begin
		if <ObjID> ::IsTurningLeft
			SetRotate min = (-1 * <minRot>)Max = (-1 * <maxRot>)
		elseif <ObjID> ::IsTurningRight
			SetRotate min = <minRot> Max = <maxRot>
		else
			SetRotate min = (-1 * <minRot>)Max = <minRot>
		endif
		wait \{ 0.1 seconds }
	repeat
endscript

script starPower_Butterflies \{sMinW = 1.0 sMaxW = 0.4 eMinH = 0.2 sMaxW = 0.1 sMinH = 0.05 sMaxH = 0.5 eMinH = 0.02 sMaxH = 0.1 cycleTime = 0.5 updateTime = 0.05}
	numSteps = (<cycleTime> / <updateTime>)
	sWStepSize = (2.0 * (<sMaxW> - <sMinW>)/ <numSteps>)
	eWStepSize = (2.0 * (<eMaxW> - <eMinW>)/ <numSteps>)
	sHStepSize = (2.0 * (<sMaxH> - <sMinH>)/ <numSteps>)
	eHStepSize = (2.0 * (<eMaxH> - <eMinH>)/ <numSteps>)
	f = <numSteps>
	casttointeger \{ f }
	f = (0.1 * randomrange (0.0, 10.0) * <f>)
	sCurW = (<sMinW> + (<f> * <sHStepSize>))
	eCurW = (<eMinW> + (<f> * <sHStepSize>))
	sCurH = (<sMinH> + (<f> * <sHStepSize>))
	eCurH = (<eMinH> + (<f> * <sHStepSize>))
	factor = 1.0
	begin
		if (<sCurH> < <sMinH> || <eCurH> < <eMinH>)
			sCurW = <sMinW>
			eCurW = <eMinW>
			sCurH = <sMinH>
			eCurH = <eMinH>
			factor = (-1.0 * <factor>)
		elseif (<sCurH> > <sMaxH> || <eCurH> > <eMaxH>)
			sCurW = <sMaxW>
			eCurW = <eMaxW>
			sCurH = <sMaxH>
			eCurH = <eMaxH>
			factor = (-1.0 * <factor>)
		endif
		SetParticleSize sw = <sCurW> ew = <eCurW> sh = <sCurH> eh = <eCurH>
		sCurW = (<sCurW> + (<factor> * <sWStepSize>))
		eCurW = (<eCurW> + (<factor> * <eWStepSize>))
		sCurH = (<sCurH> + (<factor> * <sHStepSize>))
		eCurH = (<eCurH> + (<factor> * <eHStepSize>))
		wait <updateTime> seconds
	repeat
endscript
