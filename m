Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DC81DA5F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725891567; cv=none; b=HQcBVuxgQuIf1cTx+c0ZbOnALCaRPf/fAKVJlIV6ukFeUf75lRf/AWmkhRs4mgBcbFLB6VRECIRFX977iHpjqqcTDmKOzDASd09NdGbbNYPi5fN4tbq9vszEhYcRaU3dNO154wRTNPcxkPc15bv/UeIpjpzqs88Il+p3mpyQ17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725891567; c=relaxed/simple;
	bh=u5PNIKarIWm0sQgathI+0sVqsBQ/k55USDm2Z+I5NTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+w/f5IpHQxKIsQz02Dwf84smICYt0syaAB408myH45vt08UP5Rl4mYhYX+FAXICB7vIqUUSnpkIVMIFyBw434EVRIOB897uEdwyUz6VWqvVTqdhPFxECXCLpfkQHM8uCwf71XKMvdT3Xnuazj8z9EU9EBkkx8hGx50vOQcIPBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xddh/xM2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xddh/xM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725891566; x=1757427566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5PNIKarIWm0sQgathI+0sVqsBQ/k55USDm2Z+I5NTg=;
  b=Xddh/xM2pzL7byHEluarGTFNsZyQdkswB5yBKNVs95dj6HytfvRl4ecF
   Dxh4iYxx79uRgeTGuoBvGkUy8z6Kp7rYkoNBApc/uPgdifVU0jt3h9y3E
   xOv8Ji/6QbRBY6si8jDcZ8jEJPUQs5OKZWkQsfhxu0dycgJgV03V6IZ7M
   gdEofnGGF1NfcVAUqo7uw3fNZ6i7tC8kAP7AUNLModDcdzePEIW8nO5Pt
   cR4Vp+64Cj7+j5ivtzI8sXx0JM7i45pvXcwMAYpGjJw288L09/MiPq9EL
   kASU4pBMR/WwFD+F5Z+31ty1p/VlODGY665JRT0JZ09YTm5QCWTD4klRB
   Q==;
X-CSE-ConnectionGUID: mmOa7NAITPaYNsK3tnMeUA==
X-CSE-MsgGUID: M0X/6WyZS1yj5BKbFbcgEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42099777"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="42099777"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 07:19:25 -0700
X-CSE-ConnectionGUID: UkbXZ8luReCPiOtx44V5Ew==
X-CSE-MsgGUID: mqQEiUUlRk+JY2YCKD9Pzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66475872"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Sep 2024 07:19:23 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snfEe-000Eoi-3B;
	Mon, 09 Sep 2024 14:19:20 +0000
Date: Mon, 9 Sep 2024 22:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 201/258]
 kernel/sched/core.c:3914:25: error: implicit declaration of function
 'stack_trace_save_tsk'
Message-ID: <202409092218.s0v2pzGh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 08354d16b5d03f4594c112c4c540a4a168f6a427 [201/258] trace_sched_wakeup_backtrace
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240909/202409092218.s0v2pzGh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092218.s0v2pzGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092218.s0v2pzGh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'do_trace_sched_wakeup_backtrace':
>> kernel/sched/core.c:3914:25: error: implicit declaration of function 'stack_trace_save_tsk' [-Werror=implicit-function-declaration]
    3914 |                 bt_nr = stack_trace_save_tsk(task, bt, ARRAY_SIZE(bt), 0);
         |                         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/stack_trace_save_tsk +3914 kernel/sched/core.c

  3899	
  3900	static noinline void do_trace_sched_wakeup_backtrace(struct task_struct *task, u64 start_time)
  3901	{
  3902		u64 duration = ktime_get_ns() - start_time;
  3903	
  3904		if (duration < 1000 * 1000)
  3905			return;
  3906	
  3907		if (task->__state & TASK_NOLOAD)
  3908			return;
  3909	
  3910		unsigned long bt[10];
  3911		unsigned bt_nr = 0;
  3912	
  3913		if (down_read_trylock(&task->signal->exec_update_lock)) {
> 3914			bt_nr = stack_trace_save_tsk(task, bt, ARRAY_SIZE(bt), 0);
  3915			up_read(&task->signal->exec_update_lock);
  3916		}
  3917	
  3918		trace_sched_wakeup_backtrace(task, duration, bt, bt_nr);
  3919	}
  3920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
