Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9A4366
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743814826; cv=none; b=DTXbuGNIlL7OxO9E0Pmwsd7a/tqArDB85tHIsOZhgrPgh271g7tVSD2/PJug9pc5gwX50oCeAfC1RgvZGhS6+e4T6+F5TAOJhVtvaUvR+f8cQT2oKI18lfF8cZWZlC7eAywzyHlS3KrgdeYMP/fcHeOzhf/x9DhllK+IhkEy1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743814826; c=relaxed/simple;
	bh=RZNiVF7/CKZN2J9LkFfXFN0Cl0Ega6h8rHQ8EIzlakk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwm8zX8QnBIuncRrZYOzzInxe9ATBY807ASSmm9l5fi6Q2xQXdMYjgY2kQqTDorBN9GMMOuvAj5fSl/w6BwTruUILHbVMCEYUfPkSgLRRqh6MELNMTdGGjtiF8UyaZ0GephaUuiNEizpoGazm+Ac5JNo9z/wqXD/aCAAsKSkJUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/y/ghYr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/y/ghYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743814825; x=1775350825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RZNiVF7/CKZN2J9LkFfXFN0Cl0Ega6h8rHQ8EIzlakk=;
  b=T/y/ghYrsnAzIeXs29xIRW0KdMMFm4nrnSHieWPSmrpsG01Ka8jhA3Dr
   S8YnnvWJYaOkS06LqhAY93p21A7Zi0CcxB40TUCTi22GqB1I7mYfL3/4e
   jH97oR9Qp4fbIiEAtbTbE39JLDoBM2TMZNTBmKHFTG7TztqPYAjZBEoOz
   CnJIiWvrXOPRhLa9rmF7WDYEy+7gOntWCiJGI0Zz5eGaS8py3iQl4QLy8
   9jB2chVDDknD9YtsINszuNuWoF6xx2Jx6RyFgNqYPX7fYUh4hrVnTWP8S
   jyTI4L63kJTD5dhWD8aXWwTbXaaSO0ogcK4AeGFQTkeFOZurg8VGv0cnl
   A==;
X-CSE-ConnectionGUID: zRBPYZTfRnKvx9d449K7ZA==
X-CSE-MsgGUID: 1ti+pSKxTTGA9hnfAO7yvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56646605"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="56646605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 18:00:24 -0700
X-CSE-ConnectionGUID: 3deGow7tSumzr4mcSAuilQ==
X-CSE-MsgGUID: 3gKFBJd2QE2cl/qi/Txd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="128300395"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 18:00:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0rtV-0001iG-0V;
	Sat, 05 Apr 2025 01:00:21 +0000
Date: Sat, 5 Apr 2025 08:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>
Subject: [jpoimboe:objtool-werror 1/3] arch/x86/entry/entry_64.o: warning:
 objtool: asm_load_gs_index+0x0: stack state mismatch: cfa1=4+8 cfa2=4+0
Message-ID: <202504050815.fCYlGY2l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   449363264d269ad1a7708447c2ed718e7170143c
commit: b1c60a498c6146de0706572d3f47d3723ca91743 [1/3] objtool: Fix SYSCALL instruction handling and INSN_CONTEXT_SWITCH
config: x86_64-buildonly-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050815.fCYlGY2l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050815.fCYlGY2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050815.fCYlGY2l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index+0x0: stack state mismatch: cfa1=4+8 cfa2=4+0
>> arch/x86/entry/entry_64.o: warning: objtool: asm_exc_nmi+0xf2: stack state mismatch: cfa1=4+0 cfa2=4+8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
