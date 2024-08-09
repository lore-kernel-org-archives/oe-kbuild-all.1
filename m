Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADDDB674
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 04:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723176974; cv=none; b=nGruzDW3OCkNyuiLhLMY3+YPGDh9RZFD+Yje2ilCBWSjj4gIMv03Fe79Zjeb5Iwj89Zus+sd0UG4mAo+o96UYvdM36SXBu1k9M8cTX6A0LzR8JVKVnNpaaVWySN6xyoihyKpA2krAqoE/7jlvbdbZ51Agsjp7J+hiv4XuSn7se8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723176974; c=relaxed/simple;
	bh=RrSXRXqgB7rj9aCNGUCzBDkGCciDs3ihPoGrNtXgD2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOgv1FcY6uGeI9cZbD1jUD9zzF2vMzenoGj1SZ940qPmLjc6lU6HQlRt+6GiVkIxkmPIw7yWZMa/4l81eQp9lqhVw4NGtt31ZhwftO/zgaT6BFau54/ovGOfnKdraA5eQhUJfiO6jiNwW2wunryn4Dj+KXpDOmGieiHDv11WcxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQnbeHZu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQnbeHZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723176973; x=1754712973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RrSXRXqgB7rj9aCNGUCzBDkGCciDs3ihPoGrNtXgD2Q=;
  b=AQnbeHZuKB+22rl6NrTbB4/zMWn35AqnB/uoodU/u/FfxnvaqhkOaq4l
   q2yJs1pluIrOBiu7MB21Tqj0YQfskrJvv00bwNJkog4cQxDoRrdf9uByu
   Z+kPU3dOAmM1Ac/FZqCrs+0qtHjjIPN12FoobltYdlSl1CM58gEsdZbmH
   zkk8ECR2poaExuTC+rJiJjidFm238AsYsblnZIrK3l6hkaQjfKmIlopYp
   u8qzFRLbWcd1eTR85cT940BS4ssKRoLH9V0910O4Ahe2dESaU61cl0/PO
   c/nkbsqf878hoxjSJ+IugGqRE2VqHwTDPOprINtDg3xosVWuB6VuOTsXS
   w==;
X-CSE-ConnectionGUID: v1uMGAv9QnaFgzajE1mquQ==
X-CSE-MsgGUID: LV9wuWS7SLy/vPmYCATKkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21462994"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="21462994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 21:16:12 -0700
X-CSE-ConnectionGUID: l4zBRmYwRVu8QsE0CbKxow==
X-CSE-MsgGUID: 7LT3HCwbQxeOQBQeFPQ/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="80682168"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Aug 2024 21:16:10 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scH2u-0006oi-0w;
	Fri, 09 Aug 2024 04:16:08 +0000
Date: Fri, 9 Aug 2024 12:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:sigh 5/12] drivers/hwmon/tvs-mpfs.c:366:25: error:
 'ns_thermal_of_match' undeclared here (not in a function)
Message-ID: <202408091236.XV0DnW2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git sigh
head:   fc1be45362668d3f677d26fee63f7eafbc10ff6d
commit: d93c4fe7e7f17209c24a07467b5df904735282f6 [5/12] delete all auxbus code from hwmon and use regmap
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240809/202408091236.XV0DnW2b-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091236.XV0DnW2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091236.XV0DnW2b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/tvs-mpfs.c:14:
>> drivers/hwmon/tvs-mpfs.c:366:25: error: 'ns_thermal_of_match' undeclared here (not in a function)
     366 | MODULE_DEVICE_TABLE(of, ns_thermal_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/module.h:250:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:250:21: error: '__mod_of__ns_thermal_of_match_device_table' aliased to undefined symbol 'ns_thermal_of_match'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/hwmon/tvs-mpfs.c:366:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     366 | MODULE_DEVICE_TABLE(of, ns_thermal_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +/ns_thermal_of_match +366 drivers/hwmon/tvs-mpfs.c

   361	
   362	static const struct of_device_id mpfs_tvs_of_match[] = {
   363		{ .compatible = "microchip,mpfs-tvs", },
   364		{},
   365	};
 > 366	MODULE_DEVICE_TABLE(of, ns_thermal_of_match);
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
