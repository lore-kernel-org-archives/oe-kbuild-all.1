Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABD381BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722070224; cv=none; b=FyZjg1rwIZogZ5I+tdcieC7eOZzGa1ERwsMhPOeJC4rRMgZpeHLDigNtp7+Ih6gKA5dVBlpk9b01tz5byoCh4/LL6jU6fYBrTm9Sv1oJZRiC7qocFC2bximwrVY+FT5ufd3yMevTDRsZg5OC9w0/RB78eosPXHk9akWy73G79g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722070224; c=relaxed/simple;
	bh=Bk1BmW9Q1NgrWBmFbOK1HKWG+xvVUCiNl5CwCG7iXZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIm6F+sw5qpIUw+alyCnwh/psa5xGew6kewLtWvfdYt7EWoMaKZyUZuEHbNo7MFCnm3cnnr/ssaSmldkJZ5nb6hGv9sbzx3MVpmpaQqTlfpVy3LLXPYlc2Vvr/93M4AheuPVZmIImirFQDl18CSZqCVt831WTwPu2TEH7l7VKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsOhMMda; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsOhMMda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722070222; x=1753606222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bk1BmW9Q1NgrWBmFbOK1HKWG+xvVUCiNl5CwCG7iXZI=;
  b=dsOhMMdaziLi+yA5N7Sm7Vo5Bz/C8lYlTHHvwT4hAFBG7e9/ZqJ/J9ga
   G+fdTqhspjostuc8VjnRWBxPfk94/cj+TdQy2XECcdgjvZgDjA9rQlas+
   i/rxyf7MjwlwmiMER9adrbQQQUwLyW/v4CcmXbwgChpOCiB3Ud+Mujugy
   nOfQURH90cNy7twSSDgpPgBAte7frMyrhJDHIvVY9NaKyUOfWGjITY3dC
   1RPxlyeS4kQZF9PWb0oruLHBYRYEJRXJLOAI3Xy/VunzCPAIcFCUWKIOZ
   fv5IJcFuHd0jZX2KGt8lIj3raLm1W/zp0dH93i36/UjYeVIYmjdoy5cjZ
   A==;
X-CSE-ConnectionGUID: k7jENyRJR1meyGrkMwJX/g==
X-CSE-MsgGUID: sKPdlLkkRTWSSn8pws/pyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19745487"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="19745487"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 01:50:21 -0700
X-CSE-ConnectionGUID: 1EwGWpf3SwOb7K3oxEQW+Q==
X-CSE-MsgGUID: KhCJsW6sQTymrma3dol5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="53162319"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jul 2024 01:50:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXd85-000plk-36;
	Sat, 27 Jul 2024 08:50:17 +0000
Date: Sat, 27 Jul 2024 16:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11543/23370]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_qres.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202407271613.wxmYLLXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   365ea86d72567c1550e42ecf0e3f4521da9a5570
commit: ed046b8a9bc5f5836ece3a3efa29c54f0fc904e7 [11543/23370] net: hns3: rename hns3_cae's files and remove send_cmdq
config: x86_64-buildonly-randconfig-005-20240727 (https://download.01.org/0day-ci/archive/20240727/202407271613.wxmYLLXu-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271613.wxmYLLXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271613.wxmYLLXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_qres.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:19:6: warning: no previous prototype for function 'fill_port_info' [-Wmissing-prototypes]
      19 | void fill_port_info(struct hclge_port_info *get_port_info_out,
         |      ^
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_port.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      19 | void fill_port_info(struct hclge_port_info *get_port_info_out,
         | ^
         | static 
   1 warning generated.
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_port.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_hilink_param.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_irq.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_qinfo.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_rss.o: warning: objtool: missing symbol for section .text
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
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_fd.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_mac.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_vlan.o: warning: objtool: missing symbol for section .text
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
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_qos.o: warning: objtool: missing symbol for section .text
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
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/.tmp_hns3_cae_promisc.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
