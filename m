Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706D184
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746058050; cv=none; b=hYFz+vnlkgAZ9LSG1WReq9k+VvzhnpuDlQ9nWQADHosaPcelYUB7NnLleOt7ZjEJFxdlhpfGSWul7JRaU16PgxYt6XY/BKoToiVCNuzNeB3XDDtchHCXLWpRxvS8wq+cZwmDLSKqPXkUhaPZwxz6MbumPv45BWEWjhq65Rs4GcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746058050; c=relaxed/simple;
	bh=Fd3grFB3YrMOa50m2QOsNKMQCdzqW6rdaKhwOV5T3vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGoLdO6ZTQaEhGrOsa926zpkhzzLALlRUSywOIh9iOPUlQCjW0q7s9tLlYdOjr5lNa1+OyJGa+88maGNpOcmlt/EUWBmVsz+SEWQgLxItPnyDFyQa3+th7QXntSfqn1bR34F6bI9gCrhS6Eb//45ursdQdH1XDrdYyE/cS9jAuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9MlSaEN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9MlSaEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746058048; x=1777594048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fd3grFB3YrMOa50m2QOsNKMQCdzqW6rdaKhwOV5T3vo=;
  b=W9MlSaENx/2xweApGtT9jPGpnGBltaAl1pDiC2C4MTO7FKZM5vPeopqh
   9kEKP5Oa5XAEz3F86mOrksBf885pcMbkVAUzKU+eAWczQh3YAz+rs/jDQ
   SHjCzyM8CA0QdaL4al5iNOAidsFZLcXqqI6xVc7SjdGIVzBglDnNPZyY8
   J80Hs9zctV7Y5yML2ePBkzhnFaO0Kgymx5dQglUBVb6X2lFPcQYSuUWrw
   sqmZnbkNV4kRkqAXF9Ui33FMt2yu9Yt/rBk/r5nskkAZaJQGlr2KrjrID
   NIiHl+QN8AJFPmGgHHPlT6FA+NjcqRdW4zkF++8431CKwLBx448k+eFxR
   Q==;
X-CSE-ConnectionGUID: d2HHCNFdRCe3iFxvZuwS2A==
X-CSE-MsgGUID: CDsHxvyVSgKuBsh2VacM2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65269563"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="65269563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 17:07:27 -0700
X-CSE-ConnectionGUID: i/X7HPpNRd+EFHlGPI67BA==
X-CSE-MsgGUID: 40jfPU00QGWP7x7mqfc6xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="135237824"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2025 17:07:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAHSV-0003rB-2G;
	Thu, 01 May 2025 00:07:23 +0000
Date: Thu, 1 May 2025 08:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 7746/7756] vmlinux.o: warning: objtool:
 aw_dev_dsp_update_cfg.510882(): unexpected end of section
 .text.aw_dev_dsp_update_cfg.510882
Message-ID: <202505010756.EFBmZlRT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   15b3016007055a4c32369d1f9ca6744bc765fc34
commit: 3e55a76d727eddf6b3bad82139a6788172168a01 [7746/7756] Merge branch 'sound/upstream-20250414' into merge/sound-upstream-20250414
config: x86_64-randconfig-101-20250429 (https://download.01.org/0day-ci/archive/20250501/202505010756.EFBmZlRT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010756.EFBmZlRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010756.EFBmZlRT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: .altinstr_replacement+0xdad: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xdca: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xdd7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xdf1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xe0b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xe48: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xe68: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xe7b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1017: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10fc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x11cc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x127c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x12ab: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1358: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x137b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x142b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14db: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x158b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x167b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x172b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17db: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1838: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x18d8: redundant UACCESS disable
>> vmlinux.o: warning: objtool: aw_dev_dsp_update_cfg.510882(): unexpected end of section .text.aw_dev_dsp_update_cfg.510882

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
