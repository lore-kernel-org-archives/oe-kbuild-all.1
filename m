Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463603612DF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490307; cv=none; b=O1OGBvxFeRoxgIU5X/hu4b0hwdJTtxVAIozP6TUXVYNlHutQ8CLtQ06JeKIIVd4432YI8ORWSfHVyeujNWOnzs8rW9m8JhWbtnq8bTe/SzXxU9PkexrmTsqlE3OEvBnmKBNsvKKjr/oKFq2p9r62G/kR7bxUgvlfM4OoNOZwO5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490307; c=relaxed/simple;
	bh=euFA8Gpbxb444t3Sk88pL+hmZnDfk8DfBXd/0vmiFEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oxdaIl0TODagGIaXlcBasJkcpxjZEXzLmAC6si2U0YpBkNBPIjKhoDmeWjwmN3U3Ly/t+OlxKZMF+1tiqaw4qm8M0Wtk3U0EVPO1YXgXkPi3HnznXXEetHI1v7Djav1QgtF9dW057E4XNyhSWjpnpva0S6TqUdzU5RXbFNUa2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iYhHZ8B5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iYhHZ8B5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763490302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6S9yyzsxSw09DD49kBELj6v4WeMmTrKl8rTtJFc2Jc=;
	b=iYhHZ8B52lNASE2l7k0SFcebx8xOMbTp9l3/65qvW2qKgB8YzJ0jjf/EeeZMKCsswUX9I0
	br7VuRZAFjF2/iCa6ef8r3ziu8IeKoLQth/Pul/0MI0sAySUokeEV2wZGEb6uHmhniy5UK
	eaUNtIR84zyfjQ1lVn9/nQu2NJWGMsQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-1XtSCEMdNxGSGNJYbCpcvg-1; Tue,
 18 Nov 2025 13:24:56 -0500
X-MC-Unique: 1XtSCEMdNxGSGNJYbCpcvg-1
X-Mimecast-MFC-AGG-ID: 1XtSCEMdNxGSGNJYbCpcvg_1763490295
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0B13180048E;
	Tue, 18 Nov 2025 18:24:54 +0000 (UTC)
