Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE110A22
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720985729; cv=none; b=kY+57yLiehwiFTeIjs9LyEIN2zGxbVNndOSUrV1P24j8M7wqMio3qfHSh4Rv9rbfDFvoKgFgVAuCYJJVkq2Mn0B6ol672jXlqfQqXBbWAI0aJhXhKr4gQylKGEGdI8CWVrHJW6eyS0Irbaq/qT8d019jl0IaI7O6U1+O5bStaaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720985729; c=relaxed/simple;
	bh=AeEm7RnXdFlGRsDioWVxv3pm2349b/Fylg9rt1nxkLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZFg8DPDP3mOhEJyGgugHDTEhG7ftKXAJYCdpmy+xEDYgh5tNHw2QK2CAi6yOMk8ZHd2HZ2iac5oZJq2FIWbjZrebUYy5mDQMDZIIxFMkp5BlcGkRN6POTagzGk3PAIbTP2VMMqIkttQH4F+Aq6pZG4fr6snq7qqVeUbDtCsn7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htjetnOg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htjetnOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720985728; x=1752521728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AeEm7RnXdFlGRsDioWVxv3pm2349b/Fylg9rt1nxkLY=;
  b=htjetnOglpHQNOzaVtrNCn7YxKpzwi2M2gMoDRDH9uh6SD8WTn1Phypx
   Th58fODkzN8rtzJFDL3rzZECgIFLEE25RI0NVr3FAKM5UZ0d0u7kIGdOS
   r9DsU49MB4YumCwzUZkpwGBEpZ65AvfsYZfLJlsPSE2vD913wQVzk4U77
   4cm6DHnEHtI9AD0MeyeRvhqrDSsvvxmnwvMJyOFwniMBPHOqWQGTXehW8
   eZSQjKTXCIZMAns/Ur6IRhsqjnKlMnNdbWBIUeo0j4PpzlwASlDO2iYlT
   m63FwE082DL1sXQRPIpfJmkzL6SD261n5XbsN9Rey8Ny9TjuRH2FIv/nF
   w==;
X-CSE-ConnectionGUID: vnQ1a1LNR8+TmskBD7Sb8Q==
X-CSE-MsgGUID: 8rxvOXxmR8WCpOlQWxplMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18557915"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18557915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 12:35:27 -0700
X-CSE-ConnectionGUID: n1yQMJ2gQMyXkL4vX/eWGg==
X-CSE-MsgGUID: WDWtjLuzQlay+aSJUKH3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="50175071"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jul 2024 12:35:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT50F-000dgY-0v;
	Sun, 14 Jul 2024 19:35:23 +0000
Date: Mon, 15 Jul 2024 03:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240714 22/22]
 drivers/vfio/pci/vfio_pci_config.c:1518:1: warning:
 'vfio_fill_customized_vconfig_bytes' defined but not used
Message-ID: <202407150308.HCG5GIBX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240714
head:   d39032654710dfe496616b6df763fa99ba89021d
commit: d39032654710dfe496616b6df763fa99ba89021d [22/22] vfio/pci: Report PASID capability to userspace
config: i386-randconfig-014-20240714 (https://download.01.org/0day-ci/archive/20240715/202407150308.HCG5GIBX-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150308.HCG5GIBX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150308.HCG5GIBX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_config.c:1518:1: warning: 'vfio_fill_customized_vconfig_bytes' defined but not used [-Wunused-function]
    1518 | vfio_fill_customized_vconfig_bytes(struct vfio_pci_core_device *vdev,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vfio_fill_customized_vconfig_bytes +1518 drivers/vfio/pci/vfio_pci_config.c

  1515	
  1516	/* Fill data to vconfig */
  1517	static void
> 1518	vfio_fill_customized_vconfig_bytes(struct vfio_pci_core_device *vdev,
  1519					   int offset, uint8_t *data, int size)
  1520	{
  1521		int filled = 0;
  1522	
  1523		while (size) {
  1524			if (size >= 4 && !(offset % 4)) {
  1525				__le32 *dwordp = (__le32 *)&vdev->vconfig[offset];
  1526				u32 dword;
  1527	
  1528				memcpy(&dword, data + filled, 4);
  1529				*dwordp = cpu_to_le32(dword);
  1530				filled = 4;
  1531			} else if (size >= 2 && !(offset % 2)) {
  1532				__le16 *wordp = (__le16 *)&vdev->vconfig[offset];
  1533				u16 word;
  1534	
  1535				memcpy(&word, data + filled, 2);
  1536				*wordp = cpu_to_le16(word);
  1537				filled = 2;
  1538			} else {
  1539				u8 *byte = &vdev->vconfig[offset];
  1540	
  1541				memcpy(byte, data + filled, 1);
  1542				filled = 1;
  1543			}
  1544	
  1545			offset += filled;
  1546			size -= filled;
  1547		}
  1548	}
  1549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
