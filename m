Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE68F63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674595823; x=1706131823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvf8/qppV9zLHec4Hueo9vwwXazqHJQwdnG/wB+9rOI=;
  b=F4rCxcuaWAYmlzMV/FwxQtmnJ5lEB8AfLEAzTlMhA9lt65D+sPk+lQSw
   ntFSTW4yvsDUMRqf3uSyApk+i1Gl9R22t3QxulavNWpVsyW3yAG2SZu5L
   joquka8IHpM43ec5ixYWQ21GXn5sxVqyFUM9YHW1IGekuSAZb87YNh+CV
   X1hUAwRF+Lg1cUHX32ncCGY04VlDD3g/Mqz8wn8RI9zvYMLIvKT+4CtMJ
   umVO1Iv2ljoIL55sVKlcJcbVUmHQ+Kb4UcXReXEp1s2SzS67GCpsnkrHT
   E/PghT13BBIpkxLS4WvnIOqdEg1aO3lsErn2D6mc1pb+vLZYopEag6h6C
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="314312674"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="314312674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 13:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612182893"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="612182893"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2023 13:30:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKQs1-0006nK-2c;
	Tue, 24 Jan 2023 21:30:21 +0000
Date: Wed, 25 Jan 2023 05:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 14/20] p4tc: add header field create, get,
 delete, flush and dump
Message-ID: <202301250526.V2Tb4B4w-lkp@intel.com>
References: <20230124170510.316970-14-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124170510.316970-14-jhs@mojatatu.com>

Hi Jamal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
patch link:    https://lore.kernel.org/r/20230124170510.316970-14-jhs%40mojatatu.com
patch subject: [PATCH net-next RFC 14/20] p4tc: add header field create, get, delete, flush and dump
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230125/202301250526.V2Tb4B4w-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b506de0b504b609d56bc074de9f1e59efa773d0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
        git checkout 5b506de0b504b609d56bc074de9f1e59efa773d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/kparser/ net/sched/p4tc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/sched/p4tc/p4tc_parser_api.c:128:6: warning: no previous prototype for '__tcf_parser_put' [-Wmissing-prototypes]
     128 | void __tcf_parser_put(struct p4tc_parser *parser)
         |      ^~~~~~~~~~~~~~~~


vim +/__tcf_parser_put +128 net/sched/p4tc/p4tc_parser_api.c

   127	
 > 128	void __tcf_parser_put(struct p4tc_parser *parser)
   129	{
   130		kparser_put_parser(parser->kparser, false);
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
