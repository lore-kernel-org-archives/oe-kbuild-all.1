Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9238F88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXezILVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697759077; x=1729295077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jq3D1po5zahYlQJvSXGClNzZXS0SMfmW4UtR6Umm3MU=;
  b=lXezILVzWq30PZen4TQr5EzyDJDXcVMEo4MCrG2SJWOvMJIgNQgKGL/p
   ftyNZHmtgLM8IPZ2ecwXyqe62oywBiRyHchWBsIideRrZtR2JHdcYKaWH
   6mMwjsCj4crj99BQJA5V5pol4SMPJ63ZYXcm8Sen6BWwOzJmhQqijNYl3
   2qzDOBd/gYWao289P9HfeEJb1IdwlbAn407+PP4c0+NcXUSBjWImEKLok
   DHrZNG7y2YsTCmR6xcZu6zgVCUImamnYj2D5LTU4Bf8lMSEFviDW6uLQh
   JdalLm2/QTZazPSWKortF3DReSQHj3whBNGWeg41A+zqBzp2UqUymbgLX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="450617370"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="450617370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 16:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827534960"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="827534960"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2023 16:44:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtcgq-0002ig-35;
	Thu, 19 Oct 2023 23:44:32 +0000
Date: Fri, 20 Oct 2023 07:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 07/16] drm/mediatek: aal: Use bitfield macros
Message-ID: <202310200732.gAEt1QI3-lkp@intel.com>
References: <20231012095736.100784-8-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012095736.100784-8-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.6-rc6 next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20231017-104553
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231012095736.100784-8-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v11 07/16] drm/mediatek: aal: Use bitfield macros
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200732.gAEt1QI3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200732.gAEt1QI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200732.gAEt1QI3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_aal.c: In function 'mtk_aal_config':
>> drivers/gpu/drm/mediatek/mtk_disp_aal.c:58:14: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      58 |         sz = FIELD_PREP(DISP_AAL_SIZE_HSIZE, w);
         |              ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +58 drivers/gpu/drm/mediatek/mtk_disp_aal.c

    50	
    51	void mtk_aal_config(struct device *dev, unsigned int w,
    52				   unsigned int h, unsigned int vrefresh,
    53				   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
    54	{
    55		struct mtk_disp_aal *aal = dev_get_drvdata(dev);
    56		u32 sz;
    57	
  > 58		sz = FIELD_PREP(DISP_AAL_SIZE_HSIZE, w);
    59		sz |= FIELD_PREP(DISP_AAL_SIZE_VSIZE, h);
    60	
    61		mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
    62		mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
