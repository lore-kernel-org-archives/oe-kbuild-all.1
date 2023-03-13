Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E803328F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678719837; x=1710255837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nnPVxqaWPSM62/7tvPcwit7boeqwp9uA7g0BvtONDlc=;
  b=SQi/DIzuSQcXNEQtUvFHM8GZWTaVQUGflhx9fNZnI/t19UnAfNTmWIG/
   K5r9J67IYtEgPmSwwzQvXIbnesILhDuJXn3GJw7jw0WtuOF288zcn2ZW5
   8Ykw63LilYXDJYeJKymVjua/uTggcE1Yno40H8Bur7yySBa48spXA2ZCC
   kv9GckKCS/4pm1ceZFxohzsagR9gEQU4X8vXG8aqLwvJPy1pKHqzQMrYA
   9Vlrm4SEKjlwohmNam/KX8lKqdv90E7rwXAApEnwxP6VbQwtRaf1ZlQ3a
   /B5KFSgGCjNkAx7ENhy11WV7p3Z5CdegNq7FCPtP8aqFgIkXlLdd0zJbw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339536931"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="339536931"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 08:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="1008016668"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="1008016668"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2023 08:03:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbjhs-0005n0-1m;
	Mon, 13 Mar 2023 15:03:24 +0000
Date: Mon, 13 Mar 2023 23:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Song Shuai <suagrfillet@gmail.com>, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	conor.dooley@microchip.com, ionela.voinescu@arm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH] arch_topology: Clear LLC sibling when cacheinfo teardown
Message-ID: <202303132209.invDMo8L-lkp@intel.com>
References: <20230313102752.1134472-1-suagrfillet@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313102752.1134472-1-suagrfillet@gmail.com>

Hi Song,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.3-rc2 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Shuai/arch_topology-Clear-LLC-sibling-when-cacheinfo-teardown/20230313-182946
patch link:    https://lore.kernel.org/r/20230313102752.1134472-1-suagrfillet%40gmail.com
patch subject: [PATCH] arch_topology: Clear LLC sibling when cacheinfo teardown
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230313/202303132209.invDMo8L-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a9aca0a81b31b421e3bbfa08fd205a8bec651afe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Shuai/arch_topology-Clear-LLC-sibling-when-cacheinfo-teardown/20230313-182946
        git checkout a9aca0a81b31b421e3bbfa08fd205a8bec651afe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132209.invDMo8L-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/cacheinfo.c: In function 'cacheinfo_cpu_pre_down':
>> drivers/base/cacheinfo.c:818:9: error: implicit declaration of function 'clear_llc_topology' [-Werror=implicit-function-declaration]
     818 |         clear_llc_topology(cpu);
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/clear_llc_topology +818 drivers/base/cacheinfo.c

   811	
   812	static int cacheinfo_cpu_pre_down(unsigned int cpu)
   813	{
   814		if (cpumask_test_and_clear_cpu(cpu, &cache_dev_map))
   815			cpu_cache_sysfs_exit(cpu);
   816	
   817		free_cache_attributes(cpu);
 > 818		clear_llc_topology(cpu);
   819		return 0;
   820	}
   821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
