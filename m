Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D81361952
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345868; cv=none; b=YDgYewfq6GZoVRCxuZvv7Yt1K4x2NBJ2fR+Mt4HjRwUG7rGGTO4Tg9NAEGLgbc3Yli9brF6J0A8Ht7SgAPveElbpkPef+nNY1PSo+gOt0ONeA+ryctHG3BQdKseVm93qivrcfkVUIqMMNBdG7/I/1LRpORbQITZG9fKg06xAerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345868; c=relaxed/simple;
	bh=elGtcTr7xPx2Q60NfT1WRMu2N6lR12alpUB/3yZiV5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KKbUVLPBHuPulm8ckEePLoWMsspMOZVAmURRsIG+YakS0VTPFYDoOgMlnoMBCF9Mp1+TMA1Pu5sLzFuCzFFeXhFEYw3smeao2xHiybAUV98uUlE+IrX/zUXqzToOa7IhlRQZgmEjmxjAxnOtbd0d/XM7mONfnkcC/I8xK2cBI1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3VnRx2d; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3VnRx2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792345856; x=1823881856;
  h=date:from:to:cc:subject:message-id;
  bh=elGtcTr7xPx2Q60NfT1WRMu2N6lR12alpUB/3yZiV5E=;
  b=W3VnRx2d0FjgzJ4BkZcl/sv550cDHC8ttAx4f6dE9kITV2/88byZT1QT
   0Pebi6AbNmsqvW6Fh9/NKjqB/k86iDWO44puU2h9TkzT1X+zof24ffvAd
   tDqX+1rIncIbSjqIJ/8mb9Wl8dbuMkJ1xGowWf9acWG+OPSiqFl8M362l
   Sm7JnefA03miNrmPNxKemtgoVjzOVnrej1nD1qnJb8aNeu/1eUMuAVm+l
   ybXDTrEumHiwsePuFSB3wNpG3IIzqCm6h69eHY8gRsIp26rW/RyaLfax1
   7zHOTsEggW6GNz0UbSVnBKzJ2YjINr4R7qBFaK7ivLWpbUiTsjp7X7T4s
   A==;
X-CSE-ConnectionGUID: NZSsCEeRQqW5sV+/jSwWMA==
X-CSE-MsgGUID: TVQTVi4DS4GwYcEu370YIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1050510"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1050510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 10:50:54 -0700
X-CSE-ConnectionGUID: 8BZK8WJzSBaK9jrCG2wy6A==
X-CSE-MsgGUID: qc3qz7vWQamvT5AgBaks6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2409896"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2026 10:50:52 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIV22-000000005C3-3FLm;
	Sun, 18 Oct 2026 17:50:50 +0000
Date: Sun, 18 Oct 2026 19:50:49 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 drivers/power/supply/power_supply_core.c:596:13: warning: variable 'ret' set
 but not used
Message-ID: <202610181905.N3MSjqdg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   3c5c679801a6a6e4a5aba2889fc2a5eeca9f58ef
commit: 64e2ee084b16924dde01aad0849acbc08c9ee506 [1/1] Merge 07b43820437b ("Merge tag 'for-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply") into android-mainline
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261018/202610181905.N3MSjqdg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181905.N3MSjqdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181905.N3MSjqdg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/power_supply_core.c:590:5: error: conflicting types for 'power_supply_get_by_phandle_array'; have 'int(struct device_node *, const char *, struct power_supply **, ssize_t)' {aka 'int(struct device_node *, const char *, struct power_supply **, long int)'}
     590 | int power_supply_get_by_phandle_array(struct device_node *np,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/power/supply/power_supply_core.c:21:
   ./include/linux/power_supply.h:823:1: note: previous definition of 'power_supply_get_by_phandle_array' with type 'int(struct device_node *, const char *, struct power_supply **, int)'
     823 | power_supply_get_by_phandle_array(struct device_node *np,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/power_supply_core.c: In function 'power_supply_get_by_phandle_array':
>> drivers/power/supply/power_supply_core.c:596:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     596 |         int ret;
         |             ^~~


vim +/ret +596 drivers/power/supply/power_supply_core.c

dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  569  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  570  /**
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  571   * power_supply_get_by_phandle_array() - Similar to
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  572   * power_supply_get_by_phandle but returns an array of power supply
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  573   * objects which are associated with the phandle.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  574   * @np: Pointer to device node holding phandle property.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  575   * @property: Name of property holding a power supply name.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  576   * @psy: Array of power_supply pointers provided by the client which is
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  577   * filled by power_supply_get_by_phandle_array.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  578   * @size: size of power_supply pointer array.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  579   *
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  580   * If power supply was found, it increases reference count for the
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  581   * internal power supply's device. The user should power_supply_put()
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  582   * after usage.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  583   *
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  584   * Return: On success returns the number of power supply objects filled
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  585   * in the @psy array.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  586   * -EOVERFLOW when size of @psy array is not suffice.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  587   * -EINVAL when @psy is NULL or @size is 0.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  588   * -ENODEV when matching device_node is not found.
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  589   */
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  590  int power_supply_get_by_phandle_array(struct device_node *np,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  591  				      const char *property,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  592  				      struct power_supply **psy,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  593  				      ssize_t size)
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  594  {
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  595  	struct device_node *power_supply_np;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01 @596  	int ret;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  597  	struct match_device_node_array_param param;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  598  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  599  	if (!psy || !size)
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  600  		return -EINVAL;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  601  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  602  	power_supply_np = of_parse_phandle(np, property, 0);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  603  	if (!power_supply_np)
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  604  		return -ENODEV;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  605  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  606  	param.parent_of_node = power_supply_np;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  607  	param.psy = psy;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  608  	param.psy_size = size;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  609  	param.psy_count = 0;
9f81255173e97d Lee Jones              2024-04-08  610  	ret = class_for_each_device(&power_supply_class, NULL, &param,
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  611  				    power_supply_match_device_node_array);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  612  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  613  	of_node_put(power_supply_np);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  614  
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  615  	return param.psy_count;
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  616  }
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  617  EXPORT_SYMBOL_GPL(power_supply_get_by_phandle_array);
dea1a925f6a164 Badhri Jagan Sridharan 2020-09-01  618  

:::::: The code at line 596 was first introduced by commit
:::::: dea1a925f6a164bc2b21ac2484983ae40347f012 ANDROID: power_supply: Add a helper function to retrieve psy array from phandle

:::::: TO: Badhri Jagan Sridharan <badhri@google.com>
:::::: CC: Alistair Delva <adelva@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
