Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4261849
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 02:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720839243; cv=none; b=C5kaCT7/RN9qVG4FzJLG+UFLregvA0yVP3fKF7pjchLmg3X4sHAgawJ6ALY5sDb2ZSLUHJnThuQZANjZ9AdNqmYLxyonmbW+XdGpMpCGLaVSblXSiT9FyaxUmMPQc4di6rm6GOhhgIAMf1raUmnVzd4Uk4bDJGg2NH66Y2TczMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720839243; c=relaxed/simple;
	bh=+hW3dslKMBehInYZTpc0WsFHqrfzfoHe2Uet7/Iy2WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RCbAyOtmStdDrPTihcyjc0HSXxFmekxovUeEvabwKzUOdr4nsBTUqqF89XKdCqsnBQYxM89dgMKFD+sjzhNKssZccH1CHUshllbwruLPmBrKmk1HnE80VA9kmRcbzuAC6gMhkASpiS1qnquqmdbpUvKJqf/v8EjrimQ1vCFHn8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFwhiCe0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFwhiCe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720839241; x=1752375241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hW3dslKMBehInYZTpc0WsFHqrfzfoHe2Uet7/Iy2WU=;
  b=PFwhiCe0osVhtrqBTxT0tR72Y9epPdBwemZdlaKwc4Cg8DSqwMtjUrJJ
   HbsyI+VHROgrAqbPMMcZ9MULl9SBVkGQQFKnTaXd0Hdov7Mxtx+O+je8N
   tvlewzravCgRIArdP6D/cHI2kFAKsWfLC6sIf5y2PGq8FHZ3gthUeqUxr
   g1gv01+kS5Xil1l9XHWwOXvaQKL9sZ+V1lQ57UURZ9AEUKd0uv6rZ8NVn
   thaCEfezbcfs4M+nraJ3ACTocVly09cQHLLymtpQNKyxMhaH7vZVUtYLZ
   9wWW0Wdd0PMISADKYiQ7Bz/Vin9HX6eBkQ0ijdnEThupJa+mlXPOnewVO
   A==;
X-CSE-ConnectionGUID: jhbNA/3vSV6QiT100GNm9Q==
X-CSE-MsgGUID: OKdY8F49SnqopYL1MIzO4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28889768"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="28889768"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 19:54:01 -0700
X-CSE-ConnectionGUID: du7iqGqZQYuapV56jaEUkA==
X-CSE-MsgGUID: yEVecjkeRCum9HMZSjFcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="86591377"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jul 2024 19:54:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSStZ-000baQ-03;
	Sat, 13 Jul 2024 02:53:57 +0000
Date: Sat, 13 Jul 2024 10:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [linux-next:master 12502/12880]
 drivers/gpu/drm/xe/xe_guc_submit.c:1164:52: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202407131049.PQilkG1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: f6ca930d974e473fd608fc9aa1759fbe731fe44d [12502/12880] drm/xe: Add process name and PID to job timedout message
config: x86_64-randconfig-123-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131049.PQilkG1A-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131049.PQilkG1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131049.PQilkG1A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_submit.c:1164:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct pid *pid @@     got struct pid [noderef] __rcu *pid @@
   drivers/gpu/drm/xe/xe_guc_submit.c:1164:52: sparse:     expected struct pid *pid
   drivers/gpu/drm/xe/xe_guc_submit.c:1164:52: sparse:     got struct pid [noderef] __rcu *pid

