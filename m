Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D09125D7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686302707; x=1717838707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Pdlge8HOdOgXrhYJQZzSWtRLLf66oRiREo2GTdCF98=;
  b=KEIU8rg2syBfJ4rfWgfYAfefFsSAVJtW2m7oAdpaKfU4arkYRhkUaHAG
   un2kJlAPxI+XncdVR0ycFw4xsYXVTM08W+/8ABo1lnVchK0F7gKqm8nUY
   7yVJc9T/cBrDoZVNhB9Wq5BmeIhvP2tpCNmI0CLVPQ2Fg2QcAmfRz8UQo
   TLm/bn7v17y8dm4bapx21aC9rhSJSMFgaerMnMLIEvaDwgOirmYkHZlYN
   bCI76IQWl39+B7SfBkGve39Wti8t8nJgtHnpfe5wJFjoSRf/QOB9QhGre
   CBRrA9x1Val1/7iOSopt9snqAa5XgbepcTZFC5CPre/+aBgyTpB5cUX5u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="421151099"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="421151099"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="660706496"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="660706496"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jun 2023 02:25:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7YMf-0008tU-0p;
	Fri, 09 Jun 2023 09:25:01 +0000
Date: Fri, 9 Jun 2023 17:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@axis.com, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH] watchdog/mm: Allow dumping memory info in pretimeout
Message-ID: <202306091730.papweTh9-lkp@intel.com>
References: <20230608-pretimeout-oom-v1-1-542cc91062d7@axis.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608-pretimeout-oom-v1-1-542cc91062d7@axis.com>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9561de3a55bed6bdd44a12820ba81ec416e705a7]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Whitchurch/watchdog-mm-Allow-dumping-memory-info-in-pretimeout/20230609-144807
base:   9561de3a55bed6bdd44a12820ba81ec416e705a7
patch link:    https://lore.kernel.org/r/20230608-pretimeout-oom-v1-1-542cc91062d7%40axis.com
patch subject: [PATCH] watchdog/mm: Allow dumping memory info in pretimeout
config: i386-randconfig-i051-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091730.papweTh9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git checkout 9561de3a55bed6bdd44a12820ba81ec416e705a7
        b4 shazam https://lore.kernel.org/r/20230608-pretimeout-oom-v1-1-542cc91062d7@axis.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091730.papweTh9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__show_mem" [drivers/watchdog/pretimeout_panic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
