Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5211420A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 03:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736565627; cv=none; b=g6jS6QEooCKtqnFrT8xrjsh6kfLPRgxceODnEGcKw1stlqfMkxr4Y6BnGq9eGqYsUEvwX0DqlyQMLyunkpyYpXLnwHFieoP0GZYXWpuo8sWgU/KHahbi2vMwVBzi4/ABX49vPMFQIyI9PG4bCKIGn6trN/2LXlwV0AzgdVCIySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736565627; c=relaxed/simple;
	bh=KmKk2COrZsrCeokXk5O5keFA31orG80CEDIg5t8DvHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUMpIM1gGy7qx1vOw8HukSBw9vpavhGTFYmHm9dxThOj27Aw48QzGrwBSE6g6EXdH6ElB1/PdHPlCrq6nfTCeEtl/fvB5a0b0Isx/a5sW944snZCqSSz+Ks3/HdqdRbA9sC0n6LqV50assaPYtg0YVfFHP5Pu8WyIYF+cMX+AT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNA6tk+S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNA6tk+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736565626; x=1768101626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmKk2COrZsrCeokXk5O5keFA31orG80CEDIg5t8DvHg=;
  b=hNA6tk+SEYNgOMH+eCbCHmSyPyB31zmCixh8FIVfRGPukUwCqBPccdeW
   rYsiGrJh8GFso5fqzF9aVGeDyfadmVjQHKgVL/UWILgMHxoDNmRhxauTX
   lqNl83zFLJSeg7XYdO7Tkzbnm1c71/JxznlS1SCvjX4NuoRKOAwnFJkzY
   DaoBCXmK6DEeQDqnmpzHFvIb9nFXll6v3O6k6T2ikbxGgsZKyeOAgoYOH
   zLmQt2N/VlA03l2ZROFFJgEzyKtG4HCwTFuPwGSjuizni9YUOJSE79GI8
   Ya+6jrwcsB684OeAmwKEqv6gM8o30dueMaL+y+DZhncpK6d7uex+BEfRq
   A==;
X-CSE-ConnectionGUID: czZUWX52QIaPIREpOBXkqg==
X-CSE-MsgGUID: 1Tbe3KQgRRSb0msRIbJSIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54412741"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="54412741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 19:20:26 -0800
X-CSE-ConnectionGUID: 2r9+QFLiRBWTzq5wKlbF5A==
X-CSE-MsgGUID: 2BAvBZEDTWmP8GaudVcRGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108939889"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2025 19:20:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWS2w-000K63-34;
	Sat, 11 Jan 2025 03:20:22 +0000
Date: Sat, 11 Jan 2025 11:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 29/29] vmscan.c:undefined reference to `bpf_hack'
Message-ID: <202501111114.hPnBBPnW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   1b2329dd88553224f4ef9a26e1b22cea83b071a5
commit: 1b2329dd88553224f4ef9a26e1b22cea83b071a5 [29/29] bpf: arena hack/test
config: csky-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111114.hPnBBPnW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111114.hPnBBPnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111114.hPnBBPnW-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   csky-linux-ld: mm/vmscan.o: in function `wakeup_kswapd':
>> vmscan.c:(.text+0x4ffc): undefined reference to `bpf_hack'
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   drivers/usb/dwc2/core.o: in function `dwc2_dump_global_registers':
   drivers/usb/dwc2/core.c:701:(.text+0x1234): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:703:(.text+0x1260): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:706:(.text+0x128c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:709:(.text+0x12b8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:712:(.text+0x12e6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:715:(.text+0x1314): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:718:(.text+0x1342): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:721:(.text+0x1370): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:724:(.text+0x139e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:727:(.text+0x13cc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   drivers/usb/dwc2/core.c:730:(.text+0x13fa): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
