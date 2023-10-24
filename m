Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC23156CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzUx7tvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698135528; x=1729671528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v48sIpa1X29vBNvGm6d0VEKusqQt3B2steh71tepNwc=;
  b=ZzUx7tvCV1v2bx1nISJURodoScaxen/2Y+SGIapwi5Nc8SFdesOfirYw
   WTUUu+39fdAH1zvuS56TIB1/T52FYjH8HpNWjijrYLhL6ZgIZuPTzKXS3
   55uO3Z4kQqOp/k8+jJYJ7Ar7qgQbiEXR/lbldytzuOen659ea54wI55Ih
   5Mkr/h9ikxADdGV14JUUxsVHXFHmQsETGy4nR2IPi5/k998KLSOJukt6+
   nCpx4oHGIMvdbYNsouo/9exUZK01EcUj4leyU+cdnW9rfNpRaxfqzw+BS
   uzZGsgaJm3J4Ct2Ot0VbiKtcEVlRwoKB9b6/DholTrqyoKgWc+EDWMZY8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366354450"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="366354450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="734957761"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="734957761"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2023 01:18:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvCcd-0007hS-2F;
	Tue, 24 Oct 2023 08:18:43 +0000
Date: Tue, 24 Oct 2023 16:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 07/19] scsi: core: Add unit tests for
 scsi_call_prepare_resubmit()
Message-ID: <202310241654.76PxVmpQ-lkp@intel.com>
References: <20231023215638.3405959-8-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023215638.3405959-8-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.6-rc7 next-20231023]
[cannot apply to jejb-scsi/for-next mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Introduce-more-member-variables-related-to-zone-write-locking/20231024-060029
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20231023215638.3405959-8-bvanassche%40acm.org
patch subject: [PATCH v14 07/19] scsi: core: Add unit tests for scsi_call_prepare_resubmit()
config: x86_64-buildonly-randconfig-002-20231024 (https://download.01.org/0day-ci/archive/20231024/202310241654.76PxVmpQ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241654.76PxVmpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241654.76PxVmpQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/scsi/scsi_error_test.c: In function 'test_prepare_resubmit2':
>> drivers/scsi/scsi_error_test.c:138:45: warning: 'cmd1' is used uninitialized in this function [-Wuninitialized]
     138 |  BUILD_BUG_ON(scsi_cmd_to_rq(&cmd1->cmd) != &cmd1->rq);
         |                                             ^
   In file included from <command-line>:
>> include/linux/compiler_types.h:425:38: error: call to '__compiletime_assert_309' declared with attribute error: BUILD_BUG_ON failed: scsi_cmd_to_rq(&cmd1->cmd) != &cmd1->rq
     425 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:406:4: note: in definition of macro '__compiletime_assert'
     406 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:425:2: note: in expansion of macro '_compiletime_assert'
     425 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   drivers/scsi/scsi_error_test.c:138:2: note: in expansion of macro 'BUILD_BUG_ON'
     138 |  BUILD_BUG_ON(scsi_cmd_to_rq(&cmd1->cmd) != &cmd1->rq);
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_309 +425 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  411  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  414  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  415  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  419   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
