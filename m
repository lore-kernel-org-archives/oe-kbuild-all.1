Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18651FE457
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891564; cv=none; b=hLkboPwoP2Qsn0ysNNFbIe4j6Kfwr3nSFHAzYqnT9FXInzzyxX5A/JgUDjsKBs/OvHo+TQJ/bodjqSEHeWyfkQdQX4acrEoS4OciKSg9fW7vgy+d6NcTKN1s8qNZfgXZSGLvI6ggD0HsouC80Th5eOrN8RIP8CIYWnqMjxLz2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891564; c=relaxed/simple;
	bh=xmZjO5Kg30ND+dXb732SBWkopvYmdv3ZqMYhLB0SHos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwD0/cRmgdDkGsLmt5nm5LZs5PsM+oXwRceMp6vWKDw5xI5GPTvcxWYHct7ooKZ9+f265CXxr/WHlYpISBu04fgLIMmCxVEjQMqu8S8gZYFIN8IKa5L/l3woV9uSbkVEaSY4bu4hyy5OyE7KO170PVbVekNm1wD3zGi98muc0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzX0ThoW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzX0ThoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745891563; x=1777427563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmZjO5Kg30ND+dXb732SBWkopvYmdv3ZqMYhLB0SHos=;
  b=MzX0ThoW8vqk2wWz0RngB3so9p44i259gbmzPIKlCyC+LaVnXoaFDbqp
   H5CU164ISsjR36vuOfpsOa1npEDa3Ok5+WCoWWatNsmj2vBhQveEn6FT8
   JVWY0DyUX6hMPResVQnADxk4J0Z4DsoI66qG+QIrExShzlC9ZjE1Qoayh
   hK1Krbc6d0KMkdwVwJ3GpoRa/Q2M17UYJdGND1fe3YJCTP+xJIvnj3mzh
   s8PLxOxh2Jss2MPEZL4WRTuEHxBaYkg9lJPTqzDro3dNyLs/EiD/UvH1y
   5VdJjYT5VxG4c+I4vGNKx1TDLZjPeepZHyxiQE/axdJUV5LQHIazg4A8o
   w==;
X-CSE-ConnectionGUID: wa1env25RCiuJfblx9PWaA==
X-CSE-MsgGUID: 8SrpeIJ1S3KOtoc0URJRmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72875755"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="72875755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:52:42 -0700
X-CSE-ConnectionGUID: jpyumgKNRYGZkBNobfQ55A==
X-CSE-MsgGUID: Cm43cDjuRN6syaVFIwZlVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="134198292"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2025 18:52:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9a9G-0000Or-1c;
	Tue, 29 Apr 2025 01:52:38 +0000
Date: Tue, 29 Apr 2025 09:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Michael Shych <michaelsh@nvidia.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 59/60]
 drivers/platform/mellanox/nvsw-sn2201.c:1303:14: warning: argument 1 null
 where non-null expected
Message-ID: <202504290944.hOoFRFoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   4d17f22bc6e9f6a9d94ee4313f6bf3cfa194726c
commit: bf180d44c6416f8e68c9a1fa349be008ccedd797 [59/60] platform: mellanox: nvsw-sn2200: Add support for new system flavour
config: x86_64-buildonly-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290944.hOoFRFoq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290944.hOoFRFoq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290944.hOoFRFoq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/mellanox/nvsw-sn2201.c: In function 'nvsw_sn2201_probe':
>> drivers/platform/mellanox/nvsw-sn2201.c:1303:14: warning: argument 1 null where non-null expected [-Wnonnull]
    1303 |         if (!strcmp(sku, "HI168"))
         |              ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/tlbbatch.h:5,
                    from include/linux/mm_types_task.h:17,
                    from include/linux/sched.h:38,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/platform/mellanox/nvsw-sn2201.c:8:
   include/linux/string.h:161:12: note: in a call to function 'strcmp' declared 'nonnull'
     161 | extern int strcmp(const char *,const char *);
         |            ^~~~~~


vim +1303 drivers/platform/mellanox/nvsw-sn2201.c

  1290	
  1291	static int nvsw_sn2201_probe(struct platform_device *pdev)
  1292	{
  1293		struct nvsw_sn2201 *nvsw_sn2201;
  1294		const char *sku;
  1295		int ret;
  1296	
  1297		nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
  1298		if (!nvsw_sn2201)
  1299			return -ENOMEM;
  1300	
  1301		/* Validate system powering type - only HI168 SKU supports extrenal power. */
  1302		sku = dmi_get_system_info(DMI_PRODUCT_SKU);
> 1303		if (!strcmp(sku, "HI168"))
  1304			nvsw_sn2201->ext_pwr_source = true;
  1305	
  1306		nvsw_sn2201->dev = &pdev->dev;
  1307		platform_set_drvdata(pdev, nvsw_sn2201);
  1308		ret = platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
  1309					      ARRAY_SIZE(nvsw_sn2201_lpc_io_resources));
  1310		if (ret)
  1311			return ret;
  1312	
  1313		nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
  1314		nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;
  1315		nvsw_sn2201->cpld_devs = nvsw_sn2201_cpld_brdinfo;
  1316		if (nvsw_sn2201->ext_pwr_source) {
  1317			nvsw_sn2201->sn2201_devs = nvsw_sn2201_busbar_static_brdinfo;
  1318			nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_busbar_static_brdinfo);
  1319		} else {
  1320			nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
  1321			nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
  1322		}
  1323	
  1324		return nvsw_sn2201_config_pre_init(nvsw_sn2201);
  1325	}
  1326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
