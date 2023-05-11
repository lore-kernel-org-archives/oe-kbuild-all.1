Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40651363
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683830459; x=1715366459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKohvuxo+XyuUeaJv3X5L80sMPlDwBInh+x/XqWzg10=;
  b=YwaphHi1qztp+tOLhl+f3H6GMJgrHXi7zzqxPYeDZtrFXQ1dseIVlXZN
   FwShnnb6QYw2URwB131rDA5g20gJFWHVWYjD77GoKCYJO6s4Weuy4+8j5
   VhF/qSBbKgeLnvDO+HB/2ruyicCiCfRxb7QQGKgaj7FFjw34Sz0NtOAT5
   KwK4Irp8vjCi/nkHJ/59lLkszjx9veCRx4FzgLdEewEdWsKEqXnL45fs1
   FtrrVKVeiu8+67cz6Zc/FnRTjy4wgQ85+NHB5+H7xoHE948bkEK+RC2uP
   OJaOWrEpUfxu739YlBlHWlskhRCm+4BxhfbbK+mwDlswSXshz3pgvG87y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330214706"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="330214706"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 11:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="764865427"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="764865427"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 May 2023 11:40:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxBDl-0004C4-04;
	Thu, 11 May 2023 18:40:57 +0000
Date: Fri, 12 May 2023 02:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14825/29506]
 drivers/clk/clk.c:3145:5: warning: no previous prototype for 'clk_set_flags'
Message-ID: <202305120200.S0QrvVYy-lkp@intel.com>
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
head:   7cf5d82154dcd64ff75b69f3dc8dbff4ed2d2816
commit: 3179a1a38d96f565a2229b9244285c6abf62b10a [14825/29506] ANDROID: GKI: clk: Add support for voltage voting
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230512/202305120200.S0QrvVYy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 3179a1a38d96f565a2229b9244285c6abf62b10a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/nvmem/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120200.S0QrvVYy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c: In function 'clk_update_vdd':
   drivers/clk/clk.c:624:31: warning: variable 'ignore' set but not used [-Wunused-but-set-variable]
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
