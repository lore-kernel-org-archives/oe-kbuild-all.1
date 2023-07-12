Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF644433
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689154924; x=1720690924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9VH4X5zi3pGWxw9mBhSBEHBuGPUC0xWiJcLdK2zz3Y=;
  b=HFHttgkR4rzhZE5f+TTwKPN3Yyew2A4kJwJlVDXFRW4+jvRKC3Rzu8go
   k2knNjw9GO34Uip8s0cC4j+S8VedeBbYyqVVwK4pMcnGoOT8bSp6Z7/So
   y1o0oGm+6jq7TU7NCqjI+TNY8fAfUS+40v9sXhBpM5aIwTyim4exbbLTu
   W+xscNsDxBiqijgije4CJPkgg4Um7gb+lOa3b1frexLP1gI1FUt4zsKOV
   gTkFi9uUudL2ti3KIEXfadN35d+cab+LB9ezRosJ6VGVhCkERsM9/2VBQ
   VDEB5sGu6jGzWBwvBZggKXErEzhkVNRmb7tu/I/vDTg7U2q9eb83KS9ZK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364882320"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="364882320"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 02:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715497974"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="715497974"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jul 2023 02:41:49 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJWM1-0005ah-0W;
	Wed, 12 Jul 2023 09:41:49 +0000
Date: Wed, 12 Jul 2023 17:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 704/719]
 drivers/acpi/acpi_platform.c:126:10: error: call to undeclared function
 'acpi_match_acpi_device'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202307121739.hTmLJWxm-lkp@intel.com>
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
config: x86_64-randconfig-r025-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121739.hTmLJWxm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121739.hTmLJWxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121739.hTmLJWxm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/acpi_platform.c:126:10: error: call to undeclared function 'acpi_match_acpi_device'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           match = acpi_match_acpi_device(forbidden_id_list, adev);
                   ^
>> drivers/acpi/acpi_platform.c:126:8: error: incompatible integer to pointer conversion assigning to 'const struct acpi_device_id *' from 'int' [-Wint-conversion]
           match = acpi_match_acpi_device(forbidden_id_list, adev);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/acpi_match_acpi_device +126 drivers/acpi/acpi_platform.c

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
