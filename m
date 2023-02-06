Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933E5251
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675692602; x=1707228602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0HLp/5MWz8Vyl4jk0C0xIM/ywYHasr+p/pJTm2jPWqo=;
  b=L5ukZA2YlrCjBGKbZ+TFM/KdIS8vJNm4T+KeTqGXa705KjtEk4B2yjZv
   emHNchZ3BydLufYQYeJ+yShxfeX34/JLeZJ7A3XqVO9gzTBNidE/ewtac
   kf1Dz6UKC66n0Q6rpywZ2MJc0qzec5ypj8hkdUTkl7UzoY9i0z2n7msUF
   3o+S/2ojcer4gNPogo2ycwnDEvixhN1NMO2ToPd7J76QsGSZbsIlSQh/B
   6hPULiTJMBolemj0J7LaJCT63o+NF8kgAUL0gksYnzDz3MaeF9W1UnlOD
   TwUxEHUBHvy5pvxIalnlJ/JPnI3IPrieN6VwDaZYzVEBBDy6Yvvc7QMxs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317223104"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="317223104"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 06:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="809150787"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809150787"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 06:10:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP2Bz-0002a0-19;
	Mon, 06 Feb 2023 14:09:59 +0000
Date: Mon, 6 Feb 2023 22:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kan Liang <kan.liang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Qin <chao.qin@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-lts:5.10/yocto 24097/29177]
 arch/x86/events/intel/uncore_snbep.c:5453:33: warning: 'spr_uncore_pcu'
 defined but not used
Message-ID: <202302062239.msxPZRFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kan,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: 3f62f906a5319a0bdc901f887d0d37ef43754676 [24097/29177] perf/x86/intel/uncore: Add Sapphire Rapids server IMC support
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230206/202302062239.msxPZRFc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/3f62f906a5319a0bdc901f887d0d37ef43754676
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 3f62f906a5319a0bdc901f887d0d37ef43754676
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/events/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/events/intel/uncore_snbep.c:5381:35: error: 'intel_generic_uncore_msr_init_box' undeclared here (not in a function); did you mean 'ivbep_uncore_msr_init_box'?
    5381 |         .init_box               = intel_generic_uncore_msr_init_box,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   ivbep_uncore_msr_init_box
   arch/x86/events/intel/uncore_snbep.c:5382:35: error: 'intel_generic_uncore_msr_disable_box' undeclared here (not in a function); did you mean 'snbep_uncore_msr_disable_box'?
    5382 |         .disable_box            = intel_generic_uncore_msr_disable_box,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snbep_uncore_msr_disable_box
   arch/x86/events/intel/uncore_snbep.c:5383:35: error: 'intel_generic_uncore_msr_enable_box' undeclared here (not in a function); did you mean 'snbep_uncore_msr_enable_box'?
    5383 |         .enable_box             = intel_generic_uncore_msr_enable_box,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snbep_uncore_msr_enable_box
   arch/x86/events/intel/uncore_snbep.c:5472:35: error: 'intel_generic_uncore_mmio_init_box' undeclared here (not in a function); did you mean 'snr_uncore_mmio_init_box'?
    5472 |         .init_box               = intel_generic_uncore_mmio_init_box,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snr_uncore_mmio_init_box
   arch/x86/events/intel/uncore_snbep.c:5474:35: error: 'intel_generic_uncore_mmio_disable_box' undeclared here (not in a function); did you mean 'snr_uncore_mmio_disable_box'?
    5474 |         .disable_box            = intel_generic_uncore_mmio_disable_box,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snr_uncore_mmio_disable_box
   arch/x86/events/intel/uncore_snbep.c:5475:35: error: 'intel_generic_uncore_mmio_enable_box' undeclared here (not in a function); did you mean 'snr_uncore_mmio_enable_box'?
    5475 |         .enable_box             = intel_generic_uncore_mmio_enable_box,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snr_uncore_mmio_enable_box
   arch/x86/events/intel/uncore_snbep.c:5476:35: error: 'intel_generic_uncore_mmio_disable_event' undeclared here (not in a function); did you mean 'snr_uncore_mmio_disable_event'?
    5476 |         .disable_event          = intel_generic_uncore_mmio_disable_event,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snr_uncore_mmio_disable_event
   arch/x86/events/intel/uncore_snbep.c: In function 'uncore_get_uncores':
   arch/x86/events/intel/uncore_snbep.c:5544:31: error: implicit declaration of function 'intel_uncore_generic_init_uncores'; did you mean 'intel_uncore_generic_uncore_mmio_init'? [-Werror=implicit-function-declaration]
    5544 |         start_types = types = intel_uncore_generic_init_uncores(type_id);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               intel_uncore_generic_uncore_mmio_init
   arch/x86/events/intel/uncore_snbep.c:5544:29: warning: assignment to 'struct intel_uncore_type **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    5544 |         start_types = types = intel_uncore_generic_init_uncores(type_id);
         |                             ^
   At top level:
