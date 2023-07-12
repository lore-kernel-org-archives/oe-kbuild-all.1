Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70150DDBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689150590; x=1720686590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MUGEbJaItnwT5cDWIz+ePxXLD0Dl7gmfYtFfr8RkFJU=;
  b=E/zB6KiAmhEJRRmTY1Z59Qu5rwR6jIE0K80Oax5xrIB/KsWABZ5RUiMY
   /lkhVqMvhsbnqMVwX08585AXDf1Yda1mVTRg/wFkeg99MRFQAKF2uBaHk
   1hI+axAKMZXJblP1CPtXOi31SjsBLLF10OfR+CV7JqUdMqxGX0Tz42uih
   s95fZaMBkBGbmtzwZyqysqreKKoLEgU88Njgfb0/PI1wCNDwq6Hh7c/nw
   JsGRShkyksCQCUejABEoilqC3Xnq55/slBcoMdk/186kPoPBmI0KobdXf
   OLGdgzCqkADVGH9e1D3+U5U7UpP+sqFm07aagUGs2Vn5+aMAeDa7M0Y3H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428571557"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="428571557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 01:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="756675454"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="756675454"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jul 2023 01:29:48 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJVEJ-0005YN-20;
	Wed, 12 Jul 2023 08:29:47 +0000
Date: Wed, 12 Jul 2023 16:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 704/719]
 drivers/acpi/acpi_platform.c:126:15: warning: assignment to 'const struct
 acpi_device_id *' from 'int' makes pointer from integer without a cast
Message-ID: <202307121620.TaNvUXtv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   3e07459e3b3562fda8192f91db788c99827f23a0
commit: d034fcbb7913738b4e324fd6e6c41bd7936bc2d9 [704/719] ACPI: platform: Ignore SMB0001 only when it has resources
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230712/202307121620.TaNvUXtv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121620.TaNvUXtv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121620.TaNvUXtv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/acpi_platform.c: In function 'acpi_create_platform_device':
   drivers/acpi/acpi_platform.c:126:17: error: implicit declaration of function 'acpi_match_acpi_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     126 |         match = acpi_match_acpi_device(forbidden_id_list, adev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_match_device
>> drivers/acpi/acpi_platform.c:126:15: warning: assignment to 'const struct acpi_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     126 |         match = acpi_match_acpi_device(forbidden_id_list, adev);
         |               ^
   cc1: some warnings being treated as errors


vim +126 drivers/acpi/acpi_platform.c

    98	
    99	/**
   100	 * acpi_create_platform_device - Create platform device for ACPI device node
   101	 * @adev: ACPI device node to create a platform device for.
   102	 * @properties: Optional collection of build-in properties.
   103	 *
   104	 * Check if the given @adev can be represented as a platform device and, if
   105	 * that's the case, create and register a platform device, populate its common
   106	 * resources and returns a pointer to it.  Otherwise, return %NULL.
   107	 *
   108	 * Name of the platform device will be the same as @adev's.
   109	 */
   110	struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
   111							    const struct property_entry *properties)
   112	{
   113		struct acpi_device *parent = acpi_dev_parent(adev);
   114		struct platform_device *pdev = NULL;
   115		struct platform_device_info pdevinfo;
   116		const struct acpi_device_id *match;
   117		struct resource_entry *rentry;
   118		struct list_head resource_list;
   119		struct resource *resources = NULL;
   120		int count;
   121	
   122		/* If the ACPI node already has a physical device attached, skip it. */
   123		if (adev->physical_node_count)
   124			return NULL;
   125	
 > 126		match = acpi_match_acpi_device(forbidden_id_list, adev);
   127		if (match) {
   128			if (match->driver_data & ACPI_ALLOW_WO_RESOURCES) {
   129				bool has_resources = false;
   130	
   131				acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
   132						    acpi_platform_resource_count, &has_resources);
   133				if (has_resources)
   134					return ERR_PTR(-EINVAL);
   135			} else {
   136				return ERR_PTR(-EINVAL);
   137			}
   138		}
   139	
   140		INIT_LIST_HEAD(&resource_list);
   141		count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
   142		if (count < 0)
   143			return NULL;
   144		if (count > 0) {
   145			resources = kcalloc(count, sizeof(*resources), GFP_KERNEL);
   146			if (!resources) {
   147				acpi_dev_free_resource_list(&resource_list);
   148				return ERR_PTR(-ENOMEM);
   149			}
   150			count = 0;
   151			list_for_each_entry(rentry, &resource_list, node)
   152				acpi_platform_fill_resource(adev, rentry->res,
   153							    &resources[count++]);
   154	
   155			acpi_dev_free_resource_list(&resource_list);
   156		}
   157	
   158		memset(&pdevinfo, 0, sizeof(pdevinfo));
   159		/*
   160		 * If the ACPI node has a parent and that parent has a physical device
   161		 * attached to it, that physical device should be the parent of the
   162		 * platform device we are about to create.
   163		 */
   164		pdevinfo.parent = parent ? acpi_get_first_physical_node(parent) : NULL;
   165		pdevinfo.name = dev_name(&adev->dev);
   166		pdevinfo.id = PLATFORM_DEVID_NONE;
   167		pdevinfo.res = resources;
   168		pdevinfo.num_res = count;
   169		pdevinfo.fwnode = acpi_fwnode_handle(adev);
   170		pdevinfo.properties = properties;
   171	
   172		if (acpi_dma_supported(adev))
   173			pdevinfo.dma_mask = DMA_BIT_MASK(32);
   174		else
   175			pdevinfo.dma_mask = 0;
   176	
   177		pdev = platform_device_register_full(&pdevinfo);
   178		if (IS_ERR(pdev))
   179			dev_err(&adev->dev, "platform device creation failed: %ld\n",
   180				PTR_ERR(pdev));
   181		else {
   182			set_dev_node(&pdev->dev, acpi_get_node(adev->handle));
   183			dev_dbg(&adev->dev, "created platform device %s\n",
   184				dev_name(&pdev->dev));
   185		}
   186	
   187		kfree(resources);
   188	
   189		return pdev;
   190	}
   191	EXPORT_SYMBOL_GPL(acpi_create_platform_device);
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
