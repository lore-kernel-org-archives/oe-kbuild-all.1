Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5E372
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 02:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754102302; cv=none; b=mo51RYQO2Db5gkxl6yfP5zoJkIxFjrbmFf89XGotOND7vHP2JotHWJjDuXqkTMzE1RrpGhd339vLN/c7rnseDMDC2llxZWpFDt6b1gSZECt5YByJe+A7N0TRUefNc/jX0wcBugzQa7+YRBh99dpUAe82j+/+S0jW/1yNTpsgAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754102302; c=relaxed/simple;
	bh=jRzZLGetu+OKIqkHMfkwc182kgpFn+ZFRHh27KSuQBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQP9tRrXlf/jjTWOV+i8OohQ4JwuFm105evH9XVLGcUI6uhBCM0alMxFeCtxv8ZHt7dCmkYUlaZJ0ph6xXaWmudEHOXavFhrhqNhau4kKTy1bnhEl+5natGyfskJceP55h3erRBVuTIf5biqGufjA2hvxZJEAUGjlgcCRstKY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imwPEA3o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imwPEA3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754102300; x=1785638300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRzZLGetu+OKIqkHMfkwc182kgpFn+ZFRHh27KSuQBE=;
  b=imwPEA3oklsCIz4EEzTTkBCgdym8IKN2ybf9WwdINKiCthLm0GDE4SlD
   AyAQDHiJUAKmTP5wdvQCtENNlNt2DuiD67jQAELpnQlHUj/nmkDPyJMc7
   E9oIq4+oeBQia9TAVcGk6O5DIRzp5WehBkITQ37Zmyr5AOsawFYPO1sTV
   PCQWaaNiVhRfwSWdFsHxwH+8HXyeM3w87dAc/uz4xFjfZUV85ZWaWCaZ9
   EFZ9WkOm1Fh12iHamxxGM3JyxxljYEULciB7gUVae3EoBNRpHpoZ097DR
   H63Vaw3N9bBDMUbid7xJmjnh1FnWAYYBQuldn6xQLJlbjDQCf76m5S+FX
   g==;
X-CSE-ConnectionGUID: VlJgqc3RTHSG3IMKakMR+Q==
X-CSE-MsgGUID: U6QYKc6mSB6F5Q1qPIg6mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56589963"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56589963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:38:18 -0700
X-CSE-ConnectionGUID: edeFsvbxTo6n9mrrVoL4Rw==
X-CSE-MsgGUID: S00fY/SGRb6vOoLpQmy9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162991219"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2025 19:38:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui28U-00056q-2B;
	Sat, 02 Aug 2025 02:38:14 +0000
Date: Sat, 2 Aug 2025 10:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 32/33] crypto/scompress.c:252:3: warning:
 releasing spinlock 'scratch->lock' that was not held
Message-ID: <202508021018.6g4JaCKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 2c56e090ffa701a43db01da9e65a53d4db11329b [32/33] crypto: Enable capability analysis
config: s390-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021018.6g4JaCKc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021018.6g4JaCKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021018.6g4JaCKc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/scompress.c:252:3: warning: releasing spinlock 'scratch->lock' that was not held [-Wthread-safety-analysis]
     252 |                 scomp_unlock_scratch(scratch);
         |                 ^
>> crypto/scompress.c:260:2: warning: spinlock '__ret->lock' is not held on every path through here [-Wthread-safety-analysis]
     260 |         crypto_acomp_unlock_stream_bh(stream);
         |         ^
   crypto/scompress.c:240:35: note: spinlock acquired here
     240 |                 struct scomp_scratch *scratch = scomp_lock_scratch();
         |                                                 ^
   crypto/scompress.c:163:33: note: expanded from macro 'scomp_lock_scratch'
     163 | #define scomp_lock_scratch(...) __acquire_ret(__scomp_lock_scratch(__VA_ARGS__), &__ret->lock)
         |                                 ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
>> crypto/scompress.c:260:2: warning: releasing spinlock 'stream->lock' that was not held [-Wthread-safety-analysis]
     260 |         crypto_acomp_unlock_stream_bh(stream);
         |         ^
   crypto/scompress.c:279:1: warning: spinlock '__ret->lock' is not held on every path through here [-Wthread-safety-analysis]
     279 | }
         | ^
   crypto/scompress.c:237:39: note: spinlock acquired here
     237 |         struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
         |                                              ^
   include/crypto/internal/acompress.h:199:42: note: expanded from macro 'crypto_acomp_lock_stream_bh'
     199 | #define crypto_acomp_lock_stream_bh(...) __acquire_ret(__crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
         |                                          ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   4 warnings generated.
