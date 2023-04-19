Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F7C977
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 19:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934285; x=1713470285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gYpmmZI/5hhmZF1R/R6OIR4+ATzx0yTZ2a/nDFpRIMQ=;
  b=gx8nbxS0EPpiJLdCR1DiqirK5rlxRWALXg0irBELGpGdeEbAZLPD0VpZ
   2lUkCDjUF7Vv4LGvqphpZ3uMu2SthzdflW8YxqgCs00E6Ky84kh0HG7HG
   +KslqBGVoTEMgE1bMCDTBzRZ8zbLRrSuqg4jfwrTW8PUkEKx+31Rj9asR
   MzAMi9Y7ctC6FHwYbNbQhGfhNtJsT1LkudeJDV6SVNdbrRH07Lq2Cuf4k
   UT75QFPcwfQh5Kpuo9LMkuGlT6irhGyrWYNxoKgMf/jhTQ1J5YzM5KQzg
   ozvFo28UFMjxnOaTK8XMlZxQWywu4yt68O2f/d8WM9QP82UxJNo1V3MhQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434760"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="373434760"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 12:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728442"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="815728442"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Apr 2023 12:58:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppDwI-000f9i-1i;
	Wed, 19 Apr 2023 19:58:02 +0000
Date: Thu, 20 Apr 2023 03:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 107/107] net/core/dev.c:2803:17: error:
 implicit declaration of function 'DEBUG_NET_WARN_ON_ONCE'
Message-ID: <202304200354.yasSkwZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   26a53fe91e5138d18c724c59835efc603d0213ec
commit: 26a53fe91e5138d18c724c59835efc603d0213ec [107/107] net: openvswitch: fix race on port output
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304200354.yasSkwZw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=26a53fe91e5138d18c724c59835efc603d0213ec
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 26a53fe91e5138d18c724c59835efc603d0213ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200354.yasSkwZw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:31,
                    from include/linux/if_ether.h:19,
                    from net/core/dev.c:89:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:14: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:5,
                    from net/core/dev.c:71:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:139:34: note: in definition of macro 'WARN_ON_ONCE'
     139 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   net/core/dev.c: In function 'skb_tx_hash':
>> net/core/dev.c:2803:17: error: implicit declaration of function 'DEBUG_NET_WARN_ON_ONCE' [-Werror=implicit-function-declaration]
    2803 |                 DEBUG_NET_WARN_ON_ONCE(qcount == 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/DEBUG_NET_WARN_ON_ONCE +2803 net/core/dev.c

  2776	
  2777	/*
  2778	 * Returns a Tx hash based on the given packet descriptor a Tx queues' number
  2779	 * to be used as a distribution range.
  2780	 */
  2781	static u16 skb_tx_hash(const struct net_device *dev,
  2782			       const struct net_device *sb_dev,
  2783			       struct sk_buff *skb)
  2784	{
  2785		u32 hash;
  2786		u16 qoffset = 0;
  2787		u16 qcount = dev->real_num_tx_queues;
  2788	
  2789		if (dev->num_tc) {
  2790			u8 tc = netdev_get_prio_tc_map(dev, skb->priority);
  2791	
  2792			qoffset = sb_dev->tc_to_txq[tc].offset;
  2793			qcount = sb_dev->tc_to_txq[tc].count;
  2794			if (unlikely(!qcount)) {
  2795				net_warn_ratelimited("%s: invalid qcount, qoffset %u for tc %u\n",
  2796						     sb_dev->name, qoffset, tc);
  2797				qoffset = 0;
  2798				qcount = dev->real_num_tx_queues;
  2799			}
  2800		}
  2801	
  2802		if (skb_rx_queue_recorded(skb)) {
> 2803			DEBUG_NET_WARN_ON_ONCE(qcount == 0);
  2804			hash = skb_get_rx_queue(skb);
  2805			if (hash >= qoffset)
  2806				hash -= qoffset;
  2807			while (unlikely(hash >= qcount))
  2808				hash -= qcount;
  2809			return hash + qoffset;
  2810		}
  2811	
  2812		return (u16) reciprocal_scale(skb_get_hash(skb), qcount) + qoffset;
  2813	}
  2814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
