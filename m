Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E7911193
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694040493; x=1725576493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Wlb5udvjKXip8Jt+PHIShNQsOIrXj1TqpblESAd0D0=;
  b=cWA3XCmEAnH+LHKyn4l19xzho4slvDe7cBAUr2FEryFeS8PYuxecpnK8
   zmaXB4TtHRQWYMrldZyKHLK6favBk5hj4FxyeCpZFRYso/2DqX3vh6WVi
   N3MUDSnMaZPYDQB1PcR78lDBAQS785lvBE8+7tkbbMeamgOWhb5RhWzUG
   DPrjhSwbytWCNm2aa24LzxBZWEYuwGnuzUM5AWKFu7euWugFr7fG8s/rc
   nwDWMopeCBO45NmXRDsXli4h3Pr0XiXhL5CZGMPrIhR11nf6Lt7yy9aMN
   psJ92oUkPX4roCclXH1uBp+DVjDsbG8Bv59T+ReWuvNx1RxkfLJ+iaH8+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376103971"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="376103971"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856650662"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856650662"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 15:48:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe1Jd-0000ev-19;
	Wed, 06 Sep 2023 22:48:05 +0000
Date: Thu, 7 Sep 2023 06:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Martino Fontana <tinozzo123@gmail.com>, djogorchock@gmail.com,
	jikos@kernel.org, benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Martino Fontana <tinozzo123@gmail.com>
Subject: Re: [PATCH v3] HID: nintendo: cleanup LED code
Message-ID: <202309070615.yjnCY1YM-lkp@intel.com>
References: <20230906141533.36921-1-tinozzo123@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906141533.36921-1-tinozzo123@gmail.com>

Hi Martino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.5 next-20230906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martino-Fontana/HID-nintendo-cleanup-LED-code/20230906-221818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230906141533.36921-1-tinozzo123%40gmail.com
patch subject: [PATCH v3] HID: nintendo: cleanup LED code
config: arc-randconfig-r033-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070615.yjnCY1YM-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070615.yjnCY1YM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070615.yjnCY1YM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/unaligned.h:12,
                    from drivers/hid/hid-nintendo.c:26:
   drivers/hid/hid-nintendo.c: In function 'joycon_leds_create':
>> include/linux/compiler.h:55:23: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/hid/hid-nintendo.c:1954:17: note: in expansion of macro 'if'
    1954 |                 if (ret)
         |                 ^~
   drivers/hid/hid-nintendo.c:1956:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1956 |                         return ret;
         |                         ^~~~~~
>> include/linux/compiler.h:55:23: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/hid/hid-nintendo.c:1986:17: note: in expansion of macro 'if'
    1986 |                 if (ret)
         |                 ^~
   drivers/hid/hid-nintendo.c:1988:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1988 |                         return ret;
         |                         ^~~~~~


vim +/if +55 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  49  
2bcd521a684cc9 Steven Rostedt 2008-11-21  50  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  52   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @55  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
