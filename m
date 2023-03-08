Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF11D3214
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678285849; x=1709821849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gJDTZyEK3j/ZE8w6WAM+8z7xHyz+7KOG9iq+h+iMPCA=;
  b=i/MyL2QeIbA+zuuGc+fkXKtAfRrJCsoQT//mULgPS26XzSvVcJx0rs+P
   8gPU0kzPpj58N+yb2YDfourc1Y+wSjDBad0lFJ9UZXSlxiRx0FlQ4xSzk
   490RSGhhMv02VsOfDRElgFVw8tpDkb/gO6kyUFRmS5T0c4edi+g/bW7BC
   793VAcCInCZKU6RrIHSlBU0hdIaY7MBuJtmnpOLdx6r17GOBuwFfIvQuI
   2EbO4YYTLXGF3izxO42GLTf8d2xkchnDdSjhpNkGbtb4ZxakvvO4QFQt0
   PHwK8LYR1cnl0ywklpJuCXt7Z49goyq30ZiYGpaPzq9h0cwok0aV8dkSp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338492536"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="338492536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:30:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820238349"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820238349"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 06:30:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZuoY-0002B9-21;
	Wed, 08 Mar 2023 14:30:46 +0000
Date: Wed, 8 Mar 2023 22:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net
Cc: oe-kbuild-all@lists.linux.dev, andrii@kernel.org, kernel-team@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v4 bpf-next 4/8] bpf: implement number iterator
Message-ID: <202303082250.AUFm2qRJ-lkp@intel.com>
References: <20230308035416.2591326-5-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308035416.2591326-5-andrii@kernel.org>

Hi Andrii,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-factor-out-fetching-basic-kfunc-metadata/20230308-115539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230308035416.2591326-5-andrii%40kernel.org
patch subject: [PATCH v4 bpf-next 4/8] bpf: implement number iterator
config: nios2-randconfig-r001-20230306 (https://download.01.org/0day-ci/archive/20230308/202303082250.AUFm2qRJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/19acf9ca01e2927a29d3235b3aa73598430dcb70
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrii-Nakryiko/bpf-factor-out-fetching-basic-kfunc-metadata/20230308-115539
        git checkout 19acf9ca01e2927a29d3235b3aa73598430dcb70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082250.AUFm2qRJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/bpf/bpf_iter.c: In function 'bpf_iter_num_new':
>> include/linux/compiler_types.h:399:45: error: call to '__compiletime_assert_426' declared with attribute error: BUILD_BUG_ON failed: __alignof__(struct bpf_iter_num_kern) != __alignof__(struct bpf_iter_num)
     399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:380:25: note: in definition of macro '__compiletime_assert'
     380 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
     399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/bpf/bpf_iter.c:794:9: note: in expansion of macro 'BUILD_BUG_ON'
     794 |         BUILD_BUG_ON(__alignof__(struct bpf_iter_num_kern) != __alignof__(struct bpf_iter_num));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_426 +399 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  397   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @399  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
