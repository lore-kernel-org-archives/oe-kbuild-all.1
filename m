Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B322B8B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815052; cv=none; b=CxspTYyC2kiQOGNjf59huSthD5Sbnwzdn5QFPVZg93sHhy3ZIjvpcYJKy/WjrlFyHCVNq1Cn43rWPzU+MADxF7SC4bDY+z61ofzB4W8997+oazhrYrRXu5US9Kjmytzzkl8+vrT9KBrKg3wv/2AXuKjQLhgSLCAoQii6itRx9IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815052; c=relaxed/simple;
	bh=z4Q4bPt+NdT2CqatKYjsMYeA9r8haXUww0T32PVCw+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcNVwo+TkpKER8L3VAKrWDjAsbkZJQ+gA4H5GUCGlMiFjKDCHc9Oy/Xg4tupKKWaT+mWf9DB/zwCeOp9MNzIf8ag9lOT8cbXzGeCxrDWit7rw0qWqs3rBiEcUDjkwtSi6JeeTYi9FH/DlCXulU7IS62J9asxeA/k35+Mil6Ldas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNMOrsJK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNMOrsJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762815051; x=1794351051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4Q4bPt+NdT2CqatKYjsMYeA9r8haXUww0T32PVCw+g=;
  b=SNMOrsJK2xGPBhwaeJFbccIGOgZIrKiXeNJlwyTOiSqs6zqhfmy9s5bJ
   aKSBJDyap/mr1H0HWFrufzciKzpN/YNEQVSKK3H2mZ1cUXSqc1E23hfNI
   t/opr7bMLGzgPhI62wHsiYMYFLcSvak88DelNgTmf4ypnqf0+1ODAHbb6
   KoEtVqNFy4X55h0w0sCpWqDu4x4lSZCjcNx995N6a3B0kelQT0QvpybBU
   HFuvroEzqwIZEUwrNCfamMHIcqrFOtj7Hdf4dGU4ls03k35ZJqXb0Q8Wt
   JYhzq3f9A2P/srDFy3n0j0GebOMuw9i9Nv9X/+gYi/IjYMI0aQzxIrKaP
   Q==;
X-CSE-ConnectionGUID: ILow8AVISAqWzr4mj9Hd1g==
X-CSE-MsgGUID: 2qTmZAmYSnuwkjRyWQpDCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64907417"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="64907417"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 14:50:50 -0800
X-CSE-ConnectionGUID: gUUMY/A1RXyYKZ93OS0KBw==
X-CSE-MsgGUID: PJMBI6gPRPGid/Pumo1yEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188434197"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2025 14:50:49 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIail-000179-0z;
	Mon, 10 Nov 2025 22:50:47 +0000
Date: Tue, 11 Nov 2025 06:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 49/49] mm/shrinker.c:688:6: warning:
 no previous prototype for 'register_shrinker_prepared'
Message-ID: <202511110646.bJPauqDc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9964ca4dc63640e5a033c29162ca148e6a4dd12a
commit: f1dadc895ed84d664e6d2d008be8225d3b051db7 [49/49] mm: shrinker: remove old APIs
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251111/202511110646.bJPauqDc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110646.bJPauqDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110646.bJPauqDc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

314369bb029a4d7 Qi Zheng 2023-09-11  687  
314369bb029a4d7 Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
314369bb029a4d7 Qi Zheng 2023-09-11  689  {
314369bb029a4d7 Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
314369bb029a4d7 Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
314369bb029a4d7 Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
314369bb029a4d7 Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
314369bb029a4d7 Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
314369bb029a4d7 Qi Zheng 2023-09-11  695  }
314369bb029a4d7 Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: 314369bb029a4d7f5018a64217e28d549e42fb65 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