--
>> crypto/deflate.c:129:2: warning: releasing spinlock 's->lock' that was not held [-Wthread-safety-analysis]
     129 |         crypto_acomp_unlock_stream_bh(s);
         |         ^
>> crypto/deflate.c:132:1: warning: spinlock '__ret->lock' is still held at the end of function [-Wthread-safety-analysis]
     132 | }
         | ^
   crypto/deflate.c:112:34: note: spinlock acquired here
     112 |         struct crypto_acomp_stream *s = crypto_acomp_lock_stream_bh(&deflate_streams);
         |                                         ^
   include/crypto/internal/acompress.h:199:42: note: expanded from macro 'crypto_acomp_lock_stream_bh'
     199 | #define crypto_acomp_lock_stream_bh(...) __acquire_ret(__crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
         |                                          ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   crypto/deflate.c:207:2: warning: releasing spinlock 's->lock' that was not held [-Wthread-safety-analysis]
     207 |         crypto_acomp_unlock_stream_bh(s);
         |         ^
   crypto/deflate.c:210:1: warning: spinlock '__ret->lock' is still held at the end of function [-Wthread-safety-analysis]
     210 | }
         | ^
   crypto/deflate.c:192:34: note: spinlock acquired here
     192 |         struct crypto_acomp_stream *s = crypto_acomp_lock_stream_bh(&deflate_streams);
         |                                         ^
   include/crypto/internal/acompress.h:199:42: note: expanded from macro 'crypto_acomp_lock_stream_bh'
     199 | #define crypto_acomp_lock_stream_bh(...) __acquire_ret(__crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
         |                                          ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   4 warnings generated.


vim +252 crypto/scompress.c

