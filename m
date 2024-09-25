Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29F18FDC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 23:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308129; cv=none; b=RbAQeocsiVOiSfy9WrFQVrRDm9vOSC3MLjo/RtqHMLgzN1LnmElY26rzk8SX2l7oHI2A3+YJqy/9452P9hNoThf9kswDZo0ATjHS/ncBqCTQC5qqhouPeeUMnhkUs168ucwrBkR6zMHuKwGjD6shGxkjXN71tw17L/9KmJKtpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308129; c=relaxed/simple;
	bh=aHkuDQ/+qqwAT8X7p6px3z43XkAl5erd3uFvu519Wfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FoOwFGWCJTyd3rDBCgu1z4DVmDcmsjQEv7BF9yllGKOrg/LCfXVWrE2ThAVq6VyEchaH5QROJ2iHW2vzpP1UPDuh6AVi2/iQ4w3Q+Ut6PoRqunqlGv16SiMQ/vGu+DjAXL5s6GJ4Gs+qRc/f7QjOq2Ab5QLs6sixzIdc/abpdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqvbeJUs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqvbeJUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727308128; x=1758844128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHkuDQ/+qqwAT8X7p6px3z43XkAl5erd3uFvu519Wfk=;
  b=mqvbeJUsSz2ReQLnIJqLHn51Xz/qDHrBdIBlZ2aBl01Lyava87twqwOQ
   GdYC+6UGhfZ0IBfVNFeeEAgrF6Xqr8F/GNI8TjuKjFES/0LStswnj1EQj
   Te/NUS5L2EIR5bVtnW/sEE64yO+m3YEjyl61pNmocuh5kXurCHX9TYBuX
   oxIFT8Kp58I1i5ztiJc0tLkfKvMa/xfi//9Qd+05syeBT6nnyUnp8v+nK
   O7pynTyzqnOtea/dRL+4aU/aDhyXoGhwzXeub7cnJNCoMGGgoVB8dy5cm
   t3gjh1rn+Va8gY1lS1JZwTL2vGi1UFJdMGP9WDWNyHG7X4XEstkmoVSYU
   Q==;
X-CSE-ConnectionGUID: jvC6pkIGQqKiKiO8SBOKiw==
X-CSE-MsgGUID: qhuEFSonQdSltVVhnpFMMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30178465"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="30178465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 16:48:47 -0700
X-CSE-ConnectionGUID: Kzl7HeCtRUqcN4Enef0VQg==
X-CSE-MsgGUID: cpQVzlxFQ+6VODJ0K4NQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="76028034"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2024 16:48:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stbkP-000K37-0O;
	Wed, 25 Sep 2024 23:48:41 +0000
Date: Thu, 26 Sep 2024 07:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1817/2443]
 drivers/vfio/pci/vfio_pci_config.c:1822:12: warning:
 'vfio_pci_add_emulated_cap_for_vf' defined but not used
Message-ID: <202409260745.fQySdJOB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 5289636fb54a508006db6ceb4ea97ca9fa8e246a [1817/2443] vfio/pci: Emulate PASID/PRI capability for VFs
config: x86_64-randconfig-006-20240926 (https://download.01.org/0day-ci/archive/20240926/202409260745.fQySdJOB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260745.fQySdJOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260745.fQySdJOB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/vfio/pci/vfio_pci_config.c:23:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
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
