Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA4211466
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662799; cv=none; b=kPFnk3n6elax306E4Ymma6IgGUcaRfzZG5rCSfbduA0Zv+bY013MNlHllkkjEM1VHzTd+O97uGtbMAZthYBc5z9s+EEB4+Jvg7SHXvgTIyYnwbShli8BJcvISCXsXsyqIQ4wYI/z77VVmHyfquP4oUI3P34P6iAkuP0zN322pRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662799; c=relaxed/simple;
	bh=Brb5dZ7EISYJcaAKgwB7q2UU24JD+LxA3BRVXpsD7uI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yzz431SjuYwRxe7ZW1jGpAgZghNCM8ntZYglyLhjPYIu7tYPDIbUlOVwegpoGIWwTU6CZTC09R72k+yZfEXrfhPGNMg1QRKm3YvhWTRh3ZkBvN2pV4GD39tS5hETAYJ+EDYgw4sKAQ2N3AUDI6toUD6MOABCdwq1r+zOBneWlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MM6U+y9/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MM6U+y9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780662798; x=1812198798;
  h=date:from:to:cc:subject:message-id;
  bh=Brb5dZ7EISYJcaAKgwB7q2UU24JD+LxA3BRVXpsD7uI=;
  b=MM6U+y9/BRwZRSRGkNkGa4QQ/Tr8YJpDQb1PrfhKPQh/QjJZBmjfrv7h
   3TWjO+rSdqYNlMVh33XEyl55Wg/bXBj7Sqx5GpC6eW4jrK/bmZSn3ZY5z
   dOlVX3rjnIfs5F3WK2pspzOXBo3gH1/r8OxOTAdANFh9iWp7YDcJCfttJ
   b0f94Oed8rgekY/H8l3cwVlep4uZ/PE0Ob5EjBebXVuWOAQXpzPzYZAb3
   smpWdVl/RHLe62mw97enhFSJ83qs7QM9ssd+EoLqxuggk67BSxMIYitV7
   gtbEGeRYOdDImWxtzxDTVjScgQ0x+GpJiSIRJEEhZ1+dd45NwoJ8WGEgm
   Q==;
X-CSE-ConnectionGUID: D6YOnWBZSiCYAfodMzUKXw==
X-CSE-MsgGUID: eeaVgZ2WTrieay3Oea3vCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69028230"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="69028230"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:33:17 -0700
X-CSE-ConnectionGUID: FqS883lUSueyFefnBUyNvg==
X-CSE-MsgGUID: qbR9MlK5QlG/oO7jx4Ra2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249762179"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Jun 2026 05:33:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVTjd-000000002ZF-0MoH;
	Fri, 05 Jun 2026 12:33:13 +0000
Date: Fri, 05 Jun 2026 14:32:21 +0200
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/vfio/pci/vfio_pci_config.c:1166:16: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202606051445.236KUhLV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20260604-214853
head:   345c2b0902fb86eb32cf8fadfdfb114490531b81
commit: 345c2b0902fb86eb32cf8fadfdfb114490531b81 vfio/pci: Virtualize PCIe TPH capability registers
date:   23 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260605/202606051445.236KUhLV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051445.236KUhLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051445.236KUhLV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_config.c: In function 'vfio_tph_config_write':
>> drivers/vfio/pci/vfio_pci_config.c:1166:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    1166 |         mode = FIELD_GET(PCI_TPH_CTRL_MODE_SEL_MASK, data);
         |                ^~~~~~~~~


vim +/FIELD_GET +1166 drivers/vfio/pci/vfio_pci_config.c

  1127	
  1128	static int vfio_find_cap_start(struct vfio_pci_core_device *vdev, int pos);
  1129	static int vfio_tph_config_write(struct vfio_pci_core_device *vdev, int pos,
  1130					 int count, struct perm_bits *perm,
  1131					 int offset, __le32 val)
  1132	{
  1133		int req_en_byte = PCI_TPH_CTRL + 1;
  1134		struct pci_dev *pdev = vdev->pdev;
  1135		__le32 org_val = 0;
  1136		bool extended;
  1137		u8 mode, req;
  1138		int i, ret;
  1139		u16 start;
  1140		u32 data;
  1141	
  1142		if (!vdev->tph_permit)
  1143			return count;
  1144	
  1145		/* Back up the original values in order rollback when fail */
  1146		if (offset <= req_en_byte && offset + count > req_en_byte)
  1147			vfio_default_config_read(vdev, pos, count, perm, offset,
  1148						 &org_val);
  1149	
  1150		ret = vfio_default_config_write(vdev, pos, count, perm, offset, val);
  1151		if (ret != count)
  1152			return ret;
  1153	
  1154		/* Skip if write range does not cover Requester Enable byte */
  1155		if (offset > req_en_byte || offset + count <= req_en_byte)
  1156			return count;
  1157	
  1158		ret = vfio_pci_set_power_state(vdev, PCI_D0);
  1159		if (ret)
  1160			return count;
  1161	
  1162		mutex_lock(&vdev->tph_lock);
  1163	
  1164		start = vfio_find_cap_start(vdev, pos);
  1165		data = le32_to_cpu(*(__le32 *)&vdev->vconfig[start + PCI_TPH_CTRL]);
> 1166		mode = FIELD_GET(PCI_TPH_CTRL_MODE_SEL_MASK, data);
  1167		req = FIELD_GET(PCI_TPH_CTRL_REQ_EN_MASK, data);
  1168	
  1169		if (req == PCI_TPH_REQ_TPH_ONLY || req == PCI_TPH_REQ_EXT_TPH) {
  1170			extended = !!(req == PCI_TPH_REQ_EXT_TPH);
  1171			ret = pcie_enable_tph_explicit(pdev, mode, extended);
  1172			if (!ret && vdev->tph_st_shadow) {
  1173				for (i = 0; i < vdev->tph_st_entries; i++)
  1174					pcie_tph_set_st_entry(pdev, i,
  1175							      vdev->tph_st_shadow[i]);
  1176			}
  1177			if (ret)
  1178				vfio_default_config_write(vdev, pos, count, perm,
  1179							  offset, org_val);
  1180		} else if (req == PCI_TPH_REQ_DISABLE) {
  1181			pcie_disable_tph(vdev->pdev);
  1182		} else {
  1183			vfio_default_config_write(vdev, pos, count, perm, offset,
  1184						  org_val);
  1185		}
  1186	
  1187		mutex_unlock(&vdev->tph_lock);
  1188	
  1189		return count;
  1190	}
  1191	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
