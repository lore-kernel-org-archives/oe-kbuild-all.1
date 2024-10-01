Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501AD18E027
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 03:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727753219; cv=none; b=faLroTGNMQdmTpUhge+Nsle4+k7WmydDdVcqkdtFUNLMOx/9IGCJ6RCuUJJtj2yaeFNUVUDqp31P6zjNehmhiStcytmaqibWI9dDnchOgn7UQ6FrJlFdvETPmabxLRbYmg3TF2C5sIng3m4Q0KGSqWcs+JlNQkUhGlTe3vUiY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727753219; c=relaxed/simple;
	bh=oMZj5dz9CzQ8b0tN4sPCLHZTMT4znwlJu3b/t6WYreM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cq3VK3Vh8SHyCNvemu6wtxqbXDYOn6X7BlWlNwWTFl2iexFNS1zMIJM0TO4Nq0tkjh8yOIr/ZPyKK+x0MPPXszaMT2ejoXaOA+JCT4xBCSHXHJKdSrjvdiyrruVOUyHvJFSkQTyE7gz5EMsyBW9EprppGas8DNlMb2Nrwjem7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjCzvhSW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjCzvhSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727753218; x=1759289218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMZj5dz9CzQ8b0tN4sPCLHZTMT4znwlJu3b/t6WYreM=;
  b=QjCzvhSWGplbliAsVmhlrS3gMmvI3Q6g7iTbagxuP5LuW5Bv8o68CbKE
   Pdbx82vrtbdth0ZokEjyWTMz2jKKNmZsATq0WlsJ8YigtTJMPC0WxboN4
   ETZgqYfZxYPg8bvDKmG34qZnD34FJFfaJrIHM96cY9K5y3I8jwVslkwrW
   zFC37bF2x+LmIZXzUDksGw6K+iUFWKBdIfep+ANQ4Y2YR/0lCmbzs4Kgk
   7cvus8Ag2ZlQ2d0uACJqVS2RbX12PCTn1jkI3/RGxP3cWy3UZ+tBLAc4X
   x0bea3A3W3ud0N2AiY3ftmcjRtieFfO08zBa2RX/x5vn4EU4RbnMSapp5
   g==;
X-CSE-ConnectionGUID: swxI5V16SqCiHG3Rowiy0w==
X-CSE-MsgGUID: fFqnsY2XQJyzDX+uNSVm/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38258021"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="38258021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 20:26:54 -0700
X-CSE-ConnectionGUID: /bKzlxoJSHqsnw5wTDuQjQ==
X-CSE-MsgGUID: HxU9xcpKSQewSXQo5qP15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="96850121"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 20:26:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svTXF-000QCT-0j;
	Tue, 01 Oct 2024 03:26:49 +0000
