Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A085395
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687161080; x=1718697080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4fmB3L9G2VGIbqEFe4Gha9ngKtjxCb93FwgS+NzLYjs=;
  b=eK8URXQgn/3bKAxGUcl4iU+Ho2PDUbxv6GbWkA+5IVIMIQvVGE2SHyce
   Gvh+pEvhxq14bxQP0MHG8eAuwA+zaWHkaNIXGYqhwMwXElsmFuHpLaAOp
   qq8sMh+/kzp1lx14LLpGjXBI5Fkh4p4chJJGPZQlgys+tR59cqnhRrUx/
   8+djJ9rM0AqUfE2PDJ1NXGerwNEMxzI3y/HS+LBJZEyqpyGpKo3OlCgrf
   o0hmmWc15NtJ5BNDFBYRDuEMumt1v1zaLzt4uiAZbqtbmFr9xgBgkms7h
   Cishle8puSdZrYbW/qaX4qkWpGvbNAY+CDNqDuRZs1ohHq9WMLvCiXEj4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="357054760"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="357054760"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 00:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="707802785"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="707802785"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Jun 2023 00:51:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB9fR-0004XD-0C;
	Mon, 19 Jun 2023 07:51:17 +0000
Date: Mon, 19 Jun 2023 15:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 29/34]
 drivers/gpu/drm/i915/intel_device_info.c:291:61: warning: format specifies
 type 'unsigned int' but the argument has type 'u8 *' (aka 'unsigned char *')
Message-ID: <202306191549.lNMsHerv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   c6b7f293d5463f0343d6f47b54d31698e1736945
commit: 767336b68f8a3096aa690b9799357245895a8ea8 [29/34] BACKPORT: drm/i915: store all subslice masks
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230619/202306191549.lNMsHerv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191549.lNMsHerv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191549.lNMsHerv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_device_info.c:291:61: warning: format specifies type 'unsigned int' but the argument has type 'u8 *' (aka 'unsigned char *') [-Wformat]
           DRM_DEBUG_DRIVER("fuse2=0x%x subslice_mask=0x%x\n", fuse2, sseu->subslice_mask);
                                                        ~~            ^~~~~~~~~~~~~~~~~~~
                                                        %s
   include/drm/drm_print.h:396:32: note: expanded from macro 'DRM_DEBUG_DRIVER'
           drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
                                  ~~~    ^~~~~~~~~~~
   1 warning generated.
--
>> drivers/gpu/drm/i915/intel_engine_cs.c:1014:17: error: incompatible pointer to integer conversion passing 'const u8[7]' (aka 'const unsigned char[7]') to parameter of type 'int' [-Wint-conversion]
           subslice = ffs(sseu->subslice_mask);
                          ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bitops.h:413:36: note: passing argument to parameter 'x' here
   static __always_inline int ffs(int x)
                                      ^
   1 error generated.


vim +291 drivers/gpu/drm/i915/intel_device_info.c

