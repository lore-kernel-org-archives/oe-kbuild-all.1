Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57C1DE89A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758992713; cv=none; b=QYR230d7+JAEvi6i5JXWh6HZXx3+2TjGFnd99vWTKf+8BXY0eCRbdlkNQV/d4AFWpTAO+7Y2YPbA1H/1k1to4bEjgnSlG+6XNzvzTQ+d+JIyUEyhVKgiSC5RLGENENS2mGSA+QvMH7tQ1Do8VmlLqhVjxcd0zr39Uvm+CM2uqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758992713; c=relaxed/simple;
	bh=C6L30VfJhl6vZyNZAahQ7cyCX5C5AuxRFpw5l3Q1Dwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPVkDUjBw6psbdVS3KmpvegRW/qF14oOZ8jEZkw4BvBXp7ohNQZuEMJu8VaGUJHXrsoTI+VqP2yKMk38U9gmzrvzEOKvZiipKQFEhATgr01lwERN5TUYrEMXP5Nyw2rafg/jcaB1WYnKBINwQON5htWJW4LstYoqtIv9Wro9ACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWdVkrDD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWdVkrDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758992711; x=1790528711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6L30VfJhl6vZyNZAahQ7cyCX5C5AuxRFpw5l3Q1Dwo=;
  b=lWdVkrDDBoSK4vRoj9TIgjn3BimwSs8JyL+mztCOKHhAzFxVWGY3vH41
   O0TMJh90yQmnQ6IRGhglc8lHzNULkAg8FpsV7oGRv95uHaOAK7Nh8R4/i
   i0OiyBdLcacPTTxNTmc/035zrWyQs8l4DgsxV6JlGXkFlfYlJd2Erfo9e
   Q1jZNx0ky2iYnrLFrkI6kdxabi2eJvhFOdmqAua/AmZafzfEcPzz6Q4cj
   NchKU3W/OVw8hBaNzoc+6dU+pbBlZ+s7bMjQjZL3EslaNxIuqXTAKSkRb
   Qpg0AbFUh5WTv1iYwNuLzJulqCsDjID9WP3H3Jzzo8FEymUCAh8+X8c/V
   Q==;
X-CSE-ConnectionGUID: 7CFVvFuhT3Kxp8htzbmW+A==
X-CSE-MsgGUID: Cb7V2T+jQMW0BRYq7ezUbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72660809"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="72660809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 10:05:11 -0700
X-CSE-ConnectionGUID: MNnW0J8rTROWiLu1PLq0FA==
X-CSE-MsgGUID: CCH9bg1QSnK9vujThNgTbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="178615653"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2025 10:05:09 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2YM7-0007Dr-0b;
	Sat, 27 Sep 2025 17:05:07 +0000
Date: Sun, 28 Sep 2025 01:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
	Anup Patel <anup@brainfault.org>
Subject: [linux-next:master 5507/12740] drivers/acpi/riscv/rimt.c:248:31:
 warning: 'rimt_node_get_id' defined but not used
