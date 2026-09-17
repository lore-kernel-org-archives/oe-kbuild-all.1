Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC58142C510
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633856; cv=none; b=kA5ZDgxNRFyd/qirLLIVnIT2Hqw8gbv5bjJqec3ih+H0QpI6XHhMNmK3JzIS4pmfgdzPBtCnVKhvMgAPI5wFeGyBIyKTdR92fEjLrEV5C1bTTxapypbpqRoAovn+BkgC/tPG44gmr5n5ogdL8oYscE6yIboA8p0FiotXRzog3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633856; c=relaxed/simple;
	bh=h0RCxrEan65s1OxIq67Ds/QwTPbXrKxNOJHcwfg2Ejg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LLR1PXYBz/+KWk+ZlCXFTvL6YXftcgTmbKwrR+CvjQN4N3++XNPuh5F8TMCsLLktn0Usbgc79pSUjZ253kcYykdh+HURVk1gsA8VyBVYoTiVRoESUDvlr6RgGXRYAfQMS9EFhEXVisvROqR60TMp0bKREgtZ9M3rMgmEhlfTuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ls9zbol/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls9zbol/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789633844; x=1821169844;
  h=date:from:to:cc:subject:message-id;
  bh=h0RCxrEan65s1OxIq67Ds/QwTPbXrKxNOJHcwfg2Ejg=;
  b=ls9zbol/LFm5jEKbJ8sK9kkr0m7I6jA0j7m+qCGhxUlFb+8FEfFPRI1Z
   EYShG74h/yKeZU6xHmmNCUedxZAHMX/A7vQbnG1ct6EAbs+4HMcvOSOOH
   PSLR6BsQJ4Bc/BqrRb+Pnt9xrttZYeOlNVfCGbVordIlSCri87qZbUsv/
   waDecD8c6H2KNxYkRRcE0Xd2c5AIXBNYuiEYoYNaxs9GAgZfvrkBW8koQ
   RU33mOmNiOkwyzvL8pk1HnQOYM4zx4x5nFDBWrKNcNR9qIGQDY7mt6q4T
   BapdCOGbMe05LAFBgVdU47iV2iavk2pZF1cm2hVod9r0bcnLt9r57m+Aj
   g==;
X-CSE-ConnectionGUID: 6RH5jhVuQaK9l3ifkD7LXw==
X-CSE-MsgGUID: 6q7BRwJ/RmKkf8HO7IQUDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100630630"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100630630"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:30:37 -0700
X-CSE-ConnectionGUID: ej+Jjdh7QceVSuczF0mV4w==
X-CSE-MsgGUID: dMGBklQ3R+SuCQ7QxoutLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278875692"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 01:30:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x77Vp-000000007Oj-0Row;
	Thu, 17 Sep 2026 08:30:33 +0000
Date: Thu, 17 Sep 2026 16:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Yixun Lan <dlan@kernel.org>
Subject: [spacemit-com:wip/k3-pm-v2.2 26/34]
 drivers/gpu/drm/spacemit/spacemit_cmdlist.c:131:20: warning: variable
 'regs_in_row' set but not used
Message-ID: <202609171659.KWi2D3ZW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/spacemit-com/linux wip/k3-pm-v2.2
head:   5ea9c3b3027d262ccd72347a6874357174873fa0
commit: c26d1154f593a895582795a5ca198f4cd25e68b1 [26/34] drm/spacemit: add Saturn DPU DRM device driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260917/202609171659.KWi2D3ZW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171659.KWi2D3ZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171659.KWi2D3ZW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/spacemit/spacemit_cmdlist.c: In function 'cmdlist_regs_packing':
>> drivers/gpu/drm/spacemit/spacemit_cmdlist.c:131:20: warning: variable 'regs_in_row' set but not used [-Wunused-but-set-variable=]
     131 |                 u8 regs_in_row = 0;
         |                    ^~~~~~~~~~~


