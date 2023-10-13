Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498D3D026
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2UMH/8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697201305; x=1728737305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o60+COZma8TeT2EpeOij8I3evH4uZFQtT4ewUOYUpfI=;
  b=I2UMH/8uav4DIG8h3I+E0GpzYnRzA8nDAEVUuZeQPFR2LqS+lRiJuq0D
   3NF8rD9kd7xSjfYNZIMXSXZbO++buaSwBn8nzbfplQ9yKCV8r+ljIy03s
   5TlmsoCa26TuBTywEIkGXCPhM4RLiTLSymwPmMC++jEa4ATqNhxrVsux5
   mUs8+GQrHirt2si1KpsefHV7TlS8lBJgSZBiVxcvTcA59Dj4lUJeRvkkJ
   YoAYKw+6YhbhSTZxXHp1tnf+Z8UFgIFxefGiNEU2o2ApQ89rgE4lM5mCE
   2szdt2xYIzGKIqFf6N7kVf6ciwGy/5/RUJwwycTvKB6uLW0RHLjQ47UxI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384036302"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="384036302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898547173"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="898547173"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 05:46:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrHaN-0004mH-1z;
	Fri, 13 Oct 2023 12:48:11 +0000
Date: Fri, 13 Oct 2023 20:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, frank.binns@imgtec.com,
	donald.robson@imgtec.com, boris.brezillon@collabora.com,
	faith.ekstrand@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, afd@ti.com, hns@goldelico.com,
	matthew.brost@intel.com, christian.koenig@amd.com,
	luben.tuikov@amd.com, dakr@redhat.com, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH v7 11/20] drm/imagination: Add GEM and VM related code
Message-ID: <202310132017.sS9EaOVp-lkp@intel.com>
References: <20231010133738.35274-12-sarah.walker@imgtec.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010133738.35274-12-sarah.walker@imgtec.com>

Hi Sarah,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20231012]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarah-Walker/sizes-h-Add-entries-between-SZ_32G-and-SZ_64T/20231010-221057
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231010133738.35274-12-sarah.walker%40imgtec.com
patch subject: [PATCH v7 11/20] drm/imagination: Add GEM and VM related code
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310132017.sS9EaOVp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132017.sS9EaOVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132017.sS9EaOVp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imagination/pvr_mmu.c:9:
>> drivers/gpu/drm/imagination/pvr_rogue_fwif.h:56:52: warning: 'rogue_fwif_log_group_name_value_map' defined but not used [-Wunused-const-variable=]
      56 | static const struct rogue_fwif_log_group_map_entry rogue_fwif_log_group_name_value_map[] = {
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/imagination/pvr_mmu.c:1331: warning: Incorrect use of kernel-doc format:          * @curr_page - A reference to a single physical page as indexed by
>> drivers/gpu/drm/imagination/pvr_mmu.c:1345: warning: Function parameter or member 'curr_page' not described in 'pvr_mmu_op_context'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1744: warning: Function parameter or member 'ctx' not described in 'pvr_mmu_get_root_table_dma_addr'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1744: warning: Excess function parameter 'root' description in 'pvr_mmu_get_root_table_dma_addr'
>> drivers/gpu/drm/imagination/pvr_mmu.c:2156: warning: Excess function parameter 'ptr' description in 'pvr_page_destroy'


vim +/rogue_fwif_log_group_name_value_map +56 drivers/gpu/drm/imagination/pvr_rogue_fwif.h

b4ef9acd8e065c Sarah Walker 2023-10-10  51  
b4ef9acd8e065c Sarah Walker 2023-10-10  52  /*
b4ef9acd8e065c Sarah Walker 2023-10-10  53   * Macro for use with the ROGUE_FWIF_LOG_GROUP_MAP_ENTRY type to create a lookup
b4ef9acd8e065c Sarah Walker 2023-10-10  54   * table where needed. Keep log group names short, no more than 20 chars.
b4ef9acd8e065c Sarah Walker 2023-10-10  55   */
b4ef9acd8e065c Sarah Walker 2023-10-10 @56  static const struct rogue_fwif_log_group_map_entry rogue_fwif_log_group_name_value_map[] = {
b4ef9acd8e065c Sarah Walker 2023-10-10  57  	{"none", ROGUE_FWIF_LOG_TYPE_NONE},
b4ef9acd8e065c Sarah Walker 2023-10-10  58  	{"main", ROGUE_FWIF_LOG_TYPE_GROUP_MAIN},
b4ef9acd8e065c Sarah Walker 2023-10-10  59  	{"mts", ROGUE_FWIF_LOG_TYPE_GROUP_MTS},
b4ef9acd8e065c Sarah Walker 2023-10-10  60  	{"cleanup", ROGUE_FWIF_LOG_TYPE_GROUP_CLEANUP},
b4ef9acd8e065c Sarah Walker 2023-10-10  61  	{"csw", ROGUE_FWIF_LOG_TYPE_GROUP_CSW},
b4ef9acd8e065c Sarah Walker 2023-10-10  62  	{"bif", ROGUE_FWIF_LOG_TYPE_GROUP_BIF},
b4ef9acd8e065c Sarah Walker 2023-10-10  63  	{"pm", ROGUE_FWIF_LOG_TYPE_GROUP_PM},
b4ef9acd8e065c Sarah Walker 2023-10-10  64  	{"rtd", ROGUE_FWIF_LOG_TYPE_GROUP_RTD},
b4ef9acd8e065c Sarah Walker 2023-10-10  65  	{"spm", ROGUE_FWIF_LOG_TYPE_GROUP_SPM},
b4ef9acd8e065c Sarah Walker 2023-10-10  66  	{"pow", ROGUE_FWIF_LOG_TYPE_GROUP_POW},
b4ef9acd8e065c Sarah Walker 2023-10-10  67  	{"hwr", ROGUE_FWIF_LOG_TYPE_GROUP_HWR},
b4ef9acd8e065c Sarah Walker 2023-10-10  68  	{"hwp", ROGUE_FWIF_LOG_TYPE_GROUP_HWP},
b4ef9acd8e065c Sarah Walker 2023-10-10  69  	{"rpm", ROGUE_FWIF_LOG_TYPE_GROUP_RPM},
b4ef9acd8e065c Sarah Walker 2023-10-10  70  	{"dma", ROGUE_FWIF_LOG_TYPE_GROUP_DMA},
b4ef9acd8e065c Sarah Walker 2023-10-10  71  	{"misc", ROGUE_FWIF_LOG_TYPE_GROUP_MISC},
b4ef9acd8e065c Sarah Walker 2023-10-10  72  	{"debug", ROGUE_FWIF_LOG_TYPE_GROUP_DEBUG}
b4ef9acd8e065c Sarah Walker 2023-10-10  73  };
b4ef9acd8e065c Sarah Walker 2023-10-10  74  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
