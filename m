Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E515B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 01:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677114045; x=1708650045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CMr1UrDZ0RB00T0JKlTdey2FtOCwQ9Hl4Xat0P937ys=;
  b=m86wnV8p8JMsW4em4XuDS6zo2XeukitnWWnsfUVe0DN6Vh2cq3faeAoL
   Uvw65y6lw7elT8HDA3Fu/Jd4WPclcfGnmM/ClmyEbsgAG6WArfLftLc8p
   R7rl+j7qPuLEimxeP+iq6qYcu8aWXZgTbqD9+80+AKJVPnO1tZxjPkkiU
   B+KMrkiSEEn3KXky1Iys3BBzNpays6QBkdZkdkecnbEhuHrqsRcldKy3K
   CtIw76kC6H04W371XziS42++kKEnFXErPxBnfFHITDYEoqUFyzDqKNL63
   cjd+LmTkW2W9/2Bu55pLTwr00Y+8Mn+4ZkyatxvztuGr21hKchxsrYD7X
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312707691"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312707691"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 17:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917777204"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="917777204"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 17:00:39 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUzyR-0000rm-06;
	Thu, 23 Feb 2023 01:00:39 +0000
Date: Thu, 23 Feb 2023 08:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 4/4] ublk_drv: add ebpf support
Message-ID: <202302230856.gpapZydk-lkp@intel.com>
References: <20230222132534.114574-5-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132534.114574-5-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v6.2]
[cannot apply to bpf-next/master bpf/master axboe-block/for-next linus/master next-20230222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
patch link:    https://lore.kernel.org/r/20230222132534.114574-5-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC v2 4/4] ublk_drv: add ebpf support
config: arc-randconfig-r015-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230856.gpapZydk-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/edb68bda205cafb786988ea5c1a3e4465c92fb49
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
        git checkout edb68bda205cafb786988ea5c1a3e4465c92fb49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230856.gpapZydk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/block/ublk_drv.o: in function `static_key_count':
>> include/linux/jump_label.h:260: undefined reference to `bpf_stats_enabled_key'
>> arc-elf-ld: include/linux/jump_label.h:260: undefined reference to `bpf_stats_enabled_key'


vim +260 include/linux/jump_label.h

1f69bf9c613760 Jason Baron    2016-08-03  257  
656d054e0a15ec Peter Zijlstra 2022-05-02  258  static __always_inline int static_key_count(struct static_key *key)
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  259  {
656d054e0a15ec Peter Zijlstra 2022-05-02 @260  	return arch_atomic_read(&key->enabled);
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  261  }
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
