Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838192F4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682351705; x=1713887705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DsOwhW7xkjoYUE+KJ3p/157fGcrTlibCTzP5r8jmQaU=;
  b=ZU0jvKEbsV44TPxzKThD+fwSTCAEir1y8VvK67whH/jjZbAi5Dy8IoH9
   bPrWeeamaZz4MmE98Xa6UzLwlChrlAvV61BtZReupRhSD/3IHMvBRuEcj
   hMsFhx/M4akNgwHNr1IcIQQLP4qNWyTlveApyy868a0CpQ5p68mUttsL5
   nKxKHc62mF0fS9L9sgnthBjrN0J+pmb6XwNq6JERI0oY2GrazvknxHHdP
   Wh+dKYwCwlQPBN+qLiGGMGWJvCrr4KXG7NUGvotEaea4m5dl6j1gI9vvA
   CCaKlhVtufdo95GyqFN3ijYHxl2wiG6Pgs2/wKwOJii32hBhwicMcIJU9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="348398347"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="348398347"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 08:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939371894"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="939371894"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2023 08:54:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqyWi-000iUk-2l;
	Mon, 24 Apr 2023 15:54:52 +0000
Date: Mon, 24 Apr 2023 23:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: liuwf <liuwf@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: Library: [RFC PATCH] btree_blue - a btree with linear travesal
 function and more
Message-ID: <202304242348.N3Y7q2O0-lkp@intel.com>
References: <6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel@mailbox.org>

Hi liuwf,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liuwf/Library-RFC-PATCH-btree_blue-a-btree-with-linear-travesal-function-and-more/20230424-214853
base:   linus/master
patch link:    https://lore.kernel.org/r/6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel%40mailbox.org
patch subject: Library: [RFC PATCH] btree_blue - a btree with linear travesal function and more
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230424/202304242348.N3Y7q2O0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/749f2fb7789008fd7bb23287c37f4f5aaed09f25
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review liuwf/Library-RFC-PATCH-btree_blue-a-btree-with-linear-travesal-function-and-more/20230424-214853
        git checkout 749f2fb7789008fd7bb23287c37f4f5aaed09f25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304242348.N3Y7q2O0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/btree_blue.c:109:5: warning: no previous prototype for 'getpos' [-Wmissing-prototypes]
     109 | int getpos(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
         |     ^~~~~~
>> lib/btree_blue.c:144:5: warning: no previous prototype for 'geteqv' [-Wmissing-prototypes]
     144 | int geteqv(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
         |     ^~~~~~
>> lib/btree_blue.c:392:7: warning: no previous prototype for 'btree_blue_prev_or_next' [-Wmissing-prototypes]
     392 | void *btree_blue_prev_or_next(struct btree_blue_head *head,
         |       ^~~~~~~~~~~~~~~~~~~~~~~
   lib/btree_blue.c:277:12: warning: 'geteqv_bin' defined but not used [-Wunused-function]
     277 | static int geteqv_bin(struct btree_blue_head *head,
         |            ^~~~~~~~~~
   lib/btree_blue.c:255:12: warning: 'getpos_bin' defined but not used [-Wunused-function]
     255 | static int getpos_bin(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
         |            ^~~~~~~~~~


vim +/getpos +109 lib/btree_blue.c

   108	
 > 109	int getpos(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
   110	{
   111		int i, o, x, nr, p, c;
   112	
   113		nr = cb->slots_info.slots_nr;
   114		x = nr / 8;
   115	
   116		for (i = 1; i <= x; i++) {
   117			p = i * 8 - 1;
   118			c = keycmp(head, cb, p, key);
   119			if (c < 0) {
   120				o = (i - 1) * 8;
   121				for (i = 0; i < 7; i++) {
   122					p = o + i;
   123					c = keycmp(head, cb, p, key);
   124					if (c <= 0) {
   125						return p;
   126					}
   127				}
   128				return o + 7;
   129			} else if (c == 0)
   130				return p;
   131		}
   132		
   133		o = x * 8;
   134		for (i = 0; i < nr % 8; i++) {
   135			p =  o + i;
   136			c = keycmp(head, cb, p, key);
   137			if (c <= 0)
   138				return p;
   139		}
   140	
   141		return nr;
   142	}
   143	
 > 144	int geteqv(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
   145	{
   146		int i, o, x, nr, p, c;
   147	
   148		nr = cb->slots_info.slots_nr;
   149		x = nr / 8;
   150	
   151		for (i = 1; i <= x; i++) {
   152			p = i * 8 - 1;
   153			c = keycmp(head, cb, p, key);
   154			if (c < 0) {
   155				o = (i - 1) * 8;
   156				for (i = 0; i < 7; i++) {
   157					p =  o + i;
   158					c = keycmp(head, cb, p, key);
   159					if (c != 0)
   160						continue;
   161					else
   162						return p;
   163				}
   164				return nr;
   165			} else if (c == 0)
   166				return p;
   167		}
   168		
   169		o = x * 8;
   170		for (i = 0; i < nr % 8; i++) {
   171			p =  o + i;
   172			c = keycmp(head, cb, p, key);
   173			if (c == 0)
   174				return p;
   175		}
   176	
   177		return nr;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
