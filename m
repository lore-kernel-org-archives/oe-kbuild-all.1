Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B11FB42
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689956059; x=1721492059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aH3m108yH6BHsrVb/yjh1bqZKP1L63kPlBkY+rO7Y2I=;
  b=mVbl9TLPZZayssGsdQvaRa2fSaAP7XPoE1Y0lM8JmdF9iubuGJTbdOwb
   KbrOdw+EGhPWHv03JvsoYVhiTynlCARjdLa4OWmLJ5PvhZSgJkG9yt2iA
   LRb+rcokZZ8o8SzHf4611gcQppPDvS398fxbLQkbEz6apMM4jc3pGL3Cp
   1XfeIasut7FXvkpepsb43L5NfTgmhnPzsGmBbVKtn1HhbhMUnWRuuJcry
   7i3s6HLZywUxz0B4TMeFi3nKN2c1NnsdCFDCsgZnziDVjetEtuJkkl8TX
   50a4Xsq0RF4BuUWKGCEy7ZXXvPmhRwi5C6AqIUKbM2LnRgeUWKLYMH5Uo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369729371"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="369729371"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790245877"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="790245877"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2023 09:14:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMslZ-0007Qv-0v;
	Fri, 21 Jul 2023 16:14:05 +0000
Date: Sat, 22 Jul 2023 00:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Herve Codina <herve.codina@bootlin.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 1/1] minmax: Fix header inclusions
Message-ID: <202307212304.cH79zJp1-lkp@intel.com>
References: <20230721133932.12679-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721133932.12679-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on crng-random/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/minmax-Fix-header-inclusions/20230721-214152
base:   linus/master
patch link:    https://lore.kernel.org/r/20230721133932.12679-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] minmax: Fix header inclusions
config: um-randconfig-r021-20230720 (https://download.01.org/0day-ci/archive/20230721/202307212304.cH79zJp1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212304.cH79zJp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307212304.cH79zJp1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/minmax.h:5,
                    from arch/um/os-Linux/sigio.c:6:
>> include/linux/compiler.h:246:10: fatal error: asm/rwonce.h: No such file or directory
     246 | #include <asm/rwonce.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +246 include/linux/compiler.h

a9a3ed1eff3601 Borislav Petkov 2020-04-22  245  
e506ea451254ab Will Deacon     2019-10-15 @246  #include <asm/rwonce.h>
e506ea451254ab Will Deacon     2019-10-15  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
