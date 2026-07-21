Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293A441035
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 22:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673050; cv=none; b=ehHOxv/dQ6yXX53KK5OWehOMmEkQx6s/JKZzpkxXmis9iavna1Na0UFqo1IahqqvHmN5tS31b9srPimQ8Q+42mZMb1kT+sTCgz36lxaW3keWaUK3FRxdhcBmGNZmWHroroPxH3Sr1RSn4+9NQJ3Zv7+uX/giYHcUsCEWg6b9zDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673050; c=relaxed/simple;
	bh=sHjxfRntt/CQyDDrqazVPonSzGWwt6jFIfE6teACxxo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dda2NNBVld4cD331EUlZEwTvGTEAtIN6Jn1qc76RzvYGUQICrBSu0i71PpCO49VZoUk5HkF/psGvxnbzUe/ABcfeDBQapCi99H/xBJoXVtsGJoClbp7r57R6QZgOzfUfDrYR5djnWQYjykOQniBlAsrvZu2in4rYSxb3Dc2g1RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOIcgDuC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOIcgDuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784673049; x=1816209049;
  h=date:from:to:cc:subject:message-id;
  bh=sHjxfRntt/CQyDDrqazVPonSzGWwt6jFIfE6teACxxo=;
  b=NOIcgDuCNIgoVyynfdsJkxMpO48h1wEsUDcBnhHIO4IOWi5iNgO4MGLN
   TGCUuzSz4yEEIEN9iNit7RJFic+hkOpH0rb5PFic66JpUtZQgtjYvVbJL
   UBS6q8iSchCTs8kj9mz/G9mFCTqOiVLuN8X/smx23kpTzn1LjVQ/qOzqS
   bBykd618jRSIAJkslBx2sgk9bD3dDNxDPXOYN5I7p64b5wkq5hGutwjuW
   DTr/q4gJrGLCiepdi6Yr9jPuGh8/1qx2UyF95cYgAl+dFnZWy+DZyeHSl
   abgCh7019PytaOEAWzv3kKqLNQPMVylJ5hzY9L3yZRyVhWIdwz+1IR2La
   w==;
X-CSE-ConnectionGUID: o5aaGsJTRM6yk0TR4EVuIg==
X-CSE-MsgGUID: FderGZGjQ5uqYmiboWVi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110839621"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="110839621"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 15:30:48 -0700
X-CSE-ConnectionGUID: +t2tZxa7RhCKauupWbNdfw==
X-CSE-MsgGUID: C7XGMIGBShi5iwRdkIM9ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="261461386"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Jul 2026 15:30:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmIz3-00000000Y7R-1tyi;
	Tue, 21 Jul 2026 22:30:41 +0000
Date: Wed, 22 Jul 2026 06:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: drivers/power/reset/reboot-mode.c:39:2-7: WARNING: invalid
 free of devm_ allocated data
Message-ID: <202607220659.YtQaDphB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: cfaf0a90789ac74391ac7583c86cdaaada78cdbb power: reset: reboot-mode: Expose sysfs for registered reboot_modes
date:   5 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260722/202607220659.YtQaDphB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cfaf0a90789a ("power: reset: reboot-mode: Expose sysfs for registered reboot_modes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220659.YtQaDphB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/reset/reboot-mode.c:39:2-7: WARNING: invalid free of devm_ allocated data

vim +39 drivers/power/reset/reboot-mode.c

    30	
    31	static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
    32	{
    33		struct mode_info *info;
    34		struct mode_info *next;
    35	
    36		list_for_each_entry_safe(info, next, &priv->head, list) {
    37			list_del(&info->list);
    38			kfree_const(info->mode);
  > 39			kfree(info);
    40		}
    41	}
    42	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
