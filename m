Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699033F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260955; cv=none; b=bDLyULB05NiNh7ocLJc1QdQ+UOvoDm4Nep4xC0E/nro3FwKSLxxBeB4IkMWc0g0O+xz4T33qtc3kMh33J0jgejcK53EV+/DTcNK1l/HFa34KEJ5K3PTpTYdZo5EsRV199rx+jqLA4y84F1Iz0suJMt507Mq+ddX4sJBPL4gBJP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260955; c=relaxed/simple;
	bh=kKtTtXEgtHPMHXb9OtKiLxPaPLYvSoeuCZB20WsVZ7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pm+lr6+8Z37SE8woy3wsly9D9wriUHMKl8dTrr5vZ3QqekhUeEpfBsKd8lnNJvp8Z9qJ0PTQgy7BHep7xIXFXRXfXLTm5+MNc/MMvKJgRA00EL5mEfMA5H8x+1MIb8ImxgX4yLkHGTL0/Z/wLCOhBqiZCp/4YfKEF5fWhTkQ9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzhZyG6V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzhZyG6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744260952; x=1775796952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKtTtXEgtHPMHXb9OtKiLxPaPLYvSoeuCZB20WsVZ7M=;
  b=mzhZyG6VdtCQNvjz8sd5/DEqCyy3tg9FrrYU+hPZcIlcQODzkDdF4EPy
   NkRaxnyvI2y2hkM1SF3N97Ud+U3hjEkqRJriFC9xVttjxhF7R3rnVeEdF
   WusLotUT9SRqhTOc5qaVx6TgiokZmKhxuSaTVLTU+XMg7/Nd3g2TCke/c
   axi8gYBBlYEUHqr/USmaPbXB+nDtlIcJ80Cy/fPzkgDovhMGeWCF+annr
   loaBtOxINWvtMjPJ09AhGAlE+zGtm4uRiHt+BvGAUN3b818KG5q9dzO3I
   JWV/SpV2AGPJO+b/GQlvQhoO3sqEKVupJBUwQwya9YSTLLAka9UG/1otD
   A==;
X-CSE-ConnectionGUID: 0sbOIfVQSji91evX19D+Sw==
X-CSE-MsgGUID: mkHstOPLRxqpJ58hyjfYnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45649874"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45649874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 21:55:51 -0700
X-CSE-ConnectionGUID: xff7DtsfSviU4NsAcFZpVg==
X-CSE-MsgGUID: ZnT3AwQ8Q2aSSQbHPPL3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="151968457"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2025 21:55:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2jx6-0009cR-3D;
	Thu, 10 Apr 2025 04:55:48 +0000
Date: Thu, 10 Apr 2025 12:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2116/2116]
 drivers/crypto/montage/tsse/tsse_fw_service.c:40:16: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202504101225.8jbFE2Ak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f38765261337382b0302ed7d139c110e0fbe3f71
commit: 811debd4ea52033d7393d4a7de2be11f71c70348 [2116/2116] add support for Mont-TSSE Driver
config: x86_64-randconfig-r113-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101225.8jbFE2Ak-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101225.8jbFE2Ak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101225.8jbFE2Ak-lkp@intel.com/

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
>> drivers/crypto/montage/tsse/tsse_ipc.c:22:40: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:17:17: sparse: sparse: symbol 'get_msginf' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_ipc.c:47:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:48:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned int [usertype] *[assigned] msg_data @@
   drivers/crypto/montage/tsse/tsse_ipc.c:48:36: sparse:     expected void const volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:48:36: sparse:     got unsigned int [usertype] *[assigned] msg_data
   drivers/crypto/montage/tsse/tsse_ipc.c:41:6: sparse: sparse: symbol 'ipc_recieve_msg' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_ipc.c:53:5: sparse: sparse: symbol 'msg_rout' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_ipc.c:107:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:108:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] h2d @@
   drivers/crypto/montage/tsse/tsse_ipc.c:108:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:108:21: sparse:     got unsigned char [usertype] *[assigned] h2d
   drivers/crypto/montage/tsse/tsse_ipc.c:109:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_ipc.c:109:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:109:25: sparse:     got unsigned char [usertype] *
   drivers/crypto/montage/tsse/tsse_ipc.c:103:6: sparse: sparse: symbol 'ipc_send_msg' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_ipc.c:115:6: sparse: sparse: symbol 'ipc_hw_init' was not declared. Should it be static?
   drivers/crypto/montage/tsse/tsse_ipc.c:153:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:155:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] h2d @@
   drivers/crypto/montage/tsse/tsse_ipc.c:155:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:155:21: sparse:     got unsigned char [usertype] *[assigned] h2d
   drivers/crypto/montage/tsse/tsse_ipc.c:156:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_ipc.c:156:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:156:25: sparse:     got unsigned char [usertype] *
   drivers/crypto/montage/tsse/tsse_ipc.c:122:5: sparse: sparse: symbol 'ipc_init_msg' was not declared. Should it be static?
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
