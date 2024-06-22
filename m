Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E69387
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719027035; cv=none; b=h52ndWCQvGih1AvL3bo02/nCyiaqWu0tpENWhSoJ2Xfsa9liQJHPsDMRu7kLPp18+JwDhl4zbC30s03rcUqYzCdhZEGx6YDzUWjYPIsB1KTWQxOR5Mb9dz/vOuM4jUW7o2vY8rUJyvPbNTEDle62qWhHhBEH6daNaejYmUTgFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719027035; c=relaxed/simple;
	bh=E8p38nFWqDYfTPugvCTXaYMGyEKNJ15+36ZF5g6TgLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLduEdkxGbjaD0rWNQaWncd0kwxYVncJrgFnqnawhIyum5jwzLWrGRwnq/LtJS35vlwKcoHrLub41GHEyhD4nMRg9lLKZZccaKGUh5gWr9eWfnLOh0rnf4UiE1ZYxbJuaKCaX7Pcyi8BHwpAVS70rH4i/7rVAikgRIcrDJ+B+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPsDve3B; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPsDve3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719027033; x=1750563033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8p38nFWqDYfTPugvCTXaYMGyEKNJ15+36ZF5g6TgLc=;
  b=CPsDve3BRLsw0nUxqoV920lidEQDOvf2ImhkvIgvdCmgVxMwVLrwmYio
   iDZ7lShFZuc3chLaIJP0Wbz0QG6GblFBYjHtO5hRMX+pWjLEkdECK9jEE
   MhXoCPczjS3ooeK9hfGW8fdAbn2sjKzKzBe+kkI8GRaWvxj3NM1rT5JA6
   JEbi9vg7bqnmnWpNzSNANuXg2VeOWcERGwLzlf50BFk09jYmW4eifG3A4
   wCIqnl+YzNkyLg0A/qedjVRiZXoM9sXygJ86OGpUZAKjRYawn4p9qKVNW
   D29qE0A1z3uXEPjtqkUM/TCdauG7NzHbTBDf3u68OqLfu/DrT1wO7DtaN
   w==;
X-CSE-ConnectionGUID: BWFU1j3xRae0bWK9iuaMjw==
X-CSE-MsgGUID: l4iZ2efjSySi7LDLewkTiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15769053"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="15769053"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 20:30:32 -0700
X-CSE-ConnectionGUID: loS++//cQrKEp9m36XlMdg==
X-CSE-MsgGUID: RUG+yxoLSKqbhTYgdCjr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="43451400"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jun 2024 20:30:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKrSP-0009Gg-0Z;
	Sat, 22 Jun 2024 03:30:29 +0000
Date: Sat, 22 Jun 2024 11:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 14/17]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:4177:27: warning: variable 'ring'
 set but not used
Message-ID: <202406221130.BHBlE2iM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   e1d705ecf1cbeeaa9091d3d2f0504acfbb18475f
commit: ec80b5ce3304f96b836d48755d9525d365ffb357 [14/17] [CHERRY-PICK] bnxt_en: split rx ring helpers out from ring helpers
config: i386-randconfig-002-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221130.BHBlE2iM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221130.BHBlE2iM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221130.BHBlE2iM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:4177:27: warning: variable 'ring' set but not used [-Wunused-but-set-variable]
    4177 |         struct bnxt_ring_struct *ring;
         |                                  ^
   1 warning generated.


vim +/ring +4177 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  4173	
  4174	static int bnxt_init_one_rx_ring(struct bnxt *bp, int ring_nr)
  4175	{
  4176		struct bnxt_rx_ring_info *rxr;
> 4177		struct bnxt_ring_struct *ring;
  4178	
  4179		rxr = &bp->rx_ring[ring_nr];
  4180		ring = &rxr->rx_ring_struct;
  4181		bnxt_init_one_rx_ring_rxbd(bp, rxr);
  4182	
  4183		netif_queue_set_napi(bp->dev, ring_nr, NETDEV_QUEUE_TYPE_RX,
  4184				     &rxr->bnapi->napi);
  4185	
  4186		if (BNXT_RX_PAGE_MODE(bp) && bp->xdp_prog) {
  4187			bpf_prog_add(bp->xdp_prog, 1);
  4188			rxr->xdp_prog = bp->xdp_prog;
  4189		}
  4190	
  4191		bnxt_init_one_rx_agg_ring_rxbd(bp, rxr);
  4192	
  4193		return bnxt_alloc_one_rx_ring(bp, ring_nr);
  4194	}
  4195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
