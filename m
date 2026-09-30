Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B497D19E7F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 04:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790742465; cv=none; b=c4SdQT6wVoSwvSwCNeeCkqKLuZhvDAn1w6YvXd0dfZ4prW7C5efoewX4uIS1+g2mYaNoFKtT5Mpe4BPRbsPUH95zyXJXq69kXGNGzrctqSJENX4DTYHFq0A9Gb9zsxLCVXURPJ9/PzpbvrAUm1hTXbew4uf1QaEjbq5qk1MCyIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790742465; c=relaxed/simple;
	bh=4Mn24gWb5T9iQrofCUmTDtxmkjdbGzrIpTBAfCxXotM=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4SIIoLC7mDoHdpVFBA/BTDH0qggO0Fcn6eg0VD7j0c8/KB9g+NFxAdQu/sQ3jtbqczcBXhMG3Oy5NJVRd+iV0MVmi2lhlHCBZFSUe+XD0PcH+4hLIcp66a7TooCrgPZbk7qWAKcaQsYalLMio2LrLs3fmBHl88Tel9f1v9X7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQn0jiLs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQn0jiLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790742463; x=1822278463;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=4Mn24gWb5T9iQrofCUmTDtxmkjdbGzrIpTBAfCxXotM=;
  b=ZQn0jiLs5KQzN11T3eCCbdpc+3VILQalYpYgv/n6o0o2LEdQnwy89cp+
   FWlmJcEJe0XP3L9a9R0S5fQG4kHIxPQgspuz1J0CvEMe1tqBbFnc6+QWi
   3yxYxD8uYnIle+pQjpc7HLML3Y96syn9aZSwZCLeZpgEi47alyDNG2W8J
   l8Uhl7TI1pMLNaNVqvY1X8n/Ri3yoovCSqjCdoHpqtDAuOnify9OmeYlT
   FfloLddDoohv4pKQ0zQk4YXhb8bGxB7zNU87J/F+nkmdF3kZlUDZdkohy
   An7vyFbZmpA+rYrMfe+HJAFQBMPsH1ov7LuhXuwZOG5A4vpFBrttaaru7
   w==;
X-CSE-ConnectionGUID: khXslhYoQl6uagwPwjo5xw==
X-CSE-MsgGUID: /iIlBfWyQI+xLfkj996ztQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107857933"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="107857933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:27:43 -0700
X-CSE-ConnectionGUID: rKSXEOLZQyCqy8F4sSTCaA==
X-CSE-MsgGUID: IDKLXhRKTa261+YwoSIcRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="283664155"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2026 21:27:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBlut-00000000Q7b-0H3a
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 04:27:39 +0000
Date: Wed, 30 Sep 2026 12:27:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: futex: Fix mm reuse handling for FUT_OFF_MMSHARED
Message-ID: <202609301223.w5jdpXiP-lkp@intel.com>
References: <202609301223.w5jdpXiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609301223.w5jdpXiP-lkp@intel.com>

Hi Jann,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/futex-Fix-mm-reuse-handling-for-FUT_OFF_MMSHARED/20260929-183132
base:   
patch link:    https://lore.kernel.org/r/202609301223.w5jdpXiP-lkp%40intel.com
config: csky-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301223.w5jdpXiP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301223.w5jdpXiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301223.w5jdpXiP-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/fork.o: in function `mm_init.isra.0':
>> fork.c:(.text+0x188c): undefined reference to `futex_mm_init'
>> csky-linux-ld: fork.c:(.text+0x196c): undefined reference to `futex_mm_init'
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/inode.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/inode.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/inode.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   drivers/comedi/drivers/tests/ni_routes_test.o: in function `test_ni_check_trigger_arg':
   ni_routes_test.c:(.text+0x24c2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x24c8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/comedi/drivers/tests/ni_routes_test.o: in function `test_ni_get_reg_value':
   ni_routes_test.c:(.text+0x250c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x2534): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x2552): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x2560): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x2582): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x259e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x25c0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x25dc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   ni_routes_test.c:(.text+0x25fe): additional relocation overflows omitted from the output
   csky-linux-ld: final link failed

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
