Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B207C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 00:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678237170; x=1709773170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qlFeyJbGkus8Q9ptXLaGon1pLV0mL7COWu3geujENFw=;
  b=arvOSA/JweecjNs+GK87RsG+KOEp+KNLR0uKKPFdbEPfMUKFznSF8bma
   7WQgrfskEWOGxXPLyQ4vN8V/CtJneVKEAqWCgVeGNzA/jCT4vC2slpMkq
   nGFfaCIw9xFHQZt2jb8fn7KqrCTRu7OQJ5SX/XWqBpYyKd5pCa9o+r/wg
   WBdyvPs40ky4CLwwQPoQitj1m8J3wsHNB5YzP+c4TZWn+6TtDTIY2cYLy
   /3JwZEyCe0K+m4Vf55mj30GHDVCWmeqINNygVOnyVDKggVJsyukDOjuCZ
   IrOKWmFbnORm0XaiO9R74wviKUJqekHHgZGC9ifiC1Jl7437G0mFnxIEP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337536611"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="337536611"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 16:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745715554"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="745715554"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 16:59:29 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZi9Q-0001jz-1D;
	Wed, 08 Mar 2023 00:59:28 +0000
Date: Wed, 8 Mar 2023 08:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 03/10] media: v4l: async: Simplify async sub-device fwnode
 matching
Message-ID: <202303080828.3N8gyCMH-lkp@intel.com>
References: <20230307212038.968381-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307212038.968381-4-sakari.ailus@linux.intel.com>

Hi Sakari,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on media-tree/master]
[also build test WARNING on tegra/for-next rockchip/for-next linus/master v6.3-rc1 next-20230307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-async-Return-async-sub-devices-to-subnotifier-list/20230308-053012
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230307212038.968381-4-sakari.ailus%40linux.intel.com
patch subject: [RFC 03/10] media: v4l: async: Simplify async sub-device fwnode matching
config: sparc-buildonly-randconfig-r001-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080828.3N8gyCMH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c19cc215211fbc384cd8657174ab3d90f784b3f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/media-v4l-async-Return-async-sub-devices-to-subnotifier-list/20230308-053012
        git checkout c19cc215211fbc384cd8657174ab3d90f784b3f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080828.3N8gyCMH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/div64.h:27,
                    from ./arch/sparc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22,
                    from drivers/media/i2c/max9286.c:13:
   drivers/media/i2c/max9286.c: In function 'max9286_v4l2_register':
>> include/linux/compiler.h:56:23: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/media/i2c/max9286.c:1096:9: note: in expansion of macro 'if'
    1096 |         if (ret < 0)
         |         ^~
   drivers/media/i2c/max9286.c:1098:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1098 |                 goto err_async;
         |                 ^~~~
   drivers/media/i2c/max9286.c:1098:17: error: label 'err_async' used but not defined
   drivers/media/i2c/max9286.c: At top level:
   drivers/media/i2c/max9286.c:1101:9: error: expected identifier or '(' before 'return'
    1101 |         return 0;
         |         ^~~~~~
   drivers/media/i2c/max9286.c:1103:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
    1103 | err_async:
         |          ^
   drivers/media/i2c/max9286.c:1105:9: warning: data definition has no type or storage class
    1105 |         max9286_v4l2_notifier_unregister(priv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c:1105:9: error: type defaults to 'int' in declaration of 'max9286_v4l2_notifier_unregister' [-Werror=implicit-int]
   drivers/media/i2c/max9286.c:1105:9: warning: parameter names (without types) in function declaration
   drivers/media/i2c/max9286.c:1105:9: error: conflicting types for 'max9286_v4l2_notifier_unregister'; have 'int()'
   drivers/media/i2c/max9286.c:778:13: note: previous definition of 'max9286_v4l2_notifier_unregister' with type 'void(struct max9286_priv *)'
     778 | static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c:1107:9: error: expected identifier or '(' before 'return'
    1107 |         return ret;
         |         ^~~~~~
   drivers/media/i2c/max9286.c:1108:1: error: expected identifier or '(' before '}' token
    1108 | }
         | ^
   drivers/media/i2c/max9286.c:778:13: warning: 'max9286_v4l2_notifier_unregister' defined but not used [-Wunused-function]
     778 | static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/if +56 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  50  
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  52  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  55   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @56  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
