Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF5C8CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765603566; cv=none; b=j8Z2LOUdWtsXyZ7hcHsypgOwDxJLqpfYRgSF6WRtjCfzitmfvO29P3ogA4RQNDcW7bUm5K00DADQ90FyMNuYB4U5JmqjUYu8WrBFiJ2APwWXdI+dZDBennglLoQ1+SYzIdVYowyJ7LOIW8LGjT+kH34JYKjUfHTmJPQMFGeb2VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765603566; c=relaxed/simple;
	bh=M7esZKEiwFw6lHcc62dx8qagBZPqPC8ioxy/2hXbmpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=coig/8JsBPcG2KatjmXt8Txkr6FCT29WF0IXrH4rGAMMJtGZeZ1+W3yvAPBFcMdaxJUDvQsNHImIky3Xw01rojYWhVh4h4Jyv46gmWU8asNfNtKCSDZ6HdAUVfKAvNjmTwQayggh/jk1yMSRYXUAbjZv7WtJbkwlrAxl6Wa6fmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaPGXY7X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaPGXY7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765603564; x=1797139564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7esZKEiwFw6lHcc62dx8qagBZPqPC8ioxy/2hXbmpA=;
  b=UaPGXY7X69pQWElVHHAEAwleew/0DvFIdWKEUbN8MOWcZ7zfcayMno+T
   WEeMyx5fenPv+V3T00uV7MN9OpgZo3Hp1tdUhllDRqTp8h0l6sjIRV2i4
   BbGk6P8w6Q9uw3CRMpDQ0V0qel/dnf0Mqf6JtM461IMzhdkiFPT3xA0zX
   KE3hsYXO1TWnLbh7PrSGR0Bj8XPeiJTaNOI2QPwaUIdaj4of16QhE44v9
   PXv3zHaY9THAfDgGLpyW5WaPOgrkxnOXvS5Yx/ifl8+fXMTEZnQd9EAse
   U7qxF/Il/lEum4BCUljofg2/wyxqfvPc8ZpsczIdoYKBX1QFg/bHHvhq9
   A==;
X-CSE-ConnectionGUID: dBiKoyzXT3y/Vc7CoNcgEw==
X-CSE-MsgGUID: DEYU1ra9S2ydd+n3KNGgEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85008741"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85008741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:26:03 -0800
X-CSE-ConnectionGUID: CAfwiWpmRAe84CwRl9Ct8A==
X-CSE-MsgGUID: mMiZEEi8SDuYeOJgxbUfqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201675888"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 21:26:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUI8l-0000000076V-3x6t;
	Sat, 13 Dec 2025 05:25:59 +0000
Date: Sat, 13 Dec 2025 13:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/crypto/montage/tsse/tsse_ipc_drv.c:22:41: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202512131336.tVlhD5u5-lkp@intel.com>
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
commit: 914854f2adb6988ac3b6521088ec96833d6743e2 [3541/3541] driver: crypto - update support for Mont-TSSE Driver
config: x86_64-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131336.tVlhD5u5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131336.tVlhD5u5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131336.tVlhD5u5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:22:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:46: sparse:     expected void const volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:46: sparse:     got unsigned char [usertype] *
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:108:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:120:21: sparse: sparse: cast from restricted __le32
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:124:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *msg @@     got void [noderef] __iomem *d2h_msg @@
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:124:60: sparse:     expected void *msg
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:124:60: sparse:     got void [noderef] __iomem *d2h_msg
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:136:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *addr @@
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:136:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:136:21: sparse:     got unsigned char [usertype] *addr

