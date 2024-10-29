Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1FF193071
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730168925; cv=none; b=Jg8gUuTf1HMddU4B60rZIBnxTG9wMb/Qbmd/ndodmhM1kofqOmVYFJzAImaBMsSzM7481dEmXJTG2HKtCiYwISyxRGAcZHRCgxvPb0jnulkH7uL8PzXr0bI++1e8sHojlq9YYq+xU1FY6nNNEZymJxTApYtJjUec3foEPJdzc7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730168925; c=relaxed/simple;
	bh=iDjmKEAqs+BWVGjmU7rRKvmxRUjUjfStdtnD0HzTi78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNFHzVtuCL7hBzOhSlsTC6mPd3Hx6KwKIGRO50uFAMQN/RA6eUfOPTYsbE/8DuMbo0ro995mTzOqjxZw9XQMH90yoXzXwUANir+IOJ+lrgH42a6whyqNE+LXguo3JXk4GbPhO/CPQ4/xpYV7dYeveipbTyoYIa/zdFOpiR2PcfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsKVPnk6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsKVPnk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730168922; x=1761704922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDjmKEAqs+BWVGjmU7rRKvmxRUjUjfStdtnD0HzTi78=;
  b=UsKVPnk6X8K0BrIQfFkagOKPKZo6ER3W8SmJRLRS8NDVSraR+q5tfUs+
   3R7OX5mpZM5BkOoYc0RpN4PnH4vwnxTVcX0FxDEHQgg4Ce0QI2poyJhHc
   Iq1I3B7/3MsJ8+P+4oSod5oWVxbKD4RVgyPYYT/WEho9gu9UIebNrd0LJ
   J63/Rr/mYfpr+a/jmL/m5/5MgHZt/XglG12QyY8BXPe+i3jxK+NxNatjw
   JzyV6jdPzko0RfU0BwfM07fa9qHQSvxAjHfg4Kdel+avTyDpvoHLQuaNw
   7Ao+QV/zRZ1VkxNQHCGAug38BlsaODYq/y6K9w+Ybh9glNakJygLLfgGH
   w==;
X-CSE-ConnectionGUID: w9Fc0YFnQW27EPEyzDZ7gg==
X-CSE-MsgGUID: 4n1HF+1tT6272+UlEiVMvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="32647569"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="32647569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 19:28:42 -0700
X-CSE-ConnectionGUID: z6XEpPhqSRuBvQLPSsa3+A==
X-CSE-MsgGUID: 347jkxc+Q9e9XSWyWMOzhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="112620172"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2024 19:28:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5byG-000dA8-0C;
	Tue, 29 Oct 2024 02:28:36 +0000
Date: Tue, 29 Oct 2024 10:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6955/13046]
 drivers/crypto/montage/tsse/tsse_fw_service.c:43:16: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202410291026.B9zk5zuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 2ed507edd8a7195777ec9f6bc2e3fdacbdead287 [6955/13046] add support for Montage Mont-TSSE driver
config: x86_64-randconfig-r112-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291026.B9zk5zuI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291026.B9zk5zuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291026.B9zk5zuI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/montage/tsse/tsse_fw_service.c:43:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_fw_service.c:44:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] h2d @@
   drivers/crypto/montage/tsse/tsse_fw_service.c:44:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_fw_service.c:44:21: sparse:     got unsigned char [usertype] *[assigned] h2d
>> drivers/crypto/montage/tsse/tsse_fw_service.c:45:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_fw_service.c:45:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_fw_service.c:45:25: sparse:     got unsigned char [usertype] *
   drivers/crypto/montage/tsse/tsse_fw_service.c:138:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_fw_service.c:138:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_fw_service.c:138:22: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_fw_service.c:138:22: sparse:     got unsigned char [usertype] *
--
>> drivers/crypto/montage/tsse/tsse_ipc.c:27:40: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:48:28: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] device_msg_data @@
   drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse:     expected void const volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse:     got unsigned char [usertype] *[assigned] device_msg_data
   drivers/crypto/montage/tsse/tsse_ipc.c:122:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_ipc.c:124:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] h2d @@
   drivers/crypto/montage/tsse/tsse_ipc.c:124:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:124:21: sparse:     got unsigned char [usertype] *[assigned] h2d
>> drivers/crypto/montage/tsse/tsse_ipc.c:125:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_ipc.c:125:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:125:25: sparse:     got unsigned char [usertype] *
--
>> drivers/crypto/montage/tsse/tsse_dev_drv.c:148:1: sparse: sparse: symbol 'dev_attr_tsse_image_load' was not declared. Should it be static?
--
>> drivers/crypto/montage/tsse/tsse_vuart.c:61:28: sparse: sparse: cast to restricted __le32
>> drivers/crypto/montage/tsse/tsse_vuart.c:73:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected int value @@     got restricted __le32 [usertype] @@
   drivers/crypto/montage/tsse/tsse_vuart.c:73:15: sparse:     expected int value
   drivers/crypto/montage/tsse/tsse_vuart.c:73:15: sparse:     got restricted __le32 [usertype]

vim +/__iomem +43 drivers/crypto/montage/tsse/tsse_fw_service.c

    25	
    26	static int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
    27	{
    28		u8 *h2d;
    29		u32 int_reg;
    30	
    31		mutex_lock(&tsseipc->list_lock);
    32	
    33		int_reg = readl(tsseipc->virt_addr + HOST2MAIN_INTR_SET_OFFSET);
    34		if ((int_reg & IPC_REGISTER_INT_SET) != 0) {
    35			mutex_unlock(&tsseipc->list_lock);
    36			return -EFAULT;
    37		}
    38		if (msg->header.i_len < sizeof(struct ipc_header) +
    39			sizeof(struct msg_info) + sizeof(struct fw_load)) {
    40			dev_err(tsseipc->dev, "msg format error\n");
    41			return -EFAULT;
    42		}
  > 43		h2d = (u8 *)(tsseipc->virt_addr + HOST2MAIN_IPC_OFFSET);
  > 44		memcpy_toio(h2d, msg, sizeof(struct ipc_header));
  > 45		memcpy_toio(h2d + sizeof(struct ipc_header), (u8 *)msg->i_data,
    46			    msg->header.i_len - sizeof(struct ipc_header));
    47		writel(0x1, tsseipc->virt_addr + HOST2MAIN_INTR_SET_OFFSET);
    48	
    49		dev_info(tsseipc->dev, "notify device to get firmware\n");
    50		mutex_unlock(&tsseipc->list_lock);
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
