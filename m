Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA713632B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732287586; cv=none; b=WbZbGi/XbGWD5G+W14PRf3SkwfpXabwR2rZZMIafdF9HFbUZ/Kbj/srdGLtax4mCo05hfDuHG6eAdmGMdn3W341l7WMsc5fE0DkSLqbF+pSfYLC9HF2JC+WblCbN2U7heaw4DLHlbL78mNLivDgGQ2hcN8oFwIu/Q66LGGbL1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732287586; c=relaxed/simple;
	bh=GkCbSmjhBBgXZcXWF7U1crMu95bSOWEu0XweMi7WfYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tht29HPqM+onhgc/K7ZAs7j3anmD9Nf6BkbDCbnnRXymrztAApZ2SBAC2NmzLA4INmn+G6TUcoPbhe6xaWub6foi6U9nRxiW8h9QnZxlFosZfJTAKus3x+8gIrzyKpLLUXQqgiq7rU+5vyqk67SgjxQqCSo8UKCE7X5GNgGGZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjNAW22n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjNAW22n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732287585; x=1763823585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GkCbSmjhBBgXZcXWF7U1crMu95bSOWEu0XweMi7WfYI=;
  b=TjNAW22nvKLwOS7m4PH6GhdaRGtLnvWBtZ3mfdP+9rZd1alr7FbL8jEz
   ygtPNofO1IIWFK/hPKIZ8PZuM6f0toTKidcXpYJk8IV9KFlrwumEMzBbu
   pJsdnseMQ38tizGPtO2DHKJvbeoGOfveTDSoXyizSAHVJZ1DthGINskfp
   IsGtW/cA7NIq5xBlmXazIQwdJHdBgWiaTlg9IXxprxNFw6IQK/Zym9Wt1
   PhJhWfXamUHc8uhKVqMqsxr8d0BLQnnNuD7ECcENcWJ3bc9Ki2GeftbXh
   Q9NVc9NQD8hmeAJ1C/PzZtFn/ZsrWxN8b44fWeY7r62qbrAqAb3aVXH3n
   w==;
X-CSE-ConnectionGUID: liXF/OhCSZW+A6AZWx9+rQ==
X-CSE-MsgGUID: Ok0Dpbi/Qzabd2kBudJ1EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31803414"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="31803414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:59:45 -0800
X-CSE-ConnectionGUID: X/vZvrrqSM6nIRO9u/AdxQ==
X-CSE-MsgGUID: SNnfAXWDTluSkmRUnCgJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95544425"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 06:59:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEV8D-000401-19;
	Fri, 22 Nov 2024 14:59:37 +0000
Date: Fri, 22 Nov 2024 22:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 3/7] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
Message-ID: <202411222245.WS9U5m9I-lkp@intel.com>
References: <20241120124512.134278-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-4-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on pza/reset/next linus/master drm-misc/drm-misc-next v6.12 next-20241122]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-Add-binding-for-HDMIv2-DDC/20241121-132321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241120124512.134278-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 3/7] drm/mediatek: mtk_cec: Switch to register as module_platform_driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241122/202411222245.WS9U5m9I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411222245.WS9U5m9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411222245.WS9U5m9I-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/gpu/drm/mediatek/mtk_hdmi.o: in function `mtk_hdmitx_init':
>> drivers/gpu/drm/mediatek/mtk_hdmi.c:1812: multiple definition of `init_module'; drivers/gpu/drm/mediatek/mtk_cec.o:drivers/gpu/drm/mediatek/mtk_cec.c:249: first defined here
   aarch64-linux-ld: drivers/gpu/drm/mediatek/mtk_hdmi.o: in function `mtk_hdmitx_exit':
>> drivers/gpu/drm/mediatek/mtk_hdmi.c:1818: multiple definition of `cleanup_module'; drivers/gpu/drm/mediatek/mtk_cec.o:drivers/gpu/drm/mediatek/mtk_cec.c:249: first defined here


vim +1812 drivers/gpu/drm/mediatek/mtk_hdmi.c

8f83f26891e125 Jie Qiu       2016-01-04  1810  
8f83f26891e125 Jie Qiu       2016-01-04  1811  static int __init mtk_hdmitx_init(void)
8f83f26891e125 Jie Qiu       2016-01-04 @1812  {
446b8c542f8551 Philipp Zabel 2017-03-17  1813  	return platform_register_drivers(mtk_hdmi_drivers,
446b8c542f8551 Philipp Zabel 2017-03-17  1814  					 ARRAY_SIZE(mtk_hdmi_drivers));
8f83f26891e125 Jie Qiu       2016-01-04  1815  }
8f83f26891e125 Jie Qiu       2016-01-04  1816  
8f83f26891e125 Jie Qiu       2016-01-04  1817  static void __exit mtk_hdmitx_exit(void)
8f83f26891e125 Jie Qiu       2016-01-04 @1818  {
446b8c542f8551 Philipp Zabel 2017-03-17  1819  	platform_unregister_drivers(mtk_hdmi_drivers,
446b8c542f8551 Philipp Zabel 2017-03-17  1820  				    ARRAY_SIZE(mtk_hdmi_drivers));
8f83f26891e125 Jie Qiu       2016-01-04  1821  }
8f83f26891e125 Jie Qiu       2016-01-04  1822  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