Received: from [10.44.32.60] (unknown [10.44.32.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB2A1195608E;
	Tue, 18 Nov 2025 18:24:52 +0000 (UTC)
Date: Tue, 18 Nov 2025 19:24:49 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: kernel test robot <lkp@intel.com>
cc: Dongsheng Yang <dongsheng.yang@linux.dev>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: include/linux/fortify-string.h:571:4: warning: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
In-Reply-To: <202511171758.8thF02dJ-lkp@intel.com>
Message-ID: <1aebcf4a-0d88-014e-18a4-fe36e528dd35@redhat.com>
References: <202511171758.8thF02dJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi

Would you explain what's wrong there?

at drivers/md/dm-pcache/cache_key.c:816 there's
cache_pos_copy(&cache->key_head, pos);

cache_pos_copy is defined as:
static inline void cache_pos_copy(struct pcache_cache_pos *dst, struct pcache_cache_pos *src)
{
        memcpy(dst, src, sizeof(struct pcache_cache_pos));
}

cache->key_head has the type struct pcache_cache_pos
pos has the type struct pcache_cache_pos *
pos points to the local variable pos_tail, that has the type 
pcache_cache_pos.

So, I don't see any access beyond end of structure there. Am I missing 
something?

Mikulas


On Mon, 17 Nov 2025, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6a23ae0a96a600d1d12557add110e0bb6e32730c
> commit: 1d57628ff95b32d5cfa8d8f50e07690c161e9cf0 dm-pcache: add persistent cache target in device-mapper
> date:   3 months ago
> config: riscv-randconfig-r113-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171758.8thF02dJ-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171758.8thF02dJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511171758.8thF02dJ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:382,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/smp.h:13,
>                     from include/linux/lockdep.h:14,
>                     from include/linux/spinlock.h:63,
>                     from include/linux/sched.h:37,
>                     from include/linux/mempool.h:8,
>                     from include/linux/bio.h:8,
>                     from drivers/md/dm-pcache/segment.h:5,
>                     from drivers/md/dm-pcache/cache.h:5,
>                     from drivers/md/dm-pcache/cache_key.c:2:
>    In function 'fortify_memcpy_chk',
>        inlined from 'cache_pos_copy' at drivers/md/dm-pcache/cache.h:403:2,
>        inlined from 'cache_replay' at drivers/md/dm-pcache/cache_key.c:816:2:
> >> include/linux/fortify-string.h:571:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
>      571 |    __write_overflow_field(p_size_field, size);
>          |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/__write_overflow_field +571 include/linux/fortify-string.h
> 
> a28a6e860c6cf2 Francis Laniel 2021-02-25  515  
> f68f2ff91512c1 Kees Cook      2021-04-20  516  /*
> f68f2ff91512c1 Kees Cook      2021-04-20  517   * To make sure the compiler can enforce protection against buffer overflows,
> f68f2ff91512c1 Kees Cook      2021-04-20  518   * memcpy(), memmove(), and memset() must not be used beyond individual
> f68f2ff91512c1 Kees Cook      2021-04-20  519   * struct members. If you need to copy across multiple members, please use
> f68f2ff91512c1 Kees Cook      2021-04-20  520   * struct_group() to create a named mirror of an anonymous struct union.
> f68f2ff91512c1 Kees Cook      2021-04-20  521   * (e.g. see struct sk_buff.) Read overflow checking is currently only
> f68f2ff91512c1 Kees Cook      2021-04-20  522   * done when a write overflow is also present, or when building with W=1.
> f68f2ff91512c1 Kees Cook      2021-04-20  523   *
> f68f2ff91512c1 Kees Cook      2021-04-20  524   * Mitigation coverage matrix
> f68f2ff91512c1 Kees Cook      2021-04-20  525   *					Bounds checking at:
> f68f2ff91512c1 Kees Cook      2021-04-20  526   *					+-------+-------+-------+-------+
> f68f2ff91512c1 Kees Cook      2021-04-20  527   *					| Compile time  |   Run time    |
> f68f2ff91512c1 Kees Cook      2021-04-20  528   * memcpy() argument sizes:		| write | read  | write | read  |
> f68f2ff91512c1 Kees Cook      2021-04-20  529   *        dest     source   length      +-------+-------+-------+-------+
> f68f2ff91512c1 Kees Cook      2021-04-20  530   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
> f68f2ff91512c1 Kees Cook      2021-04-20  531   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
> f68f2ff91512c1 Kees Cook      2021-04-20  532   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
> f68f2ff91512c1 Kees Cook      2021-04-20  533   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
> f68f2ff91512c1 Kees Cook      2021-04-20  534   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
> f68f2ff91512c1 Kees Cook      2021-04-20  535   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
> f68f2ff91512c1 Kees Cook      2021-04-20  536   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
> f68f2ff91512c1 Kees Cook      2021-04-20  537   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
> f68f2ff91512c1 Kees Cook      2021-04-20  538   *					+-------+-------+-------+-------+
> f68f2ff91512c1 Kees Cook      2021-04-20  539   *
> f68f2ff91512c1 Kees Cook      2021-04-20  540   * y = perform deterministic compile-time bounds checking
> f68f2ff91512c1 Kees Cook      2021-04-20  541   * n = cannot perform deterministic compile-time bounds checking
> f68f2ff91512c1 Kees Cook      2021-04-20  542   * n/a = no run-time bounds checking needed since compile-time deterministic
> f68f2ff91512c1 Kees Cook      2021-04-20  543   * B = can perform run-time bounds checking (currently unimplemented)
> f68f2ff91512c1 Kees Cook      2021-04-20  544   * V = vulnerable to run-time overflow (will need refactoring to solve)
> f68f2ff91512c1 Kees Cook      2021-04-20  545   *
> f68f2ff91512c1 Kees Cook      2021-04-20  546   */
> 54d9469bc515dc Kees Cook      2021-06-24  547  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
> f68f2ff91512c1 Kees Cook      2021-04-20  548  					 const size_t p_size,
> f68f2ff91512c1 Kees Cook      2021-04-20  549  					 const size_t q_size,
> f68f2ff91512c1 Kees Cook      2021-04-20  550  					 const size_t p_size_field,
> f68f2ff91512c1 Kees Cook      2021-04-20  551  					 const size_t q_size_field,
> 475ddf1fce1ec4 Kees Cook      2023-04-07  552  					 const u8 func)
> a28a6e860c6cf2 Francis Laniel 2021-02-25  553  {
> a28a6e860c6cf2 Francis Laniel 2021-02-25  554  	if (__builtin_constant_p(size)) {
> f68f2ff91512c1 Kees Cook      2021-04-20  555  		/*
> f68f2ff91512c1 Kees Cook      2021-04-20  556  		 * Length argument is a constant expression, so we
> f68f2ff91512c1 Kees Cook      2021-04-20  557  		 * can perform compile-time bounds checking where
> fa35198f39571b Kees Cook      2022-09-19  558  		 * buffer sizes are also known at compile time.
> f68f2ff91512c1 Kees Cook      2021-04-20  559  		 */
> f68f2ff91512c1 Kees Cook      2021-04-20  560  
> f68f2ff91512c1 Kees Cook      2021-04-20  561  		/* Error when size is larger than enclosing struct. */
> fa35198f39571b Kees Cook      2022-09-19  562  		if (__compiletime_lessthan(p_size_field, p_size) &&
> fa35198f39571b Kees Cook      2022-09-19  563  		    __compiletime_lessthan(p_size, size))
> a28a6e860c6cf2 Francis Laniel 2021-02-25  564  			__write_overflow();
> fa35198f39571b Kees Cook      2022-09-19  565  		if (__compiletime_lessthan(q_size_field, q_size) &&
> fa35198f39571b Kees Cook      2022-09-19  566  		    __compiletime_lessthan(q_size, size))
> a28a6e860c6cf2 Francis Laniel 2021-02-25  567  			__read_overflow2();
> f68f2ff91512c1 Kees Cook      2021-04-20  568  
> f68f2ff91512c1 Kees Cook      2021-04-20  569  		/* Warn when write size argument larger than dest field. */
> fa35198f39571b Kees Cook      2022-09-19  570  		if (__compiletime_lessthan(p_size_field, size))
> f68f2ff91512c1 Kees Cook      2021-04-20 @571  			__write_overflow_field(p_size_field, size);
> f68f2ff91512c1 Kees Cook      2021-04-20  572  		/*
> f68f2ff91512c1 Kees Cook      2021-04-20  573  		 * Warn for source field over-read when building with W=1
> f68f2ff91512c1 Kees Cook      2021-04-20  574  		 * or when an over-write happened, so both can be fixed at
> f68f2ff91512c1 Kees Cook      2021-04-20  575  		 * the same time.
> f68f2ff91512c1 Kees Cook      2021-04-20  576  		 */
> fa35198f39571b Kees Cook      2022-09-19  577  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
> fa35198f39571b Kees Cook      2022-09-19  578  		     __compiletime_lessthan(p_size_field, size)) &&
> fa35198f39571b Kees Cook      2022-09-19  579  		    __compiletime_lessthan(q_size_field, size))
> f68f2ff91512c1 Kees Cook      2021-04-20  580  			__read_overflow2_field(q_size_field, size);
> a28a6e860c6cf2 Francis Laniel 2021-02-25  581  	}
> f68f2ff91512c1 Kees Cook      2021-04-20  582  	/*
> f68f2ff91512c1 Kees Cook      2021-04-20  583  	 * At this point, length argument may not be a constant expression,
> f68f2ff91512c1 Kees Cook      2021-04-20  584  	 * so run-time bounds checking can be done where buffer sizes are
> f68f2ff91512c1 Kees Cook      2021-04-20  585  	 * known. (This is not an "else" because the above checks may only
> f68f2ff91512c1 Kees Cook      2021-04-20  586  	 * be compile-time warnings, and we want to still warn for run-time
> f68f2ff91512c1 Kees Cook      2021-04-20  587  	 * overflows.)
> f68f2ff91512c1 Kees Cook      2021-04-20  588  	 */
> f68f2ff91512c1 Kees Cook      2021-04-20  589  
> f68f2ff91512c1 Kees Cook      2021-04-20  590  	/*
> f68f2ff91512c1 Kees Cook      2021-04-20  591  	 * Always stop accesses beyond the struct that contains the
> f68f2ff91512c1 Kees Cook      2021-04-20  592  	 * field, when the buffer's remaining size is known.
> 311fb40aa0569a Kees Cook      2022-09-02  593  	 * (The SIZE_MAX test is to optimize away checks where the buffer
> f68f2ff91512c1 Kees Cook      2021-04-20  594  	 * lengths are unknown.)
> f68f2ff91512c1 Kees Cook      2021-04-20  595  	 */
> 475ddf1fce1ec4 Kees Cook      2023-04-07  596  	if (p_size != SIZE_MAX && p_size < size)
> 3d965b33e40d97 Kees Cook      2023-04-07  597  		fortify_panic(func, FORTIFY_WRITE, p_size, size, true);
> 475ddf1fce1ec4 Kees Cook      2023-04-07  598  	else if (q_size != SIZE_MAX && q_size < size)
> 94fd44648dae2a Kees Cook      2025-07-29  599  		fortify_panic(func, FORTIFY_READ, q_size, size, true);
> 54d9469bc515dc Kees Cook      2021-06-24  600  
> 54d9469bc515dc Kees Cook      2021-06-24  601  	/*
> 54d9469bc515dc Kees Cook      2021-06-24  602  	 * Warn when writing beyond destination field size.
> 54d9469bc515dc Kees Cook      2021-06-24  603  	 *
> 2003e483a81cc2 Kees Cook      2024-06-19  604  	 * Note the implementation of __builtin_*object_size() behaves
> 54d9469bc515dc Kees Cook      2021-06-24  605  	 * like sizeof() when not directly referencing a flexible
> 54d9469bc515dc Kees Cook      2021-06-24  606  	 * array member, which means there will be many bounds checks
> 54d9469bc515dc Kees Cook      2021-06-24  607  	 * that will appear at run-time, without a way for them to be
> 54d9469bc515dc Kees Cook      2021-06-24  608  	 * detected at compile-time (as can be done when the destination
> 54d9469bc515dc Kees Cook      2021-06-24  609  	 * is specifically the flexible array member).
> 54d9469bc515dc Kees Cook      2021-06-24  610  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
> 54d9469bc515dc Kees Cook      2021-06-24  611  	 */
> 2003e483a81cc2 Kees Cook      2024-06-19  612  	if (p_size_field != SIZE_MAX &&
> 54d9469bc515dc Kees Cook      2021-06-24  613  	    p_size != p_size_field && p_size_field < size)
> 54d9469bc515dc Kees Cook      2021-06-24  614  		return true;
> 54d9469bc515dc Kees Cook      2021-06-24  615  
> 54d9469bc515dc Kees Cook      2021-06-24  616  	return false;
> a28a6e860c6cf2 Francis Laniel 2021-02-25  617  }
> a28a6e860c6cf2 Francis Laniel 2021-02-25  618  
> 
> :::::: The code at line 571 was first introduced by commit
> :::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time
> 
> :::::: TO: Kees Cook <keescook@chromium.org>
> :::::: CC: Kees Cook <keescook@chromium.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

