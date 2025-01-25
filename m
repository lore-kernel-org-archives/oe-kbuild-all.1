Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD11ADC6D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 05:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737784645; cv=none; b=D4PJSxCVUyvpxy/71NzDe+4LktGRY5fiWEfXb1BjmRIuA8f0kA+RPgKpsjQy3JeJyHT/ca7hLodWmPWw8XNrysoyiSrCXEdw3DIas8t0qYRkFAUUhpBnPe0oGNtgTxokeag1llBMMNsEZjrBjDKVTY27bZRLObYF5JSJ/BZrj94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737784645; c=relaxed/simple;
	bh=9qWo9uVxbCh65Rvpvr/UIvPZDy6MpYcfryrI6B4na98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1mo5pvlUE8Wm14xL6DH+Yh315ieHidXDSlRgvMvq/KQtDZujDVz91KOBu22COJuW1geYLES97gP+nM6PzTCsEUJTxK7+2bQ48UORQ1cGbA11lcVMeUMZzxpfvHF8IK4i1f4qFVaVui1+EjtEOrbCp5uKLxz+GHXr2qGTnsSuOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZhP6T3q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZhP6T3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737784643; x=1769320643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qWo9uVxbCh65Rvpvr/UIvPZDy6MpYcfryrI6B4na98=;
  b=nZhP6T3qFtij/AxQ5YjW3Q6QuhNM4ZP0VOmOT22S1/6JsDTUSGKF6dmr
   KrOrhZLcFaDX+xu9gu8YUy+er/2P1WJ3dCN9G5t+uSDS1qNmkiq7tYdnt
   hhCSchCcRoqull3eAWpGzVplyeKNDEt4WMQXaAk0DG2qq0gj8TbgwKG97
   atAhVo3W/jlmTCAz9GwATGlbBFraAum92HdDaj9n6rmPh6KPAtcJQmGt2
   Mc+kAfarMPX0UXXSzugVkCElJ0cJVli7R6FBiB8e7aBlCYAAlfkeFIZ93
   wFIE/K4wu2GQrv1OPZlcAmkdefbXSwMEzt/YUCEXfi679DHrm8K50w5WK
   Q==;
X-CSE-ConnectionGUID: 5La9a0L0Qt61P/nhyWuEGw==
X-CSE-MsgGUID: Vz55y1wTQbCuZjlDAqNLrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38211420"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38211420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 21:57:23 -0800
X-CSE-ConnectionGUID: D3pRnAE9RWe+L+k9vcO/pQ==
X-CSE-MsgGUID: KDJlaKySSAGpPwFGB2ORNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="108545174"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jan 2025 21:57:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbZAV-000dYF-08;
	Sat, 25 Jan 2025 05:57:19 +0000
Date: Sat, 25 Jan 2025 13:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c:24:6: warning: no
 previous prototype for function 'mtk_apu_init_mdw_dev'
