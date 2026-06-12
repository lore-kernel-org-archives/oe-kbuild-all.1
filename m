Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCB26CE2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256174; cv=none; b=YuyWCHfZR1CcK3hlpN/+I4M/aKPcLFwWYt7HXwh04WAnSxviG/tS9V2xd1pGkSwKFMBy/iS2xS4UjFCbsqPgWgnyDcCsSTOc+0LuR3diGjQkIWFO2ST5lJe1V9AH4Ijv3oUCD4BH4pJsXqAhcNi2tL1y4w54mz1+gJ6ieeW0AuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256174; c=relaxed/simple;
	bh=6oT7wT7F+YrKRByEPMEa9J11w8Bv6Mq5bEpz6sL7npY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rb2Pouqet8Af91czeAUK5hqTaw0rn8zqDquZWqgLBkyLKHILT1wOLmMn88X8xv/jS89rSDC+nn9NC9f+GZ2EKrM8DcrpGDM/I43ToxRs6ejfTQA6/HQjqgdRUkkLDaLPGQaMI3GDSP4I+gG+hCnXtHew2RkJs1SIiSRXSkjpIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djUtWHZs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djUtWHZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781256171; x=1812792171;
  h=date:from:to:cc:subject:message-id;
  bh=6oT7wT7F+YrKRByEPMEa9J11w8Bv6Mq5bEpz6sL7npY=;
  b=djUtWHZscxjp5UpRUwCZ2eecAzAyQ3ii69mDqYl8tbiLaHvWCa3vBUTG
   LrvnE7r/JPgouhDdNdlCmCj7OOZ1GcenNWtBCpuByftsuQDxHH9S/6nJB
   GAf/dr20F2qzUldyYlBDRV5MXRyo3GnLWRiM7OPTFXpz2+BTTCmLLfOlK
   JMkMOqCSnGcC8VAnD5U32VAtyJgEO11/s3aGOaHmDtbq4AEbTZXEU6AkI
   HpdkVDn7vP29hrnD2k+OF9M9EybeRF2EIk9elEvA23UX8bhvdetRh7OXt
   4XFLIRb1Bs62hsS0BI7rnc8iHe6VCOp8oFZLkunKt6xLLERzPxQXZCNuf
   g==;
X-CSE-ConnectionGUID: xHF0lGWYQfm8Qj4a8ZoO1w==
X-CSE-MsgGUID: 4hB4fU/rS7CVL4xRd45NIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107518654"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="107518654"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:22:50 -0700
X-CSE-ConnectionGUID: iWSL70cUTjC94eEbOWxuJA==
X-CSE-MsgGUID: 1ofP3/jiRq6jFxujI/CoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="276974463"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 02:22:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXy69-00000000OXx-4C66;
	Fri, 12 Jun 2026 09:22:46 +0000
Date: Fri, 12 Jun 2026 17:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Junxiao Chang <junxiao.chang@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [intel-lts:6.12/emt 0/2]
 drivers/gpu/drm/i915/i915_driver.c:1198:38: error: 'struct pci_dev' has no
 member named 'physfn'; did you mean 'is_physfn'?
Message-ID: <202606121731.3YJZlEtD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kooran,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: d1d592bf75f7753518169d36bcc2dd9d196e27e3 [0/2] drm/i915: SR-IOV Enabling and Support
config: i386-buildonly-randconfig-005-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121731.3YJZlEtD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121731.3YJZlEtD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121731.3YJZlEtD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_driver.c: In function 'i915_drm_resume':
>> drivers/gpu/drm/i915/i915_driver.c:1198:38: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    1198 |         if (pdev->is_virtfn && pdev->physfn)
         |                                      ^~~~~~
         |                                      is_physfn
   drivers/gpu/drm/i915/i915_driver.c:1199:59: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    1199 |                 device_pm_wait_for_dev(&pdev->dev, &pdev->physfn->dev);
         |                                                           ^~~~~~
         |                                                           is_physfn


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
