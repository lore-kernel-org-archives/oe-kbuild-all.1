Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB20184
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092957; cv=none; b=kOjW+XC8/ONo5YVhnnA51qfqMu43A3miQZhi9c3OFQ6q4a54q6j16qSjT0Um00h+LvbA7reUkMyxyKDvShFJOd79J/vT79l5ay89ZFo0VirXxuYuPszrUqTkq8MHIv3E28Ov1OFJrAesUqLME6+vBJIP99QKQGuyon/HTgPXca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092957; c=relaxed/simple;
	bh=vagMNJ720aX41eM80MrMdOO1zbp8R+MjKxatxv0y0TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ey63KGtKW09xNMNEPmM12lQGMPH/cTaXoLiylDuXhGe+66RsMbdZIQAVWExPtAFD34BsoZ3v0VDLpQM8t6lcnwQ1HO6uMvVG2iioOsbNM/RaqZkx9AEE3T+zpSrWGXYMF3ZgqGQTIULOcNwxuyzqHgS8Yrf8F7AdNeWMVxyX5S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZDeIwBE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZDeIwBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754092956; x=1785628956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vagMNJ720aX41eM80MrMdOO1zbp8R+MjKxatxv0y0TY=;
  b=OZDeIwBEAo9grsxi6v1jNPiJtQ6qgOBnPGzQ+dU8Iyk92S+86f94S+Os
   RCFjJlkHLPASh12cxw43zHjXDP+/vwWA7hy8CE5FPh7czuB4GbnEe6mMe
   gu11SKTaIqwF4lGV7VT6+GoXSPQ1/ZOlk9s9gPQGVqBMFareJ7YzHxguN
   myVPAW3F25d7P4WojvaUNA+c/4Dm/ENuAa4MwhCw7hVLGOVNfrKWEqz1G
   KfE8S068D+uDNK4k/r9lkYip9GiMuvWFPZFMJVge9R8cg3KreIVfuKNXG
   hgRea4oQCNeW4CXtdp25d0er9lcN8VaHg68RCQHVXz7q0048BhOVeMgRV
   w==;
X-CSE-ConnectionGUID: v3Bgu5WhSDSojxJ5igF9xQ==
X-CSE-MsgGUID: kVGBJ5nfQUWgUW7Ij+yxPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56377809"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56377809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 17:02:35 -0700
X-CSE-ConnectionGUID: np0KnUDISVOQIFlD2sxhWw==
X-CSE-MsgGUID: t6E94NG/QB2h33Y6RquE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169070257"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 17:02:35 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhzhn-0001KB-2Z;
	Sat, 02 Aug 2025 00:02:31 +0000
Date: Sat, 2 Aug 2025 02:01:52 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 5/15]
 drivers/gpu/drm/tidss/tidss_dispc.c:624:16: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202508020235.AJVZD0Oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: d47482da8db871014f98b72967240cc79c0a6377 [5/15] drm/tidss: dispc: Get rid of FLD_GET
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020235.AJVZD0Oq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020235.AJVZD0Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020235.AJVZD0Oq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/tidss/tidss_dispc.c:7:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'CH':
   drivers/gpu/drm/tidss/tidss_dispc.c:516:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     516 |         WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:517:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     517 |                 (dispc->dev->power.runtime_status != RPM_RESUMING) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:518:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     518 |                 (dispc->dev->power.runtime_status != RPM_SUSPENDING));
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_VAL':
   drivers/gpu/drm/tidss/tidss_dispc.c:614:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     614 |         return FIELD_PREP(GENMASK(start, end), val);
         |                ^~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'REG_GET':
>> drivers/gpu/drm/tidss/tidss_dispc.c:624:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     624 |         return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
         |                ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +624 drivers/gpu/drm/tidss/tidss_dispc.c

   606	
   607	/*
   608	 * TRM gives bitfields as start:end, where start is the higher bit
   609	 * number. For example 7:0
   610	 */
   611	
   612	static u32 FLD_VAL(u32 val, u32 start, u32 end)
   613	{
 > 614		return FIELD_PREP(GENMASK(start, end), val);
   615	}
   616	
   617	static u32 FLD_MOD(u32 orig, u32 val, u32 start, u32 end)
   618	{
   619		return (orig & ~GENMASK(start, end)) | FLD_VAL(val, start, end);
   620	}
   621	
   622	static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
   623	{
 > 624		return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
   625	}
   626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
