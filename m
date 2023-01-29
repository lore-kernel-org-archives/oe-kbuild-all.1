Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B118617F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674991869; x=1706527869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=941qYSAT8AewHuWw7L2KMhlt7LAztpslaoA8f27sugc=;
  b=JBaUVilcoqyxr6llsoVN0XIhUqn0GRLQfG0rOD8PnO6e4cs71R8b9Qo7
   GLxUcKA2LNTBsGwEDBOB5ke0jX9J7G+HUC4d4rLUbJj5mpxiyespirlsD
   qUVYf4M2QK9flcXseb+/s7dQ6Zzyhw1sCxrGquy+CleqoDCThQnwseh+b
   d7sTFVJJryNJSOrBMUgLZBEBM+f/tpkocvIGkbXUTOvXDXw5/y7tZX6Ji
   nSSE0LBXmBt+M/FYuEjePHoil97lu97Rn3Yx00lrNNDDvjZih0oAno0+L
   3NST7EZuQLzPuF3SqVaKqD8VSHuKWG0JjCRDpbpB37sOVGca8dYvX9NyP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315346485"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="315346485"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 03:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909174613"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="909174613"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jan 2023 03:31:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM5tp-0002lG-0S;
	Sun, 29 Jan 2023 11:31:05 +0000
Date: Sun, 29 Jan 2023 19:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Green <greenjustin@chromium.org>,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chunkuang.hu@kernel.org,
	greenjustin@chromium.org, airlied@linux.ie,
	jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
	wenst@chromium.org, matthias.bgg@gmail.com,
	Justin Green <greenjustin@google.com>,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
Message-ID: <202301291906.Az5NHf9w-lkp@intel.com>
References: <20230127230123.941930-1-greenjustin@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127230123.941930-1-greenjustin@google.com>

Hi Justin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Green/drm-mediatek-Add-support-for-AR30-and-BA30/20230128-112134
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230127230123.941930-1-greenjustin%40google.com
patch subject: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291906.Az5NHf9w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c32525cf66e7bbf4e798aef3aafbf88dee5d049c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Justin-Green/drm-mediatek-Add-support-for-AR30-and-BA30/20230128-112134
        git checkout c32525cf66e7bbf4e798aef3aafbf88dee5d049c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/mediatek/ sound/soc/samsung/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_drm_crtc.h:10,
                    from drivers/gpu/drm/mediatek/mtk_disp_aal.c:15:
   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h: In function 'mtk_ddp_comp_supports_10bit':
>> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h:159:35: warning: returning 'int (*)(struct device *)' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     159 |                 return comp->funcs->supports_10bit;
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~


vim +159 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h

   154	
   155	static inline
   156	int mtk_ddp_comp_supports_10bit(struct mtk_ddp_comp *comp)
   157	{
   158		if (comp->funcs && comp->funcs->supports_10bit)
 > 159			return comp->funcs->supports_10bit;
   160	
   161	        return 0;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