Message-ID: <202501251352.vkqeJkpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   5ce578a45b01ebba7685938a590aa92bd1abc254
commit: b33e322e1a35554932b5cfc4cd9f32bfa7d534a9 [13/13] CHROMIUM: soc: mediatek: Add APU mvpu, mdw, apummu driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250125/202501251352.vkqeJkpH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251352.vkqeJkpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251352.vkqeJkpH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_drv.c:93:5: warning: no previous prototype for function 'apumem_init' [-Wmissing-prototypes]
      93 | int apumem_init(void)
         |     ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_drv.c:93:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      93 | int apumem_init(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_drv.c:113:6: warning: no previous prototype for function 'apumem_exit' [-Wmissing-prototypes]
     113 | void apumem_exit(void)
         |      ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_drv.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | void apumem_exit(void)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c:24:6: warning: no previous prototype for function 'mtk_apu_init_mdw_dev' [-Wmissing-prototypes]
      24 | void mtk_apu_init_mdw_dev(struct device *dev)
         |      ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      24 | void mtk_apu_init_mdw_dev(struct device *dev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:147:6: warning: no previous prototype for function 'mtk_apu_init_mdw_dtime_setting' [-Wmissing-prototypes]
     147 | void mtk_apu_init_mdw_dtime_setting(void (*update_power_dtime)(int dtime))
         |      ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | void mtk_apu_init_mdw_dtime_setting(void (*update_power_dtime)(int dtime))
         | ^
         | static 
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:267:5: warning: no previous prototype for function 'mdw_init' [-Wmissing-prototypes]
     267 | int mdw_init(void)
         |     ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | int mdw_init(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:319:6: warning: no previous prototype for function 'mdw_exit' [-Wmissing-prototypes]
     319 | void mdw_exit(void)
         |      ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_drv.c:319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     319 | void mdw_exit(void)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_ctx.c:8:5: warning: no previous prototype for function 'mdw_ctx_init' [-Wmissing-prototypes]
       8 | int mdw_ctx_init(struct mdw_device *mdev)
         |     ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_ctx.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       8 | int mdw_ctx_init(struct mdw_device *mdev)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_ctx.c:13:6: warning: no previous prototype for function 'mdw_ctx_deinit' [-Wmissing-prototypes]
      13 | void mdw_ctx_deinit(struct mdw_device *mdev)
         |      ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_ctx.c:13:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      13 | void mdw_ctx_deinit(struct mdw_device *mdev)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:933:17: warning: no previous prototype for function 'mdw_mem_query_mem' [-Wmissing-prototypes]
     933 | struct mdw_mem *mdw_mem_query_mem(uint64_t kva)
         |                 ^
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem.c:933:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     933 | struct mdw_mem *mdw_mem_query_mem(uint64_t kva)
         | ^
         | static 
   1 warning generated.
--
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:27:5: warning: no previous prototype for function 'apummu_ioremap' [-Wmissing-prototypes]
      27 | int apummu_ioremap(void)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      27 | int apummu_ioremap(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:66:5: warning: no previous prototype for function 'apummu_get_segment_offset0' [-Wmissing-prototypes]
      66 | int apummu_get_segment_offset0(uint32_t vsid_idx, uint8_t seg_idx, uint32_t *input_adr,
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | int apummu_get_segment_offset0(uint32_t vsid_idx, uint8_t seg_idx, uint32_t *input_adr,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:80:6: warning: no previous prototype for function 'apummu_get_segment_offset1' [-Wmissing-prototypes]
      80 | void apummu_get_segment_offset1(uint32_t vsid_idx, uint8_t seg_idx,
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void apummu_get_segment_offset1(uint32_t vsid_idx, uint8_t seg_idx,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:91:6: warning: no previous prototype for function 'apummu_get_segment_offset2' [-Wmissing-prototypes]
      91 | void apummu_get_segment_offset2(uint32_t vsid_idx, uint8_t seg_idx,
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | void apummu_get_segment_offset2(uint32_t vsid_idx, uint8_t seg_idx,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:115:6: warning: no previous prototype for function 'apummu_get_segment_offset3' [-Wmissing-prototypes]
     115 | void apummu_get_segment_offset3(uint32_t vsid_idx, uint8_t seg_idx,
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     115 | void apummu_get_segment_offset3(uint32_t vsid_idx, uint8_t seg_idx,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:123:6: warning: no previous prototype for function 'apummu_set_segment_offset0' [-Wmissing-prototypes]
     123 | void apummu_set_segment_offset0(uint32_t vsid_idx, uint8_t seg_idx, uint32_t input_adr,
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     123 | void apummu_set_segment_offset0(uint32_t vsid_idx, uint8_t seg_idx, uint32_t input_adr,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:135:6: warning: no previous prototype for function 'apummu_set_segment_offset1' [-Wmissing-prototypes]
     135 | void apummu_set_segment_offset1(uint32_t vsid_idx, uint8_t seg_idx, uint32_t output_adr,
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:135:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     135 | void apummu_set_segment_offset1(uint32_t vsid_idx, uint8_t seg_idx, uint32_t output_adr,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:147:6: warning: no previous prototype for function 'apummu_set_segment_offset2' [-Wmissing-prototypes]
     147 | void apummu_set_segment_offset2(
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | void apummu_set_segment_offset2(
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:163:6: warning: no previous prototype for function 'apummu_set_segment_offset3' [-Wmissing-prototypes]
     163 | void apummu_set_segment_offset3(uint32_t vsid_idx, uint8_t seg_idx, uint8_t seg_valid, uint8_t rsv)
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     163 | void apummu_set_segment_offset3(uint32_t vsid_idx, uint8_t seg_idx, uint8_t seg_valid, uint8_t rsv)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:185:5: warning: no previous prototype for function 'apummu_enable_vsid' [-Wmissing-prototypes]
     185 | int apummu_enable_vsid(uint32_t vsid_idx)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     185 | int apummu_enable_vsid(uint32_t vsid_idx)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:212:6: warning: no previous prototype for function 'apummu_enable' [-Wmissing-prototypes]
     212 | void apummu_enable(void)
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | void apummu_enable(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:222:5: warning: no previous prototype for function 'apummu_topology_init' [-Wmissing-prototypes]
     222 | int apummu_topology_init(void)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:222:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     222 | int apummu_topology_init(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:231:5: warning: no previous prototype for function 'apummu_vsid_sram_config' [-Wmissing-prototypes]
     231 | int apummu_vsid_sram_config(void)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     231 | int apummu_vsid_sram_config(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:254:6: warning: no previous prototype for function 'apummu_rv_addr_monitor' [-Wmissing-prototypes]
     254 | void apummu_rv_addr_monitor(uint32_t lower, uint32_t upper)
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | void apummu_rv_addr_monitor(uint32_t lower, uint32_t upper)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:267:10: warning: no previous prototype for function 'apummu_rv_monitor_latch' [-Wmissing-prototypes]
     267 | uint32_t apummu_rv_monitor_latch(void)
         |          ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | uint32_t apummu_rv_monitor_latch(void)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:292:6: warning: no previous prototype for function 'apummu_bind_vsid' [-Wmissing-prototypes]
     292 | void apummu_bind_vsid(void *tcu_base, uint32_t vsid_idx, uint8_t cor_id, uint8_t hw_thread,
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     292 | void apummu_bind_vsid(void *tcu_base, uint32_t vsid_idx, uint8_t cor_id, uint8_t hw_thread,
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:311:5: warning: no previous prototype for function 'apummu_rv_bind_vsid' [-Wmissing-prototypes]
     311 | int apummu_rv_bind_vsid(uint8_t hw_thread)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:311:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     311 | int apummu_rv_bind_vsid(uint8_t hw_thread)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:328:5: warning: no previous prototype for function 'apummu_logger_bind_vsid' [-Wmissing-prototypes]
     328 | int apummu_logger_bind_vsid(uint8_t hw_thread)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     328 | int apummu_logger_bind_vsid(uint8_t hw_thread)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:343:5: warning: no previous prototype for function 'apummu_apmcu_bind_vsid' [-Wmissing-prototypes]
     343 | int apummu_apmcu_bind_vsid(uint8_t hw_thread)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     343 | int apummu_apmcu_bind_vsid(uint8_t hw_thread)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:403:5: warning: no previous prototype for function 'apummu_add_map' [-Wmissing-prototypes]
     403 | int apummu_add_map(uint32_t vsid_idx, uint8_t seg_idx, uint32_t input_adr, uint32_t output_adr,
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     403 | int apummu_add_map(uint32_t vsid_idx, uint8_t seg_idx, uint32_t input_adr, uint32_t output_adr,
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:455:6: warning: no previous prototype for function 'apummu_dump_map' [-Wmissing-prototypes]
     455 | void apummu_dump_map(uint32_t vsid_idx, uint8_t seg_idx)
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:455:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     455 | void apummu_dump_map(uint32_t vsid_idx, uint8_t seg_idx)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:501:5: warning: no previous prototype for function 'apummu_boot_init' [-Wmissing-prototypes]
     501 | int apummu_boot_init(void)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:501:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     501 | int apummu_boot_init(void)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:532:6: warning: no previous prototype for function 'virtual_engine_thread' [-Wmissing-prototypes]
     532 | void virtual_engine_thread(void)
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:532:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     532 | void virtual_engine_thread(void)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:556:5: warning: no previous prototype for function 'apummu_add_apmcu_map' [-Wmissing-prototypes]
     556 | int apummu_add_apmcu_map(uint32_t seg_input0, uint32_t seg_output0, enum eAPUMMUPAGESIZE page_size)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:556:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     556 | int apummu_add_apmcu_map(uint32_t seg_input0, uint32_t seg_output0, enum eAPUMMUPAGESIZE page_size)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:579:5: warning: no previous prototype for function 'apummu_add_logger_map' [-Wmissing-prototypes]
     579 | int apummu_add_logger_map(uint32_t seg_input0, uint32_t seg_output0, enum eAPUMMUPAGESIZE page_size)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     579 | int apummu_add_logger_map(uint32_t seg_input0, uint32_t seg_output0, enum eAPUMMUPAGESIZE page_size)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:601:5: warning: no previous prototype for function 'apummu_add_rv_boot_map' [-Wmissing-prototypes]
     601 | int apummu_add_rv_boot_map(uint32_t seg_output0, int32_t seg_output1, int32_t seg_output2)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_boot.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     601 | int apummu_add_rv_boot_map(uint32_t seg_output0, int32_t seg_output1, int32_t seg_output2)
         | ^
         | static 
   26 warnings generated.
--
   In file included from drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:31:
>> drivers/soc/mediatek/apusys/slbc_ops.h:214:12: warning: no previous prototype for function 'slbc_status' [-Wmissing-prototypes]
     214 | __weak int slbc_status(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:214:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     214 | __weak int slbc_status(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:218:12: warning: no previous prototype for function 'slbc_request' [-Wmissing-prototypes]
     218 | __weak int slbc_request(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:218:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __weak int slbc_request(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:222:12: warning: no previous prototype for function 'slbc_release' [-Wmissing-prototypes]
     222 | __weak int slbc_release(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:222:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     222 | __weak int slbc_release(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:226:12: warning: no previous prototype for function 'slbc_power_on' [-Wmissing-prototypes]
     226 | __weak int slbc_power_on(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:226:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     226 | __weak int slbc_power_on(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:230:12: warning: no previous prototype for function 'slbc_power_off' [-Wmissing-prototypes]
     230 | __weak int slbc_power_off(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:230:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     230 | __weak int slbc_power_off(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:234:12: warning: no previous prototype for function 'slbc_secure_on' [-Wmissing-prototypes]
     234 | __weak int slbc_secure_on(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:234:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     234 | __weak int slbc_secure_on(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:238:12: warning: no previous prototype for function 'slbc_secure_off' [-Wmissing-prototypes]
     238 | __weak int slbc_secure_off(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:238:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     238 | __weak int slbc_secure_off(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:242:12: warning: no previous prototype for function 'slbc_register_activate_ops' [-Wmissing-prototypes]
     242 | __weak int slbc_register_activate_ops(struct slbc_ops *ops)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:242:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     242 | __weak int slbc_register_activate_ops(struct slbc_ops *ops)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:246:12: warning: no previous prototype for function 'slbc_activate_status' [-Wmissing-prototypes]
     246 | __weak int slbc_activate_status(struct slbc_data *d)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:246:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     246 | __weak int slbc_activate_status(struct slbc_data *d)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:250:13: warning: no previous prototype for function 'slbc_update_mm_bw' [-Wmissing-prototypes]
     250 | __weak void slbc_update_mm_bw(unsigned int bw) {}
         |             ^
   drivers/soc/mediatek/apusys/slbc_ops.h:250:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     250 | __weak void slbc_update_mm_bw(unsigned int bw) {}
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:251:13: warning: no previous prototype for function 'slbc_update_mic_num' [-Wmissing-prototypes]
     251 | __weak void slbc_update_mic_num(unsigned int num) {}
         |             ^
   drivers/soc/mediatek/apusys/slbc_ops.h:251:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | __weak void slbc_update_mic_num(unsigned int num) {}
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:252:13: warning: no previous prototype for function 'slbc_update_inner' [-Wmissing-prototypes]
     252 | __weak void slbc_update_inner(unsigned int inner) {}
         |             ^
   drivers/soc/mediatek/apusys/slbc_ops.h:252:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     252 | __weak void slbc_update_inner(unsigned int inner) {}
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:253:13: warning: no previous prototype for function 'slbc_update_outer' [-Wmissing-prototypes]
     253 | __weak void slbc_update_outer(unsigned int outer) {}
         |             ^
   drivers/soc/mediatek/apusys/slbc_ops.h:253:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     253 | __weak void slbc_update_outer(unsigned int outer) {}
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:254:12: warning: no previous prototype for function 'slbc_gid_val' [-Wmissing-prototypes]
     254 | __weak int slbc_gid_val(enum slc_ach_uid uid) { return -EINVAL; }
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:254:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | __weak int slbc_gid_val(enum slc_ach_uid uid) { return -EINVAL; }
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:255:12: warning: no previous prototype for function 'slbc_gid_request' [-Wmissing-prototypes]
     255 | __weak int slbc_gid_request(enum slc_ach_uid uid, int *gid, struct slbc_gid_data *data)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:255:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | __weak int slbc_gid_request(enum slc_ach_uid uid, int *gid, struct slbc_gid_data *data)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:259:12: warning: no previous prototype for function 'slbc_gid_release' [-Wmissing-prototypes]
     259 | __weak int slbc_gid_release(enum slc_ach_uid uid, int gid)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:259:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     259 | __weak int slbc_gid_release(enum slc_ach_uid uid, int gid)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:263:12: warning: no previous prototype for function 'slbc_roi_update' [-Wmissing-prototypes]
     263 | __weak int slbc_roi_update(enum slc_ach_uid uid, int gid, struct slbc_gid_data *data)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:263:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | __weak int slbc_roi_update(enum slc_ach_uid uid, int gid, struct slbc_gid_data *data)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:267:12: warning: no previous prototype for function 'slbc_validate' [-Wmissing-prototypes]
     267 | __weak int slbc_validate(enum slc_ach_uid uid, int gid)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:267:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | __weak int slbc_validate(enum slc_ach_uid uid, int gid)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:271:12: warning: no previous prototype for function 'slbc_invalidate' [-Wmissing-prototypes]
     271 | __weak int slbc_invalidate(enum slc_ach_uid uid, int gid)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:271:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     271 | __weak int slbc_invalidate(enum slc_ach_uid uid, int gid)
         |        ^
         |        static 
>> drivers/soc/mediatek/apusys/slbc_ops.h:275:12: warning: no previous prototype for function 'slbc_read_invalidate' [-Wmissing-prototypes]
     275 | __weak int slbc_read_invalidate(enum slc_ach_uid uid, int gid, int enable)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:275:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     275 | __weak int slbc_read_invalidate(enum slc_ach_uid uid, int gid, int enable)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:279:12: warning: no previous prototype for function 'slbc_force_cache' [-Wmissing-prototypes]
     279 | __weak int slbc_force_cache(enum slc_ach_uid uid, unsigned int size)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:279:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     279 | __weak int slbc_force_cache(enum slc_ach_uid uid, unsigned int size)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:283:12: warning: no previous prototype for function 'slbc_ceil' [-Wmissing-prototypes]
     283 | __weak int slbc_ceil(enum slc_ach_uid uid, unsigned int ceil)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:283:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | __weak int slbc_ceil(enum slc_ach_uid uid, unsigned int ceil)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:287:12: warning: no previous prototype for function 'slbc_window' [-Wmissing-prototypes]
     287 | __weak int slbc_window(unsigned int window)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:287:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | __weak int slbc_window(unsigned int window)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:291:12: warning: no previous prototype for function 'slbc_get_cache_size' [-Wmissing-prototypes]
     291 | __weak int slbc_get_cache_size(enum slc_ach_uid uid)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:291:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     291 | __weak int slbc_get_cache_size(enum slc_ach_uid uid)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:295:12: warning: no previous prototype for function 'slbc_get_cache_hit_rate' [-Wmissing-prototypes]
     295 | __weak int slbc_get_cache_hit_rate(enum slc_ach_uid uid)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:295:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     295 | __weak int slbc_get_cache_hit_rate(enum slc_ach_uid uid)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:299:12: warning: no previous prototype for function 'slbc_get_cache_hit_bw' [-Wmissing-prototypes]
     299 | __weak int slbc_get_cache_hit_bw(enum slc_ach_uid uid)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:299:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     299 | __weak int slbc_get_cache_hit_bw(enum slc_ach_uid uid)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/slbc_ops.h:303:12: warning: no previous prototype for function 'slbc_get_cache_usage' [-Wmissing-prototypes]
     303 | __weak int slbc_get_cache_usage(int *cpu, int *gpu, int *other)
         |            ^
   drivers/soc/mediatek/apusys/slbc_ops.h:303:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     303 | __weak int slbc_get_cache_usage(int *cpu, int *gpu, int *other)
         |        ^
         |        static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:197:5: warning: no previous prototype for function 'apummu_set_init_info' [-Wmissing-prototypes]
     197 | int apummu_set_init_info(struct mtk_apu *apu)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     197 | int apummu_set_init_info(struct mtk_apu *apu)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:599:5: warning: no previous prototype for function 'apummu_init' [-Wmissing-prototypes]
     599 | int apummu_init(void)
         |     ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:599:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     599 | int apummu_init(void)
         | ^
         | static 
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:629:6: warning: no previous prototype for function 'apummu_exit' [-Wmissing-prototypes]
     629 | void apummu_exit(void)
         |      ^
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.c:629:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     629 | void apummu_exit(void)
         | ^
         | static 
   30 warnings generated.
..


vim +/mtk_apu_init_mdw_dev +24 drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_rsc.c

    23	
  > 24	void mtk_apu_init_mdw_dev(struct device *dev)
    25	{
    26		apu_dev = dev;
    27	}
    28	EXPORT_SYMBOL_NS(mtk_apu_init_mdw_dev, MTK_APU_MDW);
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
