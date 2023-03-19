Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69DEC6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679212685; x=1710748685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ppdh4iifqYLIrZddNDxRCBoQYih9sdNUZqKadkmqKT4=;
  b=TSYiPjBksS1DzVkbUAo1eI9jMoYtU9t11Y8D/v+aVdxV2Ln6iRQ548et
   Rh5YpeVImjTGhbZeJsT5ZUy/Hb+W/YcQCkjiC/ZUl4Fp4CQ9EnHZKVHUY
   oGsa6AGOawhVAPWgp0v2JcMewLQTZUJtjf9JRXevEOJcJng/zpqghcb88
   vPTev3oRQDoJg5BfF0/O5GGzn/PGE8etDXjHBi7LY8zn7o7eFxfUS4bq7
   VudM/325V4cQ8GkEOUc08PZFMBhRigFqUq3AZMfmbveq7LjJBFXplvHO8
   qonui5/wJ81uJaDxb/B34RPembrlOoSGpdqcdP64lCQkRnDKkxmNUOgBd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318888605"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318888605"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 00:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="683133057"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="683133057"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2023 00:58:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdnvX-000ASM-04;
	Sun, 19 Mar 2023 07:58:03 +0000
Date: Sun, 19 Mar 2023 15:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/uaccess/fixes 1/4] lib/usercopy_kunit.c:324:32: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202303191545.W1eQUf4m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/uaccess/fixes
head:   bcab174e50dd95f92848c50fdfec65390e201a4b
commit: ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6 [1/4] lib: test copy_{to,from}_user()
config: csky-randconfig-s041-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191545.W1eQUf4m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/uaccess/fixes
        git checkout ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191545.W1eQUf4m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/usercopy_kunit.c:144:6: sparse: sparse: symbol 'usercopy_test_exit' was not declared. Should it be static?
>> lib/usercopy_kunit.c:324:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *uptr @@
   lib/usercopy_kunit.c:324:32: sparse:     expected void *to
   lib/usercopy_kunit.c:324:32: sparse:     got void [noderef] __user *uptr
>> lib/usercopy_kunit.c:338:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void [noderef] __user *uptr @@
   lib/usercopy_kunit.c:338:40: sparse:     expected void const *from
   lib/usercopy_kunit.c:338:40: sparse:     got void [noderef] __user *uptr

vim +324 lib/usercopy_kunit.c

   315	
   316	static unsigned long do_copy_to_user(const struct usercopy_env *env,
   317					     const struct usercopy_params *params)
   318	{
   319		void __user *uptr = (void __user *)UBUF_ADDR_BASE + params->offset;
   320		void *kptr = env->kbuf;
   321		unsigned long ret;
   322	
   323		kthread_use_mm(env->mm);
 > 324		ret = raw_copy_to_user(uptr, kptr, params->size);
   325		kthread_unuse_mm(env->mm);
   326	
   327		return ret;
   328	}
   329	
   330	static unsigned long do_copy_from_user(const struct usercopy_env *env,
   331					       const struct usercopy_params *params)
   332	{
   333		void __user *uptr = (void __user *)UBUF_ADDR_BASE + params->offset;
   334		void *kptr = env->kbuf;
   335		unsigned long ret;
   336	
   337		kthread_use_mm(env->mm);
 > 338		ret = raw_copy_from_user(kptr, uptr, params->size);
   339		kthread_unuse_mm(env->mm);
   340	
   341		return ret;
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