Message-ID: <202509280031.8Sjkr4bh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   262858079afde6d367ce3db183c74d8a43a0e83f
commit: 8f77295525825086cb43675cd1a4f3716b119d7f [5507/12740] ACPI: RISC-V: Add support for RIMT
config: riscv-randconfig-r111-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280031.8Sjkr4bh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280031.8Sjkr4bh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280031.8Sjkr4bh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/riscv/rimt.c:248:31: warning: 'rimt_node_get_id' defined but not used [-Wunused-function]
     248 | static struct acpi_rimt_node *rimt_node_get_id(struct acpi_rimt_node *node,
         |                               ^~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/rimt.c:238:12: warning: 'rimt_id_map' defined but not used [-Wunused-function]
     238 | static int rimt_id_map(struct acpi_rimt_id_mapping *map, u8 type, u32 rid_in, u32 *rid_out)
         |            ^~~~~~~~~~~
>> drivers/acpi/riscv/rimt.c:213:12: warning: 'rimt_iommu_xlate' defined but not used [-Wunused-function]
     213 | static int rimt_iommu_xlate(struct device *dev, struct acpi_rimt_node *node, u32 deviceid)
         |            ^~~~~~~~~~~~~~~~
   drivers/acpi/riscv/rimt.c:205:13: warning: 'rimt_pcie_rc_supports_ats' defined but not used [-Wunused-function]
     205 | static bool rimt_pcie_rc_supports_ats(struct acpi_rimt_node *node)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rimt_node_get_id +248 drivers/acpi/riscv/rimt.c

   212	
 > 213	static int rimt_iommu_xlate(struct device *dev, struct acpi_rimt_node *node, u32 deviceid)
   214	{
   215		struct fwnode_handle *rimt_fwnode;
   216	
   217		if (!node)
   218			return -ENODEV;
   219	
   220		rimt_fwnode = rimt_get_fwnode(node);
   221	
   222		/*
   223		 * The IOMMU drivers may not be probed yet.
   224		 * Defer the IOMMU configuration
   225		 */
   226		if (!rimt_fwnode)
   227			return -EPROBE_DEFER;
   228	
   229		return acpi_iommu_fwspec_init(dev, deviceid, rimt_fwnode);
   230	}
   231	
   232	struct rimt_pci_alias_info {
   233		struct device *dev;
   234		struct acpi_rimt_node *node;
   235		const struct iommu_ops *ops;
   236	};
   237	
 > 238	static int rimt_id_map(struct acpi_rimt_id_mapping *map, u8 type, u32 rid_in, u32 *rid_out)
   239	{
   240		if (rid_in < map->source_id_base ||
   241		    (rid_in > map->source_id_base + map->num_ids))
   242			return -ENXIO;
   243	
   244		*rid_out = map->dest_id_base + (rid_in - map->source_id_base);
   245		return 0;
   246	}
   247	
 > 248	static struct acpi_rimt_node *rimt_node_get_id(struct acpi_rimt_node *node,
   249						       u32 *id_out, int index)
   250	{
   251		struct acpi_rimt_platform_device *plat_node;
   252		u32 id_mapping_offset, num_id_mapping;
   253		struct acpi_rimt_pcie_rc *pci_node;
   254		struct acpi_rimt_id_mapping *map;
   255		struct acpi_rimt_node *parent;
   256	
   257		if (node->type == ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX) {
   258			pci_node = (struct acpi_rimt_pcie_rc *)&node->node_data;
   259			id_mapping_offset = pci_node->id_mapping_offset;
   260			num_id_mapping = pci_node->num_id_mappings;
   261		} else if (node->type == ACPI_RIMT_NODE_TYPE_PLAT_DEVICE) {
   262			plat_node = (struct acpi_rimt_platform_device *)&node->node_data;
   263			id_mapping_offset = plat_node->id_mapping_offset;
   264			num_id_mapping = plat_node->num_id_mappings;
   265		} else {
   266			return NULL;
   267		}
   268	
   269		if (!id_mapping_offset || !num_id_mapping || index >= num_id_mapping)
   270			return NULL;
   271	
   272		map = ACPI_ADD_PTR(struct acpi_rimt_id_mapping, node,
   273				   id_mapping_offset + index * sizeof(*map));
   274	
   275		/* Firmware bug! */
   276		if (!map->dest_offset) {
   277			pr_err(FW_BUG "[node %p type %d] ID map has NULL parent reference\n",
   278			       node, node->type);
   279			return NULL;
   280		}
   281	
   282		parent = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table, map->dest_offset);
   283	
   284		if (node->type == ACPI_RIMT_NODE_TYPE_PLAT_DEVICE ||
   285		    node->type == ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX) {
   286			*id_out = map->dest_id_base;
   287			return parent;
   288		}
   289	
   290		return NULL;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