>> arch/x86/events/intel/uncore_snbep.c:5453:33: warning: 'spr_uncore_pcu' defined but not used [-Wunused-variable]
    5453 | static struct intel_uncore_type spr_uncore_pcu = {
         |                                 ^~~~~~~~~~~~~~
>> arch/x86/events/intel/uncore_snbep.c:5448:33: warning: 'spr_uncore_m2pcie' defined but not used [-Wunused-variable]
    5448 | static struct intel_uncore_type spr_uncore_m2pcie = {
         |                                 ^~~~~~~~~~~~~~~~~
>> arch/x86/events/intel/uncore_snbep.c:5442:33: warning: 'spr_uncore_irp' defined but not used [-Wunused-variable]
    5442 | static struct intel_uncore_type spr_uncore_irp = {
         |                                 ^~~~~~~~~~~~~~
>> arch/x86/events/intel/uncore_snbep.c:5416:33: warning: 'spr_uncore_iio' defined but not used [-Wunused-variable]
    5416 | static struct intel_uncore_type spr_uncore_iio = {
         |                                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/spr_uncore_pcu +5453 arch/x86/events/intel/uncore_snbep.c

  5415	
> 5416	static struct intel_uncore_type spr_uncore_iio = {
  5417		.name			= "iio",
  5418		.event_mask		= SNBEP_PMON_RAW_EVENT_MASK,
  5419		.event_mask_ext		= SNR_IIO_PMON_RAW_EVENT_MASK_EXT,
  5420		.format_group		= &snr_uncore_iio_format_group,
  5421	};
  5422	
  5423	static struct attribute *spr_uncore_raw_formats_attr[] = {
  5424		&format_attr_event.attr,
  5425		&format_attr_umask_ext4.attr,
  5426		&format_attr_edge.attr,
  5427		&format_attr_inv.attr,
  5428		&format_attr_thresh8.attr,
  5429		NULL,
  5430	};
  5431	
  5432	static const struct attribute_group spr_uncore_raw_format_group = {
  5433		.name			= "format",
  5434		.attrs			= spr_uncore_raw_formats_attr,
  5435	};
  5436	
  5437	#define SPR_UNCORE_COMMON_FORMAT()				\
  5438		.event_mask		= SNBEP_PMON_RAW_EVENT_MASK,	\
  5439		.event_mask_ext		= SPR_RAW_EVENT_MASK_EXT,	\
  5440		.format_group		= &spr_uncore_raw_format_group
  5441	
> 5442	static struct intel_uncore_type spr_uncore_irp = {
  5443		SPR_UNCORE_COMMON_FORMAT(),
  5444		.name			= "irp",
  5445	
  5446	};
  5447	
> 5448	static struct intel_uncore_type spr_uncore_m2pcie = {
  5449		SPR_UNCORE_COMMON_FORMAT(),
  5450		.name			= "m2pcie",
  5451	};
  5452	
> 5453	static struct intel_uncore_type spr_uncore_pcu = {
  5454		.name			= "pcu",
  5455	};
  5456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
