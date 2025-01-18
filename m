Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9C04A28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 17:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737221565; cv=none; b=jor+hAnJan38nUkNObX9QQUEs3e2y1QV4RIeTPn3DVX2tBj0nYXP0N/nZV/31wJ5xWgBvtiTvObbLJc5tFLmXg+nlQ45PAbmpiU5r4Hsrvh+h1jduMcp4PhswD1tbM2O+D5svQwFeIdP5RO5KGOXphe2PuhACn9Xkk/l5OLVCQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737221565; c=relaxed/simple;
	bh=lsFQ7fehgEn/24kAIjTC0frlzxCYGnqmNA+a9ANu988=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTsEhowusaWeNTti++SfL0hY+HPMzXJerNCHVQxb1XtkWLAyVOzn+TpmMl6bHhHCUmwHwBIWMhtGQoqbiLvX/fr0guL1Dp/REFdQWpPMGBlhzPP6w9Pp4VCK8Y5OEkbLJGFDRCYPzFlRIP6ES5N257MM7yfzJ4jhb5eNEe+YmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUA9Rt/n; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUA9Rt/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737221564; x=1768757564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsFQ7fehgEn/24kAIjTC0frlzxCYGnqmNA+a9ANu988=;
  b=BUA9Rt/naGJWBovfrtCe2RndAbnb+COBfswzNg/7/MCQN+dkQP0jJTZT
   lXaJslZVERxJYFTwqW2wX9110VZ+dzGG7xKi6ZRRTxqZAwioMQ5yYXNB3
   Z/CmLqZpY+s2K04+gkgJho4C5UHbEbvGy/4/4W9+l9/z9mafMmL2HLlf5
   JNY/3h+s7d6NGH/UT0nTTO5go6Ee1l/crsXH+A9nKdvxLx3/LbKiSWJJz
   3/1J2lYEQGK2Dbq5XaXy72yoIQq/oREkOZicjt8HO0Aar/3kigR9yO9i3
   MNRanJ7VmpfCl0oYC4J5Ib4fOx3yGTVp6p0S+gf21Od1WEwtjjafHQQCE
   Q==;
X-CSE-ConnectionGUID: fW4115DnSLiOZuks2An+wA==
X-CSE-MsgGUID: izLbn7YsT/GKPicSxIMe9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="40445830"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="40445830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 09:32:43 -0800
X-CSE-ConnectionGUID: u2TEm51nR/K0g8Nb92o09Q==
X-CSE-MsgGUID: zXEmHHuVQamBK0J3Vzbv0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110717328"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2025 09:32:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZCgZ-000Ufb-2c;
	Sat, 18 Jan 2025 17:32:39 +0000
Date: Sun, 19 Jan 2025 01:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Deven Bowers <deven.desai@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Fan Wu <wufan@linux.microsoft.com>
Subject: security/ipe/hooks.c:52: warning: Function parameter or struct
 member '__always_unused' not described in 'ipe_mmap_file'
Message-ID: <202501190149.qVdSAbjh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 52443cb60c356707df494910fa134bbb0a8b1a66 ipe: add LSM hooks on execution and kernel read
date:   5 months ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250119/202501190149.qVdSAbjh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190149.qVdSAbjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190149.qVdSAbjh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/ipe/hooks.c:52: warning: Function parameter or struct member '__always_unused' not described in 'ipe_mmap_file'
>> security/ipe/hooks.c:52: warning: Excess function parameter 'reqprot' description in 'ipe_mmap_file'
>> security/ipe/hooks.c:80: warning: Function parameter or struct member '__always_unused' not described in 'ipe_file_mprotect'
>> security/ipe/hooks.c:80: warning: Excess function parameter 'reqprot' description in 'ipe_file_mprotect'


vim +52 security/ipe/hooks.c

    34	
    35	/**
    36	 * ipe_mmap_file() - ipe security hook function for mmap check.
    37	 * @f: File being mmap'd. Can be NULL in the case of anonymous memory.
    38	 * @reqprot: The requested protection on the mmap, passed from usermode.
    39	 * @prot: The effective protection on the mmap, resolved from reqprot and
    40	 *	  system configuration.
    41	 * @flags: Unused.
    42	 *
    43	 * This hook is called when a file is loaded through the mmap
    44	 * family of system calls.
    45	 *
    46	 * Return:
    47	 * * %0		- Success
    48	 * * %-EACCES	- Did not pass IPE policy
    49	 */
    50	int ipe_mmap_file(struct file *f, unsigned long reqprot __always_unused,
    51			  unsigned long prot, unsigned long flags)
  > 52	{
    53		struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
    54	
    55		if (prot & PROT_EXEC) {
    56			ipe_build_eval_ctx(&ctx, f, IPE_OP_EXEC);
    57			return ipe_evaluate_event(&ctx);
    58		}
    59	
    60		return 0;
    61	}
    62	
    63	/**
    64	 * ipe_file_mprotect() - ipe security hook function for mprotect check.
    65	 * @vma: Existing virtual memory area created by mmap or similar.
    66	 * @reqprot: The requested protection on the mmap, passed from usermode.
    67	 * @prot: The effective protection on the mmap, resolved from reqprot and
    68	 *	  system configuration.
    69	 *
    70	 * This LSM hook is called when a mmap'd region of memory is changing
    71	 * its protections via mprotect.
    72	 *
    73	 * Return:
    74	 * * %0		- Success
    75	 * * %-EACCES	- Did not pass IPE policy
    76	 */
    77	int ipe_file_mprotect(struct vm_area_struct *vma,
    78			      unsigned long reqprot __always_unused,
    79			      unsigned long prot)
  > 80	{
    81		struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
    82	
    83		/* Already Executable */
    84		if (vma->vm_flags & VM_EXEC)
    85			return 0;
    86	
    87		if (prot & PROT_EXEC) {
    88			ipe_build_eval_ctx(&ctx, vma->vm_file, IPE_OP_EXEC);
    89			return ipe_evaluate_event(&ctx);
    90		}
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
