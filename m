Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D9BE67
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694432183; x=1725968183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bSLaNnDaudSdMIN0jBZOJyUc0v2oG95JcrAvsixifTI=;
  b=dGAZPvM/I2yrBIUQaydfpDrCbJf3JKRhG/aGQPS6qa+lthgkiZpdoSUz
   Ee6oWW7rxnMp2bKvQwCk8Hdk3L9L2WsjiBOJIy4S79cDizPueZ6x+nNiO
   rb6AL4tE1Cf5PUtcyHQBAlHgY6Gbas1n13mZCAIzDcu+1MnkvtO+nvKzd
   E/gbyAGZC0QJfSZte1CDss692Pe4YyIbayi347wrFAvWcByCX6aUSpW4/
   vyh819oYKCi3D/zr48g/yhPHi9x7ok1vjj3GI6eCQ6jNtltpm4AAN3DE4
   fqbWK0sYugPXzGINoAKiln1yibVhk6xKIcjsFS1WQ+E565CR6mFZO8RqJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="358360888"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="358360888"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 04:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="746374015"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="746374015"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2023 04:36:01 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qffCx-0006A4-1t;
	Mon, 11 Sep 2023 11:35:59 +0000
Date: Mon, 11 Sep 2023 19:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Jiang <fei.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Min He <min.he@intel.com>, Zhao Yakui <yakui.zhao@intel.com>
Subject: [intel-lts:4.19/android_t 3691/30000]
 drivers/gpu/drm/i915/intel_pm.c:5035:37: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202309111927.plKfnXBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 1ddd999cba51a41b5cf58a2166f51888f82e0059 [3691/30000] drm/i915/gvt: pvmmio optimization for plane wm register update
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20230911/202309111927.plKfnXBp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111927.plKfnXBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111927.plKfnXBp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/intel_pm.c:5035:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] <asn:2> *pv_plane_wm @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/i915/intel_pm.c:5035:37: sparse:     expected unsigned int [noderef] [usertype] <asn:2> *pv_plane_wm
   drivers/gpu/drm/i915/intel_pm.c:5035:37: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/i915/intel_pm.c: In function 'snb_wm_lp3_irq_quirk':
   drivers/gpu/drm/i915/intel_pm.c:3037:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3037 |         intel_print_wm_latency(dev_priv, "Primary", dev_priv->wm.pri_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3037:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3038:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3038 |         intel_print_wm_latency(dev_priv, "Sprite", dev_priv->wm.spr_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3038:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3039:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3039 |         intel_print_wm_latency(dev_priv, "Cursor", dev_priv->wm.cur_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3039:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c: In function 'snb_wm_latency_quirk':
   drivers/gpu/drm/i915/intel_pm.c:3009:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3009 |         intel_print_wm_latency(dev_priv, "Primary", dev_priv->wm.pri_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3009:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3010:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3010 |         intel_print_wm_latency(dev_priv, "Sprite", dev_priv->wm.spr_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3010:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3011:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3011 |         intel_print_wm_latency(dev_priv, "Cursor", dev_priv->wm.cur_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3011:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c: In function 'ilk_setup_wm_latency':
   drivers/gpu/drm/i915/intel_pm.c:3044:9: warning: 'intel_read_wm_latency' accessing 16 bytes in a region of size 10 [-Wstringop-overflow=]
    3044 |         intel_read_wm_latency(dev_priv, dev_priv->wm.pri_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3044:9: note: referencing argument 2 of type 'uint16_t[8]' {aka 'short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2812:13: note: in a call to function 'intel_read_wm_latency'
    2812 | static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3054:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3054 |         intel_print_wm_latency(dev_priv, "Primary", dev_priv->wm.pri_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3054:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3055:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3055 |         intel_print_wm_latency(dev_priv, "Sprite", dev_priv->wm.spr_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3055:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3056:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3056 |         intel_print_wm_latency(dev_priv, "Cursor", dev_priv->wm.cur_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3056:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3044:9: warning: 'intel_read_wm_latency' accessing 16 bytes in a region of size 10 [-Wstringop-overflow=]
    3044 |         intel_read_wm_latency(dev_priv, dev_priv->wm.pri_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3044:9: note: referencing argument 2 of type 'uint16_t[8]' {aka 'short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2812:13: note: in a call to function 'intel_read_wm_latency'
    2812 | static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3054:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3054 |         intel_print_wm_latency(dev_priv, "Primary", dev_priv->wm.pri_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3054:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3055:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3055 |         intel_print_wm_latency(dev_priv, "Sprite", dev_priv->wm.spr_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3055:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}
   drivers/gpu/drm/i915/intel_pm.c:2948:13: note: in a call to function 'intel_print_wm_latency'
    2948 | static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3056:9: warning: 'intel_print_wm_latency' reading 16 bytes from a region of size 10 [-Wstringop-overread]
    3056 |         intel_print_wm_latency(dev_priv, "Cursor", dev_priv->wm.cur_latency);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_pm.c:3056:9: note: referencing argument 3 of type 'const uint16_t[8]' {aka 'const short unsigned int[8]'}

vim +5035 drivers/gpu/drm/i915/intel_pm.c

  5025	
  5026	static void skl_pv_write_plane_wm(struct intel_crtc *intel_crtc,
  5027					const struct skl_plane_wm *wm,
  5028					const struct skl_ddb_allocation *ddb,
  5029					enum plane_id plane_id)
  5030	{
  5031		int i, level;
  5032		struct pv_plane_wm_update tmp_plane_wm;
  5033		struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
  5034		int max_level = ilk_wm_max_level(dev_priv);
> 5035		u32 __iomem *pv_plane_wm = (u32 *)&(dev_priv->shared_page->pv_plane_wm);
  5036		enum pipe pipe = intel_crtc->pipe;
  5037	
  5038		memset(&tmp_plane_wm, 0, sizeof(struct pv_plane_wm_update));
  5039		tmp_plane_wm.max_wm_level = max_level;
  5040		for (level = 0; level <= max_level; level++) {
  5041			skl_pv_write_wm_level(&tmp_plane_wm.plane_wm_level[level],
  5042					      &wm->wm[level]);
  5043		}
  5044		skl_pv_write_wm_level(&tmp_plane_wm.plane_trans_wm_level,
  5045				      &wm->trans_wm);
  5046	
  5047		if (wm->is_planar) {
  5048			skl_pv_ddb_entry_write(&tmp_plane_wm.plane_buf_cfg,
  5049					       &ddb->uv_plane[pipe][plane_id]);
  5050		} else {
  5051			skl_pv_ddb_entry_write(&tmp_plane_wm.plane_buf_cfg,
  5052					       &ddb->plane[pipe][plane_id]);
  5053		}
  5054	
  5055		spin_lock(&dev_priv->shared_page_lock);
  5056		for (i = 0; i < sizeof(struct pv_plane_wm_update) / 4; i++)
  5057			writel(*((u32 *)(&tmp_plane_wm) + i), pv_plane_wm + i);
  5058		if (wm->is_planar)
  5059			skl_ddb_entry_write(dev_priv,
  5060					    PLANE_NV12_BUF_CFG(pipe, plane_id),
  5061					    &ddb->plane[pipe][plane_id]);
  5062		else
  5063			I915_WRITE(PLANE_NV12_BUF_CFG(pipe, plane_id), 0x0);
  5064		spin_unlock(&dev_priv->shared_page_lock);
  5065	}
  5066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
