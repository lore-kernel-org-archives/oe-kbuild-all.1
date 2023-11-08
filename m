Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED48610C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4IXg8bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699411929; x=1730947929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KUOjZOHt9EgQg2fg6lLqBCHVYdCMgyTqu2grPAwrOOU=;
  b=B4IXg8bIEixGqnavk77ZjOjkY86Aqgg33G1Qe3VRu2KOmzqCnH+aoepB
   lnedUXHC9R5dxBYfIHWc2LQVuIQCfxjMMDxOApiUYaK+ovho+1UIDPqwv
   s5ADEZGjpcRBYEj38eA3Ym0s6BRxo8mQmByR96eY5+B2ANnJJqYxbzHGy
   m2H+aYK/Ntnz6J4WpE7BDroHQMc6kcQ7V7QVdFNHckdVeLaEKvjAMgXII
   UORUvsvJFXfXPeVnuv0QGGWn7Ohl/SyyYyNq5YWKSK0Uq2l0OnvsPTGbB
   4NfStsZiZM/5rJGicXgcy69/VhdJbexhcdRYjVATvH7MWhC1dsKlrEovY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="392547029"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="392547029"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 18:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="792047431"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="792047431"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2023 18:52:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Yfl-0007b9-08;
	Wed, 08 Nov 2023 02:52:05 +0000
Date: Wed, 8 Nov 2023 10:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/6] crypto: rockchip: add rk3588 driver
Message-ID: <202311081054.P6mjQsFB-lkp@intel.com>
References: <20231107155532.3747113-7-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107155532.3747113-7-clabbe@baylibre.com>

Hi Corentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.6 next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Labbe/dt-bindings-crypto-add-support-for-rockchip-crypto-rk3588/20231107-235738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20231107155532.3747113-7-clabbe%40baylibre.com
patch subject: [PATCH 6/6] crypto: rockchip: add rk3588 driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081054.P6mjQsFB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081054.P6mjQsFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081054.P6mjQsFB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:31,
                    from include/linux/iopoll.h:9,
                    from drivers/crypto/rockchip/rk2_crypto_ahash.c:8:
   drivers/crypto/rockchip/rk2_crypto_ahash.c: In function 'rk2_hash_run':
>> drivers/crypto/rockchip/rk2_crypto_ahash.c:274:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 11 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     274 |                 dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/crypto/rockchip/rk2_crypto_ahash.c:274:17: note: in expansion of macro 'dev_dbg'
     274 |                 dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
         |                 ^~~~~~~
   drivers/crypto/rockchip/rk2_crypto_ahash.c:274:101: note: format string is defined here
     274 |                 dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
         |                                                                                                  ~~~^
         |                                                                                                     |
         |                                                                                                     long long unsigned int
         |                                                                                                  %x


vim +274 drivers/crypto/rockchip/rk2_crypto_ahash.c

   216	
   217	int rk2_hash_run(struct crypto_engine *engine, void *breq)
   218	{
   219		struct ahash_request *areq = container_of(breq, struct ahash_request, base);
   220		struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
   221		struct rk2_ahash_rctx *rctx = ahash_request_ctx(areq);
   222		struct ahash_alg *alg = crypto_ahash_alg(tfm);
   223		struct rk2_crypto_template *algt = container_of(alg, struct rk2_crypto_template, alg.hash.base);
   224		struct scatterlist *sgs = areq->src;
   225		struct rk2_crypto_dev *rkc = rctx->dev;
   226		struct rk2_crypto_lli *dd = &rkc->tl[0];
   227		int ddi = 0;
   228		int err = 0;
   229		unsigned int len = areq->nbytes;
   230		unsigned int todo;
   231		u32 v;
   232		int i;
   233	
   234		err = rk2_hash_prepare(engine, breq);
   235	
   236		err = pm_runtime_resume_and_get(rkc->dev);
   237		if (err)
   238			return err;
   239	
   240		dev_dbg(rkc->dev, "%s %s len=%d\n", __func__,
   241			crypto_tfm_alg_name(areq->base.tfm), areq->nbytes);
   242	
   243		algt->stat_req++;
   244		rkc->nreq++;
   245	
   246		rctx->mode = algt->rk2_mode;
   247		rctx->mode |= 0xffff0000;
   248		rctx->mode |= RK2_CRYPTO_ENABLE | RK2_CRYPTO_HW_PAD;
   249		writel(rctx->mode, rkc->reg + RK2_CRYPTO_HASH_CTL);
   250	
   251		while (sgs && len > 0) {
   252			dd = &rkc->tl[ddi];
   253	
   254			todo = min(sg_dma_len(sgs), len);
   255			dd->src_addr = sg_dma_address(sgs);
   256			dd->src_len = todo;
   257			dd->dst_addr = 0;
   258			dd->dst_len = 0;
   259			dd->dma_ctrl = ddi << 24;
   260			dd->iv = 0;
   261			dd->next = rkc->t_phy + sizeof(struct rk2_crypto_lli) * (ddi + 1);
   262	
   263			if (ddi == 0)
   264				dd->user = RK2_LLI_CIPHER_START | RK2_LLI_STRING_FIRST;
   265			else
   266				dd->user = 0;
   267	
   268			len -= todo;
   269			dd->dma_ctrl |= RK2_LLI_DMA_CTRL_SRC_INT;
   270			if (len == 0) {
   271				dd->user |= RK2_LLI_STRING_LAST;
   272				dd->dma_ctrl |= RK2_LLI_DMA_CTRL_LAST;
   273			}
 > 274			dev_dbg(rkc->dev, "HASH SG %d sglen=%d user=%x dma=%x mode=%x len=%d todo=%d phy=%llx\n",
   275				ddi, sgs->length, dd->user, dd->dma_ctrl, rctx->mode, len, todo, rkc->t_phy);
   276	
   277			sgs = sg_next(sgs);
   278			ddi++;
   279		}
   280		dd->next = 1;
   281		writel(RK2_CRYPTO_DMA_INT_LISTDONE | 0x7F, rkc->reg + RK2_CRYPTO_DMA_INT_EN);
   282	
   283		writel(rkc->t_phy, rkc->reg + RK2_CRYPTO_DMA_LLI_ADDR);
   284	
   285		reinit_completion(&rkc->complete);
   286		rkc->status = 0;
   287	
   288		writel(RK2_CRYPTO_DMA_CTL_START | RK2_CRYPTO_DMA_CTL_START << 16, rkc->reg + RK2_CRYPTO_DMA_CTL);
   289	
   290		wait_for_completion_interruptible_timeout(&rkc->complete,
   291							  msecs_to_jiffies(2000));
   292		if (!rkc->status) {
   293			dev_err(rkc->dev, "DMA timeout\n");
   294			err = -EFAULT;
   295			goto theend;
   296		}
   297	
   298		readl_poll_timeout_atomic(rkc->reg + RK2_CRYPTO_HASH_VALID, v, v == 1,
   299					  10, 1000);
   300	
   301		for (i = 0; i < crypto_ahash_digestsize(tfm) / 4; i++) {
   302			v = readl(rkc->reg + RK2_CRYPTO_HASH_DOUT_0 + i * 4);
   303			put_unaligned_le32(be32_to_cpu(v), areq->result + i * 4);
   304		}
   305	
   306	theend:
   307		pm_runtime_put_autosuspend(rkc->dev);
   308	
   309		rk2_hash_unprepare(engine, breq);
   310	
   311		local_bh_disable();
   312		crypto_finalize_hash_request(engine, breq, err);
   313		local_bh_enable();
   314	
   315		return 0;
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
