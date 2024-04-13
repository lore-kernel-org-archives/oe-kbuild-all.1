Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4FC2907
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713047587; cv=none; b=HoMadvMG5mnXfYmAAVAN3ixPFAYSQsoZVBSKrQGAwZYP3KuoWKrg7fePol2OXpv5Jh8sGPMmDHpsoKqIvKZWHsOwyNw8/CDh6fQkS7+vwVq+b36Y2TpU/9+V+1RlCDe2gbnPaNtUrilZTv688dzn4c6uM4eK6pAaasIGjY5cRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713047587; c=relaxed/simple;
	bh=0BqAKfelLXUOAfJUFP5zSEShdKgbvgLE/86dqvrJdkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HA72HZhhw5R1EezWCSy9nmJ+t/P/mZJMBuKKFUei1Ljpq64k1oO70wAZDNwQPuF+DoMp/q3cWv3o3p0x42PQR2nl83AekHFpEAg8ozP3EAenMKB+i0gF89MRlTne41hlR4QEiDcXxSuqLVdi/YBsUyjsNinP6JAi0LrIf3ZRX98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEFVaWJf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEFVaWJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713047585; x=1744583585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0BqAKfelLXUOAfJUFP5zSEShdKgbvgLE/86dqvrJdkE=;
  b=lEFVaWJfYWHjERPJH3662s3sQN3o3F136Y5RCGu3T2NfuY4rE7sZfnY4
   lEmMFxsKqB1ySjYhaJVBmkG/CZhUZHjTO+BLbAl/OwIQvz29S8w94F0S4
   jdnSnWJZnP3YRmjrTUFX6ozgEAaF2KGY30/jFhsRUvYPJIYucmYLCr1Ae
   PDuQVKOgG8EqiBH3nTf4ia1MLyp4KKx6A81deKhqXEfCNl1XqRJxOlebp
   pKGyD1aVnS0SF41jLWXJZo4W2wpzOFFeezGNXFmASUtHKLpKo/hyCQ/K6
   Dln8FGGvN9QxZC0YSyZ7W19eSsXFn6h8QJCpWr3ymU9kwnuRflulIkMBq
   g==;
X-CSE-ConnectionGUID: SB/tS3jKR1aLtRvg6FO64A==
X-CSE-MsgGUID: hgGJ/jTURR2SoBYv/HalNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8391506"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="8391506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 15:33:04 -0700
X-CSE-ConnectionGUID: OMMlm9Y3TUSlfPKS0eHdMg==
X-CSE-MsgGUID: 39qZngENT/6ikgdEZYVNyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21537148"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2024 15:33:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvlvh-00035Y-03;
	Sat, 13 Apr 2024 22:33:01 +0000
Date: Sun, 14 Apr 2024 06:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6341/30000]
 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:51:28: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202404140648.3413VbmQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4134526a9cfd552230ec7a66a1738a9066d9a0c6
commit: a5b9149cc6ef0e581c7289b01bf2bf3c2ad98248 [6341/30000] Huawei BMA: Adding Huawei BMA driver: host_kbox_drv
config: x86_64-randconfig-122-20240413 (https://download.01.org/0day-ci/archive/20240414/202404140648.3413VbmQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404140648.3413VbmQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404140648.3413VbmQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:51:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:42:6: sparse: sparse: symbol 'kbox_write_to_pci' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:120:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:111:6: sparse: sparse: symbol 'kbox_read_from_pci' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:179:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:172:6: sparse: sparse: symbol 'kbox_memset_pci' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:360:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *user_buf @@     got char [noderef] __user *data @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:360:26: sparse:     expected char *user_buf
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:360:26: sparse:     got char [noderef] __user *data
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:395:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *user_buf @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:395:34: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:395:34: sparse:     got char *user_buf
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:422:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const *user_buf @@     got char const [noderef] __user *data @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:422:32: sparse:     expected char const *user_buf
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:422:32: sparse:     got char const [noderef] __user *data
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:453:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *user_buf @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:453:51: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:453:51: sparse:     got char const *user_buf

vim +/__iomem +51 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c

    41	
    42	void kbox_write_to_pci(void __iomem *dest, const void *src, int len,
    43			       unsigned long offset)
    44	{
    45		union char_int_transfer_u transfer = { };
    46		int idx = 0;
    47		int j = 0;
    48		int four_byte_len = 0;
    49		int left_len = 0;
    50		char *src_temp = (char *)src;
  > 51		char *dest_temp = (char *)dest;
    52		int first_write_num = 0;
    53	
    54		if ((offset % KBOX_RW_UNIT) != 0) {
    55			transfer.data_int =
    56			    *(int *)(dest_temp + offset - (offset % KBOX_RW_UNIT));
    57	
    58			rmb();/* memory barriers. */
    59			first_write_num =
    60			    ((len + (offset % KBOX_RW_UNIT)) >
    61			     KBOX_RW_UNIT) ? (KBOX_RW_UNIT -
    62					      (offset % KBOX_RW_UNIT)) : len;
    63			for (idx = (int)(offset % KBOX_RW_UNIT);
    64			     idx < (int)(first_write_num + (offset % KBOX_RW_UNIT));
    65			     idx++) {
    66				if (!src_temp)
    67					return;
    68	
    69				transfer.data_char[idx] = *src_temp;
    70				src_temp++;
    71			}
    72			*(int *)(dest_temp + offset - (offset % KBOX_RW_UNIT)) =
    73			    transfer.data_int;
    74			wmb();/* memory barriers. */
    75			len -= first_write_num;
    76			offset += first_write_num;
    77		}
    78	
    79		four_byte_len = (len / KBOX_RW_UNIT);
    80		left_len = (len % KBOX_RW_UNIT);
    81		for (idx = 0; idx < four_byte_len; idx++) {
    82			for (j = 0; j < KBOX_RW_UNIT; j++) {
    83				if (!src_temp)
    84					return;
    85	
    86				transfer.data_char[j] = *src_temp;
    87				src_temp++;
    88			}
    89			*(int *)(dest_temp + offset) = transfer.data_int;
    90			wmb();/* memory barriers. */
    91			offset += KBOX_RW_UNIT;
    92		}
    93	
    94		if (left_len != 0) {
    95			transfer.data_int = *(int *)(dest_temp + offset);
    96			rmb();/* memory barriers. */
    97			for (idx = 0; idx < left_len; idx++) {
    98				if (!src_temp)
    99					return;
   100	
   101				transfer.data_char[idx] = *src_temp;
   102				src_temp++;
   103			}
   104			*(int *)(dest_temp + offset) = transfer.data_int;
   105			wmb();/* memory barriers. */
   106		}
   107	
   108		udelay(1);
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
