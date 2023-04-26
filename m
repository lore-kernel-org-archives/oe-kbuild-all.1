Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338DE4C8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682526062; x=1714062062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rB78a7/A6GTI6b2Cqo+eMAXNPCKBcL/FsCAwDCEQlv0=;
  b=QO5KqCy45L8ezIwGVlMwj95+LvGThSH5fPg3y0HCJzQfx3vnYd5VLGV3
   hXgMUytRMNUqN/35KlPs/w9nOBngHO4O8xTz5XtXt6FsHTL6WPJu2g78v
   ycYGUWsZbt+wSQGTuveeeOROtfbFglkGpA/aO8fvEjcIr5Z9aFapMuz9D
   n9dYo0EEfwqEiabqaP9tB2husnWnyVNe+eVDwEPVp/LhskkkmmomPsxvL
   zt5WSKC/EXDNGhSl93rGWWHrmyKFDd0S5K0tYcLnEoTXY82dPzEapzaNR
   UFERsdw2zwIQHeL4OoP2gN+qAH+dnKa+CGugN2CsMqHzom1d4cI53pam4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349096957"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="349096957"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 09:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805571097"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="805571097"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 09:20:44 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prhsp-0000Mc-1m;
	Wed, 26 Apr 2023 16:20:43 +0000
Date: Thu, 27 Apr 2023 00:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/3] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Message-ID: <202304270027.e1pd32ns-lkp@intel.com>
References: <b4d60f3408f8fe839933fa3938ecdc9bfceb75d7.1682513390.git.oleksii_moisieiev@epam.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d60f3408f8fe839933fa3938ecdc9bfceb75d7.1682513390.git.oleksii_moisieiev@epam.com>

Hi Oleksii,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3 next-20230425]
[cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksii-Moisieiev/pinctrl-Implementation-of-the-generic-scmi-pinctrl-driver/20230426-222739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/b4d60f3408f8fe839933fa3938ecdc9bfceb75d7.1682513390.git.oleksii_moisieiev%40epam.com
patch subject: [RFC v2 1/3] firmware: arm_scmi: Add SCMI v3.2 pincontrol protocol basic support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230427/202304270027.e1pd32ns-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d75721913de292ab464a1580633f927a5dd86fde
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksii-Moisieiev/pinctrl-Implementation-of-the-generic-scmi-pinctrl-driver/20230426-222739
        git checkout d75721913de292ab464a1580633f927a5dd86fde
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/firmware/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270027.e1pd32ns-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'scmi_pinctrl_function_select',
       inlined from 'scmi_pinctrl_set_mux' at drivers/firmware/arm_scmi/pinctrl.c:750:9:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_501' declared with attribute error: FIELD_PREP: value too large for the field
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/pinctrl.c:14:21: note: in expansion of macro 'FIELD_PREP'
      14 | #define SET_TYPE(x) FIELD_PREP(GENMASK(1, 0), (x))
         |                     ^~~~~~~~~~
   drivers/firmware/arm_scmi/pinctrl.c:470:21: note: in expansion of macro 'SET_TYPE'
     470 |         tx->flags = SET_TYPE(cpu_to_le32(type));
         |                     ^~~~~~~~


vim +/__compiletime_assert_501 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
