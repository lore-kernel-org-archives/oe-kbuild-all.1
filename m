Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EFCA65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 07:12:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3919821892;
	Tue,  3 Oct 2023 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1696317137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ML0Bq3fUJtjxTm9VqpWVCcW1VPuRT3wjKkahW+Cqogs=;
	b=aZWF76v8QkH/RTbw/6ETYEGwaZm4Kr2napQ95HcZQO0wEDN0ceLYM0ryXqIa7B84zUhQ4N
	AvNM57dFWIRdLGvJILhvIZBHfdPUoSwVX9S/ZbnDehqYEy8wRj2br83GFWJjLBPdJturBH
	ey2o1zpGCZUdaM+YpvCCab/AU1QBRMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1696317137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ML0Bq3fUJtjxTm9VqpWVCcW1VPuRT3wjKkahW+Cqogs=;
	b=dUPWRDhHDiYcRk3VBbo2F+9BZZFCfkN8RvGuPqZ0lSF81r2iOCoqL5UTXdPC9ZMI3cZtAm
	jFDeNK1F509htLBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29C55139F9;
	Tue,  3 Oct 2023 07:12:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kuBqCdG+G2XcEQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 03 Oct 2023 07:12:17 +0000
Message-ID: <94d84c27-ad7f-3026-f105-ee7ab5a5e014@suse.cz>
Date: Tue, 3 Oct 2023 09:12:16 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [vbabka:slab-remove-slab-v1r0 7/14] mm/kasan/quarantine.c:145:23:
 warning: unused variable 'flags'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
References: <202310031433.kyisgGOt-lkp@intel.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <202310031433.kyisgGOt-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/3/23 08:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-remove-slab-v1r0

Hi, appreciate the test! Can you please adjust the Cc list for the repo
vbabka/linux.git so linux-mm is not included, to reduce the volume. This
repo it's where I put my own development branches for review/testing.

For vbabka/slab.git it's ok to keep linux-mm as that's the official slab
subsystem tree where accepted patches are merged.

Thanks,
Vlastimil

> head:   227c2d309e94ff014379c57ecadff7df03a1e349
> commit: 175f421def9a7765457d1434f9df37303ff1ed9f [7/14] KASAN: remove code paths guarded by CONFIG_SLAB
> config: x86_64-randconfig-006-20231003 (https://download.01.org/0day-ci/archive/20231003/202310031433.kyisgGOt-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031433.kyisgGOt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310031433.kyisgGOt-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/kasan/quarantine.c: In function 'qlink_free':
>>> mm/kasan/quarantine.c:145:23: warning: unused variable 'flags' [-Wunused-variable]
>      145 |         unsigned long flags;
>          |                       ^~~~~
> 
> 
> vim +/flags +145 mm/kasan/quarantine.c
> 
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  140  
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  141  static void qlink_free(struct qlist_node *qlink, struct kmem_cache *cache)
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  142  {
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  143  	void *object = qlink_to_object(qlink, cache);
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  144  	struct kasan_free_meta *meta = kasan_get_free_meta(cache, object);
> 55834c59098d0c5 Alexander Potapenko 2016-05-20 @145  	unsigned long flags;
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  146  
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  147  	/*
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  148  	 * If init_on_free is enabled and KASAN's free metadata is stored in
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  149  	 * the object, zero the metadata. Otherwise, the object's memory will
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  150  	 * not be properly zeroed, as KASAN saves the metadata after the slab
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  151  	 * allocator zeroes the object.
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  152  	 */
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  153  	if (slab_want_init_on_free(cache) &&
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  154  	    cache->kasan_info.free_meta_offset == 0)
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  155  		memzero_explicit(meta, sizeof(*meta));
> 26dca996ea7b1ac Andrey Konovalov    2022-01-14  156  
> 97593cad003c668 Andrey Konovalov    2020-12-22  157  	/*
> f0953a1bbaca71e Ingo Molnar         2021-05-06  158  	 * As the object now gets freed from the quarantine, assume that its
> 97593cad003c668 Andrey Konovalov    2020-12-22  159  	 * free track is no longer valid.
> 97593cad003c668 Andrey Konovalov    2020-12-22  160  	 */
> 06bc4cf6cdde690 Andrey Konovalov    2022-05-12  161  	*(u8 *)kasan_mem_to_shadow(object) = KASAN_SLAB_FREE;
> 97593cad003c668 Andrey Konovalov    2020-12-22  162  
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  163  	___cache_free(cache, object, _THIS_IP_);
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  164  }
> 55834c59098d0c5 Alexander Potapenko 2016-05-20  165  
> 
> :::::: The code at line 145 was first introduced by commit
> :::::: 55834c59098d0c5a97b0f3247e55832b67facdcf mm: kasan: initial memory quarantine implementation
> 
> :::::: TO: Alexander Potapenko <glider@google.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 

