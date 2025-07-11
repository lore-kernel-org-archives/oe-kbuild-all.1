Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F31D6DB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752260831; cv=none; b=RGeOFtI8LW5QOnA+QkR1WuSP4+c9tCj7FufNzdtmmInQmU6kIYqZvTpiXtoANvuYqfxHAEK1CZfCZOxkatzE6mhOOcIb4YUWqEbWk2YV4XrWeSDfkFIZKa86YWna/WwjilBMLZgy5eMiV6h/HCf1cDyZbl8VKS9nyL+lQzxx/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752260831; c=relaxed/simple;
	bh=zjHCk+esSbqdHK0YclQJ8TYcaIRRHWIc/zCGqlP6pJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oyz2VeIGM1BRAHE5q3wvjSedHtX8eeZ0dONzYErORjFX1ttiDdLOEe2VTXHv65BrAVwWc46DQj3a6E/tlmta7OgA2Uu58qjRMNxnQCwcL6LRF2ovEvdMdAQnVL3vQ4PndDTYadr6egLRiI4/C5RtvwaxocgvnTwVphZyeCtER6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzH+fe4G; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzH+fe4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752260829; x=1783796829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjHCk+esSbqdHK0YclQJ8TYcaIRRHWIc/zCGqlP6pJ0=;
  b=XzH+fe4GYl8eoh7r5pKBpjBS95Fu0AG3Ptgbuq5hDph1R5h6FKmc7rm6
   aKwsTXEII5RC7IY0/B5SPtoMEypemZnwykaQesO3Cz506TpZwmgzxqoOV
   syYgBtMGHmXXXmn1mqFfjlejVGxlBHhZfpyFmB1GUQ3FdGwa4ECVz8Lbs
   KXPnticbIe3FBpdCM3/UkhAH0gu9pJtHQjVk2dUvCI55XkwXLHYkWfkzD
   eUNTy021AIdhu7DnflrHKdCULblrHfjIWld/V7UlQzwFU32PcQU3kpet5
   dxBy2EdXSbA1W9djtvEyeZ9hmKQzLIozHRRbt1spXYg36p2Z62QhWvfhM
   Q==;
X-CSE-ConnectionGUID: IfJBR2CUS3GvJOsSJV4cOQ==
X-CSE-MsgGUID: xwZa1M4tR9uz1T6v0UY8fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54694886"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="54694886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 12:07:09 -0700
X-CSE-ConnectionGUID: gJmLPpJDQkqVy2ki0g7cHg==
X-CSE-MsgGUID: 8PsGbemvSQiwbgg37s6APg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="156994430"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jul 2025 12:07:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaJ5M-0006iR-32;
	Fri, 11 Jul 2025 19:07:04 +0000
Date: Sat, 12 Jul 2025 03:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_mm_cid_batches 4/4] kernel/rseq.c:450:8: error:
 'struct task_struct' has no member named 'cid_work_to_enqueue'
Message-ID: <202507120242.0e4I4OKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_mm_cid_batches
head:   2837c05d146bb5cae04931c67f18ee689edfe9df
commit: 2837c05d146bb5cae04931c67f18ee689edfe9df [4/4] fixup reliability batch
config: riscv-randconfig-001-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120242.0e4I4OKf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120242.0e4I4OKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120242.0e4I4OKf-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rseq.c: In function '__rseq_handle_notify_resume':
>> kernel/rseq.c:450:8: error: 'struct task_struct' has no member named 'cid_work_to_enqueue'
     if (!t->cid_work_to_enqueue) {
           ^~
   kernel/rseq.c:451:4: error: 'struct task_struct' has no member named 'cid_work_to_enqueue'
      t->cid_work_to_enqueue = true;
       ^~
   kernel/rseq.c:456:4: error: 'struct task_struct' has no member named 'cid_work_to_enqueue'
      t->cid_work_to_enqueue = false;
       ^~


vim +450 kernel/rseq.c

   412	
   413	/*
   414	 * This resume handler must always be executed between any of:
   415	 * - preemption,
   416	 * - signal delivery,
   417	 * and return to user-space.
   418	 *
   419	 * This is how we can ensure that the entire rseq critical section
   420	 * will issue the commit instruction only if executed atomically with
   421	 * respect to other threads scheduled on the same CPU, and with respect
   422	 * to signal handlers.
   423	 */
   424	void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
   425	{
   426		struct task_struct *t = current;
   427		int ret, sig;
   428	
   429		if (unlikely(t->flags & PF_EXITING))
   430			return;
   431	
   432		/*
   433		 * regs is NULL if and only if the caller is in a syscall path.  Skip
   434		 * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
   435		 * kill a misbehaving userspace on debug kernels.
   436		 */
   437		if (regs) {
   438			ret = rseq_ip_fixup(regs);
   439			if (unlikely(ret < 0))
   440				goto error;
   441		}
   442		if (unlikely(rseq_update_cpu_node_id(t)))
   443			goto error;
   444		/*
   445		 * The mm_cid scan runs in batches and the totality of batches runs
   446		 * pseudo periodically (validated in mm_cid_needs_scan, delaying only
   447		 * the first batch). Intermediate batches can run as soon as possible
   448		 * but shouldn't run in the same call to exit_to_user_mode_loop.
   449		 */
 > 450		if (!t->cid_work_to_enqueue) {
   451			t->cid_work_to_enqueue = true;
   452			return;
   453		}
   454		if (mm_cid_needs_scan(t->mm)) {
   455			task_queue_mm_cid(t);
   456			t->cid_work_to_enqueue = false;
   457		}
   458		return;
   459	
   460	error:
   461		sig = ksig ? ksig->sig : 0;
   462		force_sigsegv(sig);
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
