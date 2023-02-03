Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B536AD5A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675453053; x=1706989053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LovRDsVzks1GFWLUV8L35ijuLTpUyETbcJIlQ66rkkQ=;
  b=Mn7S8x37lMTvPKpcw03kdftKqNbRtSOV+5ZH3ufOWAI7sc7apmLQkPKQ
   8hkx0fTc6HC6GR4iFwrUlmwy8TrYbq2M5ITG5wGHQtnuqAUyKk+95JoxR
   qCG1Y1xocDIX7e1SyWj7hy3Xz3KFryRdwOXr/RGs+UT9ruTmxm6LzbZ7i
   U2V+47SBTfM5cbCxr7rxDldP+grUrfn8IGcaRVThh6OUDxa+lhGZikFZd
   jD+8g6hkGIkZExajpzz4RwP21d8Av8ZRFyuSZ5mzJD20RwE1b0BaORBrL
   lf1L/lNncaVPr54CDDDYy6oxELs5d9pZewSofAHiBY473ZnxTOXyF7058
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328852492"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="328852492"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 11:37:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911259385"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="911259385"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 11:37:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO1s1-0000ix-0E;
	Fri, 03 Feb 2023 19:37:13 +0000
Date: Sat, 4 Feb 2023 03:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	eric.dumazet@gmail.com, Alexander Duyck <alexanderduyck@fb.com>,
	Soheil Hassas Yeganeh <soheil@google.com>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 4/4] net: add dedicated kmem_cache for
 typical/small skb->head
Message-ID: <202302040329.E10xZHbY-lkp@intel.com>
References: <20230202185801.4179599-5-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202185801.4179599-5-edumazet@google.com>

Hi Eric,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-add-SKB_HEAD_ALIGN-helper/20230203-031126
patch link:    https://lore.kernel.org/r/20230202185801.4179599-5-edumazet%40google.com
patch subject: [PATCH net-next 4/4] net: add dedicated kmem_cache for typical/small skb->head
config: arc-randconfig-r014-20230204 (https://download.01.org/0day-ci/archive/20230204/202302040329.E10xZHbY-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/002bb9238e98f3fbeb0402c97f711420c3321b93
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-Dumazet/net-add-SKB_HEAD_ALIGN-helper/20230203-031126
        git checkout 002bb9238e98f3fbeb0402c97f711420c3321b93
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/core/skbuff.c: In function 'kmalloc_reserve':
>> net/core/skbuff.c:503:23: error: 'KMALLOC_NOT_NORMAL_BITS' undeclared (first use in this function)
     503 |             !(flags & KMALLOC_NOT_NORMAL_BITS)) {
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:503:23: note: each undeclared identifier is reported only once for each function it appears in


vim +/KMALLOC_NOT_NORMAL_BITS +503 net/core/skbuff.c

   486	
   487	/*
   488	 * kmalloc_reserve is a wrapper around kmalloc_node_track_caller that tells
   489	 * the caller if emergency pfmemalloc reserves are being used. If it is and
   490	 * the socket is later found to be SOCK_MEMALLOC then PFMEMALLOC reserves
   491	 * may be used. Otherwise, the packet data may be discarded until enough
   492	 * memory is free
   493	 */
   494	static void *kmalloc_reserve(unsigned int *size, gfp_t flags, int node,
   495				     bool *pfmemalloc)
   496	{
   497		bool ret_pfmemalloc = false;
   498		unsigned int obj_size;
   499		void *obj;
   500	
   501		obj_size = SKB_HEAD_ALIGN(*size);
   502		if (obj_size <= SKB_SMALL_HEAD_CACHE_SIZE &&
 > 503		    !(flags & KMALLOC_NOT_NORMAL_BITS)) {
   504	
   505			/* skb_small_head_cache has non power of two size,
   506			 * likely forcing SLUB to use order-3 pages.
   507			 * We deliberately attempt a NOMEMALLOC allocation only.
   508			 */
   509			obj = kmem_cache_alloc_node(skb_small_head_cache,
   510					flags | __GFP_NOMEMALLOC | __GFP_NOWARN,
   511					node);
   512			if (obj) {
   513				*size = SKB_SMALL_HEAD_CACHE_SIZE;
   514				goto out;
   515			}
   516		}
   517		*size = obj_size = kmalloc_size_roundup(obj_size);
   518		/*
   519		 * Try a regular allocation, when that fails and we're not entitled
   520		 * to the reserves, fail.
   521		 */
   522		obj = kmalloc_node_track_caller(obj_size,
   523						flags | __GFP_NOMEMALLOC | __GFP_NOWARN,
   524						node);
   525		if (obj || !(gfp_pfmemalloc_allowed(flags)))
   526			goto out;
   527	
   528		/* Try again but now we are using pfmemalloc reserves */
   529		ret_pfmemalloc = true;
   530		obj = kmalloc_node_track_caller(obj_size, flags, node);
   531	
   532	out:
   533		if (pfmemalloc)
   534			*pfmemalloc = ret_pfmemalloc;
   535	
   536		return obj;
   537	}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
