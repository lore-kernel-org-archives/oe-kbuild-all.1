Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF87C208AB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCSaFUeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702050075; x=1733586075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kuKy0uSZ2sgf2WUnRwww3AtGWNiQbLKjTQKgA9l/IGM=;
  b=NCSaFUeL8Y9m3rC473AW2ndGet8UdaZx0mHFuvoCnogYQzTZG9PtKpD9
   0x9HRDl5EYcoiy9PtEn9i5AhQvxcrfgnMPsAe/U931Ss6YjB2V6DGaCbo
   V4dQAdXFO3BVQ/QVr1jhS/7nW9eLaqpRoHykHMP6UtDV9NTI5fiZAYCkO
   7jZStrsGT5zdFiODpikcZ2Bxv69JEz8XnmShWwTc/zPnkXo2jGqmavCLR
   jchvNh22gfg345gQz8G40fqzkoweyCV6Lg6bUuuMEzNQntA06h215im7d
   t5joKW3MO8rW5eW64rHCM36FgKLsz5BCJvub1Sv7PM6kemGJXG9s8s0M+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1276369"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1276369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 07:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="20136875"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Dec 2023 07:40:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBcyG-000DuV-07;
	Fri, 08 Dec 2023 15:40:56 +0000
Date: Fri, 8 Dec 2023 23:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>,
	Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Mina Almasry <almasrymina@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
	David Ahern <dsahern@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Shakeel Butt <shakeelb@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [net-next v1 06/16] netdev: support binding dma-buf to netdevice
Message-ID: <202312082303.bCpeCR0q-lkp@intel.com>
References: <20231208005250.2910004-7-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208005250.2910004-7-almasrymina@google.com>

Hi Mina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/net-page_pool-factor-out-releasing-DMA-from-releasing-the-page/20231208-085531
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231208005250.2910004-7-almasrymina%40google.com
patch subject: [net-next v1 06/16] netdev: support binding dma-buf to netdevice
config: m68k-randconfig-r071-20231208 (https://download.01.org/0day-ci/archive/20231208/202312082303.bCpeCR0q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312082303.bCpeCR0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312082303.bCpeCR0q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:17,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c: In function '__netdev_dmabuf_binding_free':
>> net/core/dev.c:2071:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2071 |         if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2072 |                   size, avail))
         |                   ~~~~            
         |                   |
         |                   size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/asm-generic/bug.h:176:9: note: in expansion of macro 'no_printk'
     176 |         no_printk(format);                                              \
         |         ^~~~~~~~~
   net/core/dev.c:2071:14: note: in expansion of macro 'WARN'
    2071 |         if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
         |              ^~~~
   net/core/dev.c:2071:65: note: format string is defined here
    2071 |         if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
         |                                                               ~~^
         |                                                                 |
         |                                                                 long unsigned int
         |                                                               %u
   net/core/dev.c:2071:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2071 |         if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2072 |                   size, avail))
         |                         ~~~~~     
         |                         |
         |                         size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/asm-generic/bug.h:176:9: note: in expansion of macro 'no_printk'
     176 |         no_printk(format);                                              \
         |         ^~~~~~~~~
   net/core/dev.c:2071:14: note: in expansion of macro 'WARN'
    2071 |         if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
         |              ^~~~
   net/core/dev.c:2071:76: note: format string is defined here
    2071 |         if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
         |                                                                          ~~^
         |                                                                            |
         |                                                                            long unsigned int
         |                                                                          %u


vim +2071 net/core/dev.c

  2060	
  2061	void __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *binding)
  2062	{
  2063		size_t size, avail;
  2064	
  2065		gen_pool_for_each_chunk(binding->chunk_pool,
  2066					netdev_dmabuf_free_chunk_owner, NULL);
  2067	
  2068		size = gen_pool_size(binding->chunk_pool);
  2069		avail = gen_pool_avail(binding->chunk_pool);
  2070	
> 2071		if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
  2072			  size, avail))
  2073			gen_pool_destroy(binding->chunk_pool);
  2074	
  2075		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
  2076					 DMA_BIDIRECTIONAL);
  2077		dma_buf_detach(binding->dmabuf, binding->attachment);
  2078		dma_buf_put(binding->dmabuf);
  2079		xa_destroy(&binding->bound_rxq_list);
  2080		kfree(binding);
  2081	}
  2082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
