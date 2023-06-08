Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D391FBB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 09:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686216233; x=1717752233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0P1JHTfJbTUiBWkxHsCraNFVIxEoIOHXqiEGrtgGNOU=;
  b=Sn6UsEkIQksaTRGBVFWzO0SlZkvsDj+pbgSzQpMVYQU8Ncrolq3Aw1WE
   S+RT8SoQxzzWIu1HEbZ2cW+HZaQ2r7C5+Dyyi2DCA7RAu70cvt3YpQuXM
   4SzRTw3wdcvKdotO1WIbwofUOgI20rep2gJsUNwE/hB4d5j++XTPrvu1t
   w0+LsFDsxhv97TV33o31m7AmzB5gNtj4UuTCXKZaxl+dwbvc9o/rAN2om
   ejA1X2o4Ym0TdjatP3+ZrfFZoTAXeCNiLhhcKxJpmTNLUbirDwiYN3lsW
   LEWcS4WS60psFziu63+hL5IdpNXXEmIqbs9eF7bBaH1RLElyYGpjWbVjU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420824095"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="420824095"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709916565"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="709916565"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 02:23:52 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7Brz-0007d6-0m;
	Thu, 08 Jun 2023 09:23:51 +0000
Date: Thu, 8 Jun 2023 17:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 3/5] kernel/bpf/helpers.c:475: undefined reference
 to `cpu_scale'
Message-ID: <202306081709.QuQZAon1-lkp@intel.com>
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
config: i386-randconfig-i052-20230608 (https://download.01.org/0day-ci/archive/20230608/202306081709.QuQZAon1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=435daa42656081a9a751c5140a78cb775c0c9e7a
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout 435daa42656081a9a751c5140a78cb775c0c9e7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081709.QuQZAon1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/helpers.o: in function `____bpf_get_cpu_scale':
>> kernel/bpf/helpers.c:475: undefined reference to `cpu_scale'


vim +475 kernel/bpf/helpers.c

   469	
   470	BPF_CALL_1(bpf_get_cpu_scale, u32, cpu)
   471	{
   472		if (cpu > nr_cpu_ids)
   473			return 0;
   474	
 > 475		return topology_get_cpu_scale(cpu);
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
