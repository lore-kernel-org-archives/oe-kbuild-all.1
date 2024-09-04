Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C139B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 00:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725411112; cv=none; b=sYgGP569ybLU/ytPpm4IWMMtyb8npfAPBAqLFBun9Il7wS8DDbZRBRsQJohKMwoCQ0KgEVMpllYNwsFCdYweBeWvcTpat2txpnKEVfy0M6IiREuGv9gUM34vJwin9+3fNOaUVlhmGAtLs/LrMoF1Bcjxw3NW2Q3nuidbQ0IU3jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725411112; c=relaxed/simple;
	bh=zhaXyxmRZmnrre2w2QSodQs9wWdxdhKey6/SAouzDHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHF1idb10YeTH+mcMqXWERLDd+QDv+AesEN8Y4i7hl6fQ6vJnRio9YjOlZVhGzpxldHK1wkeE4BABb6iHCvfMel5D6Aku2meo8PJPIXF4nwaEHZTLKP39kyV7W4PCvY3x02llixMJJprOFHXCr+ekpqTIGYBwm+Km4oUFQd144U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j20bu4TF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j20bu4TF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725411111; x=1756947111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhaXyxmRZmnrre2w2QSodQs9wWdxdhKey6/SAouzDHA=;
  b=j20bu4TFoz1uvCdDxfO2v7dpdX7stb6JoxhvGnruWCkJv6ajs6AB9msA
   HYcUiU6rqcjJE1qXlrtqCDEinc5z6rRyz6ImKU4nZ9QNgyZzg6TaCQyQH
   WQOCUtDWftQuBJ7LOSD80n1/dFw+DAqDJRIM4ZlFcR83lgbOSCSS6dYi0
   vL5OAOq2SYEMH6OTK56xg6OiMmfKfp+02BaJ6F9Ockf0znU8RUMT6hnZt
   ixQtcQ37xP3fSfoJrWwAPp3Xvdli5ne8BAazEfWTwzmzlIFxE4PZtF8n8
   ZS6jePt9diRwHmpDyb16bxG0re41SLznTNM4RuO4MHf1XaUSCXqnTJ4tL
   A==;
X-CSE-ConnectionGUID: B3tx9cmARNiU/TzPmx3iWA==
X-CSE-MsgGUID: JJU9Q9tHT9KOWKIttriQGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35202279"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="35202279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:51:50 -0700
X-CSE-ConnectionGUID: oyEZ4heQTVe5TqoCKqYkEA==
X-CSE-MsgGUID: aCbFE3zoS8K8zlz+3Hzd1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="64909525"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Sep 2024 17:51:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sleFI-0007OQ-1K;
	Wed, 04 Sep 2024 00:51:40 +0000
Date: Wed, 4 Sep 2024 08:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29999/30000] drivers/acpi/acpi_memhotplug.c:236:
 undefined reference to `hmat_restore_target'
Message-ID: <202409040825.59qJfROR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [29999/30000] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-randconfig-013-20240903 (https://download.01.org/0day-ci/archive/20240904/202409040825.59qJfROR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040825.59qJfROR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040825.59qJfROR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/acpi_memhotplug.o: in function `acpi_memory_enable_device':
>> drivers/acpi/acpi_memhotplug.c:236: undefined reference to `hmat_restore_target'


vim +236 drivers/acpi/acpi_memhotplug.c

   171	
   172	static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
   173	{
   174		acpi_handle handle = mem_device->device->handle;
   175		int result, num_enabled = 0;
   176		struct acpi_memory_info *info;
   177		int node;
   178	
   179		node = acpi_get_node(handle);
   180		/*
   181		 * Tell the VM there is more memory here...
   182		 * Note: Assume that this function returns zero on success
   183		 * We don't have memory-hot-add rollback function,now.
   184		 * (i.e. memory-hot-remove function)
   185		 */
   186		list_for_each_entry(info, &mem_device->res_list, list) {
   187			if (info->enabled) { /* just sanity check...*/
   188				num_enabled++;
   189				continue;
   190			}
   191			/*
   192			 * If the memory block size is zero, please ignore it.
   193			 * Don't try to do the following memory hotplug flowchart.
   194			 */
   195			if (!info->length)
   196				continue;
   197			if (node < 0)
   198				node = memory_add_physaddr_to_nid(info->start_addr);
   199	
   200			result = __add_memory(node, info->start_addr, info->length,
   201					      MHP_NONE);
   202	
   203			/*
   204			 * If the memory block has been used by the kernel, add_memory()
   205			 * returns -EEXIST. If add_memory() returns the other error, it
   206			 * means that this memory block is not used by the kernel.
   207			 */
   208			if (result && result != -EEXIST)
   209				continue;
   210	
   211			result = acpi_bind_memory_blocks(info, mem_device->device);
   212			if (result) {
   213				acpi_unbind_memory_blocks(info);
   214				return -ENODEV;
   215			}
   216	
   217			info->enabled = 1;
   218	
   219			/*
   220			 * Add num_enable even if add_memory() returns -EEXIST, so the
   221			 * device is bound to this driver.
   222			 */
   223	
   224			hotplug_mdev[node] = mem_device->device;
   225			num_enabled++;
   226		}
   227		if (acpi_has_method(handle, "_HMA")) {
   228			acpi_status status;
   229			struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
   230	
   231			status = acpi_evaluate_object(handle, "_HMA", NULL, &buffer);
   232			if (ACPI_SUCCESS(status) && buffer.length) {
   233				union acpi_object *obj = buffer.pointer;
   234	
   235				if (!obj->buffer.length)
 > 236					hmat_restore_target(node);
   237			}
   238		}
   239	
   240		if (!num_enabled) {
   241			dev_err(&mem_device->device->dev, "add_memory failed\n");
   242			return -EINVAL;
   243		}
   244		/*
   245		 * Sometimes the memory device will contain several memory blocks.
   246		 * When one memory block is hot-added to the system memory, it will
   247		 * be regarded as a success.
   248		 * Otherwise if the last memory block can't be hot-added to the system
   249		 * memory, it will be failure and the memory device can't be bound with
   250		 * driver.
   251		 */
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
