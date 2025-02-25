Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98713257422
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473427; cv=none; b=oWqO0EMX3LGWwrmRY3CC7DqXvtya8vYE02NFgx/n7CLcl0nuSK80WoD+dPeZIqfpXpeFIHPMZaYNyOf/Liq4GJSpGfCtQDfliKX+rSzfw8Bx6YOBS5TTY2SR8X0ERtGQz9FIiVlWpSLxqKTLjOEYAWMnuxsP17T1szVuQ1e/Ww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473427; c=relaxed/simple;
	bh=8Siu0OKaj+neOFTWbjj7eDZenxVJacqaa2qMaDk8hkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5n6TVTsAg/xDcA6MAsWs2164yocCGrTFlpYn4neL77WMFmtrr5G72KJIvop3ZYSnBRXXOewk/PHyHt9FrJCAPL5HSKvGrEchHYFfrsZtADvuLW8YN8WhbMZOH4YJeLCK/i/Gh54Y09MRnAB6Ca6Tup8RW/rq5qQ2/Kfpcdwo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AosKbcBl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AosKbcBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740473426; x=1772009426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Siu0OKaj+neOFTWbjj7eDZenxVJacqaa2qMaDk8hkQ=;
  b=AosKbcBlqIJ369MFaxeV1UnmhgfuPvd2I3EOmFy4+vjMCEf8E35ynTK6
   PTb6wmbDSBmMIok7xLaESVrIhIrjOM5HKgToAsKbiSDKokTUnDBQ0kzFU
   hCw1O9gdvFLY6JyMNDG8ihArfccVNtcbBEkcKewQ3fyTlw0Dk9lLCQVbk
   bWo/E77rYaBKqq2Zbvinng8fI4Wq4HVXrlFI58To4oILjgB3fI90IYlug
   yQy2UgJGyIXSeVIOJLfRGZ+vnsp5vru8PXgY0O/OqW6uLkNtQUMBphDE6
   HGOV10Q6vuHdbgf4bSZy5TiYzOckdQr7Rjc/P/pN1loaxltFpiVRntwIO
   A==;
X-CSE-ConnectionGUID: 5JBs7FUBSay+Uxz7rAdj7w==
X-CSE-MsgGUID: QASK0LQJSVm9Zt3U8XGQQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52670264"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="52670264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 00:50:26 -0800
X-CSE-ConnectionGUID: N4p1sdSHSl+zBJNVqAjaAA==
X-CSE-MsgGUID: pUQrzD6yR42m7ebeXl65Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="116816215"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Feb 2025 00:50:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmqdy-0009xX-0S;
	Tue, 25 Feb 2025 08:50:22 +0000
Date: Tue, 25 Feb 2025 16:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:microq 1/1]
 fair.c:(.text.update_rt_rq_load_avg_ratio+0x0): multiple definition of
 `update_rt_rq_load_avg_ratio';
 kernel/sched/core.o:core.c:(.text.update_rt_rq_load_avg_ratio+0x0): first
 defined here
Message-ID: <202502251602.XgjwgrNm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux microq
head:   00a569cb6069576a53081ef9112cf361497c009b
commit: 00a569cb6069576a53081ef9112cf361497c009b [1/1] sched: Add micro quanta scheduling class
config: arm-randconfig-002-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251602.XgjwgrNm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251602.XgjwgrNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251602.XgjwgrNm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sched/fair.o: in function `update_rt_rq_load_avg_ratio':
>> fair.c:(.text.update_rt_rq_load_avg_ratio+0x0): multiple definition of `update_rt_rq_load_avg_ratio'; kernel/sched/core.o:core.c:(.text.update_rt_rq_load_avg_ratio+0x0): first defined here
   arm-linux-gnueabi-ld: kernel/sched/build_policy.o: in function `update_rt_rq_load_avg_ratio':
   build_policy.c:(.text.update_rt_rq_load_avg_ratio+0x0): multiple definition of `update_rt_rq_load_avg_ratio'; kernel/sched/core.o:core.c:(.text.update_rt_rq_load_avg_ratio+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
