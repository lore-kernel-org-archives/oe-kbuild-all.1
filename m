Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDF6138
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273143; cv=none; b=q0GiyzGRj2op/2WDREqHQ6uzL5g/0B7JXENJA2rY0zhbXazXaKA9zuVMtzrXZbFUYYJe3Zz/uujpAWPA+WFaIPjhRc01DRfgHsNHxkvhd6vgfK4Sq0cI+Mfr8KWD1fGE4DgOvaa2iIcCXEHmY/z6/DgZ4XZVWLcshSU2jcPMFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273143; c=relaxed/simple;
	bh=n0vYKHMH4clRw8mZJjrkObhSvdo9pSNH0wVeYNbZXHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fVwqCg9+eYkStAMpGBmcDCkOo8aCzNYgc3OU1lSGCLeATrx4I5QI4eYMCMfa2YKu4P9jwsJKAL0dGIA5Wui7/7d3TjRuNdMsZaxmZpD2CgnqXnPCk/gi/msmGu0Z62i1oOFQ09nm+z0fjzLNo1zzPPs9uFyOn9LmDJ/TEV6pGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5Rsd/8+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5Rsd/8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721273142; x=1752809142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0vYKHMH4clRw8mZJjrkObhSvdo9pSNH0wVeYNbZXHU=;
  b=C5Rsd/8+u0S96fjJIQJUGQlT7NV5aqJ5CE3Z+TBR9SWN1JnR8XJG0nis
   Vwf19arisrj8+IZAj7NWzMfKQNwCFSLJDq86lp42yogIq3e+m/k8HL6F+
   6kZOOwB/88viIb52ZlwdUJWtId7X1ZHjB6pDzrQS9/A/1x6PXHf8AQHr7
   SvOxa6Gh5/tHOQicdNk3YIpbvP6YythSEDVRJrLvjqFa2mq3dKqtVo7AH
   DD0Y0JW5EdZErmBMDUZ/u/UTKgSUTw267dppt5dzpehlpVly73hLq5uqI
   WKIrniSwCfZjBl4/vQX+xABKIIS//qPwLhXnTJAN0TPH1A+4Rv/p8X41Y
   g==;
X-CSE-ConnectionGUID: UnT/umywSSOH3NTo8FwnRA==
X-CSE-MsgGUID: 1nBxBNksR5aolyqRCR4DBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30227920"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="30227920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 20:25:11 -0700
X-CSE-ConnectionGUID: XSH0wUH4T9mtZLtPMKIfxA==
X-CSE-MsgGUID: VXLcFTX9T96XcCgjNGYNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50671879"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2024 20:25:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUHlT-000gug-2j;
	Thu, 18 Jul 2024 03:25:07 +0000
Date: Thu, 18 Jul 2024 11:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] include/linux/page_counter.h:55:9:
 warning: 'MAX' macro redefined
Message-ID: <202407181153.AdePy9ik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   c857fcebb4972e5493e7614c9fbcceceb016d5c6
commit: a8f2d92c5560e579201e8043df06af4b22e28e9b [4/6] mm: memcg: merge multiple page_counters into a single structure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407181153.AdePy9ik-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181153.AdePy9ik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181153.AdePy9ik-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/media/atomisp/pci/sh_css_firmware.c:27:
   In file included from drivers/staging/media/atomisp//pci/runtime/debug/interface/ia_css_debug.h:25:
   In file included from drivers/staging/media/atomisp//pci/runtime/binary/interface/ia_css_binary.h:22:
   In file included from drivers/staging/media/atomisp//pci/ia_css_stream_format.h:24:
   In file included from drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp_platform.h:24:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:55:9: warning: 'MAX' macro redefined [-Wmacro-redefined]
      55 | #define MAX(a, b) ((a) > (b) ? (a) : (b))
         |         ^
   drivers/staging/media/atomisp//pci/hive_isp_css_include/math_support.h:36:9: note: previous definition is here
      36 | #define MAX(a, b)            (((a) > (b)) ? (a) : (b))
         |         ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:25:
   In file included from drivers/staging/media/atomisp//pci/runtime/binary/interface/ia_css_binary.h:22:
   In file included from drivers/staging/media/atomisp//pci/ia_css_stream_format.h:24:
   In file included from drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp_platform.h:24:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:55:9: warning: 'MAX' macro redefined [-Wmacro-redefined]
      55 | #define MAX(a, b) ((a) > (b) ? (a) : (b))
         |         ^
   drivers/staging/media/atomisp//pci/hive_isp_css_include/math_support.h:36:9: note: previous definition is here
      36 | #define MAX(a, b)            (((a) > (b)) ? (a) : (b))
         |         ^
>> drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:103:24: error: call to undeclared function 'MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     103 |         internal_res->width = __ISP_INTERNAL_WIDTH(isp_tmp_internal_width,
         |                               ^
   drivers/staging/media/atomisp//pci/sh_css_defs.h:310:22: note: expanded from macro '__ISP_INTERNAL_WIDTH'
     310 |         CEIL_MUL2(CEIL_MUL2(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
         |                             ^
   1 warning and 1 error generated.


vim +/MAX +55 include/linux/page_counter.h

    54	
  > 55	#define MAX(a, b) ((a) > (b) ? (a) : (b))
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
