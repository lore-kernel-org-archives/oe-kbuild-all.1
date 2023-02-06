Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813A53A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675698732; x=1707234732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvefBkdpPmKom40wQsp0mBCIE20Xdyc6zxR6Jkl3iyg=;
  b=dXI/qg8YzFvnhpXBsjHDGNzozhH8zTJo8UdnyMnRLRp6RPVZmkaIFIBn
   OTbhJ9MK+oV2tf6yQv6DTRNnIy1OO8wVFS5Gq5sx/3Xltp58iiGhube37
   bZMtzTlb+T5Q9kkVBzOBiwPNnN87Ce98/LPtLShH9AFjsZVxjg6iRfRv5
   JX46dqw1tUSh2hM8gOe8puX7K6bxq5iGl+tYcRT0xQHKffVXTRT+nhNBg
   CW57AFslh7bVxyfME8lzB+T0MW3g8zh67woX3WaQrwdwTm5SnS00UOSh2
   bFeQc7nHHme2q/VKOW0QkAsX7yFBW3VttJQ1Dn9WWo83Wg4a3Ub/yMDn9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327871206"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327871206"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 07:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="644079078"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="644079078"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2023 07:52:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP3mk-0002e6-2c;
	Mon, 06 Feb 2023 15:52:02 +0000
Date: Mon, 6 Feb 2023 23:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kan Liang <kan.liang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Qin <chao.qin@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-lts:5.10/yocto 24099/29177]
 arch/x86/events/intel/uncore_snbep.c:5416:33: warning: unused variable
 'spr_uncore_iio'
Message-ID: <202302062347.YFMuPIIM-lkp@intel.com>
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
commit: ad0841569ed53a6945308c8b6f9d7710bd1b07a7 [24099/29177] perf/x86/intel/uncore: Support IIO free-running counters on Sapphire Rapids server
config: i386-randconfig-a002-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062347.YFMuPIIM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/ad0841569ed53a6945308c8b6f9d7710bd1b07a7
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout ad0841569ed53a6945308c8b6f9d7710bd1b07a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/events/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/events/intel/uncore_snbep.c:5416:33: warning: unused variable 'spr_uncore_iio' [-Wunused-variable]
   static struct intel_uncore_type spr_uncore_iio = {
                                   ^
>> arch/x86/events/intel/uncore_snbep.c:5442:33: warning: unused variable 'spr_uncore_irp' [-Wunused-variable]
   static struct intel_uncore_type spr_uncore_irp = {
                                   ^
>> arch/x86/events/intel/uncore_snbep.c:5448:33: warning: unused variable 'spr_uncore_m2pcie' [-Wunused-variable]
   static struct intel_uncore_type spr_uncore_m2pcie = {
                                   ^
>> arch/x86/events/intel/uncore_snbep.c:5453:33: warning: unused variable 'spr_uncore_pcu' [-Wunused-variable]
   static struct intel_uncore_type spr_uncore_pcu = {
                                   ^
   4 warnings generated.


vim +/spr_uncore_iio +5416 arch/x86/events/intel/uncore_snbep.c

2158f3ffb5a647 Kan Liang 2021-06-30  5415  
3f62f906a5319a Kan Liang 2021-06-30 @5416  static struct intel_uncore_type spr_uncore_iio = {
3f62f906a5319a Kan Liang 2021-06-30  5417  	.name			= "iio",
3f62f906a5319a Kan Liang 2021-06-30  5418  	.event_mask		= SNBEP_PMON_RAW_EVENT_MASK,
3f62f906a5319a Kan Liang 2021-06-30  5419  	.event_mask_ext		= SNR_IIO_PMON_RAW_EVENT_MASK_EXT,
3f62f906a5319a Kan Liang 2021-06-30  5420  	.format_group		= &snr_uncore_iio_format_group,
3f62f906a5319a Kan Liang 2021-06-30  5421  };
3f62f906a5319a Kan Liang 2021-06-30  5422  
3f62f906a5319a Kan Liang 2021-06-30  5423  static struct attribute *spr_uncore_raw_formats_attr[] = {
3f62f906a5319a Kan Liang 2021-06-30  5424  	&format_attr_event.attr,
3f62f906a5319a Kan Liang 2021-06-30  5425  	&format_attr_umask_ext4.attr,
3f62f906a5319a Kan Liang 2021-06-30  5426  	&format_attr_edge.attr,
3f62f906a5319a Kan Liang 2021-06-30  5427  	&format_attr_inv.attr,
3f62f906a5319a Kan Liang 2021-06-30  5428  	&format_attr_thresh8.attr,
3f62f906a5319a Kan Liang 2021-06-30  5429  	NULL,
3f62f906a5319a Kan Liang 2021-06-30  5430  };
3f62f906a5319a Kan Liang 2021-06-30  5431  
3f62f906a5319a Kan Liang 2021-06-30  5432  static const struct attribute_group spr_uncore_raw_format_group = {
3f62f906a5319a Kan Liang 2021-06-30  5433  	.name			= "format",
3f62f906a5319a Kan Liang 2021-06-30  5434  	.attrs			= spr_uncore_raw_formats_attr,
3f62f906a5319a Kan Liang 2021-06-30  5435  };
3f62f906a5319a Kan Liang 2021-06-30  5436  
3f62f906a5319a Kan Liang 2021-06-30  5437  #define SPR_UNCORE_COMMON_FORMAT()				\
3f62f906a5319a Kan Liang 2021-06-30  5438  	.event_mask		= SNBEP_PMON_RAW_EVENT_MASK,	\
3f62f906a5319a Kan Liang 2021-06-30  5439  	.event_mask_ext		= SPR_RAW_EVENT_MASK_EXT,	\
3f62f906a5319a Kan Liang 2021-06-30  5440  	.format_group		= &spr_uncore_raw_format_group
3f62f906a5319a Kan Liang 2021-06-30  5441  
3f62f906a5319a Kan Liang 2021-06-30 @5442  static struct intel_uncore_type spr_uncore_irp = {
3f62f906a5319a Kan Liang 2021-06-30  5443  	SPR_UNCORE_COMMON_FORMAT(),
3f62f906a5319a Kan Liang 2021-06-30  5444  	.name			= "irp",
3f62f906a5319a Kan Liang 2021-06-30  5445  
3f62f906a5319a Kan Liang 2021-06-30  5446  };
3f62f906a5319a Kan Liang 2021-06-30  5447  
3f62f906a5319a Kan Liang 2021-06-30 @5448  static struct intel_uncore_type spr_uncore_m2pcie = {
3f62f906a5319a Kan Liang 2021-06-30  5449  	SPR_UNCORE_COMMON_FORMAT(),
3f62f906a5319a Kan Liang 2021-06-30  5450  	.name			= "m2pcie",
3f62f906a5319a Kan Liang 2021-06-30  5451  };
3f62f906a5319a Kan Liang 2021-06-30  5452  
3f62f906a5319a Kan Liang 2021-06-30 @5453  static struct intel_uncore_type spr_uncore_pcu = {
3f62f906a5319a Kan Liang 2021-06-30  5454  	.name			= "pcu",
3f62f906a5319a Kan Liang 2021-06-30  5455  };
3f62f906a5319a Kan Liang 2021-06-30  5456  

:::::: The code at line 5416 was first introduced by commit
:::::: 3f62f906a5319a0bdc901f887d0d37ef43754676 perf/x86/intel/uncore: Add Sapphire Rapids server IMC support

:::::: TO: Kan Liang <kan.liang@linux.intel.com>
:::::: CC: Chao Qin <chao.qin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