94b4f3ba483ace Chris Wilson                2016-07-05  267  
94b4f3ba483ace Chris Wilson                2016-07-05  268  static void gen9_sseu_info_init(struct drm_i915_private *dev_priv)
94b4f3ba483ace Chris Wilson                2016-07-05  269  {
94b4f3ba483ace Chris Wilson                2016-07-05  270  	struct intel_device_info *info = mkwrite_device_info(dev_priv);
43b6799814ca1f Imre Deak                   2016-08-31  271  	struct sseu_dev_info *sseu = &info->sseu;
94b4f3ba483ace Chris Wilson                2016-07-05  272  	int s, ss;
767336b68f8a30 Lionel Landwerlin           2018-03-06  273  	u32 fuse2, eu_disable, subslice_mask;
767336b68f8a30 Lionel Landwerlin           2018-03-06  274  	const u8 eu_mask = 0xff;
94b4f3ba483ace Chris Wilson                2016-07-05  275  
94b4f3ba483ace Chris Wilson                2016-07-05  276  	fuse2 = I915_READ(GEN8_FUSE2);
f08a0c9234c86c Imre Deak                   2016-08-31  277  	sseu->slice_mask = (fuse2 & GEN8_F2_S_ENA_MASK) >> GEN8_F2_S_ENA_SHIFT;
94b4f3ba483ace Chris Wilson                2016-07-05  278  
767336b68f8a30 Lionel Landwerlin           2018-03-06  279  	/* BXT has a single slice and at most 3 subslices. */
767336b68f8a30 Lionel Landwerlin           2018-03-06  280  	sseu->max_slices = IS_GEN9_LP(dev_priv) ? 1 : 3;
767336b68f8a30 Lionel Landwerlin           2018-03-06  281  	sseu->max_subslices = IS_GEN9_LP(dev_priv) ? 3 : 4;
767336b68f8a30 Lionel Landwerlin           2018-03-06  282  	sseu->max_eus_per_subslice = 8;
767336b68f8a30 Lionel Landwerlin           2018-03-06  283  
94b4f3ba483ace Chris Wilson                2016-07-05  284  	/*
94b4f3ba483ace Chris Wilson                2016-07-05  285  	 * The subslice disable field is global, i.e. it applies
94b4f3ba483ace Chris Wilson                2016-07-05  286  	 * to each of the enabled slices.
94b4f3ba483ace Chris Wilson                2016-07-05  287  	*/
767336b68f8a30 Lionel Landwerlin           2018-03-06  288  	subslice_mask = (1 << sseu->max_subslices) - 1;
767336b68f8a30 Lionel Landwerlin           2018-03-06  289  	subslice_mask &= ~((fuse2 & GEN9_F2_SS_DIS_MASK) >>
57ec171eae21ee Imre Deak                   2016-08-31  290  			   GEN9_F2_SS_DIS_SHIFT);
7e8b7b831eef88 Cooper Chiou                2021-01-28 @291  	DRM_DEBUG_DRIVER("fuse2=0x%x subslice_mask=0x%x\n", fuse2, sseu->subslice_mask);
94b4f3ba483ace Chris Wilson                2016-07-05  292  
94b4f3ba483ace Chris Wilson                2016-07-05  293  	/*
94b4f3ba483ace Chris Wilson                2016-07-05  294  	 * Iterate through enabled slices and subslices to
94b4f3ba483ace Chris Wilson                2016-07-05  295  	 * count the total enabled EU.
94b4f3ba483ace Chris Wilson                2016-07-05  296  	*/
767336b68f8a30 Lionel Landwerlin           2018-03-06  297  	for (s = 0; s < sseu->max_slices; s++) {
f08a0c9234c86c Imre Deak                   2016-08-31  298  		if (!(sseu->slice_mask & BIT(s)))
94b4f3ba483ace Chris Wilson                2016-07-05  299  			/* skip disabled slice */
94b4f3ba483ace Chris Wilson                2016-07-05  300  			continue;
94b4f3ba483ace Chris Wilson                2016-07-05  301  
767336b68f8a30 Lionel Landwerlin           2018-03-06  302  		sseu->subslice_mask[s] = subslice_mask;
767336b68f8a30 Lionel Landwerlin           2018-03-06  303  
94b4f3ba483ace Chris Wilson                2016-07-05  304  		eu_disable = I915_READ(GEN9_EU_DISABLE(s));
767336b68f8a30 Lionel Landwerlin           2018-03-06  305  		for (ss = 0; ss < sseu->max_subslices; ss++) {
94b4f3ba483ace Chris Wilson                2016-07-05  306  			int eu_per_ss;
767336b68f8a30 Lionel Landwerlin           2018-03-06  307  			u8 eu_disabled_mask;
94b4f3ba483ace Chris Wilson                2016-07-05  308  
767336b68f8a30 Lionel Landwerlin           2018-03-06  309  			if (!(sseu->subslice_mask[s] & BIT(ss)))
94b4f3ba483ace Chris Wilson                2016-07-05  310  				/* skip disabled subslice */
94b4f3ba483ace Chris Wilson                2016-07-05  311  				continue;
94b4f3ba483ace Chris Wilson                2016-07-05  312  
767336b68f8a30 Lionel Landwerlin           2018-03-06  313  			eu_disabled_mask = (eu_disable >> (ss*8)) & eu_mask;
767336b68f8a30 Lionel Landwerlin           2018-03-06  314  
767336b68f8a30 Lionel Landwerlin           2018-03-06  315  			sseu_set_eus(sseu, s, ss, ~eu_disabled_mask);
767336b68f8a30 Lionel Landwerlin           2018-03-06  316  
767336b68f8a30 Lionel Landwerlin           2018-03-06  317  			eu_per_ss = sseu->max_eus_per_subslice -
767336b68f8a30 Lionel Landwerlin           2018-03-06  318  				hweight8(eu_disabled_mask);
94b4f3ba483ace Chris Wilson                2016-07-05  319  
94b4f3ba483ace Chris Wilson                2016-07-05  320  			/*
94b4f3ba483ace Chris Wilson                2016-07-05  321  			 * Record which subslice(s) has(have) 7 EUs. we
94b4f3ba483ace Chris Wilson                2016-07-05  322  			 * can tune the hash used to spread work among
94b4f3ba483ace Chris Wilson                2016-07-05  323  			 * subslices if they are unbalanced.
94b4f3ba483ace Chris Wilson                2016-07-05  324  			 */
94b4f3ba483ace Chris Wilson                2016-07-05  325  			if (eu_per_ss == 7)
43b6799814ca1f Imre Deak                   2016-08-31  326  				sseu->subslice_7eu[s] |= BIT(ss);
94b4f3ba483ace Chris Wilson                2016-07-05  327  		}
94b4f3ba483ace Chris Wilson                2016-07-05  328  	}
94b4f3ba483ace Chris Wilson                2016-07-05  329  
767336b68f8a30 Lionel Landwerlin           2018-03-06  330  	sseu->eu_total = compute_eu_total(sseu);
767336b68f8a30 Lionel Landwerlin           2018-03-06  331  
94b4f3ba483ace Chris Wilson                2016-07-05  332  	/*
94b4f3ba483ace Chris Wilson                2016-07-05  333  	 * SKL is expected to always have a uniform distribution
94b4f3ba483ace Chris Wilson                2016-07-05  334  	 * of EU across subslices with the exception that any one
94b4f3ba483ace Chris Wilson                2016-07-05  335  	 * EU in any one subslice may be fused off for die
94b4f3ba483ace Chris Wilson                2016-07-05  336  	 * recovery. BXT is expected to be perfectly uniform in EU
94b4f3ba483ace Chris Wilson                2016-07-05  337  	 * distribution.
94b4f3ba483ace Chris Wilson                2016-07-05  338  	*/
57ec171eae21ee Imre Deak                   2016-08-31  339  	sseu->eu_per_subslice = sseu_subslice_total(sseu) ?
43b6799814ca1f Imre Deak                   2016-08-31  340  				DIV_ROUND_UP(sseu->eu_total,
57ec171eae21ee Imre Deak                   2016-08-31  341  					     sseu_subslice_total(sseu)) : 0;
94b4f3ba483ace Chris Wilson                2016-07-05  342  	/*
c7ae7e9ab2078e Rodrigo Vivi                2017-06-06  343  	 * SKL+ supports slice power gating on devices with more than
94b4f3ba483ace Chris Wilson                2016-07-05  344  	 * one slice, and supports EU power gating on devices with
c7ae7e9ab2078e Rodrigo Vivi                2017-06-06  345  	 * more than one EU pair per subslice. BXT+ supports subslice
94b4f3ba483ace Chris Wilson                2016-07-05  346  	 * power gating on devices with more than one subslice, and
94b4f3ba483ace Chris Wilson                2016-07-05  347  	 * supports EU power gating on devices with more than one EU
94b4f3ba483ace Chris Wilson                2016-07-05  348  	 * pair per subslice.
94b4f3ba483ace Chris Wilson                2016-07-05  349  	*/
43b6799814ca1f Imre Deak                   2016-08-31  350  	sseu->has_slice_pg =
c7ae7e9ab2078e Rodrigo Vivi                2017-06-06  351  		!IS_GEN9_LP(dev_priv) && hweight8(sseu->slice_mask) > 1;
43b6799814ca1f Imre Deak                   2016-08-31  352  	sseu->has_subslice_pg =
254e0931f5b981 Michel Thierry              2017-01-09  353  		IS_GEN9_LP(dev_priv) && sseu_subslice_total(sseu) > 1;
43b6799814ca1f Imre Deak                   2016-08-31  354  	sseu->has_eu_pg = sseu->eu_per_subslice > 2;
94b4f3ba483ace Chris Wilson                2016-07-05  355  
234516afbba56c Ander Conselvan de Oliveira 2017-03-17  356  	if (IS_GEN9_LP(dev_priv)) {
767336b68f8a30 Lionel Landwerlin           2018-03-06  357  #define IS_SS_DISABLED(ss)	(!(sseu->subslice_mask[0] & BIT(ss)))
767336b68f8a30 Lionel Landwerlin           2018-03-06  358  		info->has_pooled_eu = hweight8(sseu->subslice_mask[0]) == 3;
234516afbba56c Ander Conselvan de Oliveira 2017-03-17  359  
43b6799814ca1f Imre Deak                   2016-08-31  360  		sseu->min_eu_in_pool = 0;
94b4f3ba483ace Chris Wilson                2016-07-05  361  		if (info->has_pooled_eu) {
57ec171eae21ee Imre Deak                   2016-08-31  362  			if (IS_SS_DISABLED(2) || IS_SS_DISABLED(0))
43b6799814ca1f Imre Deak                   2016-08-31  363  				sseu->min_eu_in_pool = 3;
57ec171eae21ee Imre Deak                   2016-08-31  364  			else if (IS_SS_DISABLED(1))
43b6799814ca1f Imre Deak                   2016-08-31  365  				sseu->min_eu_in_pool = 6;
94b4f3ba483ace Chris Wilson                2016-07-05  366  			else
43b6799814ca1f Imre Deak                   2016-08-31  367  				sseu->min_eu_in_pool = 9;
94b4f3ba483ace Chris Wilson                2016-07-05  368  		}
94b4f3ba483ace Chris Wilson                2016-07-05  369  #undef IS_SS_DISABLED
94b4f3ba483ace Chris Wilson                2016-07-05  370  	}
94b4f3ba483ace Chris Wilson                2016-07-05  371  }
94b4f3ba483ace Chris Wilson                2016-07-05  372  

:::::: The code at line 291 was first introduced by commit
:::::: 7e8b7b831eef8845968681254854d4423d47acb4 BACKPORT: FROMLIST: drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9

:::::: TO: Cooper Chiou <cooper.chiou@intel.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
