Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E46567D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734849335; cv=none; b=mfhTcRrbn2wx5vVhc9IPqWu6BJyvVgQOvSapnfSc39y5OWLpOxD3Zn+3M2I8zojl+OuAO5HhUf8tP6UE+t3KcDIoAWq3f7FVI99cQbr9uerVY/G1CSXI6N12DOPugGDW5pC/uPEnULoC8HjteWPEZPKelW0oowopzCx2k0Pik1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734849335; c=relaxed/simple;
	bh=vm1R6leEAJ+USmdymqGSUzAYwzq3ovW0demVPqGJEs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQmE5OMnnucDFwQnzrMJseonytCh+7KNBJFCPctOqUCu44wD5QkQxt/xwMt44ampvdIfOlzZPZon30xHjpnNhZZ/6lgYy1eq8ZpESaARgMFGUn6OfSp+hnP4vaxjw/Jq5a+DG6NvMeg+OrA38iw9fwfLmdRGrvl/R56j/rdRjE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEkwZpkP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEkwZpkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734849333; x=1766385333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vm1R6leEAJ+USmdymqGSUzAYwzq3ovW0demVPqGJEs4=;
  b=UEkwZpkPYgl2Bbh0Mc9m1D5o/HLYpV8ZKu//1QPJ6vlKsaHBtDjOzlYV
   o/q+bLTA8ypJcAAQ6Fj4+fponB8qiJ7A4thkAFpJW0oRktlHTn9jiHv/7
   4FrZwlXV0bjySZNMD9A1TtXxMsUcq4wOQsytyOsUVxg+UFKzXPnEG7gPF
   RI4yTwY/Mm0KR8zyiLGtRWK0Atq5BsnxQ2s7Z22RjxKfYcuYIXtKVPQ33
   km/GMb82vvua6bRxCxgPMWc0XRprYYT4CEzRxQTAUG9OtLb3DLS+jB3r0
   PwqhQKGy60QJ8Ngi69uU8NR4XDkYFzAmrwLixaRT2xfLwvlMkuIn+v7ST
   A==;
X-CSE-ConnectionGUID: fBlJDQWzQ4O9eqC7LD5WSw==
X-CSE-MsgGUID: m0gq4vn0QGCYMGnpaZ8wwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34624580"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34624580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 22:35:33 -0800
X-CSE-ConnectionGUID: nmiaevfaS5qzqjZcMd5yKw==
X-CSE-MsgGUID: ZGUJq5QHQGWrVS0rSY3m6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99298825"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 22:35:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPFYn-0002lr-2q;
	Sun, 22 Dec 2024 06:35:29 +0000
Date: Sun, 22 Dec 2024 14:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [intel-lts:6.12/linux 827/1030]
 drivers/gpu/drm/i915/i915_driver.c:1198:31: error: no member named 'physfn'
 in 'struct pci_dev'
Message-ID: <202412221420.QHeZFB32-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: d1d592bf75f7753518169d36bcc2dd9d196e27e3 [827/1030] drm/i915: SR-IOV Enabling and Support
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241222/202412221420.QHeZFB32-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221420.QHeZFB32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221420.QHeZFB32-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:33:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/i915_driver.c:1198:31: error: no member named 'physfn' in 'struct pci_dev'
    1198 |         if (pdev->is_virtfn && pdev->physfn)
         |                                ~~~~  ^
   drivers/gpu/drm/i915/i915_driver.c:1199:45: error: no member named 'physfn' in 'struct pci_dev'
    1199 |                 device_pm_wait_for_dev(&pdev->dev, &pdev->physfn->dev);
         |                                                     ~~~~  ^
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:17:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc_print.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_gt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:523:25: warning: variable 'vf_regs' set but not used [-Wunused-but-set-variable]
     523 |         struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
         |                                ^
>> drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:693:5: warning: stack frame size (1056) exceeds limit (1024) in 'intel_iov_query_update_ggtt_ptes' [-Wframe-larger-than]
     693 | int intel_iov_query_update_ggtt_ptes(struct intel_iov *iov)
         |     ^
   3 warnings generated.
