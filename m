Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02E7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 00:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692749153; x=1724285153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CqhsR3cCwMICwKWbO2Th/8iw57zcWgQH5CzC/y9uWrI=;
  b=PhvlSq4xaWR93NObTUCzPHghB3mbD33QCF3Jr7NL+w8oAu3e1tAIsSQl
   gMpe3pfM0w0MY4jurkskLIfxJt1qaOgfgfoGbxMQJVynN4SQkznBhbdAo
   BsRJiKluBftsaXOsfYifD0jQFspQB0BG4Sd+1gme3MV037dt3U/mjNXXc
   wn3hlgbeyerBHY83ZRu0p9B/CPq4BCTrIgjcfpUgV2lmw8Hu41Bo4mxw3
   5cYmb+UjqTu+7hDbsZwAUFlL1CFuKYFqKRfwrH/TMqrwJIycPRywZoaZz
   SOgRFE6Z3T/qL7ghzPRP9vy7AkEOO9JVffdjKBcY9U/F49BeQRjijyuH5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372910963"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372910963"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 17:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983070483"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="983070483"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 17:05:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYbNe-0000dg-28;
	Wed, 23 Aug 2023 00:05:50 +0000
Date: Wed, 23 Aug 2023 08:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 17417/29943] gcc-7: error:
 unrecognized command line option '-fsanitize-coverage=trace-cmp'; did you
 mean '-fsanitize-coverage=trace-pc'?
Message-ID: <202308230830.YD8ZrMlb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   6904826e1ac9739626b937fd85e37cf539fec91b
commit: c093b585dac3962f3a54772bc8ef2031bd1f1990 [17417/29943] BACKPORT: kcov: test compiler capability in Kconfig and correct dependency
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230830.YD8ZrMlb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230830.YD8ZrMlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230830.YD8ZrMlb-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/purgatory/entry64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>> gcc-7: error: unrecognized command line option '-fsanitize-coverage=trace-cmp'; did you mean '-fsanitize-coverage=trace-pc'?
   make[2]: *** [./Kbuild:22: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1205: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
