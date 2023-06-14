Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB78F62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686747955; x=1718283955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3csf/VsaLa7+ZVEnM1dihFN2HzjBlfQ8LThK+wrTqpc=;
  b=R35JMXsv6YAONbYqxesdEepADVGhvsX8WpV+kfVmVYZ7daUmPmQYfqdG
   6Mw3uwx1blLR1lWv8BHSshytm6SPUQxrDzaYVrFCf49KcRDSRSBfD8v+J
   CHFmHjRWKAktSMN5izSBbza5zX7qaSt41Opow7z8nXYCgJdxxWIhVzg7O
   Np1ZK4TNDpSNsZdpuYLhfmbjVvXVyIHOFuwMgnel0Z9jofN4wmgjorKA4
   A1J2PtuKdBfEzWDdu0Q6BNelXw7mfg7K7Kw0ALCDchI0/4uaEgZ7lQjvi
   hZ0xapW5iLMCYGWc6LSURzyZNNnFyd8cPPCTyWWKmMpWv+sKHgxaPasx1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343301566"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="343301566"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 06:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712062602"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="712062602"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2023 06:05:51 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9QC7-0000fG-0F;
	Wed, 14 Jun 2023 13:05:51 +0000
Date: Wed, 14 Jun 2023 21:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] OPP: Simplify the over-designed pstate <-> level
 dance
Message-ID: <202306142056.s9s41XL5-lkp@intel.com>
References: <af0fd0fd64f33809875335a9cc2761085c3bd66f.1686739018.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af0fd0fd64f33809875335a9cc2761085c3bd66f.1686739018.git.viresh.kumar@linaro.org>

Hi Viresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc6 next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/OPP-Simplify-the-over-designed-pstate-level-dance/20230614-184040
base:   linus/master
patch link:    https://lore.kernel.org/r/af0fd0fd64f33809875335a9cc2761085c3bd66f.1686739018.git.viresh.kumar%40linaro.org
patch subject: [PATCH 2/2] OPP: Simplify the over-designed pstate <-> level dance
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306142056.s9s41XL5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout linus/master
        b4 shazam https://lore.kernel.org/r/af0fd0fd64f33809875335a9cc2761085c3bd66f.1686739018.git.viresh.kumar@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142056.s9s41XL5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/opp/of.c: In function '_of_add_opp_table_v2':
>> drivers/opp/of.c:1023:24: error: 'struct dev_pm_opp' has no member named 'pstate'
    1023 |                 if (opp->pstate) {
         |                        ^~


vim +1023 drivers/opp/of.c

f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05   981  
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05   982  /* Initializes OPP tables based on new bindings */
5ed4cecd75e902 drivers/opp/of.c            Viresh Kumar    2018-09-12   983  static int _of_add_opp_table_v2(struct device *dev, struct opp_table *opp_table)
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05   984  {
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05   985  	struct device_node *np;
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11   986  	int ret, count = 0;
3ba98324e81add drivers/opp/of.c            Viresh Kumar    2016-11-18   987  	struct dev_pm_opp *opp;
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05   988  
283d55e68d8a0f drivers/opp/of.c            Viresh Kumar    2018-09-07   989  	/* OPP table is already initialized for the device */
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11   990  	mutex_lock(&opp_table->lock);
cdd6ed90cdb6c2 drivers/opp/of.c            Viresh Kumar    2018-09-12   991  	if (opp_table->parsed_static_opps) {
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11   992  		opp_table->parsed_static_opps++;
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11   993  		mutex_unlock(&opp_table->lock);
cdd6ed90cdb6c2 drivers/opp/of.c            Viresh Kumar    2018-09-12   994  		return 0;
cdd6ed90cdb6c2 drivers/opp/of.c            Viresh Kumar    2018-09-12   995  	}
f06ed90e7051a3 drivers/opp/of.c            Viresh Kumar    2018-06-14   996  
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11   997  	opp_table->parsed_static_opps = 1;
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11   998  	mutex_unlock(&opp_table->lock);
b19c23551be8de drivers/opp/of.c            Viresh Kumar    2019-10-18   999  
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1000  	/* We have opp-table node now, iterate over it and add OPPs */
5ed4cecd75e902 drivers/opp/of.c            Viresh Kumar    2018-09-12  1001  	for_each_available_child_of_node(opp_table->np, np) {
deac8703da5faa drivers/opp/of.c            Dave Gerlach    2018-10-03  1002  		opp = _opp_add_static_v2(opp_table, dev, np);
deac8703da5faa drivers/opp/of.c            Dave Gerlach    2018-10-03  1003  		if (IS_ERR(opp)) {
deac8703da5faa drivers/opp/of.c            Dave Gerlach    2018-10-03  1004  			ret = PTR_ERR(opp);
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1005  			dev_err(dev, "%s: Failed to add OPP, %d\n", __func__,
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1006  				ret);
7978db344719da drivers/opp/of.c            Tobias Jordan   2017-10-04  1007  			of_node_put(np);
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11  1008  			goto remove_static_opp;
deac8703da5faa drivers/opp/of.c            Dave Gerlach    2018-10-03  1009  		} else if (opp) {
deac8703da5faa drivers/opp/of.c            Dave Gerlach    2018-10-03  1010  			count++;
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1011  		}
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1012  	}
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1013  
335ffab3ef8645 drivers/opp/of.c            Michał Mirosław 2021-07-26  1014  	/* There should be one or more OPPs defined */
335ffab3ef8645 drivers/opp/of.c            Michał Mirosław 2021-07-26  1015  	if (!count) {
335ffab3ef8645 drivers/opp/of.c            Michał Mirosław 2021-07-26  1016  		dev_err(dev, "%s: no supported OPPs", __func__);
ba0033192145cb drivers/opp/of.c            Viresh Kumar    2019-11-18  1017  		ret = -ENOENT;
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11  1018  		goto remove_static_opp;
ba0033192145cb drivers/opp/of.c            Viresh Kumar    2019-11-18  1019  	}
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1020  
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11  1021  	list_for_each_entry(opp, &opp_table->opp_list, node) {
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11  1022  		/* Any non-zero performance state would enable the feature */
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11 @1023  		if (opp->pstate) {
3ba98324e81add drivers/opp/of.c            Viresh Kumar    2016-11-18  1024  			opp_table->genpd_performance_state = true;
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11  1025  			break;
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11  1026  		}
a5663c9b1e31c0 drivers/opp/of.c            Viresh Kumar    2020-09-11  1027  	}
3ba98324e81add drivers/opp/of.c            Viresh Kumar    2016-11-18  1028  
7eba0c7641b000 drivers/opp/of.c            Viresh Kumar    2019-11-25  1029  	lazy_link_required_opp_table(opp_table);
7eba0c7641b000 drivers/opp/of.c            Viresh Kumar    2019-11-25  1030  
cdd6ed90cdb6c2 drivers/opp/of.c            Viresh Kumar    2018-09-12  1031  	return 0;
ba0033192145cb drivers/opp/of.c            Viresh Kumar    2019-11-18  1032  
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11  1033  remove_static_opp:
03758d60265c77 drivers/opp/of.c            Viresh Kumar    2019-11-11  1034  	_opp_remove_all_static(opp_table);
ba0033192145cb drivers/opp/of.c            Viresh Kumar    2019-11-18  1035  
ba0033192145cb drivers/opp/of.c            Viresh Kumar    2019-11-18  1036  	return ret;
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1037  }
f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
