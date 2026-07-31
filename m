Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247BA2BEFF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520907; cv=none; b=Q4wBywwM1/px/GxZwfxFItE/tJfrx/j6EvakT/XDmeYSN7JcyregoEz6p9+kCRF6zV6FnOV9LrivU4OR0xgeXGxjOZHiobd2noaeP4u28QWtbzkOVjnenDSJ4UTEmOM4QUIiuZh1Ux7klQeVLcfAxUzgXL0YPdLn34f6tnmx5Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520907; c=relaxed/simple;
	bh=V+5hmRRzM1yfTeOPDl8OXZtLchmWiv+IZUwx8vcmEo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mKnvxxNZsvACGWGA842O4ZWG5Gjog3ojuJnpQJMiHVmohf930XmVgwKQtf7e6y9+fB6IoXWl3mtVWfNVNVFlMh20umkQdqzb9l2ISSM+ugYXXnGN2/NMxBU8lGc4DFsk5w38gw2P50VvUjd8DffBuGqmtkzn+vCsjKhWxn0gu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCU3Gfz3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCU3Gfz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785520905; x=1817056905;
  h=date:from:to:cc:subject:message-id;
  bh=V+5hmRRzM1yfTeOPDl8OXZtLchmWiv+IZUwx8vcmEo0=;
  b=VCU3Gfz3NTTOqVubFrwkaxOS7ETaCcnmoqZVCbPmsHMYrz7JPHu4TmB6
   Hu7FcLG1xbDhdzIUspfloYam7fEKeLbPzN3rlzg/foYERiYuZZ9DRNlvW
   xKac1wydbvRVBPSRnOHWq8tDTnVohfjj8Ofu5ad5fg22T/jhf00g3Ip0j
   na8PWApoC4Y/PSU1ehGtOyUzqMZQHi5MQ3FmX0oPmAZFn7o39PXU1+g37
   wL5eRrwk4arMuFG9GGg+OVwQo3X/tM6HfFCkUMQ7oZMReRisrX5g++NWo
   xwgKV8IpdW11VEJOAhOXxQCqinNhCrtGkZfei5cbv66Sga8jXSwif0mAw
   A==;
X-CSE-ConnectionGUID: kVmeTBTBSz+dCbD5ppsSeA==
X-CSE-MsgGUID: ZMDncuiBTIiOg2rYetVS4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="85281209"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="85281209"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 11:01:45 -0700
X-CSE-ConnectionGUID: kiaQ8+zmQdyo62gpcwJCSw==
X-CSE-MsgGUID: 9rZ9WiLsRJy4n8si2E41KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298869125"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2026 11:01:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wprYC-000000003Eq-1ckq;
	Fri, 31 Jul 2026 18:01:40 +0000
Date: Fri, 31 Jul 2026 20:01:30 +0200
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/vfio/pci/vfio_pci_config.c:1178:16: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202607311948.8g4FkmbJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20260731-191036
head:   e577f39fe33bc6418fdf32ae8285e95107a3ed2d
commit: 3071264b1b7974b90971cab472f711328a207c65 vfio/pci: Implement VFIO_DEVICE_FEATURE_TPH and valid TPH config write support
date:   7 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260731/202607311948.8g4FkmbJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311948.8g4FkmbJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311948.8g4FkmbJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_config.c: In function 'vfio_tph_config_write':
>> drivers/vfio/pci/vfio_pci_config.c:1178:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    1178 |         mode = FIELD_GET(PCI_TPH_CTRL_MODE_SEL_MASK, new_ctrl);
         |                ^~~~~~~~~


vim +/FIELD_GET +1178 drivers/vfio/pci/vfio_pci_config.c

  1147	
  1148	static int vfio_find_cap_start(struct vfio_pci_core_device *vdev, int pos);
  1149	static int vfio_tph_config_write(struct vfio_pci_core_device *vdev, int pos,
  1150					 int count, struct perm_bits *perm,
  1151					 int offset, __le32 val)
  1152	{
  1153		u16 start = vfio_find_cap_start(vdev, pos);
  1154		struct pci_dev *pdev = vdev->pdev;
  1155		u32 org_ctrl, new_ctrl, cap;
  1156		u8 mode, req, org_req;
  1157		__le32 org_val = 0;
  1158		bool extended;
  1159		int ret;
  1160	
  1161		if (!vdev->tph_permit)
  1162			return count;
  1163	
  1164		down_write(&vdev->memory_lock);
  1165	
  1166		org_ctrl = le32_to_cpu(*(__le32 *)&vdev->vconfig[start + PCI_TPH_CTRL]);
  1167		vfio_default_config_read(vdev, pos, count, perm, offset, &org_val);
  1168	
  1169		ret = vfio_default_config_write(vdev, pos, count, perm, offset, val);
  1170		if (ret != count)
  1171			goto out;
  1172	
  1173		new_ctrl = le32_to_cpu(*(__le32 *)&vdev->vconfig[start + PCI_TPH_CTRL]);
  1174		if (new_ctrl == org_ctrl)
  1175			goto out; /* Only care about changes in TPH_CTRL. */
  1176	
  1177		cap = le32_to_cpu(*(__le32 *)&vdev->vconfig[start + PCI_TPH_CAP]);
> 1178		mode = FIELD_GET(PCI_TPH_CTRL_MODE_SEL_MASK, new_ctrl);
  1179		req = FIELD_GET(PCI_TPH_CTRL_REQ_EN_MASK, new_ctrl);
  1180		if (mode > PCI_TPH_ST_DS_MODE || !(cap & (1u << mode)) || req == 0x2 ||
  1181			(req == PCI_TPH_REQ_EXT_TPH && !(cap & PCI_TPH_CAP_EXT_TPH)))
  1182			goto restore; /* Drop invalid or unsupported write value */
  1183	
  1184		org_req = FIELD_GET(PCI_TPH_CTRL_REQ_EN_MASK, org_ctrl);
  1185		if (req == org_req)
  1186			goto out; /* Only care about requester enable */
  1187	
  1188		ret = vfio_pci_set_power_state(vdev, PCI_D0);
  1189		if (ret)
  1190			goto restore; /* Drop this write */
  1191	
  1192		if (req == PCI_TPH_REQ_TPH_ONLY || req == PCI_TPH_REQ_EXT_TPH) {
  1193			extended = !!(req == PCI_TPH_REQ_EXT_TPH);
  1194			ret = pcie_enable_tph_explicit(pdev, mode, extended);
  1195			if (ret)
  1196				goto restore;
  1197		} else if (req == PCI_TPH_REQ_DISABLE) {
  1198			pcie_disable_tph(vdev->pdev);
  1199		}
  1200	
  1201		goto out;
  1202	
  1203	restore:
  1204		vfio_default_config_write(vdev, pos, count, perm, offset, org_val);
  1205	out:
  1206		up_write(&vdev->memory_lock);
  1207		return count;
  1208	}
  1209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
