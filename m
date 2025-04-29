Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066317E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916350; cv=none; b=EMfDE2nn8G8+kzlopDp+ttIKgYkIc5J4kY5KP++0PWF7C4aMLNNWIVOnkmZ5iWDkMyAEjuyjNtLqufvtIa3Xv7lOTgPRfuYXEQUbX2SEA1fhq9m0gnONlEvosooqETmoWqLGU7XZmQl5yX9cIYGr4QW1niktoFi/uBYRvK9xLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916350; c=relaxed/simple;
	bh=WbvbuG34tjL3mqFCzXv1DrWhk6b5LMlwEDG1mGo4/5U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AYPQelVF1Ay+1xJ615PDWrJlOxBfiisB0sisK8S1GY3/YWGst8vd9fiddBIrrjO1QEgR2V6nDwqNTfmvbmQhUXYaywwbIm8zHGUvwrhVYO2S4s7BpII/Os5ii9JSj8EAqw8R/UPz9HUwgQoxKcmh+aO3OP+FIKsyXBFSlX9VSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVoyA+1D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVoyA+1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745916349; x=1777452349;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WbvbuG34tjL3mqFCzXv1DrWhk6b5LMlwEDG1mGo4/5U=;
  b=gVoyA+1D2cby6gVKYELJzjmC48obaefarTHgMDBmzNiYGrmJP0r+Aw2w
   VgNu9f8D52jRlb+raRr4RHdAoWOhOdsMR6euPafZWTR+F4H/x5dxGe8UP
   P2p0BmhCXyCxQ7zRlxWG5axNoyMcokhwCymKqa4t6uyHXWhh5ajWImiVE
   dNps5uuqNE0yaDNEnv4PmUX04xuPSdLrPMhWtQmGUmGIk1naCrPr4osoO
   tOarVwnAlozQDtZRUMQVSK7dG+ybGn3HreyckiAzu5hgVpCSkrbXt89VD
   F505D/IGAvoObawq4+LyiVbiqjB5Oj0LbQsce3qhCJIEnmRBbhioewW2c
   g==;
X-CSE-ConnectionGUID: psvvS5nHStSkk2UPXzolVg==
X-CSE-MsgGUID: oma0hISBQhqU5OTYkl7DLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72906403"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="72906403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:45:48 -0700
X-CSE-ConnectionGUID: upQmU7t2SgSqctIb/V5wxg==
X-CSE-MsgGUID: p/XP9ISET/Gnh8D+12EOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138754118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:45:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Apr 2025 11:45:42 +0300 (EEST)
To: kernel test robot <lkp@intel.com>, Vadim Pasternak <vadimp@nvidia.com>
cc: oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 59/60]
 drivers/platform/mellanox/nvsw-sn2201.c:1303:14: warning: argument 1 null
 where non-null expected
In-Reply-To: <202504290944.hOoFRFoq-lkp@intel.com>
Message-ID: <6533a563-0d8f-9703-3887-24d28d889652@linux.intel.com>
References: <202504290944.hOoFRFoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> head:   4d17f22bc6e9f6a9d94ee4313f6bf3cfa194726c
> commit: bf180d44c6416f8e68c9a1fa349be008ccedd797 [59/60] platform: mellanox: nvsw-sn2200: Add support for new system flavour
> config: x86_64-buildonly-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290944.hOoFRFoq-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290944.hOoFRFoq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504290944.hOoFRFoq-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/platform/mellanox/nvsw-sn2201.c: In function 'nvsw_sn2201_probe':
> >> drivers/platform/mellanox/nvsw-sn2201.c:1303:14: warning: argument 1 null where non-null expected [-Wnonnull]
>     1303 |         if (!strcmp(sku, "HI168"))
>          |              ^~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/x86/include/asm/tlbbatch.h:5,
>                     from include/linux/mm_types_task.h:17,
>                     from include/linux/sched.h:38,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from drivers/platform/mellanox/nvsw-sn2201.c:8:
>    include/linux/string.h:161:12: note: in a call to function 'strcmp' declared 'nonnull'
>      161 | extern int strcmp(const char *,const char *);
>          |            ^~~~~~
> 
> 
> vim +1303 drivers/platform/mellanox/nvsw-sn2201.c
> 
>   1290	
>   1291	static int nvsw_sn2201_probe(struct platform_device *pdev)
>   1292	{
>   1293		struct nvsw_sn2201 *nvsw_sn2201;
>   1294		const char *sku;
>   1295		int ret;
>   1296	
>   1297		nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
>   1298		if (!nvsw_sn2201)
>   1299			return -ENOMEM;
>   1300	
>   1301		/* Validate system powering type - only HI168 SKU supports extrenal power. */
>   1302		sku = dmi_get_system_info(DMI_PRODUCT_SKU);
> > 1303		if (!strcmp(sku, "HI168"))
>   1304			nvsw_sn2201->ext_pwr_source = true;
>   1305	
>   1306		nvsw_sn2201->dev = &pdev->dev;
>   1307		platform_set_drvdata(pdev, nvsw_sn2201);
>   1308		ret = platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
>   1309					      ARRAY_SIZE(nvsw_sn2201_lpc_io_resources));
>   1310		if (ret)
>   1311			return ret;
>   1312	
>   1313		nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
>   1314		nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;
>   1315		nvsw_sn2201->cpld_devs = nvsw_sn2201_cpld_brdinfo;
>   1316		if (nvsw_sn2201->ext_pwr_source) {
>   1317			nvsw_sn2201->sn2201_devs = nvsw_sn2201_busbar_static_brdinfo;
>   1318			nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_busbar_static_brdinfo);
>   1319		} else {
>   1320			nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
>   1321			nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
>   1322		}
>   1323	
>   1324		return nvsw_sn2201_config_pre_init(nvsw_sn2201);
>   1325	}
>   1326	
> 
> 

Hi Vadim,

As this change is only in the review-ilpo-next branch. I drop it and the 
Documentation change, please fix this warning and resubmit the last two 
patches, thank you.

-- 
 i.

