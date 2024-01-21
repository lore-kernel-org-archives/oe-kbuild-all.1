Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861791F60F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705844365; cv=none; b=lV1jfGiiMrS/S8sZj2dn6O7RGWt+P1YL9W4BbP+9kEohGN1i+Dpx2PFhrND6EPt23XiJdi0WP58lmQyi/QtOn5fxeR1m60xndN5gW/I33WGIZbPuQtSGpSDKb3flGdSO+cCV5M2ullCCm/hVXT0zSl6zbEdiMg36VYSkukx4HB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705844365; c=relaxed/simple;
	bh=4ynWSOCJS6o3wuD9I0S2Sc0BeS3b6UkpuTXc5JXAShw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orkqSDyymXdBVqyWkaswrnoGnW0+dhGLoYPVoxDhnGQGmnDTONDQiSjSreblybbQDlxNn6zmkqLVBzOXRsjODMuv/lG0osd9vfI9aExoipXUhxUNdYZfiHdSnWkvGpsTPIT9u8ap1pQUZ/xHHkuXrYynqALuwFe4vQEOG6VRkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBqqVTAP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBqqVTAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705844362; x=1737380362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ynWSOCJS6o3wuD9I0S2Sc0BeS3b6UkpuTXc5JXAShw=;
  b=JBqqVTAPeM9Wp7J+9Oq7/rFPXHYXd6zJMoLb1MXadNotWaSuUl7FwUwn
   uFmc278csqHJblsedr44OF7I/e6GQXw9lueNEY67dQGKMqiGlvCBHM6Vn
   Fl2u79FsZnxfv6O109g7mDbpyFTlowd8NVt3HGoskQQLs1iiimK+RwXms
   hd8QhZ79RwWlLFuKMA+j0KCspjT0Ep+CsQpUbcFYds5zSH3peQ0nZtonp
   8a5HOyCNmagWQzqZWDccnDOU8EaiiDf/XDfiqRE9jjDod3MSTiWApbgQJ
   A65ygieQNhlmSuie92P/BO7zYI912wadxxckw0t2dPWGDyjR7xxGC0WOX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="19600750"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="19600750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 05:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="957861"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2024 05:39:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRY2Y-0005x6-1a;
	Sun, 21 Jan 2024 13:39:10 +0000
Date: Sun, 21 Jan 2024 21:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25400/30000]
 drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: warning: no
 previous prototype for function 'sss_adm_msg_write'
