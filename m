Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85B154BE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735599959; cv=none; b=Lq6SXigkkZif4BKzd8/1ZRq/IoCynYH9DWQUHymP1b9gbfKKNIOvrTBiB7S0u8+xW6dQbZs9uH7RKvFiV69xweLSYTlgvhj2dwjEHph2btCv+cGncKvJEwNs/ikV/z3VDne+GSMTeELARw9nrvNTCN7IyYtggVFHhKXCaUNDbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735599959; c=relaxed/simple;
	bh=46VHk8hK5xqL7u61bHI3cd6mmkp2TS/lUmVfhN2ZCUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V7FABawgAO1smNQ7949gYvEF74HJ8OouFnJe72mBccu+jl9HPw7HHIqmnEtsl6HIRx/fPRM356URBGRf0+3gbFU7OSqdaf9wTPV0fdm4nlJw5u93M8rRrUFPcXs2rKJ+FGfeLc0XfqyV5jNjORz6b8Mgj1iLTwVFzWSMEtQcqTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AY3HFfz0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vnfHP/z8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AY3HFfz0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vnfHP/z8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AY3HFfz0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vnfHP/z8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AY3HFfz0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vnfHP/z8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48D191F37E;
	Mon, 30 Dec 2024 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735599956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdDqOEUKr732zxpzy7QjSwV3oaI2zeEN5KLC7v4970k=;
	b=AY3HFfz0A6aAHLE4qJdFOhJ4gcZ3PLtpyW1mllRB0Gw4Z3/WC/Aw0x81rj/e+A46itVZOR
	rOCw/30++7GP2PU5nAyC9utkLSxQcmbbDx7JGHtCYHclthUPG+PivO35yil4XtYPC52Gds
	XYw279hNsmwM/1iTcd4hbS0KZ6ijRhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735599956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdDqOEUKr732zxpzy7QjSwV3oaI2zeEN5KLC7v4970k=;
	b=vnfHP/z8fNPYR36g03YUCgulPAyBSD3mUBBI7dOJE/swUOm6S5ay16uaj8bPSMxjNI/1M6
	n1oNdJ+sb5UF1vCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735599956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdDqOEUKr732zxpzy7QjSwV3oaI2zeEN5KLC7v4970k=;
	b=AY3HFfz0A6aAHLE4qJdFOhJ4gcZ3PLtpyW1mllRB0Gw4Z3/WC/Aw0x81rj/e+A46itVZOR
	rOCw/30++7GP2PU5nAyC9utkLSxQcmbbDx7JGHtCYHclthUPG+PivO35yil4XtYPC52Gds
	XYw279hNsmwM/1iTcd4hbS0KZ6ijRhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735599956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdDqOEUKr732zxpzy7QjSwV3oaI2zeEN5KLC7v4970k=;
	b=vnfHP/z8fNPYR36g03YUCgulPAyBSD3mUBBI7dOJE/swUOm6S5ay16uaj8bPSMxjNI/1M6
	n1oNdJ+sb5UF1vCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C1DC13A30;
	Mon, 30 Dec 2024 23:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a3yrOFMnc2d5CgAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 30 Dec 2024 23:05:55 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 3610/5236] io_uring/io_uring.h:229:27:
 error: implicit declaration of function 'io_cache_alloc'; did you mean
 'kmem_cache_alloc'?
In-Reply-To: <3448d884-c2ec-42c5-bbf0-04a90943d6f7@kernel.dk> (Jens Axboe's
	message of "Fri, 27 Dec 2024 10:10:09 -0700")
Organization: SUSE
References: <202412262106.bjOOaZcE-lkp@intel.com>
	<3448d884-c2ec-42c5-bbf0-04a90943d6f7@kernel.dk>
Date: Mon, 30 Dec 2024 18:05:46 -0500
Message-ID: <87o70s7ovp.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Jens Axboe <axboe@kernel.dk> writes:

> On 12/26/24 6:13 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> commit: 694022b01368387cc1ed8485e279dfe27939ee43 [3610/5236] io_uring: Add generic helper to allocate async data
>> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262106.bjOOaZcE-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412262106.bjOOaZcE-lkp@intel.com/
>> 
>> Note: the linux-next/master HEAD 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2 builds fine.
>>       It may have been fixed somewhere.
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    In file included from io_uring/io_uring.c:82:
>>    io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>>>> io_uring/io_uring.h:229:27: error: implicit declaration of function
>>>> 'io_cache_alloc'; did you mean 'kmem_cache_alloc'?
>>>> [-Werror=implicit-function-declaration]
>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>          |                           ^~~~~~~~~~~~~~
>>          |                           kmem_cache_alloc
>>    io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>          |                         ^
>>    In file included from io_uring/io_uring.c:104:
>>    io_uring/alloc_cache.h: At top level:
>>>> io_uring/alloc_cache.h:33:21: error: conflicting types for
>>>> 'io_cache_alloc'; have 'void *(struct io_alloc_cache *, gfp_t, void
>>>> (*)(void *))' {aka 'void *(struct io_alloc_cache *, unsigned int,
>>>> void (*)(void *))'}
>>       33 | static inline void *io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp,
>>          |                     ^~~~~~~~~~~~~~
>>    io_uring/io_uring.h:229:27: note: previous implicit declaration of 'io_cache_alloc' with type 'int()'
>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>          |                           ^~~~~~~~~~~~~~
>>    cc1: some warnings being treated as errors
>> --
>>    In file included from io_uring/opdef.c:11:
>>    io_uring/io_uring.h: In function 'io_uring_alloc_async_data':
>>>> io_uring/io_uring.h:229:27: error: implicit declaration of function
>>>> 'io_cache_alloc'; did you mean 'kmem_cache_alloc'?
>>>> [-Werror=implicit-function-declaration]
>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>          |                           ^~~~~~~~~~~~~~
>>          |                           kmem_cache_alloc
>>    io_uring/io_uring.h:229:25: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>      229 |         req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>          |                         ^
>>    cc1: some warnings being treated as errors
>> 
>> 
>> vim +229 io_uring/io_uring.h
>> 
>>    224	
>>    225	static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
>>    226						      struct io_kiocb *req,
>>    227						      void (*init_once)(void *obj))
>>    228	{
>>  > 229		req->async_data = io_cache_alloc(cache, GFP_KERNEL, init_once);
>>    230		if (req->async_data)
>>    231			req->flags |= REQ_F_ASYNC_DATA;
>>    232		return req->async_data;
>>    233	}
>>    234	
>
> Gabriel, you add the alloc_cache.h include 3 patches too late, so biection
> breaks for the series after this identified commit.

This is nasty.  What's the best course of action?  Do you want to drop
the series since it is still in your branch and I can resend with this
fixed?  Or is it too late since it made into -next?  Sorry for this and
the other issue. This series was actually less harmless than I expected
and even though I always do a last minute 'git rebase --exec make'
before sending, I clearly failed to do it here.

-- 
Gabriel Krisman Bertazi