6a8487a1f29fa2 Ard Biesheuvel            2017-07-21  143  
2c56e090ffa701 Marco Elver               2025-02-19  144  static struct scomp_scratch *__scomp_lock_scratch(void)
2c56e090ffa701 Marco Elver               2025-02-19  145  	__capability_unsafe(acquires &__ret->lock)
c47e1f4142a382 Herbert Xu                2025-03-17  146  {
c47e1f4142a382 Herbert Xu                2025-03-17  147  	int cpu = raw_smp_processor_id();
c47e1f4142a382 Herbert Xu                2025-03-17  148  	struct scomp_scratch *scratch;
c47e1f4142a382 Herbert Xu                2025-03-17  149  
c47e1f4142a382 Herbert Xu                2025-03-17  150  	scratch = per_cpu_ptr(&scomp_scratch, cpu);
42d9f6c774790d Herbert Xu                2025-03-19  151  	spin_lock(&scratch->lock);
c47e1f4142a382 Herbert Xu                2025-03-17  152  	if (likely(scratch->src))
c47e1f4142a382 Herbert Xu                2025-03-17  153  		return scratch;
c47e1f4142a382 Herbert Xu                2025-03-17  154  	spin_unlock(&scratch->lock);
c47e1f4142a382 Herbert Xu                2025-03-17  155  
c47e1f4142a382 Herbert Xu                2025-03-17  156  	cpumask_set_cpu(cpu, &scomp_scratch_want);
c47e1f4142a382 Herbert Xu                2025-03-17  157  	schedule_work(&scomp_scratch_work);
c47e1f4142a382 Herbert Xu                2025-03-17  158  
c47e1f4142a382 Herbert Xu                2025-03-17  159  	scratch = per_cpu_ptr(&scomp_scratch, cpumask_first(cpu_possible_mask));
c47e1f4142a382 Herbert Xu                2025-03-17  160  	spin_lock(&scratch->lock);
c47e1f4142a382 Herbert Xu                2025-03-17  161  	return scratch;
c47e1f4142a382 Herbert Xu                2025-03-17  162  }
2c56e090ffa701 Marco Elver               2025-02-19 @163  #define scomp_lock_scratch(...) __acquire_ret(__scomp_lock_scratch(__VA_ARGS__), &__ret->lock)
c47e1f4142a382 Herbert Xu                2025-03-17  164  
42d9f6c774790d Herbert Xu                2025-03-19  165  static inline void scomp_unlock_scratch(struct scomp_scratch *scratch)
2c56e090ffa701 Marco Elver               2025-02-19  166  	__releases(&scratch->lock)
c47e1f4142a382 Herbert Xu                2025-03-17  167  {
42d9f6c774790d Herbert Xu                2025-03-19  168  	spin_unlock(&scratch->lock);
c47e1f4142a382 Herbert Xu                2025-03-17  169  }
c47e1f4142a382 Herbert Xu                2025-03-17  170  
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  171  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  172  {
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  173  	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
2d3553ecb4e316 Herbert Xu                2025-03-15  174  	struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  175  	bool src_isvirt = acomp_request_src_isvirt(req);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  176  	bool dst_isvirt = acomp_request_dst_isvirt(req);
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  177  	struct crypto_scomp *scomp = *tfm_ctx;
2d3553ecb4e316 Herbert Xu                2025-03-15  178  	unsigned int slen = req->slen;
2d3553ecb4e316 Herbert Xu                2025-03-15  179  	unsigned int dlen = req->dlen;
2d3553ecb4e316 Herbert Xu                2025-03-15  180  	struct page *spage, *dpage;
2d3553ecb4e316 Herbert Xu                2025-03-15  181  	unsigned int n;
2c1808e5fe5afd Herbert Xu                2025-03-15  182  	const u8 *src;
8a6771cda3f48a Herbert Xu                2025-03-15  183  	size_t soff;
8a6771cda3f48a Herbert Xu                2025-03-15  184  	size_t doff;
2c1808e5fe5afd Herbert Xu                2025-03-15  185  	u8 *dst;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  186  	int ret;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  187  
2d3553ecb4e316 Herbert Xu                2025-03-15  188  	if (!req->src || !slen)
71052dcf4be70b Sebastian Andrzej Siewior 2019-03-29  189  		return -EINVAL;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  190  
2d3553ecb4e316 Herbert Xu                2025-03-15  191  	if (!req->dst || !dlen)
71052dcf4be70b Sebastian Andrzej Siewior 2019-03-29  192  		return -EINVAL;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  193  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  194  	if (dst_isvirt)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  195  		dst = req->dvirt;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  196  	else {
5f3437e9c89eec Herbert Xu                2025-04-07  197  		if (dlen <= req->dst->length) {
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  198  			dpage = sg_page(req->dst);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  199  			doff = req->dst->offset;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  200  		} else
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  201  			return -ENOSYS;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  202  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  203  		dpage = nth_page(dpage, doff / PAGE_SIZE);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  204  		doff = offset_in_page(doff);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  205  
e3f08b26257318 Herbert Xu                2025-04-23  206  		n = (dlen - 1) / PAGE_SIZE;
e3f08b26257318 Herbert Xu                2025-04-23  207  		n += (offset_in_page(dlen - 1) + doff) / PAGE_SIZE;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  208  		if (PageHighMem(dpage + n) &&
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  209  		    size_add(doff, dlen) > PAGE_SIZE)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  210  			return -ENOSYS;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  211  		dst = kmap_local_page(dpage) + doff;
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  212  	}
c47e1f4142a382 Herbert Xu                2025-03-17  213  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  214  	if (src_isvirt)
2c1808e5fe5afd Herbert Xu                2025-03-15  215  		src = req->svirt;
2c1808e5fe5afd Herbert Xu                2025-03-15  216  	else {
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  217  		src = NULL;
8a6771cda3f48a Herbert Xu                2025-03-15  218  		do {
5f3437e9c89eec Herbert Xu                2025-04-07  219  			if (slen <= req->src->length) {
8a6771cda3f48a Herbert Xu                2025-03-15  220  				spage = sg_page(req->src);
2d3553ecb4e316 Herbert Xu                2025-03-15  221  				soff = req->src->offset;
8a6771cda3f48a Herbert Xu                2025-03-15  222  			} else
8a6771cda3f48a Herbert Xu                2025-03-15  223  				break;
8a6771cda3f48a Herbert Xu                2025-03-15  224  
8a6771cda3f48a Herbert Xu                2025-03-15  225  			spage = nth_page(spage, soff / PAGE_SIZE);
2d3553ecb4e316 Herbert Xu                2025-03-15  226  			soff = offset_in_page(soff);
744e1885922a99 Chengming Zhou            2023-12-27  227  
002ba346e3d76b Herbert Xu                2025-04-21  228  			n = (slen - 1) / PAGE_SIZE;
002ba346e3d76b Herbert Xu                2025-04-21  229  			n += (offset_in_page(slen - 1) + soff) / PAGE_SIZE;
8a6771cda3f48a Herbert Xu                2025-03-15  230  			if (PageHighMem(nth_page(spage, n)) &&
8a6771cda3f48a Herbert Xu                2025-03-15  231  			    size_add(soff, slen) > PAGE_SIZE)
8a6771cda3f48a Herbert Xu                2025-03-15  232  				break;
2d3553ecb4e316 Herbert Xu                2025-03-15  233  			src = kmap_local_page(spage) + soff;
8a6771cda3f48a Herbert Xu                2025-03-15  234  		} while (0);
2c1808e5fe5afd Herbert Xu                2025-03-15  235  	}
77292bb8ca69c8 Barry Song                2024-03-02  236  
2c56e090ffa701 Marco Elver               2025-02-19  237  	struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
8a6771cda3f48a Herbert Xu                2025-03-15  238  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  239  	if (!src_isvirt && !src) {
2c56e090ffa701 Marco Elver               2025-02-19  240  		struct scomp_scratch *scratch = scomp_lock_scratch();
2c56e090ffa701 Marco Elver               2025-02-19  241  		const u8 *src = scratch->src;
2d3553ecb4e316 Herbert Xu                2025-03-15  242  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  243  		memcpy_from_sglist(scratch->src, req->src, 0, slen);
2d3553ecb4e316 Herbert Xu                2025-03-15  244  
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  245  		if (dir)
2d3553ecb4e316 Herbert Xu                2025-03-15  246  			ret = crypto_scomp_compress(scomp, src, slen,
2d3553ecb4e316 Herbert Xu                2025-03-15  247  						    dst, &dlen, stream->ctx);
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  248  		else
2d3553ecb4e316 Herbert Xu                2025-03-15  249  			ret = crypto_scomp_decompress(scomp, src, slen,
2d3553ecb4e316 Herbert Xu                2025-03-15  250  						      dst, &dlen, stream->ctx);
2d3553ecb4e316 Herbert Xu                2025-03-15  251  
42d9f6c774790d Herbert Xu                2025-03-19 @252  		scomp_unlock_scratch(scratch);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  253  	} else if (dir)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  254  		ret = crypto_scomp_compress(scomp, src, slen,
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  255  					    dst, &dlen, stream->ctx);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  256  	else
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  257  		ret = crypto_scomp_decompress(scomp, src, slen,
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  258  					      dst, &dlen, stream->ctx);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  259  
42d9f6c774790d Herbert Xu                2025-03-19 @260  	crypto_acomp_unlock_stream_bh(stream);
2d3553ecb4e316 Herbert Xu                2025-03-15  261  
2d3553ecb4e316 Herbert Xu                2025-03-15  262  	req->dlen = dlen;
77292bb8ca69c8 Barry Song                2024-03-02  263  
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  264  	if (!src_isvirt && src)
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  265  		kunmap_local(src);
a7b1d0c5f1ca05 Herbert Xu                2025-03-19  266  	if (!dst_isvirt) {
2d3553ecb4e316 Herbert Xu                2025-03-15  267  		kunmap_local(dst);
2d3553ecb4e316 Herbert Xu                2025-03-15  268  		dlen += doff;
2d3553ecb4e316 Herbert Xu                2025-03-15  269  		for (;;) {
2d3553ecb4e316 Herbert Xu                2025-03-15  270  			flush_dcache_page(dpage);
2d3553ecb4e316 Herbert Xu                2025-03-15  271  			if (dlen <= PAGE_SIZE)
2d3553ecb4e316 Herbert Xu                2025-03-15  272  				break;
2d3553ecb4e316 Herbert Xu                2025-03-15  273  			dlen -= PAGE_SIZE;
2d3553ecb4e316 Herbert Xu                2025-03-15  274  			dpage = nth_page(dpage, 1);
77292bb8ca69c8 Barry Song                2024-03-02  275  		}
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  276  	}
2d3553ecb4e316 Herbert Xu                2025-03-15  277  
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  278  	return ret;
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  279  }
1ab53a77b772bf Giovanni Cabiddu          2016-10-21  280  

:::::: The code at line 252 was first introduced by commit
:::::: 42d9f6c774790d290c175e8775ce9f1366438098 crypto: acomp - Move scomp stream allocation code into acomp

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
