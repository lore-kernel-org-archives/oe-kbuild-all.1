Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC515CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682650156; x=1714186156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jvg5JLaJPpbnHG/0jtx3/2YEaCxkjotxxx2ADKhzFa8=;
  b=BNMfW4XXoGjToRUEjcpgVR4DAWRQxtcwu3N5744kc7WJu7Ti6HKf28bv
   fROtp0z52Msj45bEcoqggGZ4vvwsNAeFwZ5lbhUVh4mo9k1oQrN6sDC8W
   wkK4+mpa6of3gK20PHOtprIddmMYIKwx2mn5UqlEUKNxqJtCk1DTgsigp
   RHrN/AJKFXfDKmT1MUPB/6h/6qS5Gl/igLzjU7RKfHzQ/ceXA6dX0SnTN
   kPXm2LgmYJH8Py/e+50k4wsdjzAUBh94lk4yJ6K/2OIrPKD8m790uklo6
   CcmvPKLCzxXicrYb7GjDVhLq1HEvC4o9qzAC73PFvFRccQcZfVI4EPwl4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349652598"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="349652598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 19:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="725183383"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="725183383"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Apr 2023 19:49:14 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEAc-00002J-0e;
	Fri, 28 Apr 2023 02:49:14 +0000
Date: Fri, 28 Apr 2023 10:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
Message-ID: <202304281011.Gmu0ofeX-lkp@intel.com>
References: <20230428002009.2948020-8-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-8-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-8-vadfed%40meta.com
patch subject: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230428/202304281011.Gmu0ofeX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/896bf6147acb6644a9a3cf4825510821d86ba577
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout 896bf6147acb6644a9a3cf4825510821d86ba577
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281011.Gmu0ofeX-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/dev.c: In function 'netdev_dpll_pin_assign':
>> net/core/dev.c:8958:12: error: 'struct net_device' has no member named 'dpll_pin'
    8958 |         dev->dpll_pin = dpll_pin;
         |            ^~
--
   net/core/rtnetlink.c: In function 'rtnl_dpll_pin_size':
>> net/core/rtnetlink.c:1056:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1056 |         if (dev->dpll_pin)
         |                ^~
   net/core/rtnetlink.c:1057:53: error: 'const struct net_device' has no member named 'dpll_pin'
    1057 |                 size += dpll_msg_pin_handle_size(dev->dpll_pin);
         |                                                     ^~
   net/core/rtnetlink.c: In function 'rtnl_fill_dpll_pin':
   net/core/rtnetlink.c:1790:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1790 |         if (dev->dpll_pin) {
         |                ^~
   net/core/rtnetlink.c:1791:55: error: 'const struct net_device' has no member named 'dpll_pin'
    1791 |                 ret = dpll_msg_add_pin_handle(skb, dev->dpll_pin);
         |                                                       ^~


vim +8958 net/core/dev.c

  8954	
  8955	static void netdev_dpll_pin_assign(struct net_device *dev, struct dpll_pin *dpll_pin)
  8956	{
  8957		rtnl_lock();
> 8958		dev->dpll_pin = dpll_pin;
  8959		rtnl_unlock();
  8960	}
  8961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
