Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0719AA53
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729598260; cv=none; b=GmXC1Y1pWnH9dhH5BXzAmW+Ru39j8PCwCxH4bsFUQGXRk9Z2CsYBzdHXF2MzBtnXBjnEQC9xfts/gvxFQZLzjishToR0ohmzD65X5kh23N8xlyuUptNmCgV5Zaw9HjYgJiuzPtCDJfR+2U/9K+c+FyNGpKTbdARd3RfYW5ewkYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729598260; c=relaxed/simple;
	bh=YoHtRPTnqfj5rzl9cuoJthTQR3g60aGVef+a/KTr3qI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YlOmubjTUfu0f0J/bZHS0DwAzBU2GLAv2TyBPADYpEhuIoZovimxjGR+knI1vDQThCA8qU/PZOwKC3/Yikfmq3EcbtZDarPG1+piZqFd729lx7hJqPeR/2sx6Qo/IuLwhLdFaNAbObjxwRNQBeLthGkfTXRbRCGebSC0dVC59Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMwFjGdm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMwFjGdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729598259; x=1761134259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoHtRPTnqfj5rzl9cuoJthTQR3g60aGVef+a/KTr3qI=;
  b=cMwFjGdmaiEypIAhFluEHaKP/lejlYKfsPJy9gr6xXLqvw+wb3gWIckl
   pB8UhWcVjxWWdGKFQuy18Ak36DrSQzgaHYDr2yt5s68gqjDLvEvL2vVW9
   itm2CcAserFLApHLM/THK9S+WL/oLxe+uf1yDlo+7Ra6PqgBS1QPOg4fM
   Qd31Xozyxsn7B1+V5dwPU3COuP4u4j/8e1I6pzND+tyNS346JsHgWcLgc
   8j9TDeDSo4iu4fXPT9Z+ypjNHHq78TBhMe0egkdWSR46N5bul5j0kdn+Q
   zr/QRHEUrh1MqmPH4YSypLM1gN3nVCsev5hKca7Kmm3R55lhfc1CrcoMr
   A==;
X-CSE-ConnectionGUID: khaXGsQURMGmCHsgKWKbww==
X-CSE-MsgGUID: TxbU2tBuSoehmhLAeT+v9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51671081"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51671081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:57:38 -0700
X-CSE-ConnectionGUID: /UDRgiavTqijwWVHih9b4g==
X-CSE-MsgGUID: L8mkONxjRy+rWYScE+ajSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="117282661"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2024 04:57:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3DW0-000TWt-2d;
	Tue, 22 Oct 2024 11:57:32 +0000
Date: Tue, 22 Oct 2024 19:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1817/2444]
 drivers/vfio/pci/vfio_pci_config.c:1822:12: warning:
 'vfio_pci_add_emulated_cap_for_vf' defined but not used
Message-ID: <202410221935.V5FY7Dc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 5289636fb54a508006db6ceb4ea97ca9fa8e246a [1817/2444] vfio/pci: Emulate PASID/PRI capability for VFs
config: x86_64-randconfig-016-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221935.V5FY7Dc5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221935.V5FY7Dc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221935.V5FY7Dc5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from include/linux/vfio.h:12,
                    from drivers/vfio/pci/vfio_pci_config.c:26:
   include/linux/ioasid.h:210:51: error: unknown type name 'ioasid_set_type'
     210 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_config.c:2112:1: error: version control conflict marker in file
    2112 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/vfio/pci/vfio_pci_config.c:2127:1: error: version control conflict marker in file
    2127 | >>>>>>> 64511739a93d... vfio/pci: Emulate PASID/PRI capability for VFs
         | ^~~~~~~
   drivers/vfio/pci/vfio_pci_config.c:2127:9: error: invalid suffix "a93d..." on integer constant
    2127 | >>>>>>> 64511739a93d... vfio/pci: Emulate PASID/PRI capability for VFs
         |         ^~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_config.c: In function 'vfio_pci_config_rw':
   drivers/vfio/pci/vfio_pci_config.c:2221:23: error: implicit declaration of function 'vfio_config_do_rw'; did you mean 'vfio_config_free'? [-Werror=implicit-function-declaration]
    2221 |                 ret = vfio_config_do_rw(vdev, buf, count, &pos, iswrite);
         |                       ^~~~~~~~~~~~~~~~~
         |                       vfio_config_free
   drivers/vfio/pci/vfio_pci_config.c: At top level:
   drivers/vfio/pci/vfio_pci_config.c:2100:15: warning: 'vfio_pci_cap_remaining_dword' defined but not used [-Wunused-function]
    2100 | static size_t vfio_pci_cap_remaining_dword(struct vfio_pci_core_device *vdev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/pci/vfio_pci_config.c:1822:12: warning: 'vfio_pci_add_emulated_cap_for_vf' defined but not used [-Wunused-function]
    1822 | static int vfio_pci_add_emulated_cap_for_vf(struct vfio_pci_core_device *vdev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_config.c:333:25: warning: 'virt_perms' defined but not used [-Wunused-variable]
     333 | static struct perm_bits virt_perms = {
         |                         ^~~~~~~~~~
   drivers/vfio/pci/vfio_pci_config.c:328:25: warning: 'unassigned_perms' defined but not used [-Wunused-variable]
     328 | static struct perm_bits unassigned_perms = {
         |                         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vfio_pci_add_emulated_cap_for_vf +1822 drivers/vfio/pci/vfio_pci_config.c

  1821	
> 1822	static int vfio_pci_add_emulated_cap_for_vf(struct vfio_pci_core_device *vdev,
  1823				struct pci_dev *pdev, u16 start_epos, __le32 *prev)
  1824	{
  1825		__le32 *__prev = prev;
  1826		u16 epos = start_epos, epos_next = start_epos;
  1827		int ret = 0;
  1828	
  1829		/* Add PASID capability*/
  1830		ret = vfio_pci_add_pasid_cap(vdev, pdev, epos,
  1831						&epos_next, &__prev);
  1832		if (ret)
  1833			return ret;
  1834	
  1835		/* Add PRI capability */
  1836		epos = epos_next;
  1837		ret = vfio_pci_add_pri_cap(vdev, pdev, epos,
  1838					   &epos_next, &__prev);
  1839	
  1840		return ret;
  1841	}
  1842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
