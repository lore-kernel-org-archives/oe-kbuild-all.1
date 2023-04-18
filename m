Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8322566
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681820987; x=1713356987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPYpA65I0ZNzt+J/bfuf+D1f3uqhVdO1XM0/yjUeSj8=;
  b=YMInDGgjflLJO3hSwEzUTUuNEfdqqDZIASYfyBPeG2HnFtqNJv5OCWqI
   7gU9WO6ZoHMHZWO1rb6LEPtP/WOUBfEGz6h5Z0FgYXOPxLWzPqDvGLNKx
   e63ARnlk/5iDjHCSpcxACw7Sj7LK8E7bEaX1aKo7a1IQ9yNEH3C6IECDz
   lddsRKp+oQfg+fPuVcqthigmXdD19pSBzXk0meGyTUNuVilq2XEaBRWLG
   dq/Pa2ziFwro191R54/4IgO9pUc2HyO8o0hfw8GBEB26g+MZlrBM7U4Ke
   0yJA/XaCnPp3HHC30ZsG5G0y2M4DtFKUmZ3gIW+7gP8Q26BdjtrDcopcS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="329327711"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="329327711"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 05:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668512191"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="668512191"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2023 05:29:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pokSq-000dQH-19;
	Tue, 18 Apr 2023 12:29:40 +0000
Date: Tue, 18 Apr 2023 20:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14825/29414]
 drivers/clk/clk.c:624:31: warning: variable 'ignore' set but not used
Message-ID: <202304182056.wwW8EsjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   9b68392a2b5860995364db295d0d869b413fdfdf
commit: 3179a1a38d96f565a2229b9244285c6abf62b10a [14825/29414] ANDROID: GKI: clk: Add support for voltage voting
config: arm-randconfig-r046-20230416 (https://download.01.org/0day-ci/archive/20230418/202304182056.wwW8EsjF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 3179a1a38d96f565a2229b9244285c6abf62b10a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash M=drivers/clk

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304182056.wwW8EsjF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c: In function 'clk_update_vdd':
>> drivers/clk/clk.c:624:31: warning: variable 'ignore' set but not used [-Wunused-but-set-variable]
     624 |         int level, rc = 0, i, ignore;
         |                               ^~~~~~
   drivers/clk/clk.c: At top level:
>> drivers/clk/clk.c:3145:5: warning: no previous prototype for 'clk_set_flags' [-Wmissing-prototypes]
    3145 | int clk_set_flags(struct clk *clk, unsigned long flags)
         |     ^~~~~~~~~~~~~
>> drivers/clk/clk.c:3157:6: warning: no previous prototype for 'clk_debug_print_hw' [-Wmissing-prototypes]
    3157 | void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:4257: warning: Function parameter or member 'dev' not described in 'devm_clk_unregister'
   drivers/clk/clk.c:4455: warning: Function parameter or member 'get_hw' not described in 'of_clk_provider'


vim +/ignore +624 drivers/clk/clk.c

   618	
   619	/*
   620	 * Update voltage level given the current votes.
   621	 */
   622	static int clk_update_vdd(struct clk_vdd_class *vdd_class)
   623	{
 > 624		int level, rc = 0, i, ignore;
   625		struct regulator **r = vdd_class->regulator;
   626		int *uv = vdd_class->vdd_uv;
   627		int n_reg = vdd_class->num_regulators;
   628		int cur_lvl = vdd_class->cur_level;
   629		int max_lvl = vdd_class->num_levels - 1;
   630		int cur_base = cur_lvl * n_reg;
   631		int new_base;
   632	
   633		/* aggregate votes */
   634		for (level = max_lvl; level > 0; level--)
   635			if (vdd_class->level_votes[level])
   636				break;
   637	
   638		if (level == cur_lvl)
   639			return 0;
   640	
   641		max_lvl = max_lvl * n_reg;
   642		new_base = level * n_reg;
   643	
   644		for (i = 0; i < vdd_class->num_regulators; i++) {
   645			pr_debug("Set Voltage level Min %d, Max %d\n", uv[new_base + i],
   646					uv[max_lvl + i]);
   647			rc = regulator_set_voltage(r[i], uv[new_base + i], INT_MAX);
   648			if (rc)
   649				goto set_voltage_fail;
   650	
   651			if (cur_lvl == 0 || cur_lvl == vdd_class->num_levels)
   652				rc = regulator_enable(r[i]);
   653			else if (level == 0)
   654				rc = regulator_disable(r[i]);
   655			if (rc)
   656				goto enable_disable_fail;
   657		}
   658	
   659		if (vdd_class->set_vdd && !vdd_class->num_regulators)
   660			rc = vdd_class->set_vdd(vdd_class, level);
   661	
   662		if (!rc)
   663			vdd_class->cur_level = level;
   664	
   665		return rc;
   666	
   667	enable_disable_fail:
   668		regulator_set_voltage(r[i], uv[cur_base + i], INT_MAX);
   669	
   670	set_voltage_fail:
   671		for (i--; i >= 0; i--) {
   672			regulator_set_voltage(r[i], uv[cur_base + i], INT_MAX);
   673			if (cur_lvl == 0 || cur_lvl == vdd_class->num_levels)
   674				regulator_disable(r[i]);
   675			else if (level == 0)
   676				ignore = regulator_enable(r[i]);
   677		}
   678	
   679		return rc;
   680	}
   681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
