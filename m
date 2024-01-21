Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193B4364B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705862268; cv=none; b=haN+mMWyL+PUAy8/OjyOKzWywQKGiYTvCPUl9BF6qWTrGI3yJW4mWS+Tv+qehn6Ht1TT1vAxPpoiQwF/brO26DnxaHYyX4vgTKVLrTA/xdN19cwiMfCtPdbbkcaCJvmF0q+dHI4RsVSq/Ty3xyoxM009E6OmAJwX7BEj4Hc8/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705862268; c=relaxed/simple;
	bh=k7NlFDDEMD0/vhOgnlSniCKD9fNgrd0tHV4Ufsxzg5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rahe8yOo/VgsonN55RrjvXbDZkxWtJ5aT13f4UVAS84vaG/eyMV/lVel+sU0ZW3HjPfzIzleleq13m1jdZps3EZ12G7Pzf5nvn+wn2+UqQ455vEXc6BcSQ8nTkPe+IIsE8xJBG2IgrTxgJxxPvMxUQckECOUcS0YnJae90BJPcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkQhqBYz; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkQhqBYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705862264; x=1737398264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7NlFDDEMD0/vhOgnlSniCKD9fNgrd0tHV4Ufsxzg5I=;
  b=mkQhqBYz0FI0VyvZi3ni0atcDwzB1W5clrgMoAUd0A5bw5i+Sz0nStjf
   55cf3vJnyt6G6fx6yrUyH+foc2nVQ3fLRDbNvCfhMU7jCD9yKS/TDSZZ9
   8lYRU5/gSneUhDPX8slfOsMxdUijiu0jBogPOA71JRdBmSBahlAELYRqI
   rlrs+MKa4bMarzly7eVt2GwROOOzdsukuHdThEJnUS8BTV90QP3sc+92T
   fWrJUCYz2AcqQAHysQFoujjZa2WO33TarnkWbPpXdS6IB0oBu7lO4Ifv3
   3Zdtvn7xtdSjllohYedX5TBSt2IsnM4voLFAUZ76j7uIAGHtH3GZRPg1m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="465318615"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="465318615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 10:35:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819474362"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="819474362"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jan 2024 10:35:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRcf9-000688-1w;
	Sun, 21 Jan 2024 18:35:19 +0000
Date: Mon, 22 Jan 2024 02:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.6/linux 294/333]
 drivers/gpu/drm/i915/i915_driver.c:1255:31: error: 'struct pci_dev' has no
 member named 'physfn'; did you mean 'is_physfn'?
Message-ID: <202401220223.vHDTERVe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   9fe58986e8674d72a73d6e5c010afea625409635
commit: fc2406184d313c432b02b6d16a031b4bfc8a0483 [294/333] drm/i915: SR-IOV Enabling and Support
config: i386-randconfig-054-20240121 (https://download.01.org/0day-ci/archive/20240122/202401220223.vHDTERVe-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220223.vHDTERVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220223.vHDTERVe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_driver.c: In function 'i915_drm_resume':
>> drivers/gpu/drm/i915/i915_driver.c:1255:31: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    1255 |  if (pdev->is_virtfn && pdev->physfn)
         |                               ^~~~~~
         |                               is_physfn
   drivers/gpu/drm/i915/i915_driver.c:1256:45: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    1256 |   device_pm_wait_for_dev(&pdev->dev, &pdev->physfn->dev);
         |                                             ^~~~~~
         |                                             is_physfn


vim +1255 drivers/gpu/drm/i915/i915_driver.c

  1243	
  1244	static int i915_drm_resume(struct drm_device *dev)
  1245	{
  1246		struct drm_i915_private *dev_priv = to_i915(dev);
  1247		struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
  1248		struct intel_gt *gt;
  1249		int ret, i;
  1250	
  1251		/*
  1252		 * In case the VF and the PF are both probed on the same kernel,
  1253		 * let the VF wait until the PF finish resume first.
  1254		 */
> 1255		if (pdev->is_virtfn && pdev->physfn)
  1256			device_pm_wait_for_dev(&pdev->dev, &pdev->physfn->dev);
  1257	
  1258		disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
  1259	
  1260		ret = i915_pcode_init(dev_priv);
  1261		if (ret)
  1262			return ret;
  1263	
  1264		sanitize_gpu(dev_priv);
  1265	
  1266		ret = i915_ggtt_enable_hw(dev_priv);
  1267		if (ret)
  1268			drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
  1269		 /*
  1270		 * Wa_22018453856:
  1271		 * We need to establish communication with GuC to be able to
  1272		 * update GGTT via PF.
  1273		 */
  1274		if (IS_SRIOV_VF(dev_priv) && i915_ggtt_require_binder(dev_priv))
  1275			intel_iov_query_bootstrap(&to_gt(dev_priv)->iov);
  1276	
  1277		i915_ggtt_resume(to_gt(dev_priv)->ggtt);
  1278	
  1279		for_each_gt(gt, dev_priv, i)
  1280			if (GRAPHICS_VER(gt->i915) >= 8)
  1281				setup_private_pat(gt);
  1282	
  1283		/* Must be called after GGTT is resumed. */
  1284		intel_dpt_resume(dev_priv);
  1285	
  1286		intel_dmc_resume(dev_priv);
  1287	
  1288		i915_restore_display(dev_priv);
  1289		intel_pps_unlock_regs_wa(dev_priv);
  1290	
  1291		intel_init_pch_refclk(dev_priv);
  1292	
  1293		/*
  1294		 * Interrupts have to be enabled before any batches are run. If not the
  1295		 * GPU will hang. i915_gem_init_hw() will initiate batches to
  1296		 * update/restore the context.
  1297		 *
  1298		 * drm_mode_config_reset() needs AUX interrupts.
  1299		 *
  1300		 * Modeset enabling in intel_display_driver_init_hw() also needs working
  1301		 * interrupts.
  1302		 */
  1303		intel_runtime_pm_enable_interrupts(dev_priv);
  1304	
  1305		if (HAS_DISPLAY(dev_priv))
  1306			drm_mode_config_reset(dev);
  1307	
  1308		i915_gem_resume(dev_priv);
  1309	
  1310		intel_display_driver_init_hw(dev_priv);
  1311	
  1312		intel_clock_gating_init(dev_priv);
  1313		intel_hpd_init(dev_priv);
  1314	
  1315		/* MST sideband requires HPD interrupts enabled */
  1316		intel_dp_mst_resume(dev_priv);
  1317		intel_display_driver_resume(dev_priv);
  1318	
  1319		intel_hpd_poll_disable(dev_priv);
  1320		if (HAS_DISPLAY(dev_priv))
  1321			drm_kms_helper_poll_enable(dev);
  1322	
  1323		intel_opregion_resume(dev_priv);
  1324	
  1325		intel_fbdev_set_suspend(dev, FBINFO_STATE_RUNNING, false);
  1326	
  1327		intel_power_domains_enable(dev_priv);
  1328	
  1329		intel_gvt_resume(dev_priv);
  1330	
  1331		for_each_gt(gt, dev_priv, i) {
  1332			intel_guc_invalidate_tlb_full(&gt->uc.guc);
  1333			intel_guc_invalidate_tlb(&gt->uc.guc);
  1334		}
  1335	
  1336		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
  1337		intel_gt_bind_context_set_ready(to_gt(dev_priv), true);
  1338	
  1339		return 0;
  1340	}
  1341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
