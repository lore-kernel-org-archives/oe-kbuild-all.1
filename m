Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7052F1E376C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809529; cv=none; b=pQ7xFcPnG4BCPVULcqiamS19iwdC1UeI/WZVtqGQzO4p2RN/ah9ospFzc3tcbl+3oBieOxMU79dFAt7OPGiaKQI6sPeCIyq9JhQTDfu4lZ2dGnH4gTJzQNP3cG0Y1cZb69cUonpHf8qRiPhw7smdxGUOudAHpuzctBdF2zt0hAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809529; c=relaxed/simple;
	bh=cE6uor6V224HNqy9HKfNDm3EQVoF+57j5YGcxGtYSTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1p890eeDzWjmHwtNMTp5P1SVtKPxfRwA8nl1BHfiiWZqNXsUkSO6yNebTW2Xc61NOdhBR6Lf5A56AqLO9TNYu602mk5scGPxFsib+AMDEM+G9yLzrDqcVkukR/sI7lCa1EZ92Dzpk+CDlTopMud7LjglgVgq+VMNGEuGrIcPeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hTjeQwbV; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=O1lASry1; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hTjeQwbV; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=O1lASry1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hTjeQwbV";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="O1lASry1";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hTjeQwbV";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="O1lASry1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A08E8336A6;
	Mon, 19 Jan 2026 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768809525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UWAeQdFM5O5XpnGyuEM2lgvoZM7EruZDUjlPqgsaQB4=;
	b=hTjeQwbVDSnxIc8bjN2OB+9YmPSdAKVcuq/w3tage9Llv9oeIyShsq28/rmVg4QQEn7Pbj
	ds+YRF9LiBrJrQbUYWl6Twoj4ybJLDmEr+5vtVD/ctoOgXsqgmrOiJy7nS5mdZ4KKg5Lac
	9qTXTRWNZuw1RX/yj+wI1rCTAAP18d0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768809525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UWAeQdFM5O5XpnGyuEM2lgvoZM7EruZDUjlPqgsaQB4=;
	b=O1lASry1rqNcc6N8aXrzs4jxkfBS18GsU7awevZKQF3QYCletWSeFoosl4lbEaDCpM/ne6
	g6Uc25bx+Jq2jTDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768809525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UWAeQdFM5O5XpnGyuEM2lgvoZM7EruZDUjlPqgsaQB4=;
	b=hTjeQwbVDSnxIc8bjN2OB+9YmPSdAKVcuq/w3tage9Llv9oeIyShsq28/rmVg4QQEn7Pbj
	ds+YRF9LiBrJrQbUYWl6Twoj4ybJLDmEr+5vtVD/ctoOgXsqgmrOiJy7nS5mdZ4KKg5Lac
	9qTXTRWNZuw1RX/yj+wI1rCTAAP18d0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768809525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UWAeQdFM5O5XpnGyuEM2lgvoZM7EruZDUjlPqgsaQB4=;
	b=O1lASry1rqNcc6N8aXrzs4jxkfBS18GsU7awevZKQF3QYCletWSeFoosl4lbEaDCpM/ne6
	g6Uc25bx+Jq2jTDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 965F03EA63;
	Mon, 19 Jan 2026 07:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mZQPIzXkbWlVeAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 19 Jan 2026 07:58:45 +0000
Message-ID: <78b4fe04-770f-4f14-b741-04fd4a026ace@suse.cz>
Date: Mon, 19 Jan 2026 08:58:45 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5478/6849] mm/slub.c:2340:16: error: use of
 undeclared identifier 'MEMCG_DATA_OBJEXTS'
Content-Language: en-US
To: Harry Yoo <harry.yoo@oracle.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202601172108.4M7RmCaj-lkp@intel.com> <aW2KpbqlxEbWhCey@hyeyoo>
 <aW2gCj7pDfRKvmZI@hyeyoo>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <aW2gCj7pDfRKvmZI@hyeyoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,01.org:url,intel.com:email,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On 1/19/26 04:07, Harry Yoo wrote:
