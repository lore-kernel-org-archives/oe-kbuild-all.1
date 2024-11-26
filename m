Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72B1D5AD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630214; cv=none; b=fPKTH3t/cHYg5QNKTuKKqZqEoq4QHZiSmnwgbzpE8dqtDs3iWdIPpTXTh2nX4izgV0EZ0fucfMtjv6FuI1U0QGtMiqsuNvG3MDuxNjH8q4104Kk5mV9P52CSo4l4CblN1pnVK5GtRsG0ce/kQ3t+90F/p+78VboecmwMJ5FlOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630214; c=relaxed/simple;
	bh=HQYMATCzU7aqclW9KUyYpgnRtNXCz7UCQjHbLW1C1JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ed79USynVTggQgMrNMt8D/l4MFYeltqdQYcZlM4ZV+UcCA2XR2gfbAO18i9CDYEqstXQ8IBSOYVScCegHS80S02CKmkpkHtkVmXrouuqKKCnq2Rjbp3PtyVCvaZepakYwJ5zBi7+UBTOzQgO9an61Od8VIZo1FIZRrNaFmepJSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrOa8hCt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrOa8hCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732630213; x=1764166213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQYMATCzU7aqclW9KUyYpgnRtNXCz7UCQjHbLW1C1JM=;
  b=QrOa8hCt81fRkMs43WFLIq5YUl94kHZFzhIqalH6Yh+fL5r4sHddE3hM
   bBFgKogSxDtGdYJ87wJAUp7opxAdbs4c3UvKdza4g7LhJv+Lr4AkgixQ4
   +VBV7ujvimKm5blhVFYkzAGcF0DTMiEYzccmsyZRgtjXMgaZ/KWGXe3AG
   jIcBENLkbHF0LikRFmXFMqJ8Gm6glr714M2Rhs2zrUb5o8ZFp4XrcEypl
   y3OybauPXkDmlbSyW6t+HXJ1nQb2wf3JDqK3lLAuajFR9C1y2uNfdPvB5
   wwHgocbuFuaub72MczNt/FW7I/wyljVScgxMBdXvmeOj64aXRbDrY3GEW
   A==;
X-CSE-ConnectionGUID: bfGQQKz0ScOORvudWBusdg==
X-CSE-MsgGUID: +qZn5u5XT+uSUEHkWjPsOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="35650118"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="35650118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 06:10:12 -0800
X-CSE-ConnectionGUID: 5tCbFN42R5KdqshAWV2oeA==
X-CSE-MsgGUID: Vrfv8znWTHyNSthSZrJaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="122474022"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 06:10:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFwGW-0007KL-2T;
	Tue, 26 Nov 2024 14:10:08 +0000
Date: Tue, 26 Nov 2024 22:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 7/7] vmlinux.o: warning: objtool:
 vmx_l1d_flush+0x0: non-RO static key usage for 'vmx_l1d_flush_cond' in
 noinstr
Message-ID: <202411262258.lzY3f3jn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-noinstr
head:   fac7e09eefcc90f2cb34afeb1d0c52bfd1f25857
commit: fac7e09eefcc90f2cb34afeb1d0c52bfd1f25857 [7/7] objtool: Add noinstr validation for static branches/calls
config: x86_64-buildonly-randconfig-003-20241126 (https://download.01.org/0day-ci/archive/20241126/202411262258.lzY3f3jn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411262258.lzY3f3jn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411262258.lzY3f3jn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_l1d_flush+0x0: non-RO static key usage for 'vmx_l1d_flush_cond' in noinstr
>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x2b: non-RO static key usage for 'vmx_l1d_should_flush' in noinstr
   vmlinux.o: warning: objtool: local_clock_noinstr+0x4: non-RO static key usage for '__sched_clock_stable' in noinstr
>> vmlinux.o: warning: objtool: stackleak_erase+0x0: non-RO static key usage for 'stack_erasing_bypass' in noinstr
>> vmlinux.o: warning: objtool: stackleak_erase_on_task_stack+0x0: non-RO static key usage for 'stack_erasing_bypass' in noinstr
>> vmlinux.o: warning: objtool: stackleak_erase_off_task_stack+0x0: non-RO static key usage for 'stack_erasing_bypass' in noinstr
   vmlinux.o: warning: objtool: default_idle+0x4: non-RO static key usage for 'mds_idle_clear' in noinstr
   vmlinux.o: warning: objtool: mwait_idle+0x31: non-RO static key usage for 'mds_idle_clear' in noinstr
   vmlinux.o: warning: objtool: arch_cpu_idle+0x4: non-RO static call usage for 'x86_idle' in noinstr
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x89: non-RO static key usage for 'mds_idle_clear' in noinstr
>> vmlinux.o: warning: objtool: intel_idle+0x44: non-RO static key usage for 'mds_idle_clear' in noinstr
>> vmlinux.o: warning: objtool: intel_idle_irq+0x44: non-RO static key usage for 'mds_idle_clear' in noinstr
>> vmlinux.o: warning: objtool: intel_idle_s2idle+0x4f: non-RO static key usage for 'mds_idle_clear' in noinstr
>> vmlinux.o: warning: objtool: intel_idle_xstate+0x4e: non-RO static key usage for 'mds_idle_clear' in noinstr
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0x4e: non-RO static key usage for 'mds_idle_clear' in noinstr
   vmlinux.o: warning: objtool: acpi_safe_halt+0x12: non-RO static key usage for 'mds_idle_clear' in noinstr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
