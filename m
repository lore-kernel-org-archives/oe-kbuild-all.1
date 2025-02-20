Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366C1C3C18
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087236; cv=none; b=IW1G/4sMlv/U8QvKQUehjbvqjEC0zx6gtFiiUfcnq5taOcUkmLXuVy5IWq4XZYVyOCbu1lZXshQnJnrZT6oTJHZMux9Q4jIN4wE5WEyM6Rd3F7TWpyjjsHydQmaRrD7MiL2Yb3do8tBasU6s77ENYTQY6IeZjmeYh+IszbqYwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087236; c=relaxed/simple;
	bh=Zc2WVwnAP5GcP01zUUQhJ3ecg8lb8r2WOdu5vZTgDYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrlkdZCU2DKHipL0UqfOmViOdAC81i+qm4M/lvZqfXCBZJMmUtOuLStSLmlmmP0cV5OjMj0FM8IEj6quHMAZELVV4Uslkdx/eAzvVKXmam4o4t9GNLcrHJEbTvSElmOBvu0BHjfsthzjmQyM/OguxCSFd3n173GEyWIzt4PUCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TP9wSKYI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP9wSKYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740087232; x=1771623232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zc2WVwnAP5GcP01zUUQhJ3ecg8lb8r2WOdu5vZTgDYI=;
  b=TP9wSKYI2WX30LiAtxrftwUb66rDnWj+MtGoZE4UBV38YNEZrjz1IG+W
   RQsMBuZhHW2OW0zQ0wN7ENBmnmafF9o3OJOrEGCR1hjzZJS9pjR6pK3zD
   AYyZKXgR/UOww9bNRr0AWhDuaBtseRTunCwDScnnxjsqkoqorQWYaWVAm
   uOnpkQ7KvAzEPNeaa00w7rBCkOA58EiTpnsT4SdP0wwgVxLL9BpoxZTlZ
   yZ86YNflNuBWVr/k/9YsbY4X98g7m4sJBnMHt2fUvQoQRhXyAM93GvGfS
   /oylEHO/pRyWG7WYX9rkkIgfYKBMKPWe/P3YF2b35L6zaqytnuAp0Wb3A
   w==;
X-CSE-ConnectionGUID: vSs4yWBGQSikv/VnSeP+SQ==
X-CSE-MsgGUID: U2sdi6f7RhmzQxbyP14TxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28487853"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="28487853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 13:33:51 -0800
X-CSE-ConnectionGUID: Nkj8Y0HdQfu/z1qa9FYStg==
X-CSE-MsgGUID: EK3H11zDTDW6LODlfXbflw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="146033214"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Feb 2025 13:33:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlEB1-0004mZ-2Z;
	Thu, 20 Feb 2025 21:33:47 +0000
Date: Fri, 21 Feb 2025 05:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] kernel/sched/core.c:7724:4:
 error: call to undeclared function 'stack_trace_save_tsk'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202502210535.2R8EYar0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5f63d051ce041cdea246873cd91d9d864f8322cf
commit: b24c1517d9cc137d7ad4d356cc68fd94680ab998 [1/1] ANDROID: Fix invalid caller output in trace_sched_blocked_reason
config: arm-lpc18xx_defconfig (https://download.01.org/0day-ci/archive/20250221/202502210535.2R8EYar0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210535.2R8EYar0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210535.2R8EYar0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:7724:4: error: call to undeclared function 'stack_trace_save_tsk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7724 |                         stack_trace_save_tsk(prev, &blocked_func, 1, 0);
         |                         ^
   1 error generated.


vim +/stack_trace_save_tsk +7724 kernel/sched/core.c

  7676	
  7677		trace_android_rvh_schedule(prev, next, rq);
  7678		if (likely(prev != next)) {
  7679			rq->nr_switches++;
  7680			/*
  7681			 * RCU users of rcu_dereference(rq->curr) may not see
  7682			 * changes to task_struct made by pick_next_task().
  7683			 */
  7684			RCU_INIT_POINTER(rq->curr, next);
  7685	
  7686			if (!task_current_donor(rq, next))
  7687				proxy_tag_curr(rq, next);
  7688	
  7689			/*
  7690			 * The membarrier system call requires each architecture
  7691			 * to have a full memory barrier after updating
  7692			 * rq->curr, before returning to user-space.
  7693			 *
  7694			 * Here are the schemes providing that barrier on the
  7695			 * various architectures:
  7696			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  7697			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  7698			 *   on PowerPC and on RISC-V.
  7699			 * - finish_lock_switch() for weakly-ordered
  7700			 *   architectures where spin_unlock is a full barrier,
  7701			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  7702			 *   is a RELEASE barrier),
  7703			 *
  7704			 * The barrier matches a full barrier in the proximity of
  7705			 * the membarrier system call entry.
  7706			 *
  7707			 * On RISC-V, this barrier pairing is also needed for the
  7708			 * SYNC_CORE command when switching between processes, cf.
  7709			 * the inline comments in membarrier_arch_switch_mm().
  7710			 */
  7711			++*switch_count;
  7712	
  7713			migrate_disable_switch(rq, prev);
  7714			psi_account_irqtime(rq, prev, next);
  7715			psi_sched_switch(prev, next, !task_on_rq_queued(prev) ||
  7716						     prev->se.sched_delayed);
  7717	
  7718			trace_sched_switch(preempt, prev, next, prev_state);
  7719	
  7720			if (block && (prev_state & TASK_UNINTERRUPTIBLE)
  7721				&& trace_sched_blocked_reason_enabled()) {
  7722				unsigned long blocked_func = 0;
  7723	
> 7724				stack_trace_save_tsk(prev, &blocked_func, 1, 0);
  7725				trace_sched_blocked_reason(prev, (void *)blocked_func);
  7726			}
  7727	
  7728			/* Also unlocks the rq: */
  7729			rq = context_switch(rq, prev, next, &rf);
  7730		} else {
  7731			/* In case next was already curr but just got blocked_donor */
  7732			if (prev_not_proxied && next->blocked_donor)
  7733				proxy_tag_curr(rq, next);
  7734	
  7735			rq_unpin_lock(rq, &rf);
  7736			__balance_callbacks(rq);
  7737			raw_spin_rq_unlock_irq(rq);
  7738		}
  7739	}
  7740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