> On Mon, Jan 19, 2026 at 10:36:37AM +0900, Harry Yoo wrote:
>> On Sat, Jan 17, 2026 at 09:23:02PM +0800, kernel test robot wrote:
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> > head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
>> > commit: aeb88c8de3688638632d5867c352676d334e6531 [5478/6849] mm/slab: save memory by allocating slabobj_ext array from leftover
>> > config: mips-randconfig-r062-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/config
>> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project
>> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/reproduce
>> > 
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601172108.4M7RmCaj-lkp@intel.com/
>> > 
>> > All errors (new ones prefixed by >>):
>> > 
>> >    mm/slub.c:2154:33: error: passing 'union codetag_ref' to parameter of incompatible type 'union codetag_ref *'; take the address with &
>> >     2154 |                 if (unlikely(is_codetag_empty(ext->ref))) {
>> >          |                                               ^~~~~~~~
>> >          |                                               &
>> 
>> Oh, what a silly mistake. This should definitely be &ext->ref.
>> How it didn't break my build with CONFIG_MEM_ALLOC_PROFILING=y?

Probably lack of CONFIG_MEM_ALLOC_PROFILING_DEBUG which guards the function
that does the is_codetag_empty() call above?

>> >    include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
>> >       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>> >          |                                             ^
>> >    include/linux/alloc_tag.h:52:56: note: passing argument to parameter 'ref' here
>> >       52 | static inline bool is_codetag_empty(union codetag_ref *ref)
>> >          |                                                        ^
>> > >> mm/slub.c:2340:16: error: use of undeclared identifier 'MEMCG_DATA_OBJEXTS'
>> >     2340 |                         obj_exts |= MEMCG_DATA_OBJEXTS;
>> >          |                                     ^
>> >    2 errors generated.
>> > 
>> > 
>> > vim +/MEMCG_DATA_OBJEXTS +2340 mm/slub.c
>> > 
>> >   2316	
>> >   2317	/*
>> >   2318	 * Try to allocate slabobj_ext array from unused space.
>> >   2319	 * This function must be called on a freshly allocated slab to prevent
>> >   2320	 * concurrency problems.
>> >   2321	 */
>> >   2322	static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
>> >   2323	{
>> >   2324		void *addr;
>> >   2325		unsigned long obj_exts;
>> >   2326	
>> >   2327		if (!need_slab_obj_exts(s))
>> >   2328			return;
>> >   2329	
>> >   2330		if (obj_exts_fit_within_slab_leftover(s, slab)) {
>> >   2331			addr = slab_address(slab) + obj_exts_offset_in_slab(s, slab);
>> >   2332			addr = kasan_reset_tag(addr);
>> >   2333			obj_exts = (unsigned long)addr;
>> >   2334	
>> >   2335			get_slab_obj_exts(obj_exts);
>> >   2336			memset(addr, 0, obj_exts_size_in_slab(slab));
>> >   2337			put_slab_obj_exts(obj_exts);
>> >   2338	
>> >   2339			if (IS_ENABLED(CONFIG_MEMCG))
>> > > 2340				obj_exts |= MEMCG_DATA_OBJEXTS;
>> 
>> The config does not enable CONFIG_MEMCG.
>> 
>> Hmm, this is strange. It works when I change it to #ifdef CONFIG_MEMCG,
>> but doesn't work with IS_ENABLED().
> 
> It appears to generate code that uses MEMCG_DATA_OBJEXTS and throws a
> compile error before dead code elimination removes it. (Interestingly my
> compiler didn't produce error, but MIPS Clang does...)

Hm that's weird, both recent gcc and clang here (x86_64) error. I've never
seen dead code elimination to work at this level and would be surprised if
it did (maybe it even can't). Did you really have disabled CONFIG_MEMCG
properly (and not also disabled the whole objexts) when checking this?

> Anyway, this should fix the issue (confirmed that the compilation errors
> are resolved with MIPS Clang, and locallty tested on my machine):

I've amended the individual commits, slab/for-next should be ok now.
Thanks.

> diff --git a/mm/slub.c b/mm/slub.c
> index 373ee58b8b9e..1d87134cef90 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2200,7 +2200,7 @@ static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
>  		struct slabobj_ext *ext = slab_obj_ext(obj_exts_slab,
>  						       slab_exts, offs);
> 
> -		if (unlikely(is_codetag_empty(ext->ref))) {
> +		if (unlikely(is_codetag_empty(&ext->ref))) {
>  			put_slab_obj_exts(slab_exts);
>  			return;
>  		}
> @@ -2385,8 +2385,9 @@ static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
>  		memset(addr, 0, obj_exts_size_in_slab(slab));
>  		put_slab_obj_exts(obj_exts);
> 
> -		if (IS_ENABLED(CONFIG_MEMCG))
> -			obj_exts |= MEMCG_DATA_OBJEXTS;
> +#ifdef CONFIG_MEMCG
> +		obj_exts |= MEMCG_DATA_OBJEXTS;
> +#endif
>  		slab->obj_exts = obj_exts;
>  		slab_set_stride(slab, sizeof(struct slabobj_ext));
>  	} else if (s->flags & SLAB_OBJ_EXT_IN_OBJ) {
> @@ -2402,8 +2403,9 @@ static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
>  			       sizeof(struct slabobj_ext));
>  		put_slab_obj_exts(obj_exts);
> 
> -		if (IS_ENABLED(CONFIG_MEMCG))
> -			obj_exts |= MEMCG_DATA_OBJEXTS;
> +#ifdef CONFIG_MEMCG
> +		obj_exts |= MEMCG_DATA_OBJEXTS;
> +#endif
>  		slab->obj_exts = obj_exts;
>  		slab_set_stride(slab, s->size);
>  	}
> 

