Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C92E11DD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965242; cv=none; b=e7be/dSPCp8RnBG4hHVSTUnNa7M9g3a4gh56yNMGgLnBFiSqfU7L5bNbMCP0ImuyKIiU4/TRlIxKhHlzHfU8cm5r00KiHbAi9xj7WeKnjw7Ix8hocBKeSmkrEh7Bbb1X7BxdPQIm7Kr/sEEBlueCAQXD2DCzE1roqeoL89UL0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965242; c=relaxed/simple;
	bh=jKVoHVihHoIYaRnrqmPeYEtesD22+oLJaKQ/R5SA8UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSjvxupJ/uY4yQq8ZxxCoI3fC1OmPuNFAFfgLxZty8p+S44eEYg2wPRMiKJnUW1CqPEyDwwqttfhirSHJ01MGVgF30tUyFIIdRgNfW+IYR3VBWW2UNxNps6RVztS/tL7FMBfMoad8Cg+5xvqv7flhzdLdBvHrXY+r3y4TwxIdsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IG8RAtpk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IG8RAtpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764965241; x=1796501241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKVoHVihHoIYaRnrqmPeYEtesD22+oLJaKQ/R5SA8UM=;
  b=IG8RAtpkZ1GJm9ucN7zKcXIv+D6S+hZ6I7rJwy1ZMF+NSLXdvuk91cje
   FQZfLRyQdccM2iikam1b5FmtrzbmlL6zuu/+HIN+9uY0XsmB9BlNqtvKm
   v1/Pl35uCbGvYhTwUbtwvt3PdJlh6+AZh741PF9YPtN8sz1icd1N1Jawd
   XyMuOQCEcPVslzY6/hYQ+VlTxauAxRqSq/TUzJ9eZC5HB9DfPMzmD5GgH
   GFkwWuM4DfcAsVIEGoAgGbqaR3SS3u14u2wSX0M4nTh3oZIFKzXb2/RKw
   2KGX31Y+QoBlk8Lf4Cb6b9w0DSEKVIe1HgjJoJ2KA6sTbEu6un7/0yUYN
   Q==;
X-CSE-ConnectionGUID: aBVyKfFKQqabXsi7/8YmLQ==
X-CSE-MsgGUID: 7tUpHwmUS/CkpLwiVIftng==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66941249"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66941249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 12:07:19 -0800
X-CSE-ConnectionGUID: sD2J/7fDSw2MhCubPqvGoQ==
X-CSE-MsgGUID: Xsr4s8jeS2ywfVARHJRkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="199853105"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2025 12:07:18 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRc5D-00000000FUn-3Adh;
	Fri, 05 Dec 2025 20:07:15 +0000
Date: Sat, 6 Dec 2025 04:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubagg/ubagg_ioctl.c:70:6: warning: no previous prototype for
 'ubagg_dev_ref_get'
Message-ID: <202512060320.lR9JnDhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 1fe6d02bf7ba2fb5c30d3c4bed50f127243f7128 [3479/3479] urma: add ubagg ioctl interface and topology management
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060320.lR9JnDhZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060320.lR9JnDhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060320.lR9JnDhZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubagg/ubagg_ioctl.c:70:6: warning: no previous prototype for 'ubagg_dev_ref_get' [-Wmissing-prototypes]
      70 | void ubagg_dev_ref_get(struct ubagg_device *dev)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:75:6: warning: no previous prototype for 'ubagg_dev_ref_put' [-Wmissing-prototypes]
      75 | void ubagg_dev_ref_put(struct ubagg_device *dev)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:446:5: warning: no previous prototype for 'ubagg_user_ctl' [-Wmissing-prototypes]
     446 | int ubagg_user_ctl(struct ubcore_device *dev, struct ubcore_user_ctl *user_ctl)
         |     ^~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:483:5: warning: no previous prototype for 'ubagg_config_device' [-Wmissing-prototypes]
     483 | int ubagg_config_device(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:514:20: warning: no previous prototype for 'ubagg_create_jfc' [-Wmissing-prototypes]
     514 | struct ubcore_jfc *ubagg_create_jfc(struct ubcore_device *ub_dev,
         |                    ^~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:550:5: warning: no previous prototype for 'ubagg_destroy_jfc' [-Wmissing-prototypes]
     550 | int ubagg_destroy_jfc(struct ubcore_jfc *jfc)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:568:20: warning: no previous prototype for 'ubagg_create_jfs' [-Wmissing-prototypes]
     568 | struct ubcore_jfs *ubagg_create_jfs(struct ubcore_device *ub_dev,
         |                    ^~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:609:5: warning: no previous prototype for 'ubagg_destroy_jfs' [-Wmissing-prototypes]
     609 | int ubagg_destroy_jfs(struct ubcore_jfs *jfs)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:626:20: warning: no previous prototype for 'ubagg_create_jfr' [-Wmissing-prototypes]
     626 | struct ubcore_jfr *ubagg_create_jfr(struct ubcore_device *ub_dev,
         |                    ^~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:718:5: warning: no previous prototype for 'ubagg_destroy_jfr' [-Wmissing-prototypes]
     718 | int ubagg_destroy_jfr(struct ubcore_jfr *jfr)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:737:22: warning: no previous prototype for 'ubagg_create_jetty' [-Wmissing-prototypes]
     737 | struct ubcore_jetty *ubagg_create_jetty(struct ubcore_device *dev,
         |                      ^~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:829:5: warning: no previous prototype for 'ubagg_destroy_jetty' [-Wmissing-prototypes]
     829 | int ubagg_destroy_jetty(struct ubcore_jetty *jetty)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:849:5: warning: no previous prototype for 'ubagg_query_device_status' [-Wmissing-prototypes]
     849 | int ubagg_query_device_status(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubagg_dev_ref_get +70 drivers/ub/urma/ubagg/ubagg_ioctl.c

    69	
  > 70	void ubagg_dev_ref_get(struct ubagg_device *dev)
    71	{
    72		kref_get(&dev->ref);
    73	}
    74	
  > 75	void ubagg_dev_ref_put(struct ubagg_device *dev)
    76	{
    77		kref_put(&dev->ref, ubagg_dev_release);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
