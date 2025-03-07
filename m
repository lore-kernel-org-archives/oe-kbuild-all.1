Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8A23E321
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741365452; cv=none; b=E4pjkEWaetwRFpC8iP26akakMoBpswrH6Um4kKJ8twEdtxatt0kJWoWv6amfSJEBElK6N+qeFgCu+ZcOFOqpMUpgscl22rwsS5NYJ95NoNIt9Su1zPpTrZLgr/Xbd2db3mtL+Re3g7fZi0UGkUJhaJmvb7qZgUG+J3M5hhyEOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741365452; c=relaxed/simple;
	bh=PFUTBiRZOe4RtgS/q+m1w+eHKEW1Ko1ocs7nOTJKZls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xmy6aDqSIEoPXnUriEdoF18tuRf07ZsY6IxQGRQp6wIK9lwmNMrEq1qKkl4+1aS/Xh3X53XlFTX8ErKf/R4gSnciBwjJHqhllp3xVFhBzsf+jBSRw7CkeGUzGwwZv1RzNzQ/Oy/YuOJ9EEP067J6g6iyVUIF0KYqpoJd/RvKltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqedeTHN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqedeTHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741365451; x=1772901451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFUTBiRZOe4RtgS/q+m1w+eHKEW1Ko1ocs7nOTJKZls=;
  b=bqedeTHNUPaMLWjeo+eV5cV9+hb8fuaNP/m7aiaG4xy5WInC0PsqQVVc
   02wTMEJse8DtosebGch25wkBcGXHJTpUpgk99G/A9p0IBSZSEYO2tHzAl
   NXApJjPhtOxzngbvjMD62QNnnpu9/w0IBUWAVUreDvOSG33iIHViBU6yR
   PiyJ6A5ju7bUar6vqHQwbNkRO6/D79WpFlWFf5gAu779aDwte4bPEZYeK
   JiDFeN9VJAhG4wjG8KKVsH8EtpKaGtoIZwVTL82HNaLI/2Pzdou8da7cK
   gZsZyaq2BN+7Olx/BADGR+CEhPsOAgE+hi89bXmTzLz1eNk1myEmBNWBa
   Q==;
X-CSE-ConnectionGUID: lxZQlZLaTt62/3zkf4gUqg==
X-CSE-MsgGUID: TmEkZcLRQM2vYOJd+HMmGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29999939"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29999939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:37:30 -0800
X-CSE-ConnectionGUID: 1XGf0/ZhT8erQewBQanMmg==
X-CSE-MsgGUID: l8OCUpX/Q2SNV2Eux7dSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119868480"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Mar 2025 08:37:29 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqahT-0000lv-0b;
	Fri, 07 Mar 2025 16:37:27 +0000
Date: Sat, 8 Mar 2025 00:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 187/411]
 drivers/gpu/drm/nouveau/nvkm/device/pci.c:1711:22: error: 'nouveau_dsm_priv'
 undeclared
Message-ID: <202503080055.0HkeDctJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 534e42b9723611083d7c2aca1460af3afa9ffec9 [187/411] drm/nouveau/nvif: add runpm supported flag to device impl
config: csky-randconfig-002-20250307 (https://download.01.org/0day-ci/archive/20250308/202503080055.0HkeDctJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080055.0HkeDctJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080055.0HkeDctJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/device/pci.c: In function 'nvkm_device_pci_new':
>> drivers/gpu/drm/nouveau/nvkm/device/pci.c:1711:22: error: 'nouveau_dsm_priv' undeclared (first use in this function)
    1711 |                 if (!nouveau_dsm_priv.optimus_detected) {
         |                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/device/pci.c:1711:22: note: each undeclared identifier is reported only once for each function it appears in


vim +/nouveau_dsm_priv +1711 drivers/gpu/drm/nouveau/nvkm/device/pci.c

  1628	
  1629	int
  1630	nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
  1631			    struct nvkm_device **pdevice)
  1632	{
  1633		const struct nvkm_device_quirk *quirk = NULL;
  1634		const struct nvkm_device_pci_device *pcid;
  1635		const struct nvkm_device_pci_vendor *pciv;
  1636		const char *name = NULL;
  1637		struct nvkm_device_pci *pdev;
  1638		struct nvkm_device *device;
  1639		int ret, bits;
  1640	
  1641		switch (pci_dev->vendor) {
  1642		case 0x10de: pcid = nvkm_device_pci_10de; break;
  1643		default:
  1644			pcid = NULL;
  1645			break;
  1646		}
  1647	
  1648		while (pcid && pcid->device) {
  1649			if (pciv = pcid->vendor, pcid->device == pci_dev->device) {
  1650				while (pciv && pciv->vendor) {
  1651					if (pciv->vendor == pci_dev->subsystem_vendor &&
  1652					    pciv->device == pci_dev->subsystem_device) {
  1653						quirk = &pciv->quirk;
  1654						name  =  pciv->name;
  1655						break;
  1656					}
  1657					pciv++;
  1658				}
  1659				if (!name)
  1660					name = pcid->name;
  1661				break;
  1662			}
  1663			pcid++;
  1664		}
  1665	
  1666		if (!(pdev = kzalloc(sizeof(*pdev), GFP_KERNEL)))
  1667			return -ENOMEM;
  1668		pdev->pdev = pci_dev;
  1669		device = &pdev->device;
  1670	
  1671		ret = pci_enable_device(pci_dev);
  1672		if (ret) {
  1673			kfree(pdev);
  1674			return ret;
  1675		}
  1676	
  1677		ret = nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->dev,
  1678				       pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
  1679				       pci_find_capability(pci_dev, PCI_CAP_ID_AGP) ?
  1680				       NVKM_DEVICE_AGP : NVKM_DEVICE_PCI,
  1681				       (u64)pci_domain_nr(pci_dev->bus) << 32 |
  1682					    pci_dev->bus->number << 16 |
  1683					    PCI_SLOT(pci_dev->devfn) << 8 |
  1684					    PCI_FUNC(pci_dev->devfn), name,
  1685				       &pdev->device);
  1686	
  1687		if (ret)
  1688			goto done;
  1689	
  1690		/* Set DMA mask based on capabilities reported by the MMU subdev. */
  1691		if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
  1692			bits = pdev->device.mmu->dma_bits;
  1693		else
  1694			bits = 32;
  1695	
  1696		ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bits));
  1697		if (ret && bits != 32) {
  1698			dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
  1699			pdev->device.mmu->dma_bits = 32;
  1700		}
  1701	
  1702	done:
  1703		if (ret) {
  1704			nvkm_device_del(&device);
  1705			return ret;
  1706		}
  1707	
  1708		*pdevice = &pdev->device;
  1709	
  1710		if (nvkm_runpm) {
> 1711			if (!nouveau_dsm_priv.optimus_detected) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
