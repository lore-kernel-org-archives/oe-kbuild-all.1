Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA84C84
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 05:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686203613; x=1717739613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7dyR2c27Cf71fvUDufbBWCr8c6RnNxV3Dvj9tYgc8o=;
  b=R/QN5ne03QgoVRyS63idJq03SUFKn38BZipKCLjjq8+jflY2ep/wiiIl
   ajO2JwlSKK4h0qD7Y3kktZ3pPXjihRIBY8/oEhUQvAM13GiYas0VJuhOC
   yTRK9NYFnAHI1Luf3dWdcHlRj/lXN7JLfMqTb3WRPkChfWqsK9cK7VMw7
   r99jXBnHuL5NED2P8sqwL/5JrANOHvL+Yn5765YwYlVhEFKtduSWNIeOD
   /7Mz7Sva4w0Ngj3qvYKNccVf5IUJPOsNm/N3vR3oWZ+fkpvb1vOMkINA/
   E4rarY8EtNlvs9hntE7XmRQ7ugxopyCxsuTJAkGwJpviBOqvqC6OPYoQc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443581094"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="443581094"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 22:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="956587572"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="956587572"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2023 22:53:32 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q78aR-0007ND-2q;
	Thu, 08 Jun 2023 05:53:31 +0000
Date: Thu, 8 Jun 2023 13:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 3/5] helpers.c:undefined reference to `cpu_scale'
Message-ID: <202306081328.q6FicAyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   9386dea7e9d6e37c2c08b088f3195770ae2f3feb
commit: 435daa42656081a9a751c5140a78cb775c0c9e7a [3/5] bpf: Add cpufreq helpers
config: arm-randconfig-r016-20230608 (https://download.01.org/0day-ci/archive/20230608/202306081328.q6FicAyd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=435daa42656081a9a751c5140a78cb775c0c9e7a
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout 435daa42656081a9a751c5140a78cb775c0c9e7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081328.q6FicAyd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/bpf/helpers.o: in function `bpf_get_cpu_scale':
>> helpers.c:(.text+0xa0): undefined reference to `cpu_scale'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
