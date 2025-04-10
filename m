Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB69202F99
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268054; cv=none; b=Iizf9Xg31O/g4LppJTSqRwR8U1ocXt0HY3F51ViaHs4Lk8qUF8FuRzn/BGyNo5pTvvRMkkz7lhdNfgV1WvTlgN1qx0dAOWeuUHKyEZpmaNVxJfsf07wcignuub8w0zeY47t0Aw9MZa3vcf/0VS5YPtoDltQ0n3oYaS4JfX/dicw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268054; c=relaxed/simple;
	bh=EO8/ezDLI6pNYmnkR1ZkE42ab0WycfqaiTtjOFu5wlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mkSyI+ckp+TgawbePY30mxOYBLjhF1gF6wpMgs2I1anFCJxUQcJAdt0l/6nZkMQVX9wqfuH9FMhBm8C8/jBioWEwtXCYC5vxu7H775aQWKyG1G7+s2ErBM0EntdvFueunRn+m0e6GSV7injJLWn1I6G9ZiAGC00Pj6pMJsAkJBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYYvJAHD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYYvJAHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268053; x=1775804053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EO8/ezDLI6pNYmnkR1ZkE42ab0WycfqaiTtjOFu5wlY=;
  b=BYYvJAHDM9FlXShIMv/tqZs5f86YMZ2OlHdJ/+kc9nG5dBfNNK8QHhZG
   fqQHVAI1AkdA0FZa/0oNlhgj+4JwOpZP0mJP6fQmh7ead+NHE1mQYJ+Xb
   zdcl8xjNfOCKw4N8Bg2l/mNegJzXj3GHnD+NQO8pfw4Xx7vwdQUJiwRgy
   Gaw2xoRQeFz11FUIJtRZ94jKwGcvF5sEtB7yqXb2Xh5f0DvDDgj8VCW2C
   XrrDZqT8RuYeO9GMPCm2olXY7+6iRM7vAGYxLbC+PL3Xo8/0gsWFYKgD3
   rc8+bINfqlymhUSYp6Ai7YOFd/iUYqq1zqRoG6ErBWkg679kh/DTTCHG/
   w==;
X-CSE-ConnectionGUID: ed9ws/DeSLW1YIDk7/Te+g==
X-CSE-MsgGUID: ZLyWzGKXQyOQvRuVEbo/Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45862587"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45862587"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 23:54:12 -0700
X-CSE-ConnectionGUID: DcLF+EQ/QVe4TqJaOABHYg==
X-CSE-MsgGUID: ClCx73JPQveya7QOc784VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134004639"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2025 23:54:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2lnc-0009ib-2I;
	Thu, 10 Apr 2025 06:54:08 +0000
Date: Thu, 10 Apr 2025 14:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2116/2116]
 drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202504101403.RKyoTq9Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   62b846e657553d00552c1c71b6ecc26017eb1a9a
commit: 7795623241fe9eb57352a09b27d06b5d4ff07071 [2116/2116] add firmware update function for Mont-TSSE
config: x86_64-randconfig-r113-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101403.RKyoTq9Z-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101403.RKyoTq9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101403.RKyoTq9Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/crypto/montage/tsse/tsse_ipc.c:27:40: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:48:28: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] device_msg_data @@
   drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse:     expected void const volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:49:47: sparse:     got unsigned char [usertype] *[assigned] device_msg_data
   drivers/crypto/montage/tsse/tsse_ipc.c:122:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc.c:124:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *[assigned] h2d @@
   drivers/crypto/montage/tsse/tsse_ipc.c:124:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:124:21: sparse:     got unsigned char [usertype] *[assigned] h2d
   drivers/crypto/montage/tsse/tsse_ipc.c:125:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_ipc.c:125:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc.c:125:25: sparse:     got unsigned char [usertype] *
--
>> drivers/crypto/montage/tsse/tsse_dev_drv.c:148:1: sparse: sparse: symbol 'dev_attr_tsse_image_load' was not declared. Should it be static?

vim +49 drivers/crypto/montage/tsse/tsse_ipc.c

    16	
    17	/**
    18	 * Create ipc_msg and read message from BAR.
    19	 * Return the pointer to ipc_msg, the caller is responsible for free it.
    20	*/
    21	static struct ipc_msg *get_msginf(void __iomem *d2h)
    22	{
    23		uint32_t u_len = 0;
    24		struct ipc_msg *msg = NULL;
    25	
    26		uint8_t *device_msg_data = NULL;
  > 27		struct ipc_header *ipc_info = (struct ipc_header *)d2h;
    28	
    29		// The memory layout in d2h should at least contains:
    30		// ipc_header, msg_info and fw_load (message body)
    31		if (ipc_info->i_len < sizeof(struct ipc_header) +
    32			sizeof(struct msg_info) + sizeof(struct fw_load)) {
    33			pr_info("%s(): msg format error\n", __func__);
    34			return NULL;
    35		}
    36		u_len = ipc_info->i_len - sizeof(struct ipc_header);
    37		msg = (struct ipc_msg *)(kzalloc(sizeof(struct ipc_msg) + u_len,
    38						      GFP_ATOMIC));
    39		if (!msg) {
    40			pr_info("%s(): ipc_msg kzalloc failed\n", __func__);
    41			return NULL;
    42		}
    43	
    44		msg->header.inst_id = ipc_info->inst_id;
    45		msg->header.tgid = ipc_info->tgid;
    46		msg->header.i_len = ipc_info->i_len;
    47	
    48		device_msg_data = (uint8_t *)(d2h + sizeof(struct ipc_header));
  > 49		memcpy_fromio((uint8_t *)msg->i_data, device_msg_data, u_len);
    50	
    51		return msg;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
