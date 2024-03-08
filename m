Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63155E50
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897333; cv=none; b=dC3NcWY8QKZpRRm+PXzv0UsYkHsnKYoJXZvc8nXohzsS/lJ0YE6Gsdq/HDWXBDjrxc4I2xudbGWZdUO4EPXo/MBTj2R8EunfICYHz8BkTqleAEE5Lvoos/65sRar8PekseqooVTDcNI5eaVU//NtGiFKoKa7PScMMh6VJB3GoEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897333; c=relaxed/simple;
	bh=cFMFDCdQPbzJRq0275/4MKA4Hi8RtXPzc9Uto4d97Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTl4nlg3DxBWYDx+os1JrbEQDhSh160V3Q1ZUiS4fPS64LbFiUjGU/Y5xvx7/AWIqT3f0XVpj4WGZul4Ng1aFf+u2cFile729sXrdIgc54TSFhl6hE3OiYcfEEGmYJ6w7LbTCzcdU9O5DsVE/LltdXrhTEwJM4Jtn7+J1SQEVjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVCQsjny; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVCQsjny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709897332; x=1741433332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFMFDCdQPbzJRq0275/4MKA4Hi8RtXPzc9Uto4d97Es=;
  b=jVCQsjnyP6N/itoXZGXhEg05SluxRvpCXtNoc42O00laX1uUbtt9iIIY
   2iVdDXNbyhs9/su3vh61a9VTB2Tgru+an7fi7OAQb9YvpUPBhOc4ctujl
   GulcKSIpXZFP1llA1Wa8KHxRFfJCeI4Xy7kdNmX6Hpl12tfyupuWXsUkF
   43ukVyzX8k3znY0ITOIP3UQsBu+GTGQKASh/CYqBL4plu6pfQXbdqGlmN
   c16tk7q9/tXOz8vCF/EeXvy0h1YIM7CnnByf2ApZ/rz2x61JiTB1HW9Lz
   NpTuVMEs4AMpyuXUkLZqRJDSV/dE48eLKRTXJwyc0dMb3wuixniUsHL3g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4491011"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4491011"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="47904425"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2024 03:28:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riYP8-0006Kl-1J;
	Fri, 08 Mar 2024 11:28:46 +0000
Date: Fri, 8 Mar 2024 19:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/vfio/pci/vfio_pci_config.c:1555:5-8: Unneeded variable:
 "ret". Return "0" on line 1586
Message-ID: <202403081909.T7TWAqqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: bdee48559671cb26935ff5e7133fd3bd7a54676e vfio/pci: Emulate PASID/PRI capability for VFs
date:   9 months ago
config: x86_64-randconfig-102-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081909.T7TWAqqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081909.T7TWAqqp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/vfio_pci_config.c:1555:5-8: Unneeded variable: "ret". Return "0" on line 1586

vim +1555 drivers/vfio/pci/vfio_pci_config.c

  1551	
  1552	static int vfio_fill_custom_vconfig_bytes(struct vfio_pci_core_device *vdev,
  1553						int offset, uint8_t *data, int size)
  1554	{
> 1555		int ret = 0, data_offset = 0;
  1556	
  1557		while (size) {
  1558			int filled;
  1559	
  1560			if (size >= 4 && !(offset % 4)) {
  1561				__le32 *dwordp = (__le32 *)&vdev->vconfig[offset];
  1562				u32 dword;
  1563	
  1564				memcpy(&dword, data + data_offset, 4);
  1565				*dwordp = cpu_to_le32(dword);
  1566				filled = 4;
  1567			} else if (size >= 2 && !(offset % 2)) {
  1568				__le16 *wordp = (__le16 *)&vdev->vconfig[offset];
  1569				u16 word;
  1570	
  1571				memcpy(&word, data + data_offset, 2);
  1572				*wordp = cpu_to_le16(word);
  1573				filled = 2;
  1574			} else {
  1575				u8 *byte = &vdev->vconfig[offset];
  1576	
  1577				memcpy(byte, data + data_offset, 1);
  1578				filled = 1;
  1579			}
  1580	
  1581			offset += filled;
  1582			data_offset += filled;
  1583			size -= filled;
  1584		}
  1585	
> 1586		return ret;
  1587	}
  1588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
