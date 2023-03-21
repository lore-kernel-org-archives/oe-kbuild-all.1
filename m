Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C871FB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 07:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679383521; x=1710919521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vmP8YZkQCvk6GSCT/H6gnlYQENOHcmfT0tCph+Nlogs=;
  b=GmnIMYRBDWOfhSOH/VgSqWfKje3CBazVIaZa40uw24d1iUuqaNnclavH
   h/DUCRzskWmqyV3ruCUN9/mVU5herBpOZJlw5AAFRmLKsVz59K7gKT0TF
   7x1/N4NdFaeKexljx3TOb2wWw8bZEP9ltGhYVmeR8G6LM5f8cN7TMaaBU
   eu6gExYaj3NQK0reRy5D4aLgIaEsMhrCX5pgvEVZ9acv2uWM6/Edww3+x
   74QbATBKmaF7G7Zyzori938KcPAkC5CvnFgEDW4t3gfzk9RcQ18GvkyTh
   nmIa9IuPMVHewfmxUdvWQEjxcIsvK8KAnJKLK27UfjSSv6ZuIPgz81+wa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322711880"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="322711880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683748124"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="683748124"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2023 00:25:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peWMv-000Bib-3D;
	Tue, 21 Mar 2023 07:25:17 +0000
Date: Tue, 21 Mar 2023 15:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <eric.dumazet@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev <netdev@vger.kernel.org>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next] net: introduce a config option to tweak
 MAX_SKB_FRAGS
Message-ID: <202303211526.EFNmCcfA-lkp@intel.com>
References: <20230321033704.936685-1-eric.dumazet@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321033704.936685-1-eric.dumazet@gmail.com>

Hi Eric,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-introduce-a-config-option-to-tweak-MAX_SKB_FRAGS/20230321-113826
patch link:    https://lore.kernel.org/r/20230321033704.936685-1-eric.dumazet%40gmail.com
patch subject: [PATCH net-next] net: introduce a config option to tweak MAX_SKB_FRAGS
config: sparc-randconfig-r004-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211526.EFNmCcfA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d0eaa3eabce1c80d067a739749e4253546417722
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-Dumazet/net-introduce-a-config-option-to-tweak-MAX_SKB_FRAGS/20230321-113826
        git checkout d0eaa3eabce1c80d067a739749e4253546417722
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash arch/sparc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211526.EFNmCcfA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/net_namespace.h:43,
                    from include/linux/inet.h:42,
                    from arch/sparc/kernel/setup_64.c:27:
   include/linux/skbuff.h:348:23: error: 'CONFIG_MAX_SKB_FRAGS' undeclared here (not in a function); did you mean 'MAX_SKB_FRAGS'?
     348 | #define MAX_SKB_FRAGS CONFIG_MAX_SKB_FRAGS
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:593:31: note: in expansion of macro 'MAX_SKB_FRAGS'
     593 |         skb_frag_t      frags[MAX_SKB_FRAGS];
         |                               ^~~~~~~~~~~~~
   include/linux/skbuff.h: In function '__skb_fill_page_desc_noacc':
>> include/linux/skbuff.h:2392:51: error: parameter 'i' set but not used [-Werror=unused-but-set-parameter]
    2392 |                                               int i, struct page *page,
         |                                               ~~~~^
   include/linux/skbuff.h: In function 'skb_frag_ref':
>> include/linux/skbuff.h:3380:58: error: parameter 'f' set but not used [-Werror=unused-but-set-parameter]
    3380 | static inline void skb_frag_ref(struct sk_buff *skb, int f)
         |                                                      ~~~~^
   include/linux/skbuff.h: In function 'skb_frag_unref':
   include/linux/skbuff.h:3411:60: error: parameter 'f' set but not used [-Werror=unused-but-set-parameter]
    3411 | static inline void skb_frag_unref(struct sk_buff *skb, int f)
         |                                                        ~~~~^
   include/linux/skbuff.h: In function 'skb_frag_set_page':
   include/linux/skbuff.h:3478:63: error: parameter 'f' set but not used [-Werror=unused-but-set-parameter]
    3478 | static inline void skb_frag_set_page(struct sk_buff *skb, int f,
         |                                                           ~~~~^
   arch/sparc/kernel/setup_64.c: At top level:
   arch/sparc/kernel/setup_64.c:615:13: error: no previous prototype for 'alloc_irqstack_bootmem' [-Werror=missing-prototypes]
     615 | void __init alloc_irqstack_bootmem(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from arch/sparc/kernel/idprom.c:13:
   include/linux/skbuff.h:348:23: error: 'CONFIG_MAX_SKB_FRAGS' undeclared here (not in a function); did you mean 'MAX_SKB_FRAGS'?
     348 | #define MAX_SKB_FRAGS CONFIG_MAX_SKB_FRAGS
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:593:31: note: in expansion of macro 'MAX_SKB_FRAGS'
     593 |         skb_frag_t      frags[MAX_SKB_FRAGS];
         |                               ^~~~~~~~~~~~~
   include/linux/skbuff.h: In function '__skb_fill_page_desc_noacc':
>> include/linux/skbuff.h:2392:51: error: parameter 'i' set but not used [-Werror=unused-but-set-parameter]
    2392 |                                               int i, struct page *page,
         |                                               ~~~~^
   include/linux/skbuff.h: In function 'skb_frag_ref':
>> include/linux/skbuff.h:3380:58: error: parameter 'f' set but not used [-Werror=unused-but-set-parameter]
    3380 | static inline void skb_frag_ref(struct sk_buff *skb, int f)
         |                                                      ~~~~^
   include/linux/skbuff.h: In function 'skb_frag_unref':
   include/linux/skbuff.h:3411:60: error: parameter 'f' set but not used [-Werror=unused-but-set-parameter]
    3411 | static inline void skb_frag_unref(struct sk_buff *skb, int f)
         |                                                        ~~~~^
   include/linux/skbuff.h: In function 'skb_frag_set_page':
   include/linux/skbuff.h:3478:63: error: parameter 'f' set but not used [-Werror=unused-but-set-parameter]
    3478 | static inline void skb_frag_set_page(struct sk_buff *skb, int f,
         |                                                           ~~~~^
   cc1: all warnings being treated as errors


vim +/i +2392 include/linux/skbuff.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  2390  
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2391  static inline void __skb_fill_page_desc_noacc(struct skb_shared_info *shinfo,
84ce071e38a6e2 Pavel Begunkov 2022-07-12 @2392  					      int i, struct page *page,
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2393  					      int off, int size)
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2394  {
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2395  	skb_frag_t *frag = &shinfo->frags[i];
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2396  
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2397  	/*
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2398  	 * Propagate page pfmemalloc to the skb if we can. The problem is
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2399  	 * that not all callers have unique ownership of the page but rely
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2400  	 * on page_is_pfmemalloc doing the right thing(tm).
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2401  	 */
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2402  	frag->bv_page		  = page;
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2403  	frag->bv_offset		  = off;
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2404  	skb_frag_size_set(frag, size);
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2405  }
84ce071e38a6e2 Pavel Begunkov 2022-07-12  2406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
