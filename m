Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491A7FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 21:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763927; cv=none; b=kd0Qbztj9ZTAEjE6xRv23thMb/7ga/G2Yb0le7AJnM5r24qE+oPOt7iLmXGgKHV9V/b7F2KgM32eQkDiXlGSbiG+qEumjx3E0VQVu8IMftvNgb+HVOptlrsyeVC3TgRue+6D8mqgnTQKBmvHGW2J7pikOIScl0EhS45GM/lELtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763927; c=relaxed/simple;
	bh=s98ZFCuxlTCxy9BeQvMEN49OS8RBz+VVThbjzRkmfvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eoUy1Y/Jwhac79Yz6lTfsaaAAJlorHCrMXLziB6HhUIPi3Gj1zViHFmJPGRyPMO+yMwM2DeGGN20OTrIE2AxsQZ/KXRPUDM6OLUBPqQNA0FhmcwRwtrVUDWd58mmFZbFnfofUAUViMgL94ehtBhDLiocbQFCMmThCZWcOgrXkDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRrGRbDA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRrGRbDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749763925; x=1781299925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s98ZFCuxlTCxy9BeQvMEN49OS8RBz+VVThbjzRkmfvA=;
  b=BRrGRbDAY4N2GlwE5giOwyqsz56/xr2eNQa6KEeGfHycceOlaBqCvqFb
   65+ljb05T+ii3f4s8AQuU/MdFGSFdXPIIZf3LdrKF5DMwm38OHYRXJ9/b
   C2PRXr9oQzofk1GKBb81JpV6OIVKvuQdAzHhcQa8AxYyVkgI/upOGfSkY
   7YYwsiwcSehD8H6Bg8fFBZhnvke7SSAsWBeW4Uvn7V1Z4kakfytlsLTaa
   +oNAo+/yAGp6yQLaWLbKJwidTR4udlGoWfNaVN9ngCh9V2FlRimN0n12R
   yUFf9XAoDsg5VYL0TokwsA5wlnTQNtUgozTRJRNJ9HF3v5kVvwW9s00xr
   Q==;
X-CSE-ConnectionGUID: qz+/AEAlR1Kghg08IJevGg==
X-CSE-MsgGUID: yRPjG9hQRYWa9m2IRBrD4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52111868"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="52111868"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 14:32:03 -0700
X-CSE-ConnectionGUID: CSkPwt4JSR6WCy3VmEGY3w==
X-CSE-MsgGUID: EQhN7nYcQXmvH+L3y5Q7tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="152549204"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 14:32:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPpWh-000Byo-1l;
	Thu, 12 Jun 2025 21:31:59 +0000
Date: Fri, 13 Jun 2025 05:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 160/160]
 drivers/soc/mediatek/mtk-mmdvfs-v3.c:71:7: error: redefinition of
 'mmdvfs_get_mmup_base'
