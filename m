Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D71D9515
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642436; cv=none; b=GaQapCEODCpBQQodjPP2sRZutR2fuz0byUAUghAC6nHepTbbDutx/EHWzD5H5J0Z7eYAMyy9Ln1qccmxdzV79mN9S5fetTvIxpGzh10DvP3skgxyoHgt62kz0wWzTs+t3wS4xBoDx8lQ2ghf2B9fMSafPnMNHX1eeTWVqG+ZabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642436; c=relaxed/simple;
	bh=iZadO/RJLjVOnHRQ/vVQ4y28i06YoeTnjMk7uYvfQn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4hRZUJ8d910jpbq9aYmTjTUfmh5wiT43bfeijLADAkyzZC6CPViCrVu25E3BxqzYyIA8Lh0LDgBFT/k0X8oSEflQZVLO/y8Sddj+i5HDvuLU+9ebz75pfOKCw50CU0V8vYsHjGp9WCBbz5uwbhJVKJkDrgZcemkznDl5v9viJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tl/9Gglz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tl/9Gglz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718642433; x=1750178433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZadO/RJLjVOnHRQ/vVQ4y28i06YoeTnjMk7uYvfQn4=;
  b=Tl/9GglzFs8Hh2bs1IEnSbCsw9kwPmnS0uuKXI9vZHRPAZ13CCaYY/z2
   OFTf7acoP6W+1qGSwVHU+daeiUpPlMR4TeO9fcH2/5HxvRgzceeNpYgPf
   QTdjzzIvpBnyeMWiZWy1IMiVDqpen+Prq4FioeCMqzVBy1nVjzR2ieOQr
   iuy1YVXPgax2ZmUeDnrWoHVd0fx9xZ3VJfbqAMushhp2VT6e/dgg662rq
   kIQhvmVV+SwMw13/QCHCVmRVP5w74twDy+1M85+CWc5oy+2nbWQOrP52T
   hd7Oe6HVChGl/DuTwBF0N1KA9M9ahiewi+ZCEzCRJ153rhz5woeV3HMad
   g==;
X-CSE-ConnectionGUID: Ir9BcM3JRD6TB+mZMHT7wg==
X-CSE-MsgGUID: 2ncQ4r63QRakiwvl6Pz/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="12113003"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="12113003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 09:40:32 -0700
X-CSE-ConnectionGUID: NNgzHkbeRIO5+AHxbhGViw==
X-CSE-MsgGUID: XolyLC9nRbOUB92568k8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46206247"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2024 09:40:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJFP9-0004gl-1t;
	Mon, 17 Jun 2024 16:40:27 +0000