Date: Tue, 1 Oct 2024 11:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11543/23811]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202410011150.agWF1W8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: ed046b8a9bc5f5836ece3a3efa29c54f0fc904e7 [11543/23811] net: hns3: rename hns3_cae's files and remove send_cmdq
config: x86_64-buildonly-randconfig-005-20240929 (https://download.01.org/0day-ci/archive/20241001/202410011150.agWF1W8a-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011150.agWF1W8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011150.agWF1W8a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_vlan.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qinfo.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:20:5: warning: no previous prototype for function 'hclge_test_send_generic_cmd' [-Wmissing-prototypes]
      20 | int hclge_test_send_generic_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | int hclge_test_send_generic_cmd(struct hclge_dev *hdev, u8 *buf_in,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:62:5: warning: no previous prototype for function 'hclge_test_send_allocate_cmd' [-Wmissing-prototypes]
      62 | int hclge_test_send_allocate_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | int hclge_test_send_allocate_cmd(struct hclge_dev *hdev, u8 *buf_in,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:100:5: warning: no previous prototype for function 'hclge_test_send_key_cfg_cmd' [-Wmissing-prototypes]
     100 | int hclge_test_send_key_cfg_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | int hclge_test_send_key_cfg_cmd(struct hclge_dev *hdev, u8 *buf_in,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:153:5: warning: no previous prototype for function 'hclge_test_send_tcam_op_cmd' [-Wmissing-prototypes]
     153 | int hclge_test_send_tcam_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | int hclge_test_send_tcam_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:224:5: warning: no previous prototype for function 'hclge_test_send_ad_op_cmd' [-Wmissing-prototypes]
     224 | int hclge_test_send_ad_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | int hclge_test_send_ad_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:267:5: warning: no previous prototype for function 'hclge_test_send_cnt_op_cmd' [-Wmissing-prototypes]
     267 | int hclge_test_send_cnt_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | int hclge_test_send_cnt_op_cmd(struct hclge_dev *hdev, u8 *buf_in,
         | ^
         | static 
   6 warnings generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_fd.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_hilink_param.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:105:5: warning: no previous prototype for function 'hns3_read_stat_mode_cfg' [-Wmissing-prototypes]
     105 | int hns3_read_stat_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | int hns3_read_stat_mode_cfg(struct hns3_nic_priv *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:154:5: warning: no previous prototype for function 'hns3_set_stat_mode_cfg' [-Wmissing-prototypes]
     154 | int hns3_set_stat_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     154 | int hns3_set_stat_mode_cfg(struct hns3_nic_priv *nic_dev,
         | ^
         | static 
   2 warnings generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_stat.o: warning: objtool: missing symbol for section .text
--
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:139:5: warning: no previous prototype for function 'hns3_test_tm_pri_weight_set' [-Wmissing-prototypes]
     139 | int hns3_test_tm_pri_weight_set(struct hclge_dev *hdev, u8 pri_id, u8 dwrr)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | int hns3_test_tm_pri_weight_set(struct hclge_dev *hdev, u8 pri_id, u8 dwrr)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:152:5: warning: no previous prototype for function 'hns3_test_tm_pri_weight_get' [-Wmissing-prototypes]
     152 | int hns3_test_tm_pri_weight_get(struct hclge_dev *hdev, u8 pri_id, u8 *dwrr)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     152 | int hns3_test_tm_pri_weight_get(struct hclge_dev *hdev, u8 pri_id, u8 *dwrr)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:168:5: warning: no previous prototype for function 'hns3_test_tm_pri_pg_bitmap_set' [-Wmissing-prototypes]
     168 | int hns3_test_tm_pri_pg_bitmap_set(struct hclge_dev *hdev, u8 pg_id, u8 bitmap)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     168 | int hns3_test_tm_pri_pg_bitmap_set(struct hclge_dev *hdev, u8 pg_id, u8 bitmap)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:181:5: warning: no previous prototype for function 'hns3_test_tm_pri_pg_bitmap_get' [-Wmissing-prototypes]
     181 | int hns3_test_tm_pri_pg_bitmap_get(struct hclge_dev *hdev, u8 pg_id,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     181 | int hns3_test_tm_pri_pg_bitmap_get(struct hclge_dev *hdev, u8 pg_id,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:200:5: warning: no previous prototype for function 'hns3_test_tm_qs_bp_bitmap_set' [-Wmissing-prototypes]
     200 | int hns3_test_tm_qs_bp_bitmap_set(struct hclge_dev *hdev, u8 tc, u8 gp_id,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | int hns3_test_tm_qs_bp_bitmap_set(struct hclge_dev *hdev, u8 tc, u8 gp_id,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:217:5: warning: no previous prototype for function 'hns3_test_tm_qs_bp_bitmap_get' [-Wmissing-prototypes]
     217 | int hns3_test_tm_qs_bp_bitmap_get(struct hclge_dev *hdev, u8 tc, u8 gp_id,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     217 | int hns3_test_tm_qs_bp_bitmap_get(struct hclge_dev *hdev, u8 tc, u8 gp_id,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:237:5: warning: no previous prototype for function 'hns3_test_tm_pri_shapping_set' [-Wmissing-prototypes]
     237 | int hns3_test_tm_pri_shapping_set(struct hclge_dev *hdev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:237:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     237 | int hns3_test_tm_pri_shapping_set(struct hclge_dev *hdev,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:255:5: warning: no previous prototype for function 'hns3_test_tm_pri_shapping_get' [-Wmissing-prototypes]
     255 | int hns3_test_tm_pri_shapping_get(struct hclge_dev *hdev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | int hns3_test_tm_pri_shapping_get(struct hclge_dev *hdev,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:275:5: warning: no previous prototype for function 'hns3_test_tm_pg_weight_set' [-Wmissing-prototypes]
     275 | int hns3_test_tm_pg_weight_set(struct hclge_dev *hdev, u8 pg_id, u8 dwrr)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     275 | int hns3_test_tm_pg_weight_set(struct hclge_dev *hdev, u8 pg_id, u8 dwrr)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:288:5: warning: no previous prototype for function 'hns3_test_tm_pg_weight_get' [-Wmissing-prototypes]
     288 | int hns3_test_tm_pg_weight_get(struct hclge_dev *hdev, u8 pg_id, u8 *dwrr)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | int hns3_test_tm_pg_weight_get(struct hclge_dev *hdev, u8 pg_id, u8 *dwrr)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:304:5: warning: no previous prototype for function 'hns3_test_tm_pg_shapping_set' [-Wmissing-prototypes]
     304 | int hns3_test_tm_pg_shapping_set(struct hclge_dev *hdev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:304:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     304 | int hns3_test_tm_pg_shapping_set(struct hclge_dev *hdev,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:322:5: warning: no previous prototype for function 'hns3_test_tm_pg_shapping_get' [-Wmissing-prototypes]
     322 | int hns3_test_tm_pg_shapping_get(struct hclge_dev *hdev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:322:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     322 | int hns3_test_tm_pg_shapping_get(struct hclge_dev *hdev,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:343:5: warning: no previous prototype for function 'hns3_test_tm_port_shapping_set' [-Wmissing-prototypes]
     343 | int hns3_test_tm_port_shapping_set(struct hclge_dev *hdev, u32 shaper)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     343 | int hns3_test_tm_port_shapping_set(struct hclge_dev *hdev, u32 shaper)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:357:5: warning: no previous prototype for function 'hns3_test_tm_port_shapping_get' [-Wmissing-prototypes]
     357 | int hns3_test_tm_port_shapping_get(struct hclge_dev *hdev, u32 *shaper)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.c:357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     357 | int hns3_test_tm_port_shapping_get(struct hclge_dev *hdev, u32 *shaper)
         | ^
         | static 
   20 warnings generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_tm.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:6:5: warning: no previous prototype for function 'hns3_read_promisc_mode_cfg' [-Wmissing-prototypes]
       6 | int hns3_read_promisc_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       6 | int hns3_read_promisc_mode_cfg(struct hns3_nic_priv *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:44:5: warning: no previous prototype for function 'hns3_set_promisc_mode_cfg' [-Wmissing-prototypes]
      44 | int hns3_set_promisc_mode_cfg(struct hns3_nic_priv *nic_dev,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | int hns3_set_promisc_mode_cfg(struct hns3_nic_priv *nic_dev,
         | ^
         | static 
   2 warnings generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_promisc.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_dfx.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_irq.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:9:19: warning: no previous prototype for function 'get_val_hdev' [-Wmissing-prototypes]
       9 | struct hclge_dev *get_val_hdev(struct hns3_nic_priv *net_priv)
         |                   ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       9 | struct hclge_dev *get_val_hdev(struct hns3_nic_priv *net_priv)
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:19:5: warning: no previous prototype for function 'hns3_cmd_rx_priv_wl_config' [-Wmissing-prototypes]
      19 | int hns3_cmd_rx_priv_wl_config(struct hclge_dev *hdev, u16 tc,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      19 | int hns3_cmd_rx_priv_wl_config(struct hclge_dev *hdev, u16 tc,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:89:5: warning: no previous prototype for function 'hns3_cmd_common_thrd_config' [-Wmissing-prototypes]
      89 | int hns3_cmd_common_thrd_config(struct hclge_dev *hdev, u16 tc,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | int hns3_cmd_common_thrd_config(struct hclge_dev *hdev, u16 tc,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:161:5: warning: no previous prototype for function 'hns3_cmd_common_wl_config' [-Wmissing-prototypes]
     161 | int hns3_cmd_common_wl_config(struct hclge_dev *hdev, u32 high, u32 low, u32 en)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.c:161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     161 | int hns3_cmd_common_wl_config(struct hclge_dev *hdev, u32 high, u32 low, u32 en)
         | ^
         | static 
   4 warnings generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qos.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.c:6:5: warning: no previous prototype for function 'hns3_get_qres_rx_value' [-Wmissing-prototypes]
       6 | int hns3_get_qres_rx_value(struct hns3_nic_priv *net_priv, int ring_id,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       6 | int hns3_get_qres_rx_value(struct hns3_nic_priv *net_priv, int ring_id,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.c:54:5: warning: no previous prototype for function 'hns3_get_qres_tx_value' [-Wmissing-prototypes]
      54 | int hns3_get_qres_tx_value(struct hns3_nic_priv *net_priv, int ring_id,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | int hns3_get_qres_tx_value(struct hns3_nic_priv *net_priv, int ring_id,
         | ^
         | static 
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.c:100:6: warning: no previous prototype for function 'fill_queue_info' [-Wmissing-prototypes]
     100 | void fill_queue_info(struct hns3_nic_priv *net_priv,
         |      ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | void fill_queue_info(struct hns3_nic_priv *net_priv,
         | ^
         | static 
   3 warnings generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_qres.o: warning: objtool: missing symbol for section .text
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