--
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_relay.c:12:
   In file included from drivers/gpu/drm/i915/gt/intel_gt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/gt/iov/intel_iov_relay.c:149:12: warning: stack frame size (1048) exceeds limit (1024) in 'relay_send' [-Wframe-larger-than]
     149 | static int relay_send(struct intel_iov_relay *relay, u32 target,
         |            ^
>> drivers/gpu/drm/i915/gt/iov/intel_iov_relay.c:457:5: warning: stack frame size (1052) exceeds limit (1024) in 'intel_iov_relay_send_to_pf' [-Wframe-larger-than]
     457 | int intel_iov_relay_send_to_pf(struct intel_iov_relay *relay,
         |     ^
>> drivers/gpu/drm/i915/gt/iov/intel_iov_relay.c:676:5: warning: stack frame size (1064) exceeds limit (1024) in 'intel_iov_relay_process_guc2vf' [-Wframe-larger-than]
     676 | int intel_iov_relay_process_guc2vf(struct intel_iov_relay *relay, const u32 *msg, u32 len)
         |     ^
   4 warnings generated.
--
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_service.c:17:
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_gtt.h:19:
   In file included from include/linux/io-mapping.h:33:
   In file included from arch/x86/include/asm/iomap.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/gt/iov/intel_iov_service.c:435:5: warning: stack frame size (1076) exceeds limit (1024) in 'intel_iov_service_process_msg' [-Wframe-larger-than]
     435 | int intel_iov_service_process_msg(struct intel_iov *iov, u32 origin,
         |     ^
   2 warnings generated.


vim +1198 drivers/gpu/drm/i915/i915_driver.c

  1185	
  1186	static int i915_drm_resume(struct drm_device *dev)
  1187	{
  1188		struct drm_i915_private *dev_priv = to_i915(dev);
  1189		struct intel_display *display = &dev_priv->display;
  1190		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
  1191		struct intel_gt *gt;
  1192		int ret, i;
  1193	
  1194		/*
  1195		 * In case the VF and the PF are both probed on the same kernel,
  1196		 * let the VF wait until the PF finish resume first.
  1197		 */
> 1198		if (pdev->is_virtfn && pdev->physfn)
  1199			device_pm_wait_for_dev(&pdev->dev, &pdev->physfn->dev);
  1200	
  1201		disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
  1202	
  1203		ret = i915_pcode_init(dev_priv);
  1204		if (ret)
  1205			return ret;
  1206	
  1207		sanitize_gpu(dev_priv);
  1208	
  1209		ret = i915_ggtt_enable_hw(dev_priv);
  1210		if (ret)
  1211			drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
  1212		/*
  1213		 * Wa_22018453856:
  1214		 * We need to establish communication with GuC to be able to
  1215		 * update GGTT via PF.
  1216		 */
  1217		if (IS_SRIOV_VF(dev_priv) && i915_ggtt_require_binder(dev_priv))
  1218			intel_iov_query_bootstrap(&to_gt(dev_priv)->iov);
  1219	
  1220		i915_ggtt_resume(to_gt(dev_priv)->ggtt);
  1221	
  1222		for_each_gt(gt, dev_priv, i)
  1223			if (GRAPHICS_VER(gt->i915) >= 8)
  1224				setup_private_pat(gt);
  1225	
  1226		/* Must be called after GGTT is resumed. */
  1227		intel_dpt_resume(dev_priv);
  1228	
  1229		intel_dmc_resume(dev_priv);
  1230	
  1231		i915_restore_display(dev_priv);
  1232		intel_pps_unlock_regs_wa(display);
  1233	
  1234		intel_init_pch_refclk(dev_priv);
  1235	
  1236		/*
  1237		 * Interrupts have to be enabled before any batches are run. If not the
  1238		 * GPU will hang. i915_gem_init_hw() will initiate batches to
  1239		 * update/restore the context.
  1240		 *
  1241		 * drm_mode_config_reset() needs AUX interrupts.
  1242		 *
  1243		 * Modeset enabling in intel_display_driver_init_hw() also needs working
  1244		 * interrupts.
  1245		 */
  1246		intel_runtime_pm_enable_interrupts(dev_priv);
  1247	
  1248		if (HAS_DISPLAY(dev_priv))
  1249			drm_mode_config_reset(dev);
  1250	
  1251		i915_gem_resume(dev_priv);
  1252	
  1253		intel_display_driver_init_hw(dev_priv);
  1254	
  1255		intel_clock_gating_init(dev_priv);
  1256	
  1257		if (HAS_DISPLAY(dev_priv))
  1258			intel_display_driver_resume_access(dev_priv);
  1259	
  1260		intel_hpd_init(dev_priv);
  1261	
  1262		/* MST sideband requires HPD interrupts enabled */
  1263		intel_dp_mst_resume(dev_priv);
  1264		intel_display_driver_resume(dev_priv);
  1265	
  1266		if (HAS_DISPLAY(dev_priv)) {
  1267			intel_display_driver_enable_user_access(dev_priv);
  1268			drm_kms_helper_poll_enable(dev);
  1269		}
  1270		intel_hpd_poll_disable(dev_priv);
  1271	
  1272		intel_opregion_resume(display);
  1273	
  1274		intel_fbdev_set_suspend(dev, FBINFO_STATE_RUNNING, false);
  1275	
  1276		intel_power_domains_enable(dev_priv);
  1277	
  1278		intel_gvt_resume(dev_priv);
  1279	
  1280		for_each_gt(gt, dev_priv, i) {
  1281			intel_guc_invalidate_tlb_engines(&gt->uc.guc);
  1282			intel_guc_invalidate_tlb_guc(&gt->uc.guc);
  1283		}
  1284	
  1285		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
  1286	
  1287		return 0;
  1288	}
  1289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
