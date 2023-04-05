Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFD63AE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680709218; x=1712245218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lk5YPX90fg1j6oYUdOJhoHLCbKT1aUb27sM0PYrcNe0=;
  b=RIhNR95hnQaf+GMcEowzPiBumuB50O8/vYcOwxti9MOXPvq5SUIOaH4Z
   ydo4cUrkKkau2QLX9dsIShU01mO8UkbLpgURcbTsLroVbpDxgiGNnJMLu
   BADLFec2hwLfbBzs+OZglCyYuOK2K/AqnbUsXcB8nZU+bnO8/HrhzydSZ
   Cgk4H/Rh7T9h8nd4ZqHmExHYbuivXGG3APC0oaSBuek3oMnj+7byt0p1p
   QF8VNjgbakIH//EiYr72o16c+wqgz8szavTU7rd8USuWwCCXu++qfO4Vn
   pHleAls+cqgpdfkvInqSK42/hhhO6ZCsTYNLciLqSGVoDxIkifD71PV1P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="339979181"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="339979181"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 08:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="686789529"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="686789529"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 08:40:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk5FA-000QbV-0N;
	Wed, 05 Apr 2023 15:40:16 +0000
Date: Wed, 5 Apr 2023 23:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14825/29325]
 drivers/clk/clk.c:3145:5: warning: no previous prototype for function
 'clk_set_flags'
Message-ID: <202304052322.1BksFL6Q-lkp@intel.com>
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
head:   e8676808abe2a4dd79bd76700719c360d84b343d
commit: 3179a1a38d96f565a2229b9244285c6abf62b10a [14825/29325] ANDROID: GKI: clk: Add support for voltage voting
config: x86_64-randconfig-r005-20230403 (https://download.01.org/0day-ci/archive/20230405/202304052322.1BksFL6Q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 3179a1a38d96f565a2229b9244285c6abf62b10a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/nvmem/ kernel/power/ kernel/sched/ lib/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304052322.1BksFL6Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c:624:24: warning: variable 'ignore' set but not used [-Wunused-but-set-variable]
           int level, rc = 0, i, ignore;
                                 ^
>> drivers/clk/clk.c:3145:5: warning: no previous prototype for function 'clk_set_flags' [-Wmissing-prototypes]
   int clk_set_flags(struct clk *clk, unsigned long flags)
       ^
   drivers/clk/clk.c:3145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int clk_set_flags(struct clk *clk, unsigned long flags)
   ^
   static 
>> drivers/clk/clk.c:3157:6: warning: no previous prototype for function 'clk_debug_print_hw' [-Wmissing-prototypes]
   void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
        ^
   drivers/clk/clk.c:3157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
   ^
   static 
   3 warnings generated.
   drivers/clk/clk.c:4257: warning: Function parameter or member 'dev' not described in 'devm_clk_unregister'
   drivers/clk/clk.c:4455: warning: Function parameter or member 'get_hw' not described in 'of_clk_provider'


vim +/clk_set_flags +3145 drivers/clk/clk.c

  3144	
> 3145	int clk_set_flags(struct clk *clk, unsigned long flags)
  3146	{
  3147		if (!clk)
  3148			return 0;
  3149	
  3150		if (!clk->core->ops->set_flags)
  3151			return -EINVAL;
  3152	
  3153		return clk->core->ops->set_flags(clk->core->hw, flags);
  3154	}
  3155	EXPORT_SYMBOL_GPL(clk_set_flags);
  3156	
> 3157	void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
  3158	{
  3159	}
  3160	EXPORT_SYMBOL(clk_debug_print_hw);
  3161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