Message-ID: <202506130556.vHnSUIQ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   93817911b95226b78c95205943ab20fa76c00432
commit: 1cc9e9ca2d2e26a6b7e9b650ba61a261506201ee [160/160] CHROMIUM: mmdvfs: add basic driver to support mmdvfs
config: arm64-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130556.vHnSUIQ7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130556.vHnSUIQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130556.vHnSUIQ7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-mmdvfs-v3-user.c:34:5: warning: no previous prototype for 'mmdvfs_user_set_rate' [-Wmissing-prototypes]
      34 | int mmdvfs_user_set_rate(u8 idx, u64 freq)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:71:7: error: redefinition of 'mmdvfs_get_mmup_base'
      71 | void *mmdvfs_get_mmup_base(void)
         |       ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/soc/mediatek/mtk-mmdvfs-v3.c:28:
   include/soc/mediatek/mmdvfs_v3_memory.h:17:21: note: previous definition of 'mmdvfs_get_mmup_base' with type 'void *(void)'
      17 | static inline void *mmdvfs_get_mmup_base(void){ return NULL; }
         |                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:79:7: error: redefinition of 'mmdvfs_get_vcp_base'
      79 | void *mmdvfs_get_vcp_base(void)
         |       ^~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3_memory.h:18:21: note: previous definition of 'mmdvfs_get_vcp_base' with type 'void *(void)'
      18 | static inline void *mmdvfs_get_vcp_base(void){ return NULL; }
         |                     ^~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:87:6: error: redefinition of 'mmdvfs_get_mmup_sram_enable'
      87 | bool mmdvfs_get_mmup_sram_enable(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3_memory.h:19:20: note: previous definition of 'mmdvfs_get_mmup_sram_enable' with type 'bool(void)' {aka '_Bool(void)'}
      19 | static inline bool mmdvfs_get_mmup_sram_enable(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:95:15: error: redefinition of 'mmdvfs_get_mmup_sram'
      95 | void __iomem *mmdvfs_get_mmup_sram(void)
         |               ^~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3_memory.h:20:29: note: previous definition of 'mmdvfs_get_mmup_sram' with type 'void *(void)'
      20 | static inline void __iomem *mmdvfs_get_mmup_sram(void) { return NULL; }
         |                             ^~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:103:6: error: redefinition of 'mmdvfs_is_init_done'
     103 | bool mmdvfs_is_init_done(void)
         |      ^~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3_memory.h:22:20: note: previous definition of 'mmdvfs_is_init_done' with type 'bool(void)' {aka '_Bool(void)'}
      22 | static inline bool mmdvfs_is_init_done(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:112:5: error: redefinition of 'mtk_mmdvfs_enable_vcp'
     112 | int mtk_mmdvfs_enable_vcp(const bool enable, enum VCP_PWR_USR idx)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/soc/mediatek/mtk-mmdvfs-v3.c:27:
   include/soc/mediatek/mmdvfs_v3.h:131:19: note: previous definition of 'mtk_mmdvfs_enable_vcp' with type 'int(const bool,  enum VCP_PWR_USR)' {aka 'int(const _Bool,  enum VCP_PWR_USR)'}
     131 | static inline int mtk_mmdvfs_enable_vcp(const bool enable, enum VCP_PWR_USR idx) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c: In function 'mtk_mmdvfs_enable_vcp':
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:132:23: error: invalid use of undefined type 'struct mtk_vcp_device'
     132 |         if (vcp_device->data->vcp_is_suspending(vcp_device))
         |                       ^~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:138:41: error: invalid use of undefined type 'struct mtk_vcp_device'
     138 |                         ret = vcp_device->data->vcp_register_feature(vcp_device,
         |                                         ^~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:44:32: error: 'MMDVFS_MMUP_FEATURE_ID' undeclared (first use in this function); did you mean 'MMDVFS_HFRP_FEATURE_ID'?
      44 | #define MMDVFS_HFRP_FEATURE_ID MMDVFS_MMUP_FEATURE_ID
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:139:70: note: in expansion of macro 'MMDVFS_HFRP_FEATURE_ID'
     139 |                                                                      MMDVFS_HFRP_FEATURE_ID);
         |                                                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:44:32: note: each undeclared identifier is reported only once for each function it appears in
      44 | #define MMDVFS_HFRP_FEATURE_ID MMDVFS_MMUP_FEATURE_ID
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:139:70: note: in expansion of macro 'MMDVFS_HFRP_FEATURE_ID'
     139 |                                                                      MMDVFS_HFRP_FEATURE_ID);
         |                                                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:151:41: error: invalid use of undefined type 'struct mtk_vcp_device'
     151 |                         ret = vcp_device->data->vcp_deregister_feature(vcp_device,
         |                                         ^~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c: In function 'mmdvfs_vcp_ipi_send_ex':
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:176:38: error: 'MMDVFS_VCP_FEATURE_ID' undeclared (first use in this function); did you mean 'MMDVFS_HFRP_FEATURE_ID'?
     176 |         const u32 feature_id = vcp ? MMDVFS_VCP_FEATURE_ID : MMDVFS_MMUP_FEATURE_ID;
         |                                      ^~~~~~~~~~~~~~~~~~~~~
         |                                      MMDVFS_HFRP_FEATURE_ID
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:176:62: error: 'MMDVFS_MMUP_FEATURE_ID' undeclared (first use in this function); did you mean 'MMDVFS_HFRP_FEATURE_ID'?
     176 |         const u32 feature_id = vcp ? MMDVFS_VCP_FEATURE_ID : MMDVFS_MMUP_FEATURE_ID;
         |                                                              ^~~~~~~~~~~~~~~~~~~~~~
         |                                                              MMDVFS_HFRP_FEATURE_ID
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:240:27: error: invalid use of undefined type 'struct mtk_vcp_device'
     240 |         while (!vcp_device->data->vcp_is_ready(feature_id) || !mmdvfs_dev->mmdvfs_vcp_cb_ready ||
         |                           ^~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:250:31: error: 'VCP_SYNC_TIMEOUT_MS' undeclared (first use in this function); did you mean 'IPI_TIMEOUT_MS'?
     250 |                 if (++retry > VCP_SYNC_TIMEOUT_MS) {
         |                               ^~~~~~~~~~~~~~~~~~~
         |                               IPI_TIMEOUT_MS
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:270:33: error: invalid use of undefined type 'struct mtk_vcp_device'
     270 |         vcp_ipi_dev = vcp_device->ipi_dev;
         |                                 ^~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:274:25: error: invalid use of undefined type 'struct mtk_vcp_device'
     274 |         ret = vcp_device->ipi_ops->ipi_send(vcp_ipi_dev,
         |                         ^~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:275:51: error: 'IPI_OUT_MMDVFS_VCP' undeclared (first use in this function); did you mean 'IPI_MMDVFS_VCP'?
     275 |                                             vcp ? IPI_OUT_MMDVFS_VCP : IPI_OUT_MMDVFS_MMUP,
         |                                                   ^~~~~~~~~~~~~~~~~~
         |                                                   IPI_MMDVFS_VCP
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:275:72: error: 'IPI_OUT_MMDVFS_MMUP' undeclared (first use in this function); did you mean 'IPI_MMDVFS_CCU'?
     275 |                                             vcp ? IPI_OUT_MMDVFS_VCP : IPI_OUT_MMDVFS_MMUP,
         |                                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                                        IPI_MMDVFS_CCU
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:277:20: error: 'IPI_ACTION_DONE' undeclared (first use in this function)
     277 |         if (ret != IPI_ACTION_DONE)
         |                    ^~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:284:32: error: invalid use of undefined type 'struct mtk_vcp_device'
     284 |                 if (!vcp_device->data->vcp_is_ready(feature_id))
         |                                ^~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:287:31: error: 'IPI_COMPL_TIMEOUT' undeclared (first use in this function)
     287 |                         ret = IPI_COMPL_TIMEOUT;
         |                               ^~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:31,
                    from include/linux/clk.h:13,
                    from drivers/soc/mediatek/mtk-mmdvfs-v3.c:6:
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:300:36: error: invalid use of undefined type 'struct mtk_vcp_device'
     300 |                          vcp_device->data->vcp_is_ready(feature_id),
         |                                    ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.h:25:17: note: in expansion of macro 'dev_dbg'
      25 |                 dev_dbg(&(plat_dev)->dev, "[mmdvfs dbg]%s %d: " fmt "\n", \
         |                 ^~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:298:9: note: in expansion of macro 'mtk_mmdvfs_debug'
     298 |         mtk_mmdvfs_debug(pdev, LOG_IPI, "ret:%d %d vcp:%d id:%u %d %d %llx vcp_power:%d func:%#x",
         |         ^~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c: In function 'mtk_mmdvfs_set_rate':
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:377:27: error: invalid use of undefined type 'struct mtk_vcp_device'
     377 |         while (!vcp_device->data->vcp_is_ready(MMDVFS_HFRP_FEATURE_ID) ||
         |                           ^~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:44:32: error: 'MMDVFS_MMUP_FEATURE_ID' undeclared (first use in this function); did you mean 'MMDVFS_HFRP_FEATURE_ID'?
      44 | #define MMDVFS_HFRP_FEATURE_ID MMDVFS_MMUP_FEATURE_ID
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:377:48: note: in expansion of macro 'MMDVFS_HFRP_FEATURE_ID'
     377 |         while (!vcp_device->data->vcp_is_ready(MMDVFS_HFRP_FEATURE_ID) ||
         |                                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:379:31: error: 'VCP_SYNC_TIMEOUT_MS' undeclared (first use in this function); did you mean 'IPI_TIMEOUT_MS'?
     379 |                 if (++retry > VCP_SYNC_TIMEOUT_MS) {
         |                               ^~~~~~~~~~~~~~~~~~~
         |                               IPI_TIMEOUT_MS
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:390:46: error: invalid use of undefined type 'struct mtk_vcp_device'
     390 |                        ret, retry, vcp_device->data->vcp_is_ready(MMDVFS_HFRP_FEATURE_ID),
         |                                              ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.h:25:17: note: in expansion of macro 'dev_dbg'
      25 |                 dev_dbg(&(plat_dev)->dev, "[mmdvfs dbg]%s %d: " fmt "\n", \
         |                 ^~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:388:9: note: in expansion of macro 'mtk_mmdvfs_debug'
     388 |         mtk_mmdvfs_debug(mmdvfs_dev->pdev, LOG_CLK_OPS,
         |         ^~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c: At top level:
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:434:5: error: redefinition of 'mtk_mmdvfs_force_vcore_notify'
     434 | int mtk_mmdvfs_force_vcore_notify(const u32 val)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:132:19: note: previous definition of 'mtk_mmdvfs_force_vcore_notify' with type 'int(const u32)' {aka 'int(const unsigned int)'}
     132 | static inline int mtk_mmdvfs_force_vcore_notify(const u32 val) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:481:6: warning: no previous prototype for 'vmm_notify_work_func' [-Wmissing-prototypes]
     481 | void vmm_notify_work_func(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:490:5: error: redefinition of 'mtk_mmdvfs_genpd_notify'
     490 | int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:133:19: note: previous definition of 'mtk_mmdvfs_genpd_notify' with type 'int(const u8,  const bool)' {aka 'int(const unsigned char,  const _Bool)'}
     133 | static inline int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:518:5: error: redefinition of 'mtk_mmdvfs_set_avs'
     518 | int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh)
         |     ^~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:134:19: note: previous definition of 'mtk_mmdvfs_set_avs' with type 'int(const u8,  const u32,  const u32)' {aka 'int(const unsigned char,  const unsigned int,  const unsigned int)'}
     134 | static inline int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:535:5: warning: no previous prototype for 'vmm_avs_debug_dump' [-Wmissing-prototypes]
     535 | int vmm_avs_debug_dump(char *buf, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:569:5: error: redefinition of 'mtk_mmdvfs_camsv_dc_enable'
     569 | int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:135:19: note: previous definition of 'mtk_mmdvfs_camsv_dc_enable' with type 'int(const u8,  const bool)' {aka 'int(const unsigned char,  const _Bool)'}
     135 | static inline int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:692:5: warning: no previous prototype for 'mmdvfs_vmm_ceil_step' [-Wmissing-prototypes]
     692 | int mmdvfs_vmm_ceil_step(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:717:5: warning: no previous prototype for 'mmdvfs_rst_clk_rate' [-Wmissing-prototypes]
     717 | int mmdvfs_rst_clk_rate(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:756:5: warning: no previous prototype for 'mmdvfs_get_vcp_log' [-Wmissing-prototypes]
     756 | int mmdvfs_get_vcp_log(char *buf, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:784:5: warning: no previous prototype for 'mmdvfs_set_vcp_log' [-Wmissing-prototypes]
     784 | int mmdvfs_set_vcp_log(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:813:5: warning: no previous prototype for 'mmdvfs_get_vmrc_log' [-Wmissing-prototypes]
     813 | int mmdvfs_get_vmrc_log(char *buf, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:841:5: warning: no previous prototype for 'mmdvfs_set_vmrc_log' [-Wmissing-prototypes]
     841 | int mmdvfs_set_vmrc_log(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:882:5: error: redefinition of 'mmdvfs_set_lp_mode_by_vcp'
     882 | int mmdvfs_set_lp_mode_by_vcp(const bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:139:19: note: previous definition of 'mmdvfs_set_lp_mode_by_vcp' with type 'int(const bool)' {aka 'int(const _Bool)'}
     139 | static inline int mmdvfs_set_lp_mode_by_vcp(const bool enable) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:900:6: error: redefinition of 'mmdvfs_rc_enable_set_fp'
     900 | void mmdvfs_rc_enable_set_fp(rc_enable fp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:138:20: note: previous definition of 'mmdvfs_rc_enable_set_fp' with type 'void(int (*)(const bool,  const bool))' {aka 'void(int (*)(const _Bool,  const _Bool))'}
     138 | static inline void mmdvfs_rc_enable_set_fp(rc_enable fp) { return; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:911:6: error: redefinition of 'mmdvfs_get_mmup_enable'
     911 | bool mmdvfs_get_mmup_enable(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3_memory.h:21:20: note: previous definition of 'mmdvfs_get_mmup_enable' with type 'bool(void)' {aka '_Bool(void)'}
      21 | static inline bool mmdvfs_get_mmup_enable(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:919:6: error: redefinition of 'mmdvfs_is_mux_version'
     919 | bool mmdvfs_is_mux_version(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:140:20: note: previous definition of 'mmdvfs_is_mux_version' with type 'bool(void)' {aka '_Bool(void)'}
     140 | static inline bool mmdvfs_is_mux_version(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:964:5: error: redefinition of 'mmdvfs_force_step_by_vcp'
     964 | int mmdvfs_force_step_by_vcp(const u8 pwr_idx, const s8 opp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:141:19: note: previous definition of 'mmdvfs_force_step_by_vcp' with type 'int(const u8,  const s8)' {aka 'int(const unsigned char,  const signed char)'}
     141 | static inline int mmdvfs_force_step_by_vcp(const u8 pwr_idx, const s8 opp) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1038:5: error: redefinition of 'mtk_mmdvfs_v3_set_force_step'
    1038 | int mtk_mmdvfs_v3_set_force_step(const u16 pwr_idx,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:151:5: note: previous definition of 'mtk_mmdvfs_v3_set_force_step' with type 'int(const u16,  const s16,  const bool)' {aka 'int(const short unsigned int,  const short int,  const _Bool)'}
     151 | int mtk_mmdvfs_v3_set_force_step(const u16 pwr_idx, const s16 opp, const bool cmd) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1105:5: error: redefinition of 'mmdvfs_force_voltage_by_vcp'
    1105 | int mmdvfs_force_voltage_by_vcp(const u8 pwr_idx, const s8 opp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:142:19: note: previous definition of 'mmdvfs_force_voltage_by_vcp' with type 'int(const u8,  const s8)' {aka 'int(const unsigned char,  const signed char)'}
     142 | static inline int mmdvfs_force_voltage_by_vcp(const u8 pwr_idx, const s8 opp) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1150:5: error: redefinition of 'mmdvfs_force_rc_clock_by_vcp'
    1150 | int mmdvfs_force_rc_clock_by_vcp(const u8 pwr_idx, const s8 opp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:143:19: note: previous definition of 'mmdvfs_force_rc_clock_by_vcp' with type 'int(const u8,  const s8)' {aka 'int(const unsigned char,  const signed char)'}
     143 | static inline int mmdvfs_force_rc_clock_by_vcp(const u8 pwr_idx, const s8 opp) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1184:5: error: redefinition of 'mmdvfs_force_single_clock_by_vcp'
    1184 | int mmdvfs_force_single_clock_by_vcp(const u8 mux_idx, const s8 opp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:144:19: note: previous definition of 'mmdvfs_force_single_clock_by_vcp' with type 'int(const u8,  const s8)' {aka 'int(const unsigned char,  const signed char)'}
     144 | static inline int mmdvfs_force_single_clock_by_vcp(const u8 mux_idx, const s8 opp) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1258:5: error: redefinition of 'mmdvfs_vote_step_by_vcp'
    1258 | int mmdvfs_vote_step_by_vcp(const u8 pwr_idx, const s8 opp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:145:19: note: previous definition of 'mmdvfs_vote_step_by_vcp' with type 'int(const u8,  const s8)' {aka 'int(const unsigned char,  const signed char)'}
     145 | static inline int mmdvfs_vote_step_by_vcp(const u8 pwr_idx, const s8 opp) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1350:5: error: redefinition of 'mtk_mmdvfs_v3_set_vote_step'
    1350 | int mtk_mmdvfs_v3_set_vote_step(const u16 pwr_idx, const s16 opp, const bool requested_by_cmd)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:137:5: note: previous definition of 'mtk_mmdvfs_v3_set_vote_step' with type 'int(const u16,  const s16,  const bool)' {aka 'int(const short unsigned int,  const short int,  const _Bool)'}
     137 | int mtk_mmdvfs_v3_set_vote_step(const u16 pwr_idx, const s16 opp, const bool cmd) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1529:6: error: redefinition of 'mmdvfs_vcp_cb_mutex_lock'
    1529 | void mmdvfs_vcp_cb_mutex_lock(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/soc/mediatek/mmdvfs_v3.h:147:20: note: previous definition of 'mmdvfs_vcp_cb_mutex_lock' with type 'void(void)'
     147 | static inline void mmdvfs_vcp_cb_mutex_lock(void) { return; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1535:6: error: redefinition of 'mmdvfs_vcp_cb_mutex_unlock'
    1535 | void mmdvfs_vcp_cb_mutex_unlock(void)
--
   cc1: warning: drivers/remoteproc/vcp: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/remoteproc/vcp/include: No such file or directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c: In function 'mmdebug_vcp_ipi_cb':
>> drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:74:23: error: 'IPI_IN_MMDEBUG' undeclared (first use in this function)
      74 |         if (ipi_id != IPI_IN_MMDEBUG || !data)
         |                       ^~~~~~~~~~~~~~
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:74:23: note: each undeclared identifier is reported only once for each function it appears in
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c: In function 'mmdebug_vcp_init_thread':
>> drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:126:31: error: implicit declaration of function 'mtk_vcp_get_by_phandle' [-Wimplicit-function-declaration]
     126 |         mmdebug->vcp_device = mtk_vcp_get_by_phandle(vcp_phandle);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:126:29: error: assignment to 'struct mtk_vcp_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     126 |         mmdebug->vcp_device = mtk_vcp_get_by_phandle(vcp_phandle);
         |                             ^
>> drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:133:36: error: invalid use of undefined type 'struct mtk_vcp_device'
     133 |         while (!mmdebug->vcp_device->data->vcp_is_ready(MMDEBUG_FEATURE_ID)) {
         |                                    ^~
>> drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:133:57: error: 'MMDEBUG_FEATURE_ID' undeclared (first use in this function)
     133 |         while (!mmdebug->vcp_device->data->vcp_is_ready(MMDEBUG_FEATURE_ID)) {
         |                                                         ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:142:28: error: invalid use of undefined type 'struct mtk_vcp_device'
     142 |         mmdebug->vcp_device->data->vcp_register_feature(mmdebug->vcp_device, MMDEBUG_FEATURE_ID);
         |                            ^~
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:144:34: error: invalid use of undefined type 'struct mtk_vcp_device'
     144 |         ret = mmdebug->vcp_device->ipi_ops->ipi_register(mmdebug->vcp_device->ipi_dev,
         |                                  ^~
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:144:77: error: invalid use of undefined type 'struct mtk_vcp_device'
     144 |         ret = mmdebug->vcp_device->ipi_ops->ipi_register(mmdebug->vcp_device->ipi_dev,
         |                                                                             ^~
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:145:58: error: 'IPI_IN_MMDEBUG' undeclared (first use in this function)
     145 |                                                          IPI_IN_MMDEBUG,
         |                                                          ^~~~~~~~~~~~~~
   drivers/misc/mediatek/mmdebug/mtk-mmdebug-vcp.c:153:28: error: invalid use of undefined type 'struct mtk_vcp_device'
     153 |         mmdebug->vcp_device->data->vcp_deregister_feature(mmdebug->vcp_device, MMDEBUG_FEATURE_ID);
         |                            ^~


vim +/mmdvfs_get_mmup_base +71 drivers/soc/mediatek/mtk-mmdvfs-v3.c

    38	
    39	/* If mmup_ena is true, MMDVFS_MMUP_FEATURE_ID is used.
    40	 * Otherwise, if mmup_ena is false, MMDVFS_VCP_FEATURE_ID should be used.
    41	 * Since the code never sets mmup_ena to false,
    42	 * it's simplified to directly use MMDVFS_MMUP_FEATURE_ID.
    43	 */
  > 44	#define MMDVFS_HFRP_FEATURE_ID MMDVFS_MMUP_FEATURE_ID
    45	
    46	static DEFINE_MUTEX(mmdvfs_vcp_pwr_mutex);
    47	static DEFINE_MUTEX(mmdvfs_vcp_cb_mutex);
    48	static DEFINE_MUTEX(mmdvfs_vcp_ipi_mutex);
    49	static DEFINE_MUTEX(mmdvfs_vmm_pwr_mutex);
    50	
    51	#define MMDVFS_IPI_SEND_TIMEOUT       1000000
    52	#define MMDVFS_IPI_DELAY_US           100
    53	#define MMDVFS_REQUEST_VCP_MAX_COUNT  10000
    54	#define MMDVFS_MAX_RETRY_COUNT        100
    55	#define MMDVFS_DEFAULT_RATE           26000000UL
    56	#define DEFAULT_DPSW_THR_VALUE        1
    57	
    58	int mmdvfs_log_level;
    59	module_param(mmdvfs_log_level, uint, 0644);
    60	MODULE_PARM_DESC(mmdvfs_log_level, "mmdvfs log level");
    61	
    62	enum {
    63		LOG_PWR,
    64		LOG_IPI,
    65		LOG_CLK_OPS,
    66		LOG_DBG,
    67		LOG_RST_CLK,
    68		LOG_NUM,
    69	};
    70	
  > 71	void *mmdvfs_get_mmup_base(void)
    72	{
    73		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
    74	
    75		return (IS_ERR_OR_NULL(mmdvfs_dev))? NULL : mmdvfs_dev->mmdvfs_mmup_va;
    76	}
    77	EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_base);
    78	
  > 79	void *mmdvfs_get_vcp_base(void)
    80	{
    81		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
    82	
    83		return (IS_ERR_OR_NULL(mmdvfs_dev))? NULL : mmdvfs_dev->mmdvfs_vcp_va;
    84	}
    85	EXPORT_SYMBOL_GPL(mmdvfs_get_vcp_base);
    86	
  > 87	bool mmdvfs_get_mmup_sram_enable(void)
    88	{
    89		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
    90	
    91		return (IS_ERR_OR_NULL(mmdvfs_dev))? false : mmdvfs_dev->mmdvfs_mmup_sram;
    92	}
    93	EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_sram_enable);
    94	
  > 95	void __iomem *mmdvfs_get_mmup_sram(void)
    96	{
    97		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
    98	
    99		return (IS_ERR_OR_NULL(mmdvfs_dev))? NULL : mmdvfs_dev->mmdvfs_mmup_sram_va;
   100	}
   101	EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_sram);
   102	
 > 103	bool mmdvfs_is_init_done(void)
   104	{
   105		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
   106	
   107		return (IS_ERR_OR_NULL(mmdvfs_dev))? false :
   108			(mmdvfs_dev->mmdvfs_free_run ? mmdvfs_dev->mmdvfs_init_done : false);
   109	}
   110	EXPORT_SYMBOL_GPL(mmdvfs_is_init_done);
   111	
 > 112	int mtk_mmdvfs_enable_vcp(const bool enable, enum VCP_PWR_USR idx)
   113	{
   114		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
   115		struct mtk_vcp_device  *vcp_device;
   116		int ret = 0;
   117	
   118		if (IS_ERR_OR_NULL(mmdvfs_dev))
   119			return -EINVAL;
   120	
   121		vcp_device = mmdvfs_dev->vcp_device;
   122	
   123		if (IS_ERR_OR_NULL(vcp_device)) {
   124			mtk_mmdvfs_err(mmdvfs_dev->pdev, "Invalid vcp_device!");
   125			return -EINVAL;
   126		}
   127	
   128		if (!mmdvfs_dev->mmdvfs_free_run)
   129			return 0;
   130	
   131		mtk_mmdvfs_debug(mmdvfs_dev->pdev, LOG_PWR, "+++ vcp_power:%d", mmdvfs_dev->vcp_power);
 > 132		if (vcp_device->data->vcp_is_suspending(vcp_device))
   133			return -EBUSY;
   134	
   135		mutex_lock(&mmdvfs_vcp_pwr_mutex);
   136		if (enable) {
   137			if (!mmdvfs_dev->vcp_power) {
   138				ret = vcp_device->data->vcp_register_feature(vcp_device,
 > 139									     MMDVFS_HFRP_FEATURE_ID);
   140				if (ret)
   141					goto enable_vcp_end;
   142			}
   143			mmdvfs_dev->vcp_power += 1;
   144			mmdvfs_dev->vcp_pwr_usage[idx] += 1;
   145		} else {
   146			if (!mmdvfs_dev->vcp_pwr_usage[idx] || !mmdvfs_dev->vcp_power) {
   147				ret = -EINVAL;
   148				goto enable_vcp_end;
   149			}
   150			if (mmdvfs_dev->vcp_power == 1) {
   151				ret = vcp_device->data->vcp_deregister_feature(vcp_device,
   152									       MMDVFS_HFRP_FEATURE_ID);
   153				if (ret)
   154					goto enable_vcp_end;
   155			}
   156			mmdvfs_dev->vcp_pwr_usage[idx] -= 1;
   157			mmdvfs_dev->vcp_power -= 1;
   158		}
   159	
   160	enable_vcp_end:
   161		mtk_mmdvfs_debug(mmdvfs_dev->pdev, LOG_PWR, "ret:%d enable:%d vcp_power:%d idx:%u usage:%d",
   162				 ret, enable, mmdvfs_dev->vcp_power, idx,
   163				 mmdvfs_dev->vcp_pwr_usage[idx]);
   164		mutex_unlock(&mmdvfs_vcp_pwr_mutex);
   165	
   166		mtk_mmdvfs_debug(mmdvfs_dev->pdev, LOG_PWR, "--- vcp_power:%d", mmdvfs_dev->vcp_power);
   167	
   168		return ret;
   169	}
   170	EXPORT_SYMBOL_GPL(mtk_mmdvfs_enable_vcp);
   171	
   172	static int mmdvfs_vcp_ipi_send_ex(struct mtk_mmdvfs_dev *mmdvfs_dev, enum ipi_func_id func,
   173					  const u8 idx, const u8 opp, u32 *data, const bool vcp)
   174	{
   175		struct platform_device *pdev = mmdvfs_dev->pdev;
 > 176		const u32 feature_id = vcp ? MMDVFS_VCP_FEATURE_ID : MMDVFS_MMUP_FEATURE_ID;
   177		struct mtk_vcp_device  *vcp_device = mmdvfs_dev->vcp_device;
   178		struct mtk_ipi_device *vcp_ipi_dev;
   179		struct mmdvfs_ipi_data slot = {func, idx, opp,
   180			(vcp ? mmdvfs_dev->mmdvfs_vcp_iova : mmdvfs_dev->mmdvfs_mmup_iova) >> 32,
   181			(u32)(vcp ? mmdvfs_dev->mmdvfs_vcp_iova : mmdvfs_dev->mmdvfs_mmup_iova)};
   182		int ret = 0, retry = 0;
   183		u32 val;
   184	
   185		if (!mmdvfs_is_init_done())
   186			return -ENODEV;
   187	
   188		mutex_lock(&mmdvfs_vcp_ipi_mutex);
   189		switch (func) {
   190		case FUNC_VMM_CEIL_ENABLE:
   191			val = readl(MEM_VMM_CEIL_ENABLE);
   192			if (opp)
   193				writel(val | BIT(idx), MEM_VMM_CEIL_ENABLE);
   194			else
   195				writel(val & ~BIT(idx), MEM_VMM_CEIL_ENABLE);
   196			break;
   197		case FUNC_VCORE_CEIL_LEVEL:
   198			if (!data || *data >= PWR_MMDVFS_NUM) {
   199				ret = -EINVAL;
   200				goto ipi_lock_end;
   201			}
   202			val = readl(MEM_CEIL_LEVEL(*data));
   203			val &= ~GENMASK(idx * 4 + 3, idx * 4); /* clear pre ceil level */
   204			val |= opp << (idx * 4); /* set cur ceil level */
   205			writel(val, MEM_CEIL_LEVEL(*data));
   206			break;
   207		case FUNC_VMM_GENPD_NOTIFY:
   208			if (idx >= VMM_USR_NUM) {
   209				ret = -EINVAL;
   210				goto ipi_lock_end;
   211			}
   212			writel(opp, MEM_GENPD_ENABLE_USR(idx));
   213			break;
   214		case FUNC_VMM_AVS_UPDATE:
   215			if (idx >= VMM_USR_NUM) {
   216				ret = -EINVAL;
   217				goto ipi_lock_end;
   218			}
   219			writel(data[0], MEM_AGING_CNT_USR(idx));
   220			writel(data[1], MEM_FRESH_CNT_USR(idx));
   221			break;
   222		case FUNC_FORCE_OPP:
   223			writel(opp, MEM_FORCE_OPP_PWR(idx));
   224			break;
   225		case FUNC_VOTE_OPP:
   226			writel(opp, MEM_VOTE_OPP_USR(idx));
   227			break;
   228		case FUNC_MMDVFS_LP_MODE:
   229			writel(idx, MEM_MMDVFS_LP_MODE);
   230			break;
   231		case FUNC_MMDVFS_PROFILE:
   232			writel(*data, MEM_PROFILE_TIMES);
   233			break;
   234		default:
   235			break;
   236		}
   237		val = readl(MEM_IPI_SYNC_FUNC(vcp));
   238		mutex_unlock(&mmdvfs_vcp_ipi_mutex);
   239	
   240		while (!vcp_device->data->vcp_is_ready(feature_id) || !mmdvfs_dev->mmdvfs_vcp_cb_ready ||
   241		       mmdvfs_dev->mmdvfs_rst_clk_done) {
   242			if (!mmdvfs_dev->mmdvfs_vcp_cb_ready &&
   243			    (func == FUNC_MMDVFS_INIT || func == FUNC_MMDVFSRC_INIT))
   244				break;
   245			if (mmdvfs_dev->mmdvfs_rst_clk_done && func == FUNC_CLKMUX_ENABLE)
   246				break;
   247			if (func == FUNC_VMM_GENPD_NOTIFY || func == FUNC_VMM_CEIL_ENABLE ||
   248			    func == FUNC_MMDVFS_LP_MODE || (func == FUNC_CLKMUX_ENABLE && !opp))
   249				goto ipi_send_end;
 > 250			if (++retry > VCP_SYNC_TIMEOUT_MS) {
   251				ret = -ETIMEDOUT;
   252				goto ipi_send_end;
   253			}
   254			mdelay(1);
   255		}
   256	
   257		mutex_lock(&mmdvfs_vcp_ipi_mutex);
   258		writel(0, MEM_IPI_SYNC_DATA(vcp));
   259		writel(val | BIT(func), MEM_IPI_SYNC_FUNC(vcp));
   260	
   261		mutex_lock(&mmdvfs_vcp_cb_mutex);
   262		if (!mmdvfs_dev->mmdvfs_vcp_cb_ready && func != FUNC_MMDVFS_INIT &&
   263		    func != FUNC_MMDVFSRC_INIT) {
   264			mutex_unlock(&mmdvfs_vcp_cb_mutex);
   265			ret = -ETIMEDOUT;
   266			goto ipi_lock_end;
   267		}
   268		mutex_unlock(&mmdvfs_vcp_cb_mutex);
   269	
 > 270		vcp_ipi_dev = vcp_device->ipi_dev;
   271		if (!vcp_ipi_dev)
   272			goto ipi_lock_end;
   273	
   274		ret = vcp_device->ipi_ops->ipi_send(vcp_ipi_dev,
   275						    vcp ? IPI_OUT_MMDVFS_VCP : IPI_OUT_MMDVFS_MMUP,
   276						    &slot, PIN_OUT_SIZE_MMDVFS, IPI_TIMEOUT_MS);
   277		if (ret != IPI_ACTION_DONE)
   278			goto ipi_lock_end;
   279	
   280	
   281		ret = readl_poll_timeout(MEM_IPI_SYNC_DATA(vcp), val, (val & (1 << func)),
   282					 MMDVFS_IPI_DELAY_US, MMDVFS_IPI_SEND_TIMEOUT);
   283		if (ret) {
   284			if (!vcp_device->data->vcp_is_ready(feature_id))
   285				ret = -ETIMEDOUT;
   286			else
   287				ret = IPI_COMPL_TIMEOUT;
   288		}
   289	
   290		if (!ret)
   291			writel(val & ~readl(MEM_IPI_SYNC_DATA(vcp)), MEM_IPI_SYNC_FUNC(vcp));
   292	
   293	ipi_lock_end:
   294		val = readl(MEM_IPI_SYNC_FUNC(vcp));
   295		mutex_unlock(&mmdvfs_vcp_ipi_mutex);
   296	
   297	ipi_send_end:
   298		mtk_mmdvfs_debug(pdev, LOG_IPI, "ret:%d %d vcp:%d id:%u %d %d %llx vcp_power:%d func:%#x",
   299				 ret, retry, vcp, feature_id,
   300				 vcp_device->data->vcp_is_ready(feature_id),
   301				 mmdvfs_dev->mmdvfs_vcp_cb_ready, *(u64 *)&slot,
   302				 mmdvfs_dev->vcp_power, val);
   303		mtk_mmdvfs_debug(pdev, LOG_IPI, "rst_clk:%d data:%#x pm time:%llu time:%llu ready:%llu",
   304				 mmdvfs_dev->mmdvfs_rst_clk_done, readl(MEM_IPI_SYNC_DATA(vcp)),
   305				 mmdvfs_dev->cb_timestamp[0], mmdvfs_dev->cb_timestamp[1],
   306				 mmdvfs_dev->cb_timestamp[2]);
   307		mmdvfs_dev->mmdvfs_ipi_status = ret;
   308	
   309		return ret;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