Date: Tue, 18 Jun 2024 00:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11543/22946]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:673:22: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202406180051.YLZ6CGij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a0395933d53f0828dc53b5f46a63a06f024156b1
commit: ed046b8a9bc5f5836ece3a3efa29c54f0fc904e7 [11543/22946] net: hns3: rename hns3_cae's files and remove send_cmdq
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240618/202406180051.YLZ6CGij-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240618/202406180051.YLZ6CGij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180051.YLZ6CGij-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:85:14: sparse: sparse: symbol 'g_nictool_class' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:86:13: sparse: sparse: symbol 'g_nictool_cdev' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:89:5: sparse: sparse: symbol 'g_nictool_init_flag' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:90:5: sparse: sparse: symbol 'g_nictool_ref_cnt' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:128:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void *in_buff @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:128:43: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:128:43: sparse:     got void *in_buff
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:171:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:171:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:171:32: sparse:     got void *out_buf
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:258:5: sparse: sparse: symbol 'hns3_test_chs_set' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:302:5: sparse: sparse: symbol 'hns3_test_chs_get' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:355:5: sparse: sparse: symbol 'hns3_test_chs_cfg' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:412:5: sparse: sparse: symbol 'hns_test_get_commit_id' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:485:5: sparse: sparse: symbol 'hns3_test_clean_stats' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:518:5: sparse: sparse: symbol 'hns3_nic_reset' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:566:5: sparse: sparse: symbol 'hns3_nic_timeout_cfg' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:599:5: sparse: sparse: symbol 'hns3_gro_age_handle' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:670:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:670:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:670:30: sparse:     got unsigned int [usertype]
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:673:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:673:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:673:22: sparse:     got unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:674:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:674:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:674:22: sparse:     got int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:675:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:675:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:675:22: sparse:     got int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:684:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:684:23: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:684:23: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:689:5: sparse: sparse: symbol 'hns3_nic_dcqcn' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:878:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dcqcn_rx_cnt @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:878:42: sparse:     expected unsigned int [usertype] dcqcn_rx_cnt
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:878:42: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:879:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dcqcn_tx_cnt @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:879:42: sparse:     expected unsigned int [usertype] dcqcn_tx_cnt
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:879:42: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:880:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dcqcn_db_cnt @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:880:42: sparse:     expected unsigned int [usertype] dcqcn_db_cnt
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:880:42: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:852:5: sparse: sparse: symbol 'hns3_dcqcn_get_msg_cnt' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:973:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:973:38: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:973:38: sparse:     got void *
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:1050:5: sparse: sparse: symbol 'nictool_k_mmap' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:1073:5: sparse: sparse: symbol 'if_nictool_exist' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:258:5: warning: no previous prototype for 'hns3_test_chs_set' [-Wmissing-prototypes]
     258 | int hns3_test_chs_set(struct hclge_dev *hdev, u8 chs_type, u8 enable)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:302:5: warning: no previous prototype for 'hns3_test_chs_get' [-Wmissing-prototypes]
     302 | int hns3_test_chs_get(struct hclge_dev *hdev, u8 chs_type, u8 *enable)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:355:5: warning: no previous prototype for 'hns3_test_chs_cfg' [-Wmissing-prototypes]
     355 | int hns3_test_chs_cfg(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:412:5: warning: no previous prototype for 'hns_test_get_commit_id' [-Wmissing-prototypes]
     412 | int hns_test_get_commit_id(struct hnae3_handle *handle, u8 *commit_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c: In function 'get_driver_ver':
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:480:53: warning: argument to 'sizeof' in 'strncpy' call is the same expression as the source; did you mean to use the size of the destination? [-Wsizeof-pointer-memaccess]
     480 |         strncpy(buf_out, HNAE_DRIVER_VERSION, sizeof(HNAE_DRIVER_VERSION));
         |                                                     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c: At top level:
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:485:5: warning: no previous prototype for 'hns3_test_clean_stats' [-Wmissing-prototypes]
     485 | int hns3_test_clean_stats(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:518:5: warning: no previous prototype for 'hns3_nic_reset' [-Wmissing-prototypes]
     518 | int hns3_nic_reset(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:566:5: warning: no previous prototype for 'hns3_nic_timeout_cfg' [-Wmissing-prototypes]
     566 | int hns3_nic_timeout_cfg(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:599:5: warning: no previous prototype for 'hns3_gro_age_handle' [-Wmissing-prototypes]
     599 | int hns3_gro_age_handle(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:689:5: warning: no previous prototype for 'hns3_nic_dcqcn' [-Wmissing-prototypes]
     689 | int hns3_nic_dcqcn(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:852:5: warning: no previous prototype for 'hns3_dcqcn_get_msg_cnt' [-Wmissing-prototypes]
     852 | int hns3_dcqcn_get_msg_cnt(struct hns3_nic_priv *net_priv,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:1050:5: warning: no previous prototype for 'nictool_k_mmap' [-Wmissing-prototypes]
    1050 | int nictool_k_mmap(struct file *filp, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:1073:5: warning: no previous prototype for 'if_nictool_exist' [-Wmissing-prototypes]
    1073 | int if_nictool_exist(void)
         |     ^~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:27:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:27:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:27:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:28:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:28:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:28:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:29:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:29:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:29:30: sparse:     got unsigned int [usertype]
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:37:32: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:37:53: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:41:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:41:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:41:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:42:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:42:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:42:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:43:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:43:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:43:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:44:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:44:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:44:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:45:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:45:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:45:30: sparse:     got unsigned int [usertype]
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:74:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:74:18: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:74:18: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:75:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:75:17: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.c:75:17: sparse:     got restricted __le32
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:20:5: sparse: sparse: symbol 'hclge_test_send_generic_cmd' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:62:5: sparse: sparse: symbol 'hclge_test_send_allocate_cmd' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:100:5: sparse: sparse: symbol 'hclge_test_send_key_cfg_cmd' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:153:5: sparse: sparse: symbol 'hclge_test_send_tcam_op_cmd' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:224:5: sparse: sparse: symbol 'hclge_test_send_ad_op_cmd' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:280:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cnt_idx @@     got restricted __le32 [usertype] idx @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:280:22: sparse:     expected restricted __le16 [usertype] cnt_idx
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:280:22: sparse:     got restricted __le32 [usertype] idx
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:267:5: sparse: sparse: symbol 'hclge_test_send_cnt_op_cmd' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:20:5: warning: no previous prototype for 'hclge_test_send_generic_cmd' [-Wmissing-prototypes]
      20 | int hclge_test_send_generic_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:62:5: warning: no previous prototype for 'hclge_test_send_allocate_cmd' [-Wmissing-prototypes]
      62 | int hclge_test_send_allocate_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:100:5: warning: no previous prototype for 'hclge_test_send_key_cfg_cmd' [-Wmissing-prototypes]
     100 | int hclge_test_send_key_cfg_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:153:5: warning: no previous prototype for 'hclge_test_send_tcam_op_cmd' [-Wmissing-prototypes]
     153 | int hclge_test_send_tcam_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:224:5: warning: no previous prototype for 'hclge_test_send_ad_op_cmd' [-Wmissing-prototypes]
     224 | int hclge_test_send_ad_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:267:5: warning: no previous prototype for 'hclge_test_send_cnt_op_cmd' [-Wmissing-prototypes]
     267 | int hclge_test_send_cnt_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:38:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:38:46: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:38:46: sparse:     got unsigned int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:54:55: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:55:54: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:90:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:90:45: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:90:45: sparse:     got unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:137:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:137:45: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.c:137:45: sparse:     got unsigned int
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:32:67: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] his_link_machine_state @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:32:67: sparse:     expected unsigned int [usertype] his_link_machine_state
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:32:67: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:35:46: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:39:67: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cur_link_machine_state @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:39:67: sparse:     expected unsigned int [usertype] cur_link_machine_state
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:39:67: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:42:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:19:6: sparse: sparse: symbol 'fill_port_info' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:19:6: warning: no previous prototype for 'fill_port_info' [-Wmissing-prototypes]
      19 | void fill_port_info(struct hclge_port_info *get_port_info_out,
         |      ^~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:6:5: sparse: sparse: symbol 'hns3_read_promisc_mode_cfg' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:44:5: sparse: sparse: symbol 'hns3_set_promisc_mode_cfg' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:6:5: warning: no previous prototype for 'hns3_read_promisc_mode_cfg' [-Wmissing-prototypes]
       6 | int hns3_read_promisc_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:44:5: warning: no previous prototype for 'hns3_set_promisc_mode_cfg' [-Wmissing-prototypes]
      44 | int hns3_set_promisc_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:9:18: sparse: sparse: symbol 'get_val_hdev' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:19:5: sparse: sparse: symbol 'hns3_cmd_rx_priv_wl_config' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:89:5: sparse: sparse: symbol 'hns3_cmd_common_thrd_config' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:161:5: sparse: sparse: symbol 'hns3_cmd_common_wl_config' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:229:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] high_wl @@     got restricted __le16 [usertype] high @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:229:35: sparse:     expected unsigned int [usertype] high_wl
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:229:35: sparse:     got restricted __le16 [usertype] high
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:230:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] low_wl @@     got restricted __le16 [usertype] low @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:230:34: sparse:     expected unsigned int [usertype] low_wl
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:230:34: sparse:     got restricted __le16 [usertype] low
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:273:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:273:48: sparse:     expected unsigned short
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:273:48: sparse:     got restricted __le16
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:275:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] share_buff @@     got restricted __le16 [usertype] shared_buf @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:275:38: sparse:     expected unsigned short [usertype] share_buff
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:275:38: sparse:     got restricted __le16 [usertype] shared_buf
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:318:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:318:48: sparse:     expected unsigned short
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:318:48: sparse:     got restricted __le16
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:366:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] high @@     got restricted __le16 [usertype] high @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:366:53: sparse:     expected unsigned short [usertype] high
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:366:53: sparse:     got restricted __le16 [usertype] high
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:367:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] low @@     got restricted __le16 [usertype] low @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:367:52: sparse:     expected unsigned short [usertype] low
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:367:52: sparse:     got restricted __le16 [usertype] low
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:416:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] high @@     got restricted __le16 [usertype] high @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:416:53: sparse:     expected unsigned short [usertype] high
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:416:53: sparse:     got restricted __le16 [usertype] high
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:417:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] low @@     got restricted __le16 [usertype] low @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:417:52: sparse:     expected unsigned short [usertype] low
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:417:52: sparse:     got restricted __le16 [usertype] low
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:450:28: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:452:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:452:22: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:452:22: sparse:     got unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:9:19: warning: no previous prototype for 'get_val_hdev' [-Wmissing-prototypes]
       9 | struct hclge_dev *get_val_hdev(struct hns3_nic_priv *net_priv)
         |                   ^~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:19:5: warning: no previous prototype for 'hns3_cmd_rx_priv_wl_config' [-Wmissing-prototypes]
      19 | int hns3_cmd_rx_priv_wl_config(struct hclge_dev *hdev, u16 tc,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:89:5: warning: no previous prototype for 'hns3_cmd_common_thrd_config' [-Wmissing-prototypes]
      89 | int hns3_cmd_common_thrd_config(struct hclge_dev *hdev, u16 tc,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:161:5: warning: no previous prototype for 'hns3_cmd_common_wl_config' [-Wmissing-prototypes]
     161 | int hns3_cmd_common_wl_config(struct hclge_dev *hdev, u32 high, u32 low, u32 en)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:6:30: sparse: sparse: symbol 'hns3_ring_stats_name' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:149:21: sparse: sparse: cast to restricted __le64
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:105:5: sparse: sparse: symbol 'hns3_read_stat_mode_cfg' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:192:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:192:14: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:192:14: sparse:     got restricted __le64 [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:154:5: sparse: sparse: symbol 'hns3_set_stat_mode_cfg' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:105:5: warning: no previous prototype for 'hns3_read_stat_mode_cfg' [-Wmissing-prototypes]
     105 | int hns3_read_stat_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:154:5: warning: no previous prototype for 'hns3_set_stat_mode_cfg' [-Wmissing-prototypes]
     154 | int hns3_set_stat_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:25:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:25:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:25:30: sparse:     got int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:45:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:45:23: sparse:     expected unsigned char [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:45:23: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:50:5: sparse: sparse: symbol 'hns3_test_tm_q_to_qs_set' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:75:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:63:5: sparse: sparse: symbol 'hns3_test_tm_q_to_qs_get' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:80:5: sparse: sparse: symbol 'hns3_test_tm_qs_to_pri_set' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:94:5: sparse: sparse: symbol 'hns3_test_tm_qs_to_pri_get' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:110:5: sparse: sparse: symbol 'hns3_test_tm_qs_weight_set' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:123:5: sparse: sparse: symbol 'hns3_test_tm_qs_weight_get' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:139:5: sparse: sparse: symbol 'hns3_test_tm_pri_weight_set' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:152:5: sparse: sparse: symbol 'hns3_test_tm_pri_weight_get' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:175:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] pg_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:175:20: sparse:     expected unsigned char [usertype] pg_id
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:175:20: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:168:5: sparse: sparse: symbol 'hns3_test_tm_pri_pg_bitmap_set' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:190:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] pg_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:190:20: sparse:     expected unsigned char [usertype] pg_id
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:190:20: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:181:5: sparse: sparse: symbol 'hns3_test_tm_pri_pg_bitmap_get' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:212:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] qs_bit_map @@     got unsigned int [usertype] map @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:212:38: sparse:     expected restricted __le32 [usertype] qs_bit_map
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:212:38: sparse:     got unsigned int [usertype] map
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:200:5: sparse: sparse: symbol 'hns3_test_tm_qs_bp_bitmap_set' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:233:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] qs_bit_map @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:233:14: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:233:14: sparse:     got restricted __le32 [usertype] qs_bit_map
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:217:5: sparse: sparse: symbol 'hns3_test_tm_qs_bp_bitmap_get' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:250:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] pri_shapping_para @@     got unsigned int [usertype] shaper @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:250:41: sparse:     expected restricted __le32 [usertype] pri_shapping_para
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:250:41: sparse:     got unsigned int [usertype] shaper
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:237:5: sparse: sparse: symbol 'hns3_test_tm_pri_shapping_set' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:270:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] pri_shapping_para @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:270:17: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:270:17: sparse:     got restricted __le32 [usertype] pri_shapping_para
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:255:5: sparse: sparse: symbol 'hns3_test_tm_pri_shapping_get' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:275:5: sparse: sparse: symbol 'hns3_test_tm_pg_weight_set' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:288:5: sparse: sparse: symbol 'hns3_test_tm_pg_weight_get' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:317:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] pg_shapping_para @@     got unsigned int [usertype] shaper @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:317:40: sparse:     expected restricted __le32 [usertype] pg_shapping_para
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:317:40: sparse:     got unsigned int [usertype] shaper
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:304:5: sparse: sparse: symbol 'hns3_test_tm_pg_shapping_set' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:338:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] pg_shapping_para @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:338:25: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:338:25: sparse:     got restricted __le32 [usertype] pg_shapping_para
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:322:5: sparse: sparse: symbol 'hns3_test_tm_pg_shapping_get' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:352:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] port_shapping_para @@     got unsigned int [usertype] shaper @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:352:42: sparse:     expected restricted __le32 [usertype] port_shapping_para
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:352:42: sparse:     got unsigned int [usertype] shaper
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:343:5: sparse: sparse: symbol 'hns3_test_tm_port_shapping_set' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:369:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] port_shapping_para @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:369:25: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:369:25: sparse:     got restricted __le32 [usertype] port_shapping_para
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:357:5: sparse: sparse: symbol 'hns3_test_tm_port_shapping_get' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:421:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:421:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:421:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:422:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:422:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:422:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:423:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:423:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:423:30: sparse:     got int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:431:27: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:431:48: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:435:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:435:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:435:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:436:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:436:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:436:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:437:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:437:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:437:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:438:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:438:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:438:30: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:439:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:439:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:439:30: sparse:     got int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:50:5: warning: no previous prototype for 'hns3_test_tm_q_to_qs_set' [-Wmissing-prototypes]
      50 | int hns3_test_tm_q_to_qs_set(struct hclge_dev *hdev, u16 q_id, u16 qs_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:63:5: warning: no previous prototype for 'hns3_test_tm_q_to_qs_get' [-Wmissing-prototypes]
      63 | int hns3_test_tm_q_to_qs_get(struct hclge_dev *hdev, u16 q_id, u16 *qs_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:80:5: warning: no previous prototype for 'hns3_test_tm_qs_to_pri_set' [-Wmissing-prototypes]
      80 | int hns3_test_tm_qs_to_pri_set(struct hclge_dev *hdev, u16 qs_id, u8 pri)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:94:5: warning: no previous prototype for 'hns3_test_tm_qs_to_pri_get' [-Wmissing-prototypes]
      94 | int hns3_test_tm_qs_to_pri_get(struct hclge_dev *hdev, u16 qs_id, u8 *pri)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:110:5: warning: no previous prototype for 'hns3_test_tm_qs_weight_set' [-Wmissing-prototypes]
     110 | int hns3_test_tm_qs_weight_set(struct hclge_dev *hdev, u16 qs_id, u8 dwrr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:123:5: warning: no previous prototype for 'hns3_test_tm_qs_weight_get' [-Wmissing-prototypes]
     123 | int hns3_test_tm_qs_weight_get(struct hclge_dev *hdev, u16 qs_id, u8 *dwrr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:139:5: warning: no previous prototype for 'hns3_test_tm_pri_weight_set' [-Wmissing-prototypes]
     139 | int hns3_test_tm_pri_weight_set(struct hclge_dev *hdev, u8 pri_id, u8 dwrr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:152:5: warning: no previous prototype for 'hns3_test_tm_pri_weight_get' [-Wmissing-prototypes]
     152 | int hns3_test_tm_pri_weight_get(struct hclge_dev *hdev, u8 pri_id, u8 *dwrr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:168:5: warning: no previous prototype for 'hns3_test_tm_pri_pg_bitmap_set' [-Wmissing-prototypes]
     168 | int hns3_test_tm_pri_pg_bitmap_set(struct hclge_dev *hdev, u8 pg_id, u8 bitmap)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:181:5: warning: no previous prototype for 'hns3_test_tm_pri_pg_bitmap_get' [-Wmissing-prototypes]
     181 | int hns3_test_tm_pri_pg_bitmap_get(struct hclge_dev *hdev, u8 pg_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:200:5: warning: no previous prototype for 'hns3_test_tm_qs_bp_bitmap_set' [-Wmissing-prototypes]
     200 | int hns3_test_tm_qs_bp_bitmap_set(struct hclge_dev *hdev, u8 tc, u8 gp_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:217:5: warning: no previous prototype for 'hns3_test_tm_qs_bp_bitmap_get' [-Wmissing-prototypes]
     217 | int hns3_test_tm_qs_bp_bitmap_get(struct hclge_dev *hdev, u8 tc, u8 gp_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:237:5: warning: no previous prototype for 'hns3_test_tm_pri_shapping_set' [-Wmissing-prototypes]
     237 | int hns3_test_tm_pri_shapping_set(struct hclge_dev *hdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:255:5: warning: no previous prototype for 'hns3_test_tm_pri_shapping_get' [-Wmissing-prototypes]
     255 | int hns3_test_tm_pri_shapping_get(struct hclge_dev *hdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:275:5: warning: no previous prototype for 'hns3_test_tm_pg_weight_set' [-Wmissing-prototypes]
     275 | int hns3_test_tm_pg_weight_set(struct hclge_dev *hdev, u8 pg_id, u8 dwrr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:288:5: warning: no previous prototype for 'hns3_test_tm_pg_weight_get' [-Wmissing-prototypes]
     288 | int hns3_test_tm_pg_weight_get(struct hclge_dev *hdev, u8 pg_id, u8 *dwrr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:304:5: warning: no previous prototype for 'hns3_test_tm_pg_shapping_set' [-Wmissing-prototypes]
     304 | int hns3_test_tm_pg_shapping_set(struct hclge_dev *hdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:322:5: warning: no previous prototype for 'hns3_test_tm_pg_shapping_get' [-Wmissing-prototypes]
     322 | int hns3_test_tm_pg_shapping_get(struct hclge_dev *hdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:343:5: warning: no previous prototype for 'hns3_test_tm_port_shapping_set' [-Wmissing-prototypes]
     343 | int hns3_test_tm_port_shapping_set(struct hclge_dev *hdev, u32 shaper)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:357:5: warning: no previous prototype for 'hns3_test_tm_port_shapping_get' [-Wmissing-prototypes]
     357 | int hns3_test_tm_port_shapping_get(struct hclge_dev *hdev, u32 *shaper)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:54:46: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:54:46: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:54:46: sparse:    right side has type int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:55:46: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:55:46: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:55:46: sparse:    right side has type int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:59:38: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:59:38: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:59:38: sparse:    right side has type unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:61:38: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:61:38: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:61:38: sparse:    right side has type int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:70:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ti2oupm @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:70:43: sparse:     expected unsigned int [usertype] ti2oupm
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:70:43: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:71:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tv2pupm @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:71:43: sparse:     expected unsigned int [usertype] tv2pupm
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:71:43: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:75:38: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:75:38: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:75:38: sparse:    right side has type int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:76:38: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:76:38: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:76:38: sparse:    right side has type int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:85:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tp2nupm @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:85:43: sparse:     expected unsigned int [usertype] tp2nupm
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:85:43: sparse:     got restricted __le32
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:86:54: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:87:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:96:46: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:96:46: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:96:46: sparse:    right side has type int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:97:46: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:97:46: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:97:46: sparse:    right side has type int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:100:38: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:100:38: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:100:38: sparse:    right side has type unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:102:38: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:102:38: sparse:    left side has type restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:102:38: sparse:    right side has type int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:113:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] ti2oupm @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:113:46: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:113:46: sparse:     got unsigned int [usertype] ti2oupm
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:115:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] tv2pupm @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:115:46: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:115:46: sparse:     got unsigned int [usertype] tv2pupm
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:126:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:126:38: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:126:38: sparse:     got int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:127:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:127:38: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:127:38: sparse:     got int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:138:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] tp2nupm @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:138:46: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:138:46: sparse:     got unsigned int [usertype] tp2nupm
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:140:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:140:46: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.c:140:46: sparse:     got int
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_xsfp.c:56:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_xsfp.c:56:41: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_xsfp.c:56:41: sparse:     got int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_xsfp.c:126:5: sparse: sparse: symbol 'hns3_set_sfp_state' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_xsfp.c:126:5: warning: no previous prototype for 'hns3_set_sfp_state' [-Wmissing-prototypes]
     126 | int hns3_set_sfp_state(struct hnae3_handle *handle, bool en)
         |     ^~~~~~~~~~~~~~~~~~

vim +673 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c

d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  648  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  649  static int hns3_dcqcn_rw(struct hns3_nic_priv *net_priv,
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  650  			 u32 offset, u32 *data, u32 rw_type)
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  651  {
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  652  	struct hnae3_handle *h = net_priv->ae_handle;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  653  	struct hclge_vport *vport;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  654  	struct hclge_dev *hdev;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  655  	struct hclge_desc desc;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  656  	int ret;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  657  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  658  	if (!data)
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  659  		return -EFAULT;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  660  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  661  	vport = container_of(h, struct hclge_vport, nic);
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  662  	hdev = vport->back;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  663  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  664  	if (rw_type == DEVMEM_CFG_READ) {
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  665  		hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_DCQCN_TEMPLATE_CFG,
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  666  					   true);
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  667  	} else {
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  668  		hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_DCQCN_TEMPLATE_CFG,
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  669  					   false);
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  670  		desc.data[2] = *data;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  671  	}
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  672  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14 @673  	desc.data[0] = SCC_TEMP_LOW_ADDR + offset;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  674  	desc.data[1] = SCC_TEMP_HIGH_ADDR;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  675  	desc.data[4] = 32;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  676  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  677  	ret = hclge_cmd_send(&hdev->hw, &desc, 1);
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  678  	if (ret) {
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  679  		dev_err(&hdev->pdev->dev, "disable net lane failed %d\n", ret);
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  680  		return ret;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  681  	}
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  682  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  683  	if (rw_type == DEVMEM_CFG_READ)
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  684  		*data = desc.data[2];
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  685  
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  686  	return 0;
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  687  }
d02033616da9f2 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_nictool.c Weiwei 2019-08-14  688  

:::::: The code at line 673 was first introduced by commit
:::::: d02033616da9f2fca85e2e8cb73bdd04c46f21e9 net: hns3: add hns3 cae drivers to kernel

:::::: TO: Weiwei <dengweiwei@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
