Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5810FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 22:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685659249; x=1717195249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4PQmr3XNF2i2NFoC4sEFPaxJmOQAdvW8/knUm2N/aCI=;
  b=RJP78RN4EVUqMeRlxqO7ceS9BhzmnF6e7pQEOsZzxdb2R1/4al5gcYPd
   N9/ql2x9H6GRk6dkjcwVD0E00Sg5laMWksSPSFnkH00L4RjQW6/bapzLL
   rzzYtLFh7xviqQio27ZkBsCSAtUQKY7sy6gZkDI4uvbbDNwNAZcWdxWwp
   8+GwqfRVgCbd1ZkkSOYle2kg72oZu+v9Y/BEDpSzzitj1qxJ1wLZ47DE0
   b/KQI/xJsOk6XT2uJ1QoLeR+U1tn5fGWZJ/AeFMx1a/snMqInbpqEC0/b
   h4UlKURfuaDtl4I8p1i5dTewVt7D3RZ9qRA4JTeJtYdtxCzfZCQ2JP6pK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354560670"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="354560670"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 15:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831735444"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="831735444"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Jun 2023 15:40:45 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4qyK-0002jr-2m;
	Thu, 01 Jun 2023 22:40:44 +0000
Date: Fri, 2 Jun 2023 06:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	rcu <rcu@vger.kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>
Subject: Re: [PATCH 3/9] rcu: Rename jiffies_till_flush to jiffies_lazy_flush
Message-ID: <202306020646.Ud0VLSIi-lkp@intel.com>
References: <20230531101736.12981-4-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531101736.12981-4-frederic@kernel.org>

Hi Frederic,

kernel test robot noticed the following build errors:

[auto build test ERROR on paulmck-rcu/dev]
[also build test ERROR on linus/master v6.4-rc4 next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frederic-Weisbecker/rcu-Assume-IRQS-disabled-from-rcu_report_dead/20230531-182004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
patch link:    https://lore.kernel.org/r/20230531101736.12981-4-frederic%40kernel.org
patch subject: [PATCH 3/9] rcu: Rename jiffies_till_flush to jiffies_lazy_flush
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306020646.Ud0VLSIi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c07a1bea9df8b80429d4e24052d83de94f5ee160
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frederic-Weisbecker/rcu-Assume-IRQS-disabled-from-rcu_report_dead/20230531-182004
        git checkout c07a1bea9df8b80429d4e24052d83de94f5ee160
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020646.Ud0VLSIi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/rcu/rcuscale.o: in function `kfree_scale_init':
   rcuscale.c:(.init.text+0xec): undefined reference to `rcu_get_jiffies_lazy_flush'
>> arm-linux-gnueabi-ld: rcuscale.c:(.init.text+0x104): undefined reference to `rcu_set_jiffies_lazy_flush'
   arm-linux-gnueabi-ld: rcuscale.c:(.init.text+0x170): undefined reference to `rcu_set_jiffies_lazy_flush'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