vim +/__iomem +22 drivers/crypto/montage/tsse/tsse_ipc_drv.c

    19	
    20	static int ipc_d2h_new_msg_process(struct tsse_ipc *tsseipc, void __iomem *d2h_msg)
    21	{
  > 22		struct tsse_ipc_msg *ipc_msg = (struct tsse_ipc_msg *)d2h_msg;
    23		void *payload;
    24		u32 msg_len;
    25		u32 header_len;
    26		u32 payload_len;
    27		int ret;
    28		u64 epid;
    29	
    30		msg_len = ipc_msg->msg_len;
    31		header_len = sizeof(struct tsse_ipc_msg);
    32		payload_len = msg_len - header_len;
    33		epid = ipc_msg->epid;
    34	
    35		if (msg_len < header_len || msg_len > IPC_MAX_DATA_LEN) {
    36			pr_err("%s %d: invalid msg len: %u in resp\n", __func__, __LINE__, msg_len);
    37			return -EINVAL;
    38		}
    39		payload = kzalloc(payload_len, GFP_ATOMIC);
    40		if (!payload)
    41			return -ENOMEM;
  > 42		memcpy_fromio(payload, (u8 *)d2h_msg + header_len, payload_len);
    43		if (ipc_msg->type == TSSE_IPC_TYPE_RING_SETUP_RSP)
    44			ret = ipc_ring_setup_resp_receive(payload, payload_len);
    45		else
    46			ret = tsse_service_msg_receive(epid, payload, payload_len);
    47		kfree(payload);
    48		return ret;
    49	}
    50	
    51	static struct tsse_ipc_msg *ipc_h2d_msg_header_create(u64 epid, u32 payload_length)
    52	{
    53		struct tsse_ipc_msg *header = (struct tsse_ipc_msg *)(
    54			kzalloc(sizeof(struct tsse_ipc_msg), GFP_ATOMIC));
    55		if (header) {
    56			if (GET_SERVICE_ID(epid) == EPID_MANAGE_SERVICE_ID) {
    57				if (GET_APP_SPECIFIC_ID(epid) == TSSE_IPC_SPECIFIC_RING_SETUP_REQ)
    58					header->type = TSSE_IPC_TYPE_RING_SETUP_REQ;
    59				else if (GET_APP_SPECIFIC_ID(epid) == TSSE_IPC_SPECIFIC_RING_SETUP_RSP)
    60					header->type = TSSE_IPC_TYPE_RING_SETUP_RSP;
    61				else
    62					header->type = TSSE_IPC_TYPE_SERVICE;
    63			} else {
    64				header->type = TSSE_IPC_TYPE_SERVICE;
    65			}
    66			header->msg_len = sizeof(struct tsse_ipc_msg) + payload_length;
    67			header->rev = 0;
    68			header->epid = epid;
    69		}
    70		return header;
    71	}
    72	
    73	int ipc_h2d_msg_send(int device_handle, u64 epid, void *msg_payload, u32 length)
    74	{
    75		struct tsse_dev *tdev;
    76		struct tsse_ipc *tsseipc;
    77		struct tsse_ipc_msg *header;
    78		u8 *h2d;
    79		u32 int_reg;
    80		u32 header_size;
    81	
    82		tdev = tsse_get_dev_by_handle(device_handle);
    83		if (!tdev)
    84			return -ENODEV;
    85	
    86		if (!msg_payload || !length) {
    87			pr_err("%s %d: invalid msg payload\n", __func__, __LINE__);
    88			return -EINVAL;
    89		}
    90		header_size = sizeof(struct tsse_ipc_msg);
    91		if (length + header_size > IPC_MAX_DATA_LEN) {
    92			pr_err("%s %d length too large: %u\n", __func__, __LINE__, length);
    93			return -EINVAL;
    94		}
    95		tsseipc = tdev->ipc;
    96		mutex_lock(&tsseipc->list_lock);
    97		int_reg = readl(tsseipc->virt_addr + HOST2MAIN_INTR_SET_OFFSET);
    98		if ((int_reg & IPC_REGISTER_INT_SET) != 0) {
    99			mutex_unlock(&tsseipc->list_lock);
   100			return -EAGAIN;
   101		}
   102		header = ipc_h2d_msg_header_create(epid, length);
   103		if (!header) {
   104			mutex_unlock(&tsseipc->list_lock);
   105			pr_err("%s(): msg header kzalloc failed\n", __func__);
   106			return -ENOMEM;
   107		}
   108		h2d = (u8 *)(tsseipc->virt_addr + HOST2MAIN_IPC_OFFSET);
   109		ipc_memcpy_to_io(h2d, (u8 *)header, header_size);
   110		ipc_memcpy_to_io(h2d + header_size, msg_payload, length);
   111	
   112		writel(0x1, tsseipc->virt_addr + HOST2MAIN_INTR_SET_OFFSET);
   113		mutex_unlock(&tsseipc->list_lock);
   114		kfree(header);
   115		return 0;
   116	}
   117	
   118	int ipc_d2h_msg_dispatch(struct tsse_ipc *tsseipc, void __iomem *d2h_msg)
   119	{
   120		u16 type = (u16) cpu_to_le32(readl(d2h_msg));
   121	
   122		switch (type) {
   123		case TSSE_IPC_TYPE_LEGACY:
   124			return ipc_d2h_legacy_msg_process(tsseipc, d2h_msg);
   125		case TSSE_IPC_TYPE_SERVICE:
   126		case TSSE_IPC_TYPE_RING_SETUP_RSP:
   127			return ipc_d2h_new_msg_process(tsseipc, d2h_msg);
   128		default:
   129			pr_err("%s %d: invalid msg type: %u\n", __func__, __LINE__, type);
   130			return -EINVAL;
   131		}
   132	}
   133	
   134	void ipc_memcpy_to_io(u8 *addr, u8 *src, u32 len)
   135	{
 > 136		memcpy_toio(addr, src, len);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
