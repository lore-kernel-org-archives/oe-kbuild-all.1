Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE119EC7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 05:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmN6s40c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697866131; x=1729402131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xc7hmmey9IOAnAb6Zjw4GcicvoddLDrEt4638oxWDnI=;
  b=DmN6s40cw14nMAD2YYSqarFjQSVmjmb2Q5RX5i1p1W/H0G6CnS14VMyO
   H2ymlNU5G8QyjaY4Y45do6xD2/1d/swRstM/v+vF8171a+JnpEP76kF7E
   hUbaBMfp18QnQOKOOfEKsqblaDcnpc4l11HEziFMFcSsZb+DAt9AZPW70
   X3R8d0XVO0JEIQFMkYQOXUeVFWc1ibdHe73Si0JyxEfLomw3p5fQeLVNp
   ZZst0oZ2AfSur0hwuaYhDpw8kiPi5iQZasc/u+kY/YVr1CtEsVdtz9FCE
   0W8JGWiIbb32YyFvn9vjXBq/YcIufQro+Uw3h8ZQQBNNXvPcdjqufpsyD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389463659"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="389463659"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 22:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="734159918"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="734159918"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2023 22:28:50 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu4XY-0004SQ-07;
	Sat, 21 Oct 2023 05:28:48 +0000
Date: Sat, 21 Oct 2023 13:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 PATCH] vdpa_sim: implement .reset_map support
Message-ID: <202310211338.XNy1u6hu-lkp@intel.com>
References: <1697605893-30313-1-git-send-email-si-wei.liu@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1697605893-30313-1-git-send-email-si-wei.liu@oracle.com>

