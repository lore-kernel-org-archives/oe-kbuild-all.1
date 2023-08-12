Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ABC628
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 08:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691829070; x=1723365070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/HAgdM51RnDScoXkjddHHDhRSbN+L9IbYrA3fQ3aRo=;
  b=Lfpx5+KfaWE/wsJUIVxhfkKR5ZI8o/RmzONyORp2brkweeGPLNc55I4l
   +/igz0suP6lNuOR/vu9XPAE6iGScjBZIu/u0Pj0eLmij9GyEJmIDqu0Ws
   nek0/Rh++Gcc/6yJTUo2elECaKRGWYqaLlF0Pc0uHeeDHR6WcYApyqb0F
   ZaE+Hqaq40znaYXhRf+TcQZlhcjD/obK3EvD2nxZ1G4WdTUm/qQZxaRpI
   72AivGRKhBWPZcbGKZwY7HsZ8jDAQRBPgrdYnWPGObHufgqTkDKtYE152
   4oCvpIm8Xz9uGy6701/qiVyrEVqSxZogb8+sxPncUHZvjC0+wT6sC+W7h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356772351"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="356772351"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 01:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="847025081"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="847025081"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2023 01:31:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUk1b-0008QA-1G;
	Sat, 12 Aug 2023 08:31:07 +0000
Date: Sat, 12 Aug 2023 16:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7979/8003]
 drivers/mtd/mtdsplit/mtdsplit_fit.c:82: warning: expecting prototype for Get
 'data(). Prototype was for fit_image_get_data_offset() instead
Message-ID: <202308121648.ezcYGmN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4
head:   33ae06cdbe7cdded20d1ac549403343243272109
commit: 1d762c3039f69d6949056a6da3a9817d37461036 [7979/8003] OWRT BUILD: mtd: mtdsplit support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308121648.ezcYGmN6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121648.ezcYGmN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121648.ezcYGmN6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/mtdsplit/mtdsplit_fit.c:82: warning: expecting prototype for Get 'data(). Prototype was for fit_image_get_data_offset() instead
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:107: warning: expecting prototype for Get 'data(). Prototype was for fit_image_get_data_position() instead
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:131: warning: expecting prototype for Get 'data(). Prototype was for fit_image_get_data_size() instead


vim +82 drivers/mtd/mtdsplit/mtdsplit_fit.c

    68	
    69	
    70	/**
    71	 * Get 'data-offset' property from a given image node.
    72	 *
    73	 * @fit: pointer to the FIT image header
    74	 * @noffset: component image node offset
    75	 * @data_offset: holds the data-offset property
    76	 *
    77	 * returns:
    78	 *     0, on success
    79	 *     -ENOENT if the property could not be found
    80	 */
    81	static int fit_image_get_data_offset(const void *fit, int noffset, int *data_offset)
  > 82	{
    83		const fdt32_t *val;
    84	
    85		val = fdt_getprop(fit, noffset, FIT_DATA_OFFSET_PROP, NULL);
    86		if (!val)
    87			return -ENOENT;
    88	
    89		*data_offset = fdt32_to_cpu(*val);
    90	
    91		return 0;
    92	}
    93	
    94	/**
    95	 * Get 'data-position' property from a given image node.
    96	 *
    97	 * @fit: pointer to the FIT image header
    98	 * @noffset: component image node offset
    99	 * @data_position: holds the data-position property
   100	 *
   101	 * returns:
   102	 *     0, on success
   103	 *     -ENOENT if the property could not be found
   104	 */
   105	static int fit_image_get_data_position(const void *fit, int noffset,
   106					int *data_position)
 > 107	{
   108		const fdt32_t *val;
   109	
   110		val = fdt_getprop(fit, noffset, FIT_DATA_POSITION_PROP, NULL);
   111		if (!val)
   112			return -ENOENT;
   113	
   114		*data_position = fdt32_to_cpu(*val);
   115	
   116		return 0;
   117	}
   118	
   119	/**
   120	 * Get 'data-size' property from a given image node.
   121	 *
   122	 * @fit: pointer to the FIT image header
   123	 * @noffset: component image node offset
   124	 * @data_size: holds the data-size property
   125	 *
   126	 * returns:
   127	 *     0, on success
   128	 *     -ENOENT if the property could not be found
   129	 */
   130	static int fit_image_get_data_size(const void *fit, int noffset, int *data_size)
 > 131	{
   132		const fdt32_t *val;
   133	
   134		val = fdt_getprop(fit, noffset, FIT_DATA_SIZE_PROP, NULL);
   135		if (!val)
   136			return -ENOENT;
   137	
   138		*data_size = fdt32_to_cpu(*val);
   139	
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
