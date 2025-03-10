Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E21D516F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741589125; cv=none; b=NcR10gc1S4CoGnyiRFAdfmud1NqhKbvd2qTYwRRjvW5GwN7qjBzBTaXy5K4QysnRAXxv2iNUEvvbIUtZnkhYmA3o5eXZxPp66eZcTHJnumGnpyVFcn/G2CCivtKkFCNfIJ2L6sKnosMlT1aziRzmsEqobfsOlnu1f+o5H6XatKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741589125; c=relaxed/simple;
	bh=6BtRP9IUF8CL4Uq+4nZaWVgCOtSFtSG7pqKP4GPsn6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/bINm0dD7PBFbNGa5d7J6STHphvBI3wBco/Nu8DEyt59AWbgALdO+jrTdNgWB9zetgc6GEeS6wdSK26URz/UUV/NsnD6NFoNN2lk9JHAh2vRFxdwaEIw6CNSFrp7Ax9aloKx5OGeSs1ZU6Vr9jBRA1F5wKX+dXJnJ8mU965k38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhBVm6Lp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhBVm6Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741589124; x=1773125124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BtRP9IUF8CL4Uq+4nZaWVgCOtSFtSG7pqKP4GPsn6k=;
  b=LhBVm6LpjenA5a+WGVwKMAZCLrZbmWd4Dei/U0LesSK2dmjO1Zp98Y5X
   W8QjPE9qYV6BNcOgog+575GWoA17+JcxidX1WoX4TGBwCsqIbAdiup8DF
   L5/+Ocg5fkgwKZGqm4ljq9ZQRybuDxCulfPMkNeGoohcbzhP50S++Tu6l
   mwZ5e5vZ2H79HCwxcwxPv1jFYVL97/pcoi1tIcvdi2Tmoe1RPPB0gK+y7
   8Hg1NxU8LPXl2eZxNhnBhzF/fuE5NBAUsUFuCGsO2GZ67k/ZY+8r5C3qO
   TFGBMtGqPZj04EJmdt2SdP1AUdm/YD4ruwKt0m5Q+DTE+XrBbVCg5lgVl
   Q==;
X-CSE-ConnectionGUID: TnxbFFgoTSORdVsq0tqlxQ==
X-CSE-MsgGUID: AyWKv/s0TNmflb5FOcJzVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42604953"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42604953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:45:24 -0700
X-CSE-ConnectionGUID: jtn515t7SwyqAMLysjcLQA==
X-CSE-MsgGUID: XUY/7g39Rg+zNybu8MyDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="125146058"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2025 23:45:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trWt5-0003tE-2q;
	Mon, 10 Mar 2025 06:45:19 +0000
Date: Mon, 10 Mar 2025 14:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-03-07 40/40]
 sound/soc/soc-core.c:2895:94: error: 'name' undeclared
Message-ID: <202503101445.AguRCIHI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-03-07
head:   609577579ecf4de9913d0d83a96d240bd935a4a1
commit: 609577579ecf4de9913d0d83a96d240bd935a4a1 [40/40] ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
config: arm-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101445.AguRCIHI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101445.AguRCIHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101445.AguRCIHI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/soc-core.c: In function 'snd_soc_unregister_component_by_driver':
>> sound/soc/soc-core.c:2895:94: error: 'name' undeclared (first use in this function)
    2895 |                 struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, name);
         |                                                                                              ^~~~
   sound/soc/soc-core.c:2895:94: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/soc-core.c:2888:21: warning: variable 'driver_name' set but not used [-Wunused-but-set-variable]
    2888 |         const char *driver_name = NULL;
         |                     ^~~~~~~~~~~


vim +/name +2895 sound/soc/soc-core.c

  2877	
  2878	/**
  2879	 * snd_soc_unregister_component_by_driver - Unregister component using a given driver
  2880	 * from the ASoC core
  2881	 *
  2882	 * @dev: The device to unregister
  2883	 * @component_driver: The component driver to unregister
  2884	 */
  2885	void snd_soc_unregister_component_by_driver(struct device *dev,
  2886						    const struct snd_soc_component_driver *component_driver)
  2887	{
> 2888		const char *driver_name = NULL;
  2889	
  2890		if (component_driver)
  2891			driver_name = component_driver->name;
  2892	
  2893		mutex_lock(&client_mutex);
  2894		while (1) {
> 2895			struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, name);
  2896	
  2897			if (!component)
  2898				break;
  2899	
  2900			snd_soc_del_component_unlocked(component);
  2901		}
  2902		mutex_unlock(&client_mutex);
  2903	}
  2904	EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
  2905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
