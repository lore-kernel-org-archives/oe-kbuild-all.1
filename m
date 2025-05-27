Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273161EE017
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327198; cv=none; b=QvX8nf6eIttAQcVO5dXOtUDRtwP3gtd0vHIvXcis8a9KGYvhEzv2Ok3xYxciW18Bc1kuz/UfCAw6Pl2PYgbptdm+ftTfWgeSMLawFcq/E00+i/hnNQKsoTBgHTyKbzGFp4sFSn/8Vh+WkxJsSvga325vd6nn4zHlM1LQfuOhbcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327198; c=relaxed/simple;
	bh=kJ4JrOdubrze6/esUL9jceBkCiSDEmKmgfseAVwWaWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+d5GACzpmv8qcewYCjM2Nt53LZPC2OemhAEzS4e1HKHigwlteHBtJ1EWvcXerosiX0POQFkrrhEtXuz80aOdZRRhF5dWQf2Sl04g8sypYC4xh3L2hYU+0Z62eK6niiq7BmOWF8Dg2sQvdEjCMhHddjesTgdS2oez9PybnKMyQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQSJogEi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQSJogEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327197; x=1779863197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJ4JrOdubrze6/esUL9jceBkCiSDEmKmgfseAVwWaWw=;
  b=NQSJogEiHPODlQLh/o55kqNzguXKprLoHWPxrQu1JfpD4/WjfAFnMS9W
   aSZu3DXFveCKTfrIdtDo/LwqhQTk+BpGD9mF/CUaYnyhJFw4AQgZwMXB9
   mzn0a3bHMMV0OBxHrSqSw77Vo6O9p6Ajp4EbNgKegF1SkdTBIr6bbeYM+
   Lkw7hLJRvMHcgchUV6qATaHCdIgS6q80AWLKF1RY9SWWfkqnhT4+d9iIr
   uSlnh5aSxpwZsNDh26altRUWzxQxWQ4/Hva1ETcCepL2rZ8vfpO/N6/G+
   JnlaGY9G0QWVUKIEEh3SLMhuDsdJaK1cc5DKvSKiBoEz6/Qo1RaFNWR3V
   w==;
X-CSE-ConnectionGUID: VEjz7eFNTwS6h/jifKRZLw==
X-CSE-MsgGUID: g8hwhE5HTv+ZZ0y/fjKAlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50180816"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="50180816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:26:37 -0700
X-CSE-ConnectionGUID: IOEdcsEGQfaotjxZQb6XEw==
X-CSE-MsgGUID: tUczRPtASU22gHoH/vNLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143284259"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2025 23:26:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJnlh-000SxE-0f;
	Tue, 27 May 2025 06:26:33 +0000
Date: Tue, 27 May 2025 14:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/gpu/drm/mediatek/mtk_dvo.c:275:6: warning: no previous prototype for
 function 'mtk_dvo_mutex_vsync_set'
Message-ID: <202505271421.0ab4Nzjc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: 7614ce4cc66748a10c0ab90d9cdcb96e158c0f05 [133/133] CHROMIUM: drm/mediatek: eDP: Add dvo golden setting
config: arm-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271421.0ab4Nzjc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271421.0ab4Nzjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271421.0ab4Nzjc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dvo.c:275:6: warning: no previous prototype for function 'mtk_dvo_mutex_vsync_set' [-Wmissing-prototypes]
     275 | void mtk_dvo_mutex_vsync_set(struct mtk_dvo *dvo)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     275 | void mtk_dvo_mutex_vsync_set(struct mtk_dvo *dvo)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dvo.c:742:6: warning: no previous prototype for function 'mtk_dvo_start' [-Wmissing-prototypes]
     742 | void mtk_dvo_start(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:742:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     742 | void mtk_dvo_start(struct device *dev)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dvo.c:749:6: warning: no previous prototype for function 'mtk_dvo_stop' [-Wmissing-prototypes]
     749 | void mtk_dvo_stop(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     749 | void mtk_dvo_stop(struct device *dev)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dvo.c:756:6: warning: no previous prototype for function 'mtk_dvo_get_hrt_bw_by_datarate' [-Wmissing-prototypes]
     756 | void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     756 | void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
         | ^
         | static 
   4 warnings generated.


vim +/mtk_dvo_mutex_vsync_set +275 drivers/gpu/drm/mediatek/mtk_dvo.c

   274	
 > 275	void mtk_dvo_mutex_vsync_set(struct mtk_dvo *dvo)
   276	{
   277		u32 val = 0x5;
   278		struct drm_display_mode *mode;
   279		struct videomode vm = { 0 };
   280		unsigned int vfporch;
   281	
   282		if (!dvo)
   283			return;
   284	
   285		mode = &dvo->mode;
   286		drm_display_mode_to_videomode(mode, &vm);
   287	
   288		vfporch = vm.vfront_porch;
   289		if (vfporch > 10) {
   290			dev_dbg(dvo->dev, "%s vfporch %d no need set mutex_vsync_sel\n",
   291					   __func__, vfporch);
   292			return;
   293		}
   294	
   295		val = (val << 4) | MUTEX_VSYNC_SEL;
   296		mtk_dvo_mask(dvo, DVO_MUTEX_VSYNC_SET, val, MUTEX_VSYNC_SEL | MUTEX_VFP_MASK);
   297	}
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
