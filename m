Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F845199FBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763190215; cv=none; b=AExZUDe78aZhd6XMuoQazmak9PaXQBVY8+q3WA7kei29nzwDJujaqVMg5Q4u7FnUFbpEGADxbcM4m+cN340SbXSEB7rOLJ2UfYU6at5m7RZHMaH5sq0CMmdLK70DO7iYmZePyPfsu2U+NG56Xg+Lhss9BZo76FSRRFAzbkxox+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763190215; c=relaxed/simple;
	bh=8DpZWFK0S3H2zb8eZabNtksiwnx/vJRbWss0ymp60v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCmtmIXzAxHAH27JPNFxVLspFEeMJV2OlL6VWISZhhdjCG/v3YxTCPkz5yTtBOeVdoA2pauVw8jojENFirNiTi1X5cIsWu/jT8EJq+G24Pyfow9Sobwi1BXf9kdHxX2oHeCMAtP/3st5qgaomQM1O1vyJtiqrmVXvSkjg8h46FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZEV2C+4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZEV2C+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763190213; x=1794726213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DpZWFK0S3H2zb8eZabNtksiwnx/vJRbWss0ymp60v4=;
  b=NZEV2C+4/UX3f1mvG+mGtD47ABIW/dNfOJb7jyHNm5U74SHJxWDQRPVD
   mlyIAv/bsXhtbIraCUlaU9RwReRdR+XYrSicRvsrd4/O+2ZRWHRRYSxVA
   vepnR/7GVH0D+AdkPSTl+kiuKhmwdxiHLKB7BqjCzRBO0jPl6cZBOt0pS
   188BsLGDXMQraieZOD62WCioDqUKz4AuLQMw2h43oJbRrsyojYHSBzNrx
   5guRmmq1g6XSeeigo/J3m0TXZbjA2G65xIPuP98ifCUtsDzbk0WKypvRw
   lybJlVUlo9R9umO+0GN6yWm9JwuOjA2ROpbAMeXpnEOzFdVSCulzznCkJ
   g==;
X-CSE-ConnectionGUID: RpxMWqPFTaeMKSHq1a11/g==
X-CSE-MsgGUID: idKVpqowRMqBET1tb0VoMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64280418"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="64280418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 23:03:33 -0800
X-CSE-ConnectionGUID: L7sqwuGiSH+sfy7WCS7y9Q==
X-CSE-MsgGUID: w+TzgPbaRFeDnKKqJPJ+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="195122207"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 23:03:32 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKAJl-0007lv-0C;
	Sat, 15 Nov 2025 07:03:29 +0000
Date: Sat, 15 Nov 2025 15:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:old-ucode-platform 2/7]
 include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error:
 asm/vfm.h: No such file or directory
Message-ID: <202511151519.QIYTMv1j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git old-ucode-platform
head:   19fb9a6d870e83926b240ba86a3e35870fa2e578
commit: a2e925d5405ec14de4721ada7fdbd066aa33028c [2/7] x86/cpu: Add missing #include
config: powerpc-randconfig-r072-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151519.QIYTMv1j-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151519.QIYTMv1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151519.QIYTMv1j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/peci-cpu.h:33,
                    from drivers/peci/device.c:6:
>> include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error: asm/vfm.h: No such file or directory
       5 | #include <asm/vfm.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +5 include/linux/../../arch/x86/include/asm/intel-family.h

     4	
   > 5	#include <asm/vfm.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