Message-ID: <202401212125.00TDDyKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   297307a8bbb354ddba271dfebf528961834ddf14
commit: 0c4c3ee2e4947ad6ec346dc37fa133f4fecafd76 [25400/30000] Net: ethernet: Support management channel of the host tool in 3snic 3s9xx network driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240121/202401212125.00TDDyKq-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401212125.00TDDyKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401212125.00TDDyKq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: warning: no previous prototype for function 'sss_adm_msg_write' [-Wmissing-prototypes]
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:5: warning: no previous prototype for function 'sss_adm_msg_read' [-Wmissing-prototypes]
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:5: warning: no previous prototype for function 'sss_adm_msg_read_ack' [-Wmissing-prototypes]
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:5: warning: no previous prototype for function 'sss_adm_msg_write_nack' [-Wmissing-prototypes]
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:5: warning: no previous prototype for function 'sss_sync_send_adm_msg' [-Wmissing-prototypes]
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         | ^
         | static 
   5 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:6: warning: no previous prototype for function 'sss_destroy_adm_msg' [-Wmissing-prototypes]
     580 | void sss_destroy_adm_msg(struct sss_adm_msg *adm_msg)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | void sss_destroy_adm_msg(struct sss_adm_msg *adm_msg)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:689:5: warning: no previous prototype for function 'sss_hwif_init_adm' [-Wmissing-prototypes]
     689 | int sss_hwif_init_adm(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     689 | int sss_hwif_init_adm(struct sss_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:738:6: warning: no previous prototype for function 'sss_hwif_deinit_adm' [-Wmissing-prototypes]
     738 | void sss_hwif_deinit_adm(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | void sss_hwif_deinit_adm(struct sss_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:752:6: warning: no previous prototype for function 'sss_complete_adm_event' [-Wmissing-prototypes]
     752 | void sss_complete_adm_event(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:752:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     752 | void sss_complete_adm_event(struct sss_hwdev *hwdev)
         | ^
         | static 
   4 warnings generated.
--
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:15:5: warning: no previous prototype for function 'sss_alloc_db_addr' [-Wmissing-prototypes]
      15 | int sss_alloc_db_addr(void *hwdev, void __iomem **db_base)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:15:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      15 | int sss_alloc_db_addr(void *hwdev, void __iomem **db_base)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:37:6: warning: no previous prototype for function 'sss_free_db_addr' [-Wmissing-prototypes]
      37 | void sss_free_db_addr(void *hwdev, const void __iomem *db_base)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void sss_free_db_addr(void *hwdev, const void __iomem *db_base)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:52:6: warning: no previous prototype for function 'sss_chip_set_msix_auto_mask' [-Wmissing-prototypes]
      52 | void sss_chip_set_msix_auto_mask(void *hwdev, u16 msix_id,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | void sss_chip_set_msix_auto_mask(void *hwdev, u16 msix_id,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:70:6: warning: no previous prototype for function 'sss_chip_set_msix_state' [-Wmissing-prototypes]
      70 | void sss_chip_set_msix_state(void *hwdev, u16 msix_id,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | void sss_chip_set_msix_state(void *hwdev, u16 msix_id,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:86:5: warning: no previous prototype for function 'sss_get_global_func_id' [-Wmissing-prototypes]
      86 | u16 sss_get_global_func_id(void *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | u16 sss_get_global_func_id(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:95:4: warning: no previous prototype for function 'sss_get_pf_id_of_vf' [-Wmissing-prototypes]
      95 | u8 sss_get_pf_id_of_vf(void *hwdev)
         |    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | u8 sss_get_pf_id_of_vf(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:104:4: warning: no previous prototype for function 'sss_get_pcie_itf_id' [-Wmissing-prototypes]
     104 | u8 sss_get_pcie_itf_id(void *hwdev)
         |    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | u8 sss_get_pcie_itf_id(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:113:20: warning: no previous prototype for function 'sss_get_func_type' [-Wmissing-prototypes]
     113 | enum sss_func_type sss_get_func_type(void *hwdev)
         |                    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | enum sss_func_type sss_get_func_type(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:122:20: warning: no previous prototype for function 'sss_get_func_id' [-Wmissing-prototypes]
     122 | enum sss_func_type sss_get_func_id(void *hwdev)
         |                    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | enum sss_func_type sss_get_func_id(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:131:5: warning: no previous prototype for function 'sss_get_glb_pf_vf_offset' [-Wmissing-prototypes]
     131 | u16 sss_get_glb_pf_vf_offset(void *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     131 | u16 sss_get_glb_pf_vf_offset(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:140:4: warning: no previous prototype for function 'sss_get_ppf_id' [-Wmissing-prototypes]
     140 | u8 sss_get_ppf_id(void *hwdev)
         |    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     140 | u8 sss_get_ppf_id(void *hwdev)
         | ^
         | static 
   11 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:6: warning: no previous prototype for function 'sss_tool_free_in_buf' [-Wmissing-prototypes]
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:6: warning: no previous prototype for function 'sss_tool_free_out_buf' [-Wmissing-prototypes]
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:5: warning: no previous prototype for function 'sss_tool_alloc_in_buf' [-Wmissing-prototypes]
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:5: warning: no previous prototype for function 'sss_tool_alloc_out_buf' [-Wmissing-prototypes]
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:5: warning: no previous prototype for function 'sss_tool_copy_to_user' [-Wmissing-prototypes]
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         | ^
         | static 
   5 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:5: warning: no previous prototype for function 'sss_tool_send_clp_msg' [-Wmissing-prototypes]
     498 | int sss_tool_send_clp_msg(struct sss_hwdev *hwdev, u8 mod, u16 cmd, const void *buf_in,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     498 | int sss_tool_send_clp_msg(struct sss_hwdev *hwdev, u8 mod, u16 cmd, const void *buf_in,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:5: warning: no previous prototype for function 'sss_tool_adm_csr_rd32' [-Wmissing-prototypes]
     588 | int sss_tool_adm_csr_rd32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 *val)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     588 | int sss_tool_adm_csr_rd32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 *val)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:5: warning: no previous prototype for function 'sss_tool_adm_csr_wr32' [-Wmissing-prototypes]
     621 | int sss_tool_adm_csr_wr32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 val)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | int sss_tool_adm_csr_wr32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 val)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_sdk.c:29:5: warning: no previous prototype for function 'sss_tool_get_func_type' [-Wmissing-prototypes]
      29 | int sss_tool_get_func_type(struct sss_hal_dev *hal_dev, const void *buf_in, u32 in_size,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_sdk.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | int sss_tool_get_func_type(struct sss_hal_dev *hal_dev, const void *buf_in, u32 in_size,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_sdk.c:42:5: warning: no previous prototype for function 'sss_tool_get_func_id' [-Wmissing-prototypes]
      42 | int sss_tool_get_func_id(struct sss_hal_dev *hal_dev, const void *buf_in, u32 in_size,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_sdk.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | int sss_tool_get_func_id(struct sss_hal_dev *hal_dev, const void *buf_in, u32 in_size,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_sdk.c:55:5: warning: no previous prototype for function 'sss_tool_get_hw_driver_stats' [-Wmissing-prototypes]
      55 | int sss_tool_get_hw_driver_stats(struct sss_hal_dev *hal_dev, const void *buf_in, u32 in_size,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_sdk.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | int sss_tool_get_hw_driver_stats(struct sss_hal_dev *hal_dev, const void *buf_in, u32 in_size,
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:492:5: warning: no previous prototype for function 'sss_nic_get_io_stats_size' [-Wmissing-prototypes]
     492 | u32 sss_nic_get_io_stats_size(const struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats_api.c:492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     492 | u32 sss_nic_get_io_stats_size(const struct sss_nic_dev *nic_dev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_func.c:98:5: warning: no previous prototype for function 'sss_tool_ioctl' [-Wmissing-prototypes]
      98 | int sss_tool_ioctl(void *uld_dev, u32 cmd, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_func.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      98 | int sss_tool_ioctl(void *uld_dev, u32 cmd, const void *in_buf,
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_dcb.c:326:5: warning: no previous prototype for function 'sss_tool_dcb_mt_qos_map' [-Wmissing-prototypes]
     326 | int sss_tool_dcb_mt_qos_map(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_dcb.c:326:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     326 | int sss_tool_dcb_mt_qos_map(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_dcb.c:370:5: warning: no previous prototype for function 'sss_tool_dcb_mt_dcb_state' [-Wmissing-prototypes]
     370 | int sss_tool_dcb_mt_dcb_state(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_dcb.c:370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     370 | int sss_tool_dcb_mt_dcb_state(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_dcb.c:432:5: warning: no previous prototype for function 'sss_tool_dcb_mt_hw_qos_get' [-Wmissing-prototypes]
     432 | int sss_tool_dcb_mt_hw_qos_get(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_dcb.c:432:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     432 | int sss_tool_dcb_mt_hw_qos_get(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
   3 warnings generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:22:5: warning: no previous prototype for function 'sss_tool_get_loopback_mode' [-Wmissing-prototypes]
      22 | int sss_tool_get_loopback_mode(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | int sss_tool_get_loopback_mode(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:42:5: warning: no previous prototype for function 'sss_tool_set_loopback_mode' [-Wmissing-prototypes]
      42 | int sss_tool_set_loopback_mode(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | int sss_tool_set_loopback_mode(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:147:5: warning: no previous prototype for function 'sss_tool_set_link_mode' [-Wmissing-prototypes]
     147 | int sss_tool_set_link_mode(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | int sss_tool_set_link_mode(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:174:6: warning: variable 'old_bw_limit' set but not used [-Wunused-but-set-variable]
     174 |         u32 old_bw_limit;
         |             ^
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:253:5: warning: no previous prototype for function 'sss_tool_set_pf_bw_limit' [-Wmissing-prototypes]
     253 | int sss_tool_set_pf_bw_limit(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     253 | int sss_tool_set_pf_bw_limit(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:277:5: warning: no previous prototype for function 'sss_tool_get_pf_bw_limit' [-Wmissing-prototypes]
     277 | int sss_tool_get_pf_bw_limit(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | int sss_tool_get_pf_bw_limit(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:307:5: warning: no previous prototype for function 'sss_tool_get_netdev_name' [-Wmissing-prototypes]
     307 | int sss_tool_get_netdev_name(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     307 | int sss_tool_get_netdev_name(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:326:5: warning: no previous prototype for function 'sss_tool_get_netdev_tx_timeout' [-Wmissing-prototypes]
     326 | int sss_tool_get_netdev_tx_timeout(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:326:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     326 | int sss_tool_get_netdev_tx_timeout(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:348:5: warning: no previous prototype for function 'sss_tool_set_netdev_tx_timeout' [-Wmissing-prototypes]
     348 | int sss_tool_set_netdev_tx_timeout(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     348 | int sss_tool_set_netdev_tx_timeout(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:371:5: warning: no previous prototype for function 'sss_tool_get_xsfp_present' [-Wmissing-prototypes]
     371 | int sss_tool_get_xsfp_present(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     371 | int sss_tool_get_xsfp_present(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:393:5: warning: no previous prototype for function 'sss_tool_get_xsfp_info' [-Wmissing-prototypes]
     393 | int sss_tool_get_xsfp_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_phy_attr.c:393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     393 | int sss_tool_get_xsfp_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         | ^
         | static 
   11 warnings generated.
..


vim +/sss_adm_msg_write +545 drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c

   544	
 > 545	int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
   546			      const void *cmd, u16 cmd_size)
   547	{
   548		return sss_adm_msg_io(adm_msg, node_id, cmd, cmd_size, NULL, 0);
   549	}
   550	
 > 551	int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
   552			     const void *cmd, u16 size, void *ack, u16 ack_size)
   553	{
   554		return sss_adm_msg_io(adm_msg, node_id, cmd, size, ack, ack_size);
   555	}
   556	
   557	static void sss_set_adm_event_flag(struct sss_msg_pf_to_mgmt *pf_to_mgmt,
   558					   int event_flag)
   559	{
   560		spin_lock(&pf_to_mgmt->sync_event_lock);
   561		pf_to_mgmt->event_state = event_flag;
   562		spin_unlock(&pf_to_mgmt->sync_event_lock);
   563	}
   564	
   565	static u16 sss_align_adm_msg_len(u16 msg_data_len)
   566	{
   567		/* u64 - the size of the header */
   568		u16 msg_size;
   569	
   570		msg_size = (u16)(SSS_MGMT_MSG_RSVD_FOR_DEV + sizeof(u64) + msg_data_len);
   571	
   572		if (msg_size > SSS_MGMT_MSG_SIZE_MIN)
   573			msg_size = SSS_MGMT_MSG_SIZE_MIN +
   574				   ALIGN((msg_size - SSS_MGMT_MSG_SIZE_MIN), SSS_MGMT_MSG_SIZE_STEP);
   575		else
   576			msg_size = SSS_MGMT_MSG_SIZE_MIN;
   577	
   578		return msg_size;
   579	}
   580	
   581	static void sss_encapsulate_adm_msg(u8 *adm_msg, u64 *header,
   582					    const void *body, int body_len)
   583	{
   584		u8 *adm_msg_new = adm_msg;
   585	
   586		memset(adm_msg_new, 0, SSS_MGMT_MSG_RSVD_FOR_DEV);
   587	
   588		adm_msg_new += SSS_MGMT_MSG_RSVD_FOR_DEV;
   589		memcpy(adm_msg_new, header, sizeof(*header));
   590	
   591		adm_msg_new += sizeof(*header);
   592		memcpy(adm_msg_new, body, (size_t)(u32)body_len);
   593	}
   594	
   595	#define SSS_MAX_PF_MGMT_BUF_MAX 2048L
   596	
 > 597	int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
   598				 u16 size, void *ack, u16 ack_size)
   599	{
   600		struct sss_msg_pf_to_mgmt *pf_to_mgmt = NULL;
   601		struct sss_adm_msg *adm_mag = NULL;
   602	
   603		if (!hwdev || !cmd || (ack_size && !ack) || size > SSS_MAX_PF_MGMT_BUF_MAX)
   604			return -EINVAL;
   605	
   606		if (!SSS_SUPPORT_ADM_MSG((struct sss_hwdev *)hwdev))
   607			return -EPERM;
   608	
   609		pf_to_mgmt = ((struct sss_hwdev *)hwdev)->pf_to_mgmt;
   610		adm_mag = pf_to_mgmt->adm_msg[SSS_ADM_MSG_POLL_READ];
   611	
   612		if (!(((struct sss_hwdev *)hwdev)->chip_present_flag))
   613			return -EPERM;
   614	
   615		return sss_adm_msg_read(adm_mag, dest, cmd, size, ack, ack_size);
   616	}
   617	
 > 618	int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
   619	{
   620		struct sss_msg_pf_to_mgmt *pf_to_mgmt = NULL;
   621		struct sss_adm_msg *adm_mag = NULL;
   622	
   623		if (!hwdev || !size || !cmd || size > SSS_MAX_PF_MGMT_BUF_MAX)
   624			return -EINVAL;
   625	
   626		if (!SSS_SUPPORT_ADM_MSG((struct sss_hwdev *)hwdev))
   627			return -EPERM;
   628	
   629		pf_to_mgmt = ((struct sss_hwdev *)hwdev)->pf_to_mgmt;
   630		adm_mag = pf_to_mgmt->adm_msg[SSS_ADM_MSG_POLL_WRITE];
   631	
   632		if (!(((struct sss_hwdev *)hwdev)->chip_present_flag))
   633			return -EPERM;
   634	
   635		return sss_adm_msg_write(adm_mag, dest, cmd, size);
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
