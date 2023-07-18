Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA51125D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689695398; x=1721231398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EzplRbbTsNCEBtVNsJhzJPpcHTPhq5P6ocW0vewx3Io=;
  b=ega1nZMkbQH/+c32XMIvLN5Sq3mRKNrm7viTzXNuXOV3xmm2FqzTAByo
   aZ0SD5MxDaQiB5i5XNRVZy910aZOD43rBbteVBtDwsE5jInoJGqPyv7EP
   fEJ5JGU09ofeA/wP6JCsq8ffZXc+ZddAUqZIQpXZnlQd8YfX7rTCVuP8p
   FoqBbd9HubugGBzHQM6fClaJRo8g46dRhUm29WTHvwpTVlzDicrZ9wBhk
   xXXxE5KMH2XAwUI/ogW+X/77aU+UGNBnjmXJ1KlQkI7dIqunAlJ7BEddS
   KJoghlPuuA6JkwvkYUoazkVPxZOVLRYcjpxZXKQgiUqpiZA0ifDJWk63X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345833933"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="345833933"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 08:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054338291"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="1054338291"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2023 08:49:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLmxN-0000h9-38;
	Tue, 18 Jul 2023 15:49:45 +0000
Date: Tue, 18 Jul 2023 23:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: isaku.yamahata@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] KVM: x86: Make struct sev_cmd common for
 KVM_MEM_ENC_OP
Message-ID: <202307182309.gg6HifN9-lkp@intel.com>
References: <2f296c5a255936b92cffde5e7d6414edfb93f660.1689645293.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f296c5a255936b92cffde5e7d6414edfb93f660.1689645293.git.isaku.yamahata@intel.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 831fe284d8275987596b7d640518dddba5735f61]

url:    https://github.com/intel-lab-lkp/linux/commits/isaku-yamahata-intel-com/KVM-x86-Make-struct-sev_cmd-common-for-KVM_MEM_ENC_OP/20230718-185857
base:   831fe284d8275987596b7d640518dddba5735f61
patch link:    https://lore.kernel.org/r/2f296c5a255936b92cffde5e7d6414edfb93f660.1689645293.git.isaku.yamahata%40intel.com
patch subject: [RFC PATCH] KVM: x86: Make struct sev_cmd common for KVM_MEM_ENC_OP
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307182309.gg6HifN9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307182309.gg6HifN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307182309.gg6HifN9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/x86/kvm/svm/sev.c: In function 'sev_mem_enc_ioctl':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_745' declared with attribute error: BUILD_BUG_ON failed: sizeof(*sev_cmd) != sizeof(*cmd)
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
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:1844:9: note: in expansion of macro 'BUILD_BUG_ON'
    1844 |         BUILD_BUG_ON(sizeof(*sev_cmd) != sizeof(*cmd));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_745 +397 include/linux/compiler_types.h

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
https://github.com/intel/lkp-tests/wiki
