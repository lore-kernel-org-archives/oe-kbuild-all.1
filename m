Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03429CFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 03:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273773; cv=none; b=Mpu5qksntISYm+LvzKqGrRQgKhzaGoaNIjY0oN62apehx/IPWcZuszf0R9L3F+gQvuyq+WUF2EZu5zazhDAXTXUiAABiNo30pIHtAANuCxd2X2qT8Y/iQsbnkRcpx87NYzRIibrFcKq051CqVfj1diQcE5rayvPwR1Vv84rpsqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273773; c=relaxed/simple;
	bh=aA7C+A9nv8pNUp9QAMlmbyR64IcXoSF+ZEIUuojKucM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cpVn8mqWgAr4H+W+ibpgJZl7zuNFsvHHRIe1aXiWSDdazigu1lBF7h7mPmMXB8SUqQz5FsM/wnGHMx+FMAvaYYhyja7VuybJjRLnuKT4r5XpnCOyi8Suwhy5Co3rE6nUm6bhpJZo3AQDWtmOevlz4etzaYt/Qu1EdW9Ldvh773I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irVogTZJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irVogTZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721273772; x=1752809772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aA7C+A9nv8pNUp9QAMlmbyR64IcXoSF+ZEIUuojKucM=;
  b=irVogTZJ60XU3DPe+qm5zrf6ZrSsnMIXx7XS22ETIST7r/r5LE1/MQdQ
   wJIYu3bAIjElWHFXmQbPGQCh4LwIdzLqUjDyaWvNlzAMC81qY70F6Co3S
   73LL4r25wsQ2DvL/pLSmtfdDwaoROq3L+HeL35/Ar1d+Qovo5WWkDYx7D
   0CvVV4fTL9qZH8WDO6oCuQ+cpTalHW2CxCeq6Me9DrsaX4LrlBnLyvTPd
   4160qwA6p4aFGj+hMhW65JOlQzUsP/9Dbo96gaXqrk/71aol0DCZInjOq
   0MStPYRf4w2VaouZFqdNUNcBORPBQptre6IaSBKm73XcvYKnJjBG6nC0Q
   A==;
X-CSE-ConnectionGUID: xUObxAivRH+jhWdnpBDs3Q==
X-CSE-MsgGUID: 6TjeEuRfSBy4zD1H1IJ/aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18949023"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18949023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 20:36:11 -0700
X-CSE-ConnectionGUID: rVwCjcg+RCSgaDWAxFG0jA==
X-CSE-MsgGUID: N/JqDqxfSMyVMGMpRgiBqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="51345449"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2024 20:36:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUHw8-000gv4-06;
	Thu, 18 Jul 2024 03:36:08 +0000
Date: Thu, 18 Jul 2024 11:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] include/linux/page_counter.h:55:
 warning: "MAX" redefined
Message-ID: <202407181122.aSYjpU1I-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240718/202407181122.aSYjpU1I-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181122.aSYjpU1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181122.aSYjpU1I-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp_platform.h:24,
                    from drivers/staging/media/atomisp//pci/ia_css_stream_format.h:24,
                    from drivers/staging/media/atomisp//pci/runtime/binary/interface/ia_css_binary.h:22,
                    from drivers/staging/media/atomisp//pci/runtime/debug/interface/ia_css_debug.h:25,
                    from drivers/staging/media/atomisp/pci/sh_css_firmware.c:27:
>> include/linux/page_counter.h:55: warning: "MAX" redefined
      55 | #define MAX(a, b) ((a) > (b) ? (a) : (b))
         | 
   In file included from drivers/staging/media/atomisp/pci/sh_css_firmware.c:22:
   drivers/staging/media/atomisp//pci/hive_isp_css_include/math_support.h:36: note: this is the location of the previous definition
      36 | #define MAX(a, b)            (((a) > (b)) ? (a) : (b))
         | 
--
   In file included from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp_platform.h:24,
                    from drivers/staging/media/atomisp//pci/ia_css_stream_format.h:24,
                    from drivers/staging/media/atomisp//pci/runtime/binary/interface/ia_css_binary.h:22,
                    from drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:25:
>> include/linux/page_counter.h:55: warning: "MAX" redefined
      55 | #define MAX(a, b) ((a) > (b) ? (a) : (b))
         | 
   In file included from drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:18:
   drivers/staging/media/atomisp//pci/hive_isp_css_include/math_support.h:36: note: this is the location of the previous definition
      36 | #define MAX(a, b)            (((a) > (b)) ? (a) : (b))
         | 
   drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c: In function 'ia_css_binary_internal_res':
>> drivers/staging/media/atomisp//pci/sh_css_defs.h:310:29: error: implicit declaration of function 'MAX'; did you mean 'EAX'? [-Werror=implicit-function-declaration]
     310 |         CEIL_MUL2(CEIL_MUL2(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
         |                             ^~~
   drivers/staging/media/atomisp//pci/hive_isp_css_include/math_support.h:42:33: note: in definition of macro 'CEIL_MUL2'
      42 | #define CEIL_MUL2(a, b)      (((a) + (b) - 1) & ~((b) - 1))
         |                                 ^
   drivers/staging/media/atomisp//pci/sh_css_defs.h:310:19: note: in expansion of macro 'CEIL_MUL2'
     310 |         CEIL_MUL2(CEIL_MUL2(MAX(__ISP_PADDED_OUTPUT_WIDTH(out_width, \
         |                   ^~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:103:31: note: in expansion of macro '__ISP_INTERNAL_WIDTH'
     103 |         internal_res->width = __ISP_INTERNAL_WIDTH(isp_tmp_internal_width,
         |                               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/MAX +55 include/linux/page_counter.h

    54	
  > 55	#define MAX(a, b) ((a) > (b) ? (a) : (b))
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