Hi Si-Wei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Si-Wei-Liu/vdpa_sim-implement-reset_map-support/20231018-131559
base:   linus/master
patch link:    https://lore.kernel.org/r/1697605893-30313-1-git-send-email-si-wei.liu%40oracle.com
patch subject: [RFC v2 PATCH] vdpa_sim: implement .reset_map support
config: x86_64-randconfig-072-20231021 (https://download.01.org/0day-ci/archive/20231021/202310211338.XNy1u6hu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211338.XNy1u6hu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211338.XNy1u6hu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vdpa/vdpa_sim/vdpa_sim.c:778:10: error: 'const struct vdpa_config_ops' has no member named 'reset_map'; did you mean 'set_map'?
     778 |         .reset_map              = vdpasim_reset_map,
         |          ^~~~~~~~~
         |          set_map
>> drivers/vdpa/vdpa_sim/vdpa_sim.c:778:35: error: initialization of 'int (*)(struct vdpa_device *, unsigned int,  unsigned int)' from incompatible pointer type 'int (*)(struct vdpa_device *, unsigned int)' [-Werror=incompatible-pointer-types]
     778 |         .reset_map              = vdpasim_reset_map,
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_sim/vdpa_sim.c:778:35: note: (near initialization for 'vdpasim_config_ops.set_group_asid')
   drivers/vdpa/vdpa_sim/vdpa_sim.c:778:35: warning: initialized field overwritten [-Woverride-init]
   drivers/vdpa/vdpa_sim/vdpa_sim.c:778:35: note: (near initialization for 'vdpasim_config_ops.set_group_asid')
   drivers/vdpa/vdpa_sim/vdpa_sim.c:816:10: error: 'const struct vdpa_config_ops' has no member named 'reset_map'; did you mean 'set_map'?
     816 |         .reset_map              = vdpasim_reset_map,
         |          ^~~~~~~~~
         |          set_map
>> drivers/vdpa/vdpa_sim/vdpa_sim.c:816:35: error: initialization of 'int (*)(struct vdpa_device *, unsigned int,  u64,  u64,  u64,  u32,  void *)' {aka 'int (*)(struct vdpa_device *, unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  unsigned int,  void *)'} from incompatible pointer type 'int (*)(struct vdpa_device *, unsigned int)' [-Werror=incompatible-pointer-types]
     816 |         .reset_map              = vdpasim_reset_map,
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_sim/vdpa_sim.c:816:35: note: (near initialization for 'vdpasim_batch_config_ops.dma_map')
   cc1: some warnings being treated as errors


vim +778 drivers/vdpa/vdpa_sim/vdpa_sim.c

   744	
   745	static const struct vdpa_config_ops vdpasim_config_ops = {
   746		.set_vq_address         = vdpasim_set_vq_address,
   747		.set_vq_num             = vdpasim_set_vq_num,
   748		.kick_vq                = vdpasim_kick_vq,
   749		.set_vq_cb              = vdpasim_set_vq_cb,
   750		.set_vq_ready           = vdpasim_set_vq_ready,
   751		.get_vq_ready           = vdpasim_get_vq_ready,
   752		.set_vq_state           = vdpasim_set_vq_state,
   753		.get_vendor_vq_stats    = vdpasim_get_vq_stats,
   754		.get_vq_state           = vdpasim_get_vq_state,
   755		.get_vq_align           = vdpasim_get_vq_align,
   756		.get_vq_group           = vdpasim_get_vq_group,
   757		.get_device_features    = vdpasim_get_device_features,
   758		.get_backend_features   = vdpasim_get_backend_features,
   759		.set_driver_features    = vdpasim_set_driver_features,
   760		.get_driver_features    = vdpasim_get_driver_features,
   761		.set_config_cb          = vdpasim_set_config_cb,
   762		.get_vq_num_max         = vdpasim_get_vq_num_max,
   763		.get_device_id          = vdpasim_get_device_id,
   764		.get_vendor_id          = vdpasim_get_vendor_id,
   765		.get_status             = vdpasim_get_status,
   766		.set_status             = vdpasim_set_status,
   767		.reset			= vdpasim_reset,
   768		.suspend		= vdpasim_suspend,
   769		.resume			= vdpasim_resume,
   770		.get_config_size        = vdpasim_get_config_size,
   771		.get_config             = vdpasim_get_config,
   772		.set_config             = vdpasim_set_config,
   773		.get_generation         = vdpasim_get_generation,
   774		.get_iova_range         = vdpasim_get_iova_range,
   775		.set_group_asid         = vdpasim_set_group_asid,
   776		.dma_map                = vdpasim_dma_map,
   777		.dma_unmap              = vdpasim_dma_unmap,
 > 778		.reset_map              = vdpasim_reset_map,
   779		.bind_mm		= vdpasim_bind_mm,
   780		.unbind_mm		= vdpasim_unbind_mm,
   781		.free                   = vdpasim_free,
   782	};
   783	
   784	static const struct vdpa_config_ops vdpasim_batch_config_ops = {
   785		.set_vq_address         = vdpasim_set_vq_address,
   786		.set_vq_num             = vdpasim_set_vq_num,
   787		.kick_vq                = vdpasim_kick_vq,
   788		.set_vq_cb              = vdpasim_set_vq_cb,
   789		.set_vq_ready           = vdpasim_set_vq_ready,
   790		.get_vq_ready           = vdpasim_get_vq_ready,
   791		.set_vq_state           = vdpasim_set_vq_state,
   792		.get_vendor_vq_stats    = vdpasim_get_vq_stats,
   793		.get_vq_state           = vdpasim_get_vq_state,
   794		.get_vq_align           = vdpasim_get_vq_align,
   795		.get_vq_group           = vdpasim_get_vq_group,
   796		.get_device_features    = vdpasim_get_device_features,
   797		.get_backend_features   = vdpasim_get_backend_features,
   798		.set_driver_features    = vdpasim_set_driver_features,
   799		.get_driver_features    = vdpasim_get_driver_features,
   800		.set_config_cb          = vdpasim_set_config_cb,
   801		.get_vq_num_max         = vdpasim_get_vq_num_max,
   802		.get_device_id          = vdpasim_get_device_id,
   803		.get_vendor_id          = vdpasim_get_vendor_id,
   804		.get_status             = vdpasim_get_status,
   805		.set_status             = vdpasim_set_status,
   806		.reset			= vdpasim_reset,
   807		.suspend		= vdpasim_suspend,
   808		.resume			= vdpasim_resume,
   809		.get_config_size        = vdpasim_get_config_size,
   810		.get_config             = vdpasim_get_config,
   811		.set_config             = vdpasim_set_config,
   812		.get_generation         = vdpasim_get_generation,
   813		.get_iova_range         = vdpasim_get_iova_range,
   814		.set_group_asid         = vdpasim_set_group_asid,
   815		.set_map                = vdpasim_set_map,
 > 816		.reset_map              = vdpasim_reset_map,
   817		.bind_mm		= vdpasim_bind_mm,
   818		.unbind_mm		= vdpasim_unbind_mm,
   819		.free                   = vdpasim_free,
   820	};
   821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
