Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1417E2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDJdBNka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699072487; x=1730608487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rbLklNc9cpSb1Dtx2oseSFeF/6b1ZscT41HU2S8HYZQ=;
  b=RDJdBNkaX372fCZJM5qZ2atFxpruj7r9ZR1KDehwRcBqCUNEkBr0ar5T
   p5LdmoJ8A6EO2XPh0eIffuuy2oKWf6xCfbIgByAKyBczApPLUBzIUbyCk
   V7aIUMduJEnDI1g++ocRbDQkPS7bw2nT/4Ywwx03tZTXd1uAvPSWwUIEx
   6X6QQgLsA/MYVoQrwXoj/xQka4lIwUk5GgUgkFLSQ2miTz97QHJ6W+S5/
   cddVVw1gto+9SqVZPe7wkB6agkGuqb+JnpLMC6lh4EUNCFdZMfASSPKHp
   vJ1ka2SMlrZs720yvF8X4/Pj1GfKAA/ibmOhgnnBZ443KX8cCevjFx+IU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369266516"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369266516"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 21:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832216470"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="832216470"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 21:34:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8Mq-0003QA-0t;
	Sat, 04 Nov 2023 04:34:40 +0000
Date: Sat, 4 Nov 2023 12:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
	Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guenter Roeck <groeck@google.com>,
	Yaniv Tzoreff <yanivt@google.com>, Benson Leung <bleung@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Vincent Whitchurch <vincent.whitchurch@axis.com>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v1 10/12] dyndbg: add processing of T(race) flag argument
Message-ID: <202311041243.SboyHnXN-lkp@intel.com>
References: <20231103131011.1316396-11-lb@semihalf.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103131011.1316396-11-lb@semihalf.com>

Hi Łukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ukasz-Bartosik/dyndbg-add-_DPRINTK_FLAGS_ENABLED/20231103-212105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231103131011.1316396-11-lb%40semihalf.com
patch subject: [PATCH v1 10/12] dyndbg: add processing of T(race) flag argument
config: i386-randconfig-063-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041243.SboyHnXN-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041243.SboyHnXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041243.SboyHnXN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:157:6: sparse: sparse: symbol 'show_T_args' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