vim +/regs_in_row +131 drivers/gpu/drm/spacemit/spacemit_cmdlist.c

17f019205565e6 Cody Kang 2026-08-09   83  
17f019205565e6 Cody Kang 2026-08-09   84  void cmdlist_regs_packing(struct cmdlist *cl, enum cmdlist_mode_type mod,
17f019205565e6 Cody Kang 2026-08-09   85  			  struct cmdlist_regs *cl_regs)
17f019205565e6 Cody Kang 2026-08-09   86  {
17f019205565e6 Cody Kang 2026-08-09   87  	struct spacemit_crtc *a_crtc;
17f019205565e6 Cody Kang 2026-08-09   88  	struct spacemit_drm_private *priv;
17f019205565e6 Cody Kang 2026-08-09   89  	struct spacemit_hw_device *hwdev;
17f019205565e6 Cody Kang 2026-08-09   90  	u32 *reg_base;
17f019205565e6 Cody Kang 2026-08-09   91  	int i;
17f019205565e6 Cody Kang 2026-08-09   92  	u32 index;
17f019205565e6 Cody Kang 2026-08-09   93  
17f019205565e6 Cody Kang 2026-08-09   94  	if (!cl_regs)
17f019205565e6 Cody Kang 2026-08-09   95  		return;
17f019205565e6 Cody Kang 2026-08-09   96  
17f019205565e6 Cody Kang 2026-08-09   97  	if (cl->type == CMDLIST_PLANE) {
17f019205565e6 Cody Kang 2026-08-09   98  		struct spacemit_plane_state *spacemit_pstate =
17f019205565e6 Cody Kang 2026-08-09   99  				cl_to_spacemit_pstate(cl);
17f019205565e6 Cody Kang 2026-08-09  100  
17f019205565e6 Cody Kang 2026-08-09  101  		a_crtc = to_spacemit_crtc(spacemit_pstate->state.crtc);
17f019205565e6 Cody Kang 2026-08-09  102  
17f019205565e6 Cody Kang 2026-08-09  103  		drm_dbg(a_crtc->crtc.dev, "rch_id = %d, ch_y = %u\n",
17f019205565e6 Cody Kang 2026-08-09  104  			spacemit_pstate->rdma_id,
17f019205565e6 Cody Kang 2026-08-09  105  			spacemit_pstate->state.crtc_y);
17f019205565e6 Cody Kang 2026-08-09  106  	} else if (cl->type == CMDLIST_CRTC) {
17f019205565e6 Cody Kang 2026-08-09  107  		struct spacemit_crtc_state *spacemit_cstate =
17f019205565e6 Cody Kang 2026-08-09  108  				cl_to_spacemit_cstate(cl);
17f019205565e6 Cody Kang 2026-08-09  109  
17f019205565e6 Cody Kang 2026-08-09  110  		a_crtc = to_spacemit_crtc(spacemit_cstate->base.crtc);
17f019205565e6 Cody Kang 2026-08-09  111  	} else {
17f019205565e6 Cody Kang 2026-08-09  112  		WARN_ONCE(1, "unsupported cmdlist type %d\n", cl->type);
17f019205565e6 Cody Kang 2026-08-09  113  		return;
17f019205565e6 Cody Kang 2026-08-09  114  	}
17f019205565e6 Cody Kang 2026-08-09  115  
17f019205565e6 Cody Kang 2026-08-09  116  	priv = a_crtc->crtc.dev->dev_private;
17f019205565e6 Cody Kang 2026-08-09  117  	hwdev = priv->hwdev;
17f019205565e6 Cody Kang 2026-08-09  118  	reg_base = cl_regs->module;
17f019205565e6 Cody Kang 2026-08-09  119  
17f019205565e6 Cody Kang 2026-08-09  120  	cl->mode_mask |= mod;
17f019205565e6 Cody Kang 2026-08-09  121  
17f019205565e6 Cody Kang 2026-08-09  122  	/*
17f019205565e6 Cody Kang 2026-08-09  123  	 * Without the atomic_check() buffer the staged register writes vanish.
17f019205565e6 Cody Kang 2026-08-09  124  	 */
17f019205565e6 Cody Kang 2026-08-09  125  	if (drm_WARN_ON(a_crtc->crtc.dev, !cl->va))
17f019205565e6 Cody Kang 2026-08-09  126  		return;
17f019205565e6 Cody Kang 2026-08-09  127  
17f019205565e6 Cody Kang 2026-08-09  128  	for (i = 0; i < cl_regs->size;) {
17f019205565e6 Cody Kang 2026-08-09  129  		u32 value[CMDLIST_ROW_REGS] = {0x0};
17f019205565e6 Cody Kang 2026-08-09  130  		u32 offset, strobe = 0;
17f019205565e6 Cody Kang 2026-08-09 @131  		u8 regs_in_row = 0;
17f019205565e6 Cody Kang 2026-08-09  132  
17f019205565e6 Cody Kang 2026-08-09  133  		if (cl_regs->flags[i]) {
17f019205565e6 Cody Kang 2026-08-09  134  			offset = cl_regs->base + i * sizeof(u32);
17f019205565e6 Cody Kang 2026-08-09  135  			for (u8 j = 0; j < CMDLIST_ROW_REGS; j++) {
17f019205565e6 Cody Kang 2026-08-09  136  				index = i + j;
17f019205565e6 Cody Kang 2026-08-09  137  				if (likely(index < cl_regs->size)) {
17f019205565e6 Cody Kang 2026-08-09  138  					if (cl_regs->flags[index]) {
17f019205565e6 Cody Kang 2026-08-09  139  						value[j] = reg_base[index];
17f019205565e6 Cody Kang 2026-08-09  140  						regs_in_row++;
17f019205565e6 Cody Kang 2026-08-09  141  						strobe |= CMDLIST_REG_STROBE(j);
17f019205565e6 Cody Kang 2026-08-09  142  					}
17f019205565e6 Cody Kang 2026-08-09  143  				} else {
17f019205565e6 Cody Kang 2026-08-09  144  					break;
17f019205565e6 Cody Kang 2026-08-09  145  				}
17f019205565e6 Cody Kang 2026-08-09  146  			}
17f019205565e6 Cody Kang 2026-08-09  147  			hwdev->cmdlist_fill_data_row(cl, strobe, offset, value);
17f019205565e6 Cody Kang 2026-08-09  148  			/*
17f019205565e6 Cody Kang 2026-08-09  149  			 * the row covers the whole window; a shorter stride
17f019205565e6 Cody Kang 2026-08-09  150  			 * would revisit covered words as duplicate rows
17f019205565e6 Cody Kang 2026-08-09  151  			 */
17f019205565e6 Cody Kang 2026-08-09  152  			i += CMDLIST_ROW_REGS;
17f019205565e6 Cody Kang 2026-08-09  153  			cl->nod_len++;
17f019205565e6 Cody Kang 2026-08-09  154  		} else {
17f019205565e6 Cody Kang 2026-08-09  155  			i++;
17f019205565e6 Cody Kang 2026-08-09  156  		}
17f019205565e6 Cody Kang 2026-08-09  157  	}
17f019205565e6 Cody Kang 2026-08-09  158  
17f019205565e6 Cody Kang 2026-08-09  159  	drm_dbg(a_crtc->crtc.dev, "row_num = %d\n", cl->nod_len);
17f019205565e6 Cody Kang 2026-08-09  160  }
17f019205565e6 Cody Kang 2026-08-09  161  

:::::: The code at line 131 was first introduced by commit
:::::: 17f019205565e6d42c17962e5520ae6daa890946 drm/spacemit: add Saturn DPU core types, cmdlist and display MMU

:::::: TO: Cody Kang <codykang.hk@gmail.com>
:::::: CC: Yixun Lan <dlan@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
