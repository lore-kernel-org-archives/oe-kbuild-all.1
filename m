Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6C1FB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675512705; x=1707048705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K4woONew4U/L2D+4wA59TuZN29ygVURa2XSOlPvEPxg=;
  b=SQXyQvc2cNbLC1KeCJOnmZA9AHRB4/nWA2c51AVeU+9A39mUQ0kccwGg
   Uab6HtoVO7w9qN5ywxMa3VCa1zINPdFVSkcPmbu7d+mVsqR9mgODXufP+
   YvuAlUgDARELrHvObLsAC8MMvk5hsr3MSV4nCn7pvpnG0LLG1pUnB4Vpf
   aWie79vBMzjR2T8J4RaczIiDOVy0/pNFs4WjQANFy5PooxkNWbQ9nuuOz
   80U5qlYA9+ZTEvYJzcqO9VOaw4lTzlbK0kH1FHSV+BCO4VNkdfWYEQccn
   MmJHbZItrK4gDhlPeI2nAbIFHhfd1LgqMLT6EH6K2NBUIMlBvl407nNtS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356285704"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="356285704"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 04:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734643407"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734643407"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 04:11:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOHOR-0001I8-07;
	Sat, 04 Feb 2023 12:11:43 +0000
Date: Sat, 4 Feb 2023 20:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v1 20/32] drivers/base/cpu.c:504:9:
 error: implicit declaration of function 'unregister_cpu'; did you mean
 'register_cpu'?
Message-ID: <202302042001.avSllcZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git virtual_cpu_hotplug/rfc/v1
head:   81295db7555df74bd02dab0b7e87b512d3a3de34
commit: 9048fbcbea6dd1dfa42a3b9409695ff9199a417d [20/32] drivers: base: Implement weak arch_unregister_cpu()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230204/202302042001.avSllcZk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=9048fbcbea6dd1dfa42a3b9409695ff9199a417d
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse virtual_cpu_hotplug/rfc/v1
        git checkout 9048fbcbea6dd1dfa42a3b9409695ff9199a417d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/base/cpu.c: In function 'arch_unregister_cpu':
>> drivers/base/cpu.c:504:9: error: implicit declaration of function 'unregister_cpu'; did you mean 'register_cpu'? [-Werror=implicit-function-declaration]
     504 |         unregister_cpu(&per_cpu(cpu_devices, num));
         |         ^~~~~~~~~~~~~~
         |         register_cpu
   cc1: some warnings being treated as errors


vim +504 drivers/base/cpu.c

   501	
   502	void __weak arch_unregister_cpu(int num)
   503	{
 > 504		unregister_cpu(&per_cpu(cpu_devices, num));
   505	}
   506	#endif
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
