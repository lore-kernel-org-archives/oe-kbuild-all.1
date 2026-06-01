Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872993DB628
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327785; cv=none; b=HIJPEAscK7RY52fQTgH7SYNJTrJ1jpab900u+Obb872qWc7wxeuS4AbJ8UxIEtRnCJFjl4M9dwZgcwaCN4endD5oVBIHnrESK4ZxsCmGeFxA23MULcVgbTOCWnYuboR4WS6Q/0MqGPSRP1ce/Z/0esCWUhqrPTZmSxuNRL9EhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327785; c=relaxed/simple;
	bh=KZQ+deFYnmns8Q1dpmlhqwReBN5uuuDSD1MC4r9IPwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGjXVD7INzNqIa4Lz0OeZZ3Y2wy8dStW/IrIuj1CRxcEjnQ57zHbVDYxWzowLXBPAXqpPoN2vI3sKtq8x+qGEoqD76pjyNRIagvgNN/hSxBRKTLsnrT3UjqefRW34NjzvzU6SOP2hvXz09b84qfmnNXp8E/lzCR9zDwrVl1pxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C677A68BFE; Mon,  1 Jun 2026 17:29:33 +0200 (CEST)
Date: Mon, 1 Jun 2026 17:29:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [axboe:for-7.0/block 19/138]
 block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from
 restricted blk_status_t
Message-ID: <20260601152933.GA6444@lst.de>
References: <202606012339.rZAl6Xq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606012339.rZAl6Xq8-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

I think powerpc really need to pick the tricks from other architectures
to make cmpxchg work on __bitwise fields.

On Mon, Jun 01, 2026 at 11:26:16PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/block
> head:   72f4d6fca699a1e35b39c5e5dacac2926d254135
> commit: b37fbce460ad60b0c4449c1c7566cf24f3016713 [19/138] blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio
> config: powerpc64-randconfig-r111-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012339.rZAl6Xq8-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012339.rZAl6Xq8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606012339.rZAl6Xq8-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
> >> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
>    block/blk-crypto-fallback.c:154:17: sparse: sparse: cast to restricted blk_status_t
> 
> vim +154 block/blk-crypto-fallback.c
> 
>    143	
>    144	static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
>    145	{
>    146		struct bio *src_bio = enc_bio->bi_private;
>    147		int i;
>    148	
>    149		for (i = 0; i < enc_bio->bi_vcnt; i++)
>    150			mempool_free(enc_bio->bi_io_vec[i].bv_page,
>    151				     blk_crypto_bounce_page_pool);
>    152	
>    153		if (enc_bio->bi_status)
>  > 154			cmpxchg(&src_bio->bi_status, 0, enc_bio->bi_status);
>    155	
>    156		bio_put(enc_bio);
>    157		bio_endio(src_bio);
>    158	}
>    159	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
---end quoted text---
