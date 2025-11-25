Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6971FDE01
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078169; cv=none; b=u2PKqhyvjSRM2l40Qj19Iwj1uD7rW5oid3r7KGaEWBAvbTTfNyYhTOXxK7GE1bT2pW0BqzXcy3G/u0SSixMfMY7Fg7mygsW9kNGWfxwq84SxEc9Ir069v1f5M7oB2jF0UgKOhGi9vf0TY+0lqPGJHedc8n52pfjeRRM6JDVBvhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078169; c=relaxed/simple;
	bh=dlhtpD2PGaMTjtg40oRdcJgd/WynGmZRX4mvD4ps0hE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfO5LzI9s0MGiIG5rH8klYQzwFi9PGOdO1fK3MOEwMcrcTG67rTMG+/5cOnMIcfSPIaCIHuhfNEPbyA8dD0a11Lq/GhGClCvmKDIPSqcPOEkwVdzZ3/BKDpvo9M6Oe3sJuQAgBUszs9qIP3O6dIPJ+bKCKQL2lgyi79/ClG4rJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVfPR5bo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVfPR5bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764078166; x=1795614166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlhtpD2PGaMTjtg40oRdcJgd/WynGmZRX4mvD4ps0hE=;
  b=SVfPR5bo6QCM7urQWvMwVdK0De8ZE8lbvDVzn2VNxidtIdaSNuOcZka8
   fm8NTJFf+HCGLfSFGxqAON1r2Wg2xVRQNC6vsM8KZXi821yS08pzy7+Y8
   dM2jaa4OEfrd8MS+obiNQZLL9yYlCcbtnd/whX/j+I9utpMahuJAXoAqL
   yDbyJNexbYeO0cGmIUe2vPFCQy+3RVPS/Y7Hk2lPdM3eppYGf9hOsUl5v
   u4B4c0enn4soxrfLtf6/bnoB0SOjjU67qiAx8LhlpcfiE4nVbz/h3aYA3
   0Y0Ec4jempDOhOugMtvDy+eLcbctd3+3MAG+jkRbeURjew3u/9SlV72PC
   A==;
X-CSE-ConnectionGUID: uE7RTa7eRqORtZqawJ8aGA==
X-CSE-MsgGUID: DxJz+lyGS9y0DeOh1wC6IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88746593"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="88746593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:42:45 -0800
X-CSE-ConnectionGUID: ARzgve/YTNOQt3CSWI0Kxw==
X-CSE-MsgGUID: zno5Ht+JT8ab1uNXwtUngQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223318848"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2025 05:42:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtJc-000000001pM-10Y4;
	Tue, 25 Nov 2025 13:42:44 +0000
Date: Tue, 25 Nov 2025 21:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:old-ucode-platform 2/6]
 include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error:
 asm/vfm.h: No such file or directory
Message-ID: <202511252103.vQT88U4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git old-ucode-platform
head:   13bb70ba267344f42129e7942104f056d44389b5
commit: 61c21b2d8b57e9b2d48b774618c1bd19ce7a3a59 [2/6] x86/cpu: Add missing #include
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20251125/202511252103.vQT88U4a-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252103.vQT88U4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252103.vQT88U4a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/peci-cpu.h:33,
                    from drivers/hwmon/peci/cputemp.c:11:
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
