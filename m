Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271784A23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765591372; cv=none; b=Wnbgb12nczur4AJVurQbo7H5SpwIKfDQdriB/JKlNhQrOJoif/7NdYRklwmAXPuS4SekAYMgFwINd67Lybi59+ONo8FYuybwxWUmCoOXFw/ZFTxb7ernuYBQrmLI9I6nOwBwpTRLY78zTSNZ/qIrmlqwOR+SPK8q8XRrKPDrSms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765591372; c=relaxed/simple;
	bh=vRGMjFxuFo7zQ5CJfnyxFOj+M+5SThyKz+z3WspvXkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZRaYgpdaUczaIosQRWA5tgYbxNY16rfjkzkeVG0V5F48jLfaq8YyVZe5sVq7fvQ4CSHyIsmMV6xbjpvcDlmVcGvwa0dOIJ2GQBlfE2pWRr/DMk/rhXBu8uElHLppO9zcaJQL+8xLH2QEzpIs2s2Hc3ib8CticCUDajLPfiBcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=In4djjlu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="In4djjlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765591370; x=1797127370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRGMjFxuFo7zQ5CJfnyxFOj+M+5SThyKz+z3WspvXkg=;
  b=In4djjluwh4K96tH1Bp27hPLF398V6E5wDP0Yaev5wDsXZfpoQL2Zv+w
   mOoG1snNo1AaRAhEmMPnAjNIADvf+XtyEfsdQ+srGXzq63CSg9OF9+olq
   Lp2ajRvleeSmaRgeDP4HCqHk5ylXC5qt4xCaTGZffgpp7mnDVkal5DbQM
   w5xrG33dmeM8sd6FL6dpH4+kMhldbTImeQEfd4sGIFOVNhtmrJ0Er3AJv
   qCSHzm88VHynSdvQTmAYTVozOUz3m0wNeQIYVnQhUyviYoyU+/EgfPXgz
   +Nc2BUNZa6n9sZ3GeFnxdXw2YCh4D0OM3Q1fgVdsasgg05EmK1IbNyMvf
   A==;
X-CSE-ConnectionGUID: aJfG7tyrRdC7jgbNjqFt6Q==
X-CSE-MsgGUID: cyisn9XMQPy205E+qUuN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="55160133"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="55160133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:02:49 -0800
X-CSE-ConnectionGUID: SZc5WiifQxCkDILA6mDwNA==
X-CSE-MsgGUID: R2u17goFR5qAciY2qS/ELQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201411555"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 18:02:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEy6-000000006ub-0AzQ;
	Sat, 13 Dec 2025 02:02:46 +0000
Date: Sat, 13 Dec 2025 10:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/crypto/montage/tsse/tsse_fw_service.c:40:16: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202512130900.UPe4oSIC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 811debd4ea52033d7393d4a7de2be11f71c70348 [3541/3541] add support for Mont-TSSE Driver
config: x86_64-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130900.UPe4oSIC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130900.UPe4oSIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130900.UPe4oSIC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/montage/tsse/tsse_fw_service.c:40:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_fw_service.c:41:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] h2d @@
   drivers/crypto/montage/tsse/tsse_fw_service.c:41:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_fw_service.c:41:21: sparse:     got unsigned char [usertype] *[assigned] h2d
>> drivers/crypto/montage/tsse/tsse_fw_service.c:42:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_fw_service.c:42:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_fw_service.c:42:25: sparse:     got unsigned char [usertype] *
   drivers/crypto/montage/tsse/tsse_fw_service.c:26:5: sparse: sparse: symbol 'fw_send_msg' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_fw_service.c:51:6: sparse: sparse: symbol 'fw_free' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_fw_service.c:141:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_fw_service.c:141:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_fw_service.c:141:22: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_fw_service.c:141:22: sparse:     got unsigned char [usertype] *
--
>> drivers/crypto/montage/tsse/tsse_vuart.c:61:28: sparse: sparse: cast to restricted __le32
>> drivers/crypto/montage/tsse/tsse_vuart.c:73:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected int value @@     got restricted __le32 [usertype] @@
   drivers/crypto/montage/tsse/tsse_vuart.c:73:15: sparse:     expected int value
   drivers/crypto/montage/tsse/tsse_vuart.c:73:15: sparse:     got restricted __le32 [usertype]

vim +/__iomem +40 drivers/crypto/montage/tsse/tsse_fw_service.c

    25	
    26	int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
    27	{
    28		u8 *h2d;
    29		u32 int_reg;
    30		u32 rc;
    31	
    32		mutex_lock(&tsseipc->list_lock);
    33	
    34		int_reg = readl(tsseipc->virt_addr + HOST2MAIN_INTR_SET_OFFSET);
    35		if ((int_reg & IPC_REGISTER_INT_SET) != 0) {
    36			rc = -1;
    37			mutex_unlock(&tsseipc->list_lock);
    38			return rc;
    39		}
  > 40		h2d = (u8 *)(tsseipc->virt_addr + HOST2MAIN_IPC_OFFSET);
    41		memcpy_toio(h2d, msg, sizeof(struct ipc_header));
  > 42		memcpy_toio(h2d + sizeof(struct ipc_header), (u32 *)msg->i_data,
    43			    msg->header.i_len - sizeof(struct ipc_header));
    44		writel(0x1, tsseipc->virt_addr + HOST2MAIN_INTR_SET_OFFSET);
    45	
    46		dev_info(tsseipc->dev, "notify device to get firmware\n");
    47		mutex_unlock(&tsseipc->list_lock);
    48		return 0;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
