Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667481925A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739652033; cv=none; b=lkV4Rqwzd/klon2b/BwSo1k2OuhNpVFPLBzdjPgSRtzadR24KSnozVBFVimg4VK7cYd1UFlF9TWLF0xcQi/jjXtwe4/wG3f7fZIem5LM1+2XAXfCvrkQWXR4Gvso9sx+SCdTZE+B1PzhWpad0JBliUt3U5ixFd+XCfnvp2OOWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739652033; c=relaxed/simple;
	bh=3WKueJ+rVJ4qeKsjZqvs8W2s8/k4xARBtpVkvwJBGyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zr6UHIit+7C+dbwBdqHz2WhdY1i28iTPdk6RoyBHMlF/Jr+RonD35s6RFtQs6eWmgtvgHaMYxodG5S3aV5+o4cNlg97OJ3MVAbcBxq8QZ1ukUKCMUdXWUzfvB7QiWehxUfXparGej6MN2neDxYRdC4Tj9VvgCoUMkiuqV7P8HLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3JliVO6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3JliVO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739652032; x=1771188032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WKueJ+rVJ4qeKsjZqvs8W2s8/k4xARBtpVkvwJBGyM=;
  b=G3JliVO6Y03z92ETrAvGZH0EsepcbbYZvfZL0Ccxtui97WKCikCNKO1s
   Mz1EqUWBpK21k026AnzyPibYlQLinaAcyvM/v6mqNcR7dxhJAzM54y3HZ
   F9FPU4CAaODkBe4c6iIBIzcYZQ6DzvdSD6pZgVqVjkZJOx/OGoCI5yVXD
   qzJOHvdjn3Mup+RIGXzdTCuf3WIU49olHaJXebJPFPhJYxVmrq3lcJlCZ
   qDCsr7XuWNI1Rs4bbG9t/VZ16ktiqXASSSZapNuXkgODu1lrHHI1+geky
   zkyDs6+0nGuQPwrOAIHyQIAWNTfcgFheuuuoMhRN3Ce0h6Gl2a8v05SWp
   Q==;
X-CSE-ConnectionGUID: ELk9zVyOTZaDyVTbuE3iPw==
X-CSE-MsgGUID: 4eDC9kq2QyO0au1alaRK8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51359418"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="51359418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 12:40:31 -0800
X-CSE-ConnectionGUID: igwEfprgTTuXAAf9UE2Juw==
X-CSE-MsgGUID: AUzOzTEIQ0SF6clC2cltow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113621689"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2025 12:40:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjOxf-001BAJ-0p;
	Sat, 15 Feb 2025 20:40:27 +0000
Date: Sun, 16 Feb 2025 04:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1422/1422] kernel/time/.tmp_hrtimer.o:
 warning: objtool: hrtimer_start_range_ns()+0x535: unreachable instruction
Message-ID: <202502160431.1F2NAJJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Phil,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: 40ecfb28732cefd0c5658f7c10543bbc4cd41cb8 [1422/1422] hrtimer: Prevent queuing of hrtimer without a function callback
config: x86_64-buildonly-randconfig-001-20250210 (https://download.01.org/0day-ci/archive/20250216/202502160431.1F2NAJJ5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160431.1F2NAJJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160431.1F2NAJJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:130:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     130 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:131:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     131 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:132:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     132 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:133:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     133 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> kernel/time/.tmp_hrtimer.o: warning: objtool: hrtimer_start_range_ns()+0x535: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