vim +1164 drivers/gpu/drm/xe/xe_guc_submit.c

  1054	
  1055	static enum drm_gpu_sched_stat
  1056	guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
  1057	{
  1058		struct xe_sched_job *job = to_xe_sched_job(drm_job);
  1059		struct xe_sched_job *tmp_job;
  1060		struct xe_exec_queue *q = job->q;
  1061		struct xe_gpu_scheduler *sched = &q->guc->sched;
  1062		struct xe_guc *guc = exec_queue_to_guc(q);
  1063		const char *process_name = "no process";
  1064		struct task_struct *task = NULL;
  1065		int err = -ETIME;
  1066		pid_t pid = -1;
  1067		int i = 0;
  1068		bool wedged, skip_timeout_check;
  1069	
  1070		/*
  1071		 * TDR has fired before free job worker. Common if exec queue
  1072		 * immediately closed after last fence signaled.
  1073		 */
  1074		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
  1075			guc_exec_queue_free_job(drm_job);
  1076	
  1077			return DRM_GPU_SCHED_STAT_NOMINAL;
  1078		}
  1079	
  1080		/* Kill the run_job entry point */
  1081		xe_sched_submission_stop(sched);
  1082	
  1083		/* Must check all state after stopping scheduler */
  1084		skip_timeout_check = exec_queue_reset(q) ||
  1085			exec_queue_killed_or_banned_or_wedged(q) ||
  1086			exec_queue_destroyed(q);
  1087	
  1088		/* Job hasn't started, can't be timed out */
  1089		if (!skip_timeout_check && !xe_sched_job_started(job))
  1090			goto rearm;
  1091	
  1092		/*
  1093		 * XXX: Sampling timeout doesn't work in wedged mode as we have to
  1094		 * modify scheduling state to read timestamp. We could read the
  1095		 * timestamp from a register to accumulate current running time but this
  1096		 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
  1097		 * genuine timeouts.
  1098		 */
  1099		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
  1100	
  1101		/* Engine state now stable, disable scheduling to check timestamp */
  1102		if (!wedged && exec_queue_registered(q)) {
  1103			int ret;
  1104	
  1105			if (exec_queue_reset(q))
  1106				err = -EIO;
  1107	
  1108			if (!exec_queue_destroyed(q)) {
  1109				/*
  1110				 * Wait for any pending G2H to flush out before
  1111				 * modifying state
  1112				 */
  1113				ret = wait_event_timeout(guc->ct.wq,
  1114							 !exec_queue_pending_enable(q) ||
  1115							 guc_read_stopped(guc), HZ * 5);
  1116				if (!ret || guc_read_stopped(guc))
  1117					goto trigger_reset;
  1118	
  1119				/*
  1120				 * Flag communicates to G2H handler that schedule
  1121				 * disable originated from a timeout check. The G2H then
  1122				 * avoid triggering cleanup or deregistering the exec
  1123				 * queue.
  1124				 */
  1125				set_exec_queue_check_timeout(q);
  1126				disable_scheduling(q, skip_timeout_check);
  1127			}
  1128	
  1129			/*
  1130			 * Must wait for scheduling to be disabled before signalling
  1131			 * any fences, if GT broken the GT reset code should signal us.
  1132			 *
  1133			 * FIXME: Tests can generate a ton of 0x6000 (IOMMU CAT fault
  1134			 * error) messages which can cause the schedule disable to get
  1135			 * lost. If this occurs, trigger a GT reset to recover.
  1136			 */
  1137			smp_rmb();
  1138			ret = wait_event_timeout(guc->ct.wq,
  1139						 !exec_queue_pending_disable(q) ||
  1140						 guc_read_stopped(guc), HZ * 5);
  1141			if (!ret || guc_read_stopped(guc)) {
  1142	trigger_reset:
  1143				if (!ret)
  1144					xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
  1145				set_exec_queue_extra_ref(q);
  1146				xe_exec_queue_get(q);	/* GT reset owns this */
  1147				set_exec_queue_banned(q);
  1148				xe_gt_reset_async(q->gt);
  1149				xe_sched_tdr_queue_imm(sched);
  1150				goto rearm;
  1151			}
  1152		}
  1153	
  1154		/*
  1155		 * Check if job is actually timed out, if so restart job execution and TDR
  1156		 */
  1157		if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
  1158		    !exec_queue_reset(q) && exec_queue_registered(q)) {
  1159			clear_exec_queue_check_timeout(q);
  1160			goto sched_enable;
  1161		}
  1162	
  1163		if (q->vm && q->vm->xef) {
> 1164			task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
  1165			if (task) {
  1166				process_name = task->comm;
  1167				pid = task->pid;
  1168			}
  1169		}
  1170		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
  1171			     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
  1172			     q->guc->id, q->flags, process_name, pid);
  1173		if (task)
  1174			put_task_struct(task);
  1175	
  1176		trace_xe_sched_job_timedout(job);
  1177	
  1178		if (!exec_queue_killed(q))
  1179			xe_devcoredump(job);
  1180	
  1181		/*
  1182		 * Kernel jobs should never fail, nor should VM jobs if they do
  1183		 * somethings has gone wrong and the GT needs a reset
  1184		 */
  1185		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
  1186			   "Kernel-submitted job timed out\n");
  1187		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
  1188			   "VM job timed out on non-killed execqueue\n");
  1189		if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
  1190				(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
  1191			if (!xe_sched_invalidate_job(job, 2)) {
  1192				clear_exec_queue_check_timeout(q);
  1193				xe_gt_reset_async(q->gt);
  1194				goto rearm;
  1195			}
  1196		}
  1197	
  1198		/* Finish cleaning up exec queue via deregister */
  1199		set_exec_queue_banned(q);
  1200		if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
  1201			set_exec_queue_extra_ref(q);
  1202			xe_exec_queue_get(q);
  1203			__deregister_exec_queue(guc, q);
  1204		}
  1205	
  1206		/* Stop fence signaling */
  1207		xe_hw_fence_irq_stop(q->fence_irq);
  1208	
  1209		/*
  1210		 * Fence state now stable, stop / start scheduler which cleans up any
  1211		 * fences that are complete
  1212		 */
  1213		xe_sched_add_pending_job(sched, job);
  1214		xe_sched_submission_start(sched);
  1215	
  1216		xe_guc_exec_queue_trigger_cleanup(q);
  1217	
  1218		/* Mark all outstanding jobs as bad, thus completing them */
  1219		spin_lock(&sched->base.job_list_lock);
  1220		list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
  1221			xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
  1222		spin_unlock(&sched->base.job_list_lock);
  1223	
  1224		/* Start fence signaling */
  1225		xe_hw_fence_irq_start(q->fence_irq);
  1226	
  1227		return DRM_GPU_SCHED_STAT_NOMINAL;
  1228	
  1229	sched_enable:
  1230		enable_scheduling(q);
  1231	rearm:
  1232		/*
  1233		 * XXX: Ideally want to adjust timeout based on current exection time
  1234		 * but there is not currently an easy way to do in DRM scheduler. With
  1235		 * some thought, do this in a follow up.
  1236		 */
  1237		xe_sched_add_pending_job(sched, job);
  1238		xe_sched_submission_start(sched);
  1239	
  1240		return DRM_GPU_SCHED_STAT_NOMINAL;
  1241	}
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
