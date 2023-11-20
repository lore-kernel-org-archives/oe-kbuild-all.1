Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110D1B287
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUNHNdNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700488542; x=1732024542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQLXsXotpCnDtYSLSfZgjOpAUxc8PjoOMMKrz0Mm5iI=;
  b=mUNHNdNjY788jVYFnDWgExFH1/KAp3UvJpraaNLfM6zXfI3rrcbnP1o9
   D043hbihPXs+/BEGrpOfrmpHRILDwTlQ77ko8qdHZHA9990lps6W/lyHE
   eNs+c8d+iCJG9dG5WqbIQLZpm8L9Ow2feQ1HTZ7+yymjgfacPsA2sPk9D
   G4E2yK52hmxNqsI8r5OyS0GAPS6MV8fqtxj+UTzVJOgzQq7a7ffn+0YPq
   +3qrdB4Ec2MMzdkKJOIqdto6XpNU3/Xc2arQfqzzEQGYndNf6bve6Gsux
   Ar98kMBFBbCr5E+jOh0mNIVSRjkvk63ovYblBOFdp93NQ8CVSYuZYq8TK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4739434"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="4739434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 05:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742733508"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="742733508"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2023 05:55:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r54kT-0006VR-14;
	Mon, 20 Nov 2023 13:55:37 +0000
Date: Mon, 20 Nov 2023 21:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 4/8] sound/core/memalloc.c:551:15: error:
 call to undeclared function 'get_dma_ops'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202311202137.N9JNMLe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-ops-cleanup
head:   5ab735c803b75be08ec98ef185b2df10bf41475a
commit: 5b95bda81e5c3a8365de492b8bb19a65591c5df4 [4/8] dma-mapping: make get_dma_ops private
config: i386-buildonly-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202137.N9JNMLe9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202137.N9JNMLe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202137.N9JNMLe9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/memalloc.c:551:15: error: call to undeclared function 'get_dma_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!sgt && !get_dma_ops(dmab->dev.dev))
                        ^
   sound/core/memalloc.c:551:15: note: did you mean 'set_dma_ops'?
   include/linux/dma-map-ops.h:88:20: note: 'set_dma_ops' declared here
   static inline void set_dma_ops(struct device *dev,
                      ^
   1 error generated.
--
>> kernel/dma/ops_helpers.c:64:34: error: call to undeclared function 'get_dma_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           const struct dma_map_ops *ops = get_dma_ops(dev);
                                           ^
   kernel/dma/ops_helpers.c:64:34: note: did you mean 'set_dma_ops'?
   include/linux/dma-map-ops.h:88:20: note: 'set_dma_ops' declared here
   static inline void set_dma_ops(struct device *dev,
                      ^
>> kernel/dma/ops_helpers.c:64:28: error: incompatible integer to pointer conversion initializing 'const struct dma_map_ops *' with an expression of type 'int' [-Wint-conversion]
           const struct dma_map_ops *ops = get_dma_ops(dev);
                                     ^     ~~~~~~~~~~~~~~~~
   kernel/dma/ops_helpers.c:87:34: error: call to undeclared function 'get_dma_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           const struct dma_map_ops *ops = get_dma_ops(dev);
                                           ^
   kernel/dma/ops_helpers.c:87:28: error: incompatible integer to pointer conversion initializing 'const struct dma_map_ops *' with an expression of type 'int' [-Wint-conversion]
           const struct dma_map_ops *ops = get_dma_ops(dev);
                                     ^     ~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> kernel/dma/mapping.c:121:9: error: call to undeclared function 'get_arch_dma_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return get_arch_dma_ops();
                  ^
   kernel/dma/mapping.c:121:9: note: did you mean 'get_dma_ops'?
   kernel/dma/mapping.c:117:41: note: 'get_dma_ops' declared here
   static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
                                           ^
>> kernel/dma/mapping.c:121:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'const struct dma_map_ops *' [-Wint-conversion]
           return get_arch_dma_ops();
                  ^~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/get_dma_ops +551 sound/core/memalloc.c

a25684a956468e Takashi Iwai      2021-10-17  535  
a25684a956468e Takashi Iwai      2021-10-17  536  /*
a25684a956468e Takashi Iwai      2021-10-17  537   * Non-contiguous pages allocator
a25684a956468e Takashi Iwai      2021-10-17  538   */
a25684a956468e Takashi Iwai      2021-10-17  539  static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
a25684a956468e Takashi Iwai      2021-10-17  540  {
a25684a956468e Takashi Iwai      2021-10-17  541  	struct sg_table *sgt;
a25684a956468e Takashi Iwai      2021-10-17  542  	void *p;
a25684a956468e Takashi Iwai      2021-10-17  543  
53466ebdec614f Takashi Iwai      2023-01-25  544  #ifdef CONFIG_SND_DMA_SGBUF
53466ebdec614f Takashi Iwai      2023-01-25  545  	if (cpu_feature_enabled(X86_FEATURE_XENPV))
53466ebdec614f Takashi Iwai      2023-01-25  546  		return snd_dma_sg_fallback_alloc(dmab, size);
53466ebdec614f Takashi Iwai      2023-01-25  547  #endif
9d8e536d36e75e Takashi Iwai      2022-11-12  548  	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
db918321275d64 Christoph Hellwig 2022-12-20  549  				      DEFAULT_GFP, 0);
925ca893b4a651 Takashi Iwai      2022-04-13  550  #ifdef CONFIG_SND_DMA_SGBUF
53466ebdec614f Takashi Iwai      2023-01-25 @551  	if (!sgt && !get_dma_ops(dmab->dev.dev))
925ca893b4a651 Takashi Iwai      2022-04-13  552  		return snd_dma_sg_fallback_alloc(dmab, size);
9736a325137b62 Takashi Iwai      2022-11-10  553  #endif
9736a325137b62 Takashi Iwai      2022-11-10  554  	if (!sgt)
9736a325137b62 Takashi Iwai      2022-11-10  555  		return NULL;
925ca893b4a651 Takashi Iwai      2022-04-13  556  
8e1741c658996a Takashi Iwai      2022-02-10  557  	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
8e1741c658996a Takashi Iwai      2022-02-10  558  					    sg_dma_address(sgt->sgl));
a25684a956468e Takashi Iwai      2021-10-17  559  	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
37137ec26c2c03 Takashi Iwai      2022-09-06  560  	if (p) {
a25684a956468e Takashi Iwai      2021-10-17  561  		dmab->private_data = sgt;
37137ec26c2c03 Takashi Iwai      2022-09-06  562  		/* store the first page address for convenience */
37137ec26c2c03 Takashi Iwai      2022-09-06  563  		dmab->addr = snd_sgbuf_get_addr(dmab, 0);
37137ec26c2c03 Takashi Iwai      2022-09-06  564  	} else {
a25684a956468e Takashi Iwai      2021-10-17  565  		dma_free_noncontiguous(dmab->dev.dev, size, sgt, dmab->dev.dir);
37137ec26c2c03 Takashi Iwai      2022-09-06  566  	}
a25684a956468e Takashi Iwai      2021-10-17  567  	return p;
a25684a956468e Takashi Iwai      2021-10-17  568  }
a25684a956468e Takashi Iwai      2021-10-17  569  

:::::: The code at line 551 was first introduced by commit
:::::: 53466ebdec614f915c691809b0861acecb941e30 ALSA: memalloc: Workaround for Xen PV

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
