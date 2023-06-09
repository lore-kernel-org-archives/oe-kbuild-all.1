Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB619E52
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686331901; x=1717867901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3KRhN/tyqwQs8OSqKathPTJ9l/GDjc6KVCoDBxLBh38=;
  b=W0kkZDgbHvZONqP9H0JAZCkr2nlL8oRmY7BM+xbzJx928tHpkBqZPcDx
   lI1Yxpf8rx5U/+te55DLG8jzhCGI3EKL48BEduEbplzJO+D/QLJeObPyh
   mv/O40MzJuG0IZoBDtMaFiDVKHrrJR0mljSnjwg2HykYFO0wtv0BQoSFU
   /JYlg4yPEWWoLj0+rz4ADiGlj2SxcCtJalQQIlGm/WAimOMmxsC6zDJnT
   2AUiA1PFTNnDNMFXorDV3ptgtsBejpIJ/3u9LsczRo/b7MEIRCpWxiBiF
   8RVQxGDD1x3VkqQ5b+wAHh1BGZfJK9ksUnVApGoE38PtiZPCvyl/O0EcI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="421242033"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="421242033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 10:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775584267"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="775584267"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2023 10:31:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7fxZ-0009G8-1t;
	Fri, 09 Jun 2023 17:31:37 +0000
Date: Sat, 10 Jun 2023 01:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v8 06/10] netdev: expose DPLL pin
 handle for netdevice
Message-ID: <202306100147.TAy88mnU-lkp@intel.com>
References: <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>

Hi Arkadiusz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue net-next/main net/main linus/master v6.4-rc5]
[cannot apply to next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/dpll-documentation-on-DPLL-subsystem-interface/20230609-202453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230609121853.3607724-7-arkadiusz.kubalewski%40intel.com
patch subject: [Intel-wired-lan] [RFC PATCH v8 06/10] netdev: expose DPLL pin handle for netdevice
config: parisc-buildonly-randconfig-r005-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100147.TAy88mnU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch tnguy-next-queue dev-queue
        git checkout tnguy-next-queue/dev-queue
        b4 shazam https://lore.kernel.org/r/20230609121853.3607724-7-arkadiusz.kubalewski@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash net/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100147.TAy88mnU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from net/core/rtnetlink.c:15:
   net/core/rtnetlink.c: In function 'rtnl_dpll_pin_size':
>> net/core/rtnetlink.c:1059:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1059 |         if (dev->dpll_pin)
         |                ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   net/core/rtnetlink.c:1059:9: note: in expansion of macro 'if'
    1059 |         if (dev->dpll_pin)
         |         ^~
>> net/core/rtnetlink.c:1059:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1059 |         if (dev->dpll_pin)
         |                ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   net/core/rtnetlink.c:1059:9: note: in expansion of macro 'if'
    1059 |         if (dev->dpll_pin)
         |         ^~
>> net/core/rtnetlink.c:1059:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1059 |         if (dev->dpll_pin)
         |                ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   net/core/rtnetlink.c:1059:9: note: in expansion of macro 'if'
    1059 |         if (dev->dpll_pin)
         |         ^~
   net/core/rtnetlink.c:1060:53: error: 'const struct net_device' has no member named 'dpll_pin'
    1060 |                 size += dpll_msg_pin_handle_size(dev->dpll_pin);
         |                                                     ^~
   net/core/rtnetlink.c: In function 'rtnl_fill_dpll_pin':
   net/core/rtnetlink.c:1793:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1793 |         if (dev->dpll_pin) {
         |                ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   net/core/rtnetlink.c:1793:9: note: in expansion of macro 'if'
    1793 |         if (dev->dpll_pin) {
         |         ^~
   net/core/rtnetlink.c:1793:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1793 |         if (dev->dpll_pin) {
         |                ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   net/core/rtnetlink.c:1793:9: note: in expansion of macro 'if'
    1793 |         if (dev->dpll_pin) {
         |         ^~
   net/core/rtnetlink.c:1793:16: error: 'const struct net_device' has no member named 'dpll_pin'
    1793 |         if (dev->dpll_pin) {
         |                ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   net/core/rtnetlink.c:1793:9: note: in expansion of macro 'if'
    1793 |         if (dev->dpll_pin) {
         |         ^~
   net/core/rtnetlink.c:1794:55: error: 'const struct net_device' has no member named 'dpll_pin'
    1794 |                 ret = dpll_msg_add_pin_handle(skb, dev->dpll_pin);
         |                                                       ^~


vim +1059 net/core/rtnetlink.c

  1054	
  1055	static size_t rtnl_dpll_pin_size(const struct net_device *dev)
  1056	{
  1057		size_t size = nla_total_size(0); /* nest IFLA_DPLL_PIN */
  1058	
> 1059		if (dev->dpll_pin)
  1060			size += dpll_msg_pin_handle_size(dev->dpll_pin);
  1061	
  1062		return size;
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
