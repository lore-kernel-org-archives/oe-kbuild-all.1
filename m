Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B42119
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733376585; cv=none; b=CV5uNWEJRmLZkf9EM6tP7Qz/WLw8K9la/mOLTUYlc2v5nUkUN9rBxt9nh582eYd1B5zzgjVHnHva32RbAFqJqIqxLadvc4FrZ0Vz47kf8TW1Z9oEeP/Z1CWR+pHeq9G1IJxxBtWGDGNkqsK1C+4o2cZ89m8nVq1Q1a09Z8jI3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733376585; c=relaxed/simple;
	bh=lhSJcQ71un/L0ETK1QX46gP6NgaCVGZiAMMkd9VLerQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoEis0XEDFAk10hDPfp1ePkxuZzEaflVNYgN9DlV8FWmoUo1nn8YsEZU0bHN4mIRVdYbEq7JNhL+go1rpJ9LT/TfBJfZHGqKaM5XVM4fnUUbm3g/jgGoUfVGuGWzC8VOl5QhfvReNUYd4xo8UlCtsWrb7rbJ28D9UvILaaRCRLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yx2QFcZH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yx2QFcZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733376583; x=1764912583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhSJcQ71un/L0ETK1QX46gP6NgaCVGZiAMMkd9VLerQ=;
  b=Yx2QFcZHTbmcM9UtVbXo4BJkLjAs+Ydoevfe8s3pt6Hc4v3FclR67/xk
   D61GkzdtT/2jnRVxOuIRgQ+SX+Y/IGjbDfQwBCSaomBPKfz7GH3EMS6wY
   WCsUEgquMXa8ILShhTK21sqXkMphfWZSt+YskKs7DvjIT0+Ucq31ayR/6
   LvvoqXwhwxgM91vZZZHWBQUPd3Y/cfqeEOGavwh26RxVeSbJ0cwlhl0B4
   LJeWoUIxPhqRJt3AP1t0MJ8IYYQt7Chy0GjDp75imOpFgEHBCfoUX9Icz
   FE/AeSh7WDDvL9PL6aA4NGtMOilkyHtyGVB198KyK0zTKGy4m+NRILGve
   Q==;
X-CSE-ConnectionGUID: WmgiFwf4QEad0x/eVFocFg==
X-CSE-MsgGUID: WZ/PCRSXT5GeC28oXnqSVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56147749"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56147749"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:29:42 -0800
X-CSE-ConnectionGUID: DuuwropmRfGPwcn7GqC/WA==
X-CSE-MsgGUID: zo+kJZnKSt2NlXr8ZsmhgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124904037"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 21:29:42 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ4Ql-0003qR-1m;
	Thu, 05 Dec 2024 05:29:39 +0000
Date: Thu, 5 Dec 2024 13:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype
 for 'ubcore_hash_table_rmv_vtpn'
Message-ID: <202412051356.um0lEVov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fdc4bca5e9e486a894194c2b6a956492b11d8cc5
commit: 013280dfab06d20e73de842e8d2fc2a200055455 [2516/2516] urma: upload kernel patch for 20240224_rain
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241205/202412051356.um0lEVov-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051356.um0lEVov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051356.um0lEVov-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype for 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     261 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ubcore_hash_table_rmv_vtpn +261 drivers/ub/urma/ubcore/ubcore_vtp.c

   260	
 > 261	void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
   262	{
   263		struct ubcore_hash_table *ht;
   264	
   265		ht = ubcore_get_vtpn_ht(dev, vtpn->trans_mode);
   266		if (ht == NULL)
   267			return;
   268		ubcore_hash_table_remove(ht, &vtpn->hnode);
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
