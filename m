Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FDE2E36E1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 00:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754354574; cv=none; b=DmEuE65qzkNhxMgrOoXvqNiYfcVXzKj0Ya/LKyl/3p3sj2ovfXM494hT2YHI3y4HZ67gRxmY4VNJTiKKm4DVMhvrpYTwCwrJdKofYag7CL8mrRrRJaBqPYk3uu+Lvpdvx7Zg/ZjnJhxK8MBypA6cvERFpiH598jj5/eCDQzyBco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754354574; c=relaxed/simple;
	bh=bg47Nvaj/sovkqOWZRQ2yTVszIhZamt3w37B4x1dSb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEzGsZpbhBivYbdaKrxMNMV+yYBS5ZKjMJ774PIrMVPpxqYGHK1LCV6HhvIpOtA2px9HH4Ui8eJeQw+yC5rRfY1nEsHKWgnKl3F6E6eFCIAjp0YTQW42ga/8Yy0gS2hILBZ3GMmrof9MC8N1W6Ef+OloVsCa0XSW08AT62edeBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmdIAbmy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmdIAbmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754354573; x=1785890573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bg47Nvaj/sovkqOWZRQ2yTVszIhZamt3w37B4x1dSb4=;
  b=NmdIAbmyfgwHqd407KCvvEs/IkOzd3uuQKc50Ko8fQySIqxc77BP3uw0
   7gkSN9x0ZeVLYcuGi/qF0n91wsMXwdECIze7RroktkyGHwDWKcDgEjCTj
   QrPge1fHRIlPGBjkVZ4uw1/a2MFnfqlYH5gNWbVowqGK9oubjn2pFXhD/
   0a50wq44W4PF6KPZ7a8N2TbCjxqndyypIKzeFvPrqel8Mucb8So1XFoQD
   fgQpxb66HCrLstNp9z6MuozRD42bYTjFcKYUXdGEBsNgc+x9VZcG9DYLx
   szU+1Wpx/y2AECTK5JLwoxCgyzUk8JKd+9iA4gEU7r/8DRkfx1sr0fD3M
   A==;
X-CSE-ConnectionGUID: rTWGMdOtRQOnAiGGqD5xZA==
X-CSE-MsgGUID: 26JyjCGqSECOD7H0ANU6IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56711925"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56711925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:42:52 -0700
X-CSE-ConnectionGUID: lRMu96E0QgiCyQD812biug==
X-CSE-MsgGUID: t8DDxDIQTUOaHSzTayluqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="195148986"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2025 17:42:51 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj5lQ-0001tL-1l;
	Tue, 05 Aug 2025 00:42:48 +0000
Date: Tue, 5 Aug 2025 02:42:43 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] fs/block_dev.c:1096:6:
 warning: no previous prototype for 'bd_abort_claiming'
Message-ID: <202508050226.6CBD8sQZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: abbf198d064fa41dcc413c392423ad71c2c85c3e [1743/1743] block: Do not discard buffers under a mounted filesystem
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508050226.6CBD8sQZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050226.6CBD8sQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050226.6CBD8sQZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/block_dev.c:1096:6: warning: no previous prototype for 'bd_abort_claiming' [-Wmissing-prototypes]
    1096 | void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
         |      ^~~~~~~~~~~~~~~~~


vim +/bd_abort_claiming +1096 fs/block_dev.c

  1085	
  1086	/**
  1087	 * bd_abort_claiming - abort claiming of a block device
  1088	 * @bdev: block device of interest
  1089	 * @whole: whole block device (returned from bd_start_claiming())
  1090	 * @holder: holder that has claimed @bdev
  1091	 *
  1092	 * Abort claiming of a block device when the exclusive open failed. This can be
  1093	 * also used when exclusive open is not actually desired and we just needed
  1094	 * to block other exclusive openers for a while.
  1095	 */
> 1096	void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
  1097	                      void *holder)
  1098	{
  1099	       spin_lock(&bdev_lock);
  1100	       bd_clear_claiming(whole, holder);
  1101	       spin_unlock(&bdev_lock);
  1102	}
  1103	EXPORT_SYMBOL(bd_abort_claiming);
  1104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
