Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924881E1C3A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506543; cv=none; b=nh+fx+06mwx5WmWzq+YKWkIMrbg4dDVrYx5EjuD4TaH+FxLY6jbDg2FKqFwAXYn3qqXZK8RiWEg2juhu/xwdyOC3bPe89xFvsFD0mLwJ7pZ4sxijmOG0chqtJkQQ1Mlu+XU45b3+ku7986GcVcIswmpUJIpYXA2XRTQLfWnal1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506543; c=relaxed/simple;
	bh=SwcZ1fhTI4ANEcNtmUr8/cmjJpRtlFcGNp09Uxlk7BI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PcSR1EFS5r9fAzgQlUprRkbO4uGkBI/ev88rCthSssmIeDh0eqpQndW6GNbxdOzXg/iRYD0NJ3q7Ml04anN1y0O18mbGcXNBGP884MPOLBueKHQkst46BkLRJYI+VJpMizGiYknpSHrvbJDf0rZ/i/Qf08ZoGjCG5+Z+31REzgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhwUg1/u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhwUg1/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728506541; x=1760042541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwcZ1fhTI4ANEcNtmUr8/cmjJpRtlFcGNp09Uxlk7BI=;
  b=XhwUg1/u+lKDHjuN4L/tptx+6ukXZNsU9SgTvE4XppU2qPQ2gbldy5NL
   l1+qKti0rmTlgIxq5/wzl3XfozTFN22VzOHRGT3/179StPNqD9v7x9Idd
   HiD83fPe0sWJyJ1AX1bjb/uh3sV3dUyInqgGZqSirIpO8/fohSQ2vX6kK
   Ng8RGePHzfE0jmsxASpq1GZyNjSG1C56SYFss701J86i352idIXNkgjOp
   HkVfaPij+vS7PZzwJL7ZEviTsTBydW5O+5VX23pvlsvg+INLldA6/FS7P
   yzpTbLGaQveZrH/4CxynCRAnrIf4hg3hrAoSIfEjN8y6hnQLdEwkIAbjR
   Q==;
X-CSE-ConnectionGUID: otPHzwW0QjCJo4lr/61fyA==
X-CSE-MsgGUID: 3XrITkTTT3Klpm6px1mjtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27315274"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27315274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 13:42:21 -0700
X-CSE-ConnectionGUID: SHsPDrQLR8WVmJbtzwIq9g==
X-CSE-MsgGUID: a3AF5n5bS++PwjpUwffsbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="99692320"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2024 13:42:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sydVh-0009mS-2N;
	Wed, 09 Oct 2024 20:42:17 +0000
Date: Thu, 10 Oct 2024 04:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-deprecated 4/18]
 arch/powerpc/include/asm/hvcall.h:556:1: error: type specifier missing,
 defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202410100446.wMnbqMAP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-deprecated
head:   dcac197b3a60b3c0c8417cae924a5e9f22e2d8ba
commit: 9d18d6239993d7bfb1e5142a4d7b190de0ed2113 [4/18] powerpc/pseries: Convert hcall_tracepoint_key to new static branch API
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241010/202410100446.wMnbqMAP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100446.wMnbqMAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100446.wMnbqMAP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kvm/guest-state-buffer.c:3:
>> arch/powerpc/include/asm/hvcall.h:556:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     556 | DECLARE_STATIC_KEY_FALSE(hcall_tracepoint_key);
         | ^
         | int
>> arch/powerpc/include/asm/hvcall.h:556:26: error: a parameter list without types is only allowed in a function definition
     556 | DECLARE_STATIC_KEY_FALSE(hcall_tracepoint_key);
         |                          ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kvm/guest-state-buffer.c:5:
   In file included from arch/powerpc/include/asm/pgalloc.h:5:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +/int +556 arch/powerpc/include/asm/hvcall.h

   554	
   555	/* pseries hcall tracing */
 > 556	DECLARE_STATIC_KEY_FALSE(hcall_tracepoint_key);
   557	void __trace_hcall_entry(unsigned long opcode, unsigned long *args);
   558	void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf);
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
