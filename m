Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E419882
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 21:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692999597; x=1724535597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ye06UylIdWIXz2h7elR2QCRcCRgoU/TM529cL68GaCI=;
  b=IlbRIBCkq3sVYI0CWHOAfzdbwHVez8ZkT4oluBXOXzCvQ+ZaeYJKX3TI
   sA55N1k2eWGX2S26ZsdPlRu7qHTxduCyVLPLY9JXRv1jgU2O4Yp0QoQ4s
   O9eIbqQcQR+Ta6khSHAdfIf76u+EHMplvv0yI47AQ3CBdI7h8424Jyx2m
   1jaagpYXegZevAWo9KIP21L8NhshCQTo/5RluWgf+70muX+wrLde2kbZ+
   cGxy3XKM5Xe3tJtMi4H3sEz71BMiNhxyKUqHbtuIUO6pg/pWXimyFP13f
   NqPlXnI6wKliEcKy1VIFBTl/28jfIXCDHXZjjtIjz5k/PrD/Th2lKpDQ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372209013"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="372209013"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731177925"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="731177925"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 14:39:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZeX4-00041j-2B;
	Fri, 25 Aug 2023 21:39:54 +0000
Date: Sat, 26 Aug 2023 05:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 113/121] sound/core/pcm_memory.c:45:28:
 error: implicit declaration of function 'get_dma_ops'
Message-ID: <202308260543.u0iU3KVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   0c9605e45c07b5620523344eeeb65f6d5ee3f39d
commit: a63ed814355de5c8e8b8b5ada70346a747a1da24 [113/121] ALSA: pcm: Use SG-buffer only when direct DMA is available
config: m68k-randconfig-r025-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260543.u0iU3KVr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260543.u0iU3KVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260543.u0iU3KVr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/io.h:10,
                    from sound/core/pcm_memory.c:7:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_no.h:33:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      33 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   sound/core/pcm_memory.c: In function 'do_alloc_pages':
>> sound/core/pcm_memory.c:45:28: error: implicit declaration of function 'get_dma_ops' [-Werror=implicit-function-declaration]
      45 |             !dma_is_direct(get_dma_ops(dev))) {
         |                            ^~~~~~~~~~~
>> sound/core/pcm_memory.c:45:28: warning: passing argument 1 of 'dma_is_direct' makes pointer from integer without a cast [-Wint-conversion]
      45 |             !dma_is_direct(get_dma_ops(dev))) {
         |                            ^~~~~~~~~~~~~~~~
         |                            |
         |                            int
   In file included from sound/core/pcm_memory.c:14:
   include/linux/dma-mapping.h:194:60: note: expected 'const struct dma_map_ops *' but argument is of type 'int'
     194 | static inline bool dma_is_direct(const struct dma_map_ops *ops)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   arch/m68k/68000/ints.c:77:6: warning: no previous prototype for 'process_int' [-Wmissing-prototypes]
      77 | void process_int(int vec, struct pt_regs *fp)
         |      ^~~~~~~~~~~
   arch/m68k/68000/ints.c: In function 'process_int':
>> arch/m68k/68000/ints.c:82:30: error: 'ISR' undeclared (first use in this function)
      82 |         unsigned long pend = ISR;
         |                              ^~~
   arch/m68k/68000/ints.c:82:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/m68k/68000/ints.c: In function 'intc_irq_unmask':
>> arch/m68k/68000/ints.c:135:9: error: 'IMR' undeclared (first use in this function)
     135 |         IMR &= ~(1 << d->irq);
         |         ^~~
   arch/m68k/68000/ints.c: In function 'intc_irq_mask':
   arch/m68k/68000/ints.c:140:9: error: 'IMR' undeclared (first use in this function)
     140 |         IMR |= (1 << d->irq);
         |         ^~~
   arch/m68k/68000/ints.c: At top level:
   arch/m68k/68000/ints.c:153:13: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
     153 | void __init trap_init(void)
         |             ^~~~~~~~~
   arch/m68k/68000/ints.c:172:13: warning: no previous prototype for 'init_IRQ' [-Wmissing-prototypes]
     172 | void __init init_IRQ(void)
         |             ^~~~~~~~
   arch/m68k/68000/ints.c: In function 'init_IRQ':
>> arch/m68k/68000/ints.c:176:9: error: 'IVR' undeclared (first use in this function)
     176 |         IVR = 0x40; /* Set DragonBall IVR (interrupt base) to 64 */
         |         ^~~
   arch/m68k/68000/ints.c:179:9: error: 'IMR' undeclared (first use in this function)
     179 |         IMR = ~0;
         |         ^~~


vim +/get_dma_ops +45 sound/core/pcm_memory.c

    33	
    34	static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
    35				  size_t size, struct snd_dma_buffer *dmab)
    36	{
    37		int err;
    38	
    39		if (max_alloc_per_card &&
    40		    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
    41			return -ENOMEM;
    42	
    43		if (IS_ENABLED(CONFIG_SND_DMA_SGBUF) &&
    44		    (type == SNDRV_DMA_TYPE_DEV_SG || type == SNDRV_DMA_TYPE_DEV_UC_SG) &&
  > 45		    !dma_is_direct(get_dma_ops(dev))) {
    46			/* mutate to continuous page allocation */
    47			dev_dbg(dev, "Use continuous page allocator\n");
    48			if (type == SNDRV_DMA_TYPE_DEV_SG)
    49				type = SNDRV_DMA_TYPE_DEV;
    50			else
    51				type = SNDRV_DMA_TYPE_DEV_UC;
    52		}
    53	
    54		err = snd_dma_alloc_pages(type, dev, size, dmab);
    55		if (!err) {
    56			mutex_lock(&card->memory_mutex);
    57			card->total_pcm_alloc_bytes += dmab->bytes;
    58			mutex_unlock(&card->memory_mutex);
    59		}
    60		return err;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
