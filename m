Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518628FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 21:11:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E784922021;
	Fri, 11 Nov 2022 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1668201084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7S3ir/l0uio8KcE29E9g1I1ku+YQ2IOl6IeYpDw0JQ=;
	b=YRvzTqj9ip3ozeHd4K8lVIvhG4EKZ0FjMfv+h5lVBLSHCb2BPZTVj7SYuW8CnyIfi336Zc
	Lk4UeG+DtQAZvyIzHURvMCSE+JDF4Ihik3vtW59Gs0gtI35jppCMPSyv9/8niI8B516db4
	LEL0pn0EUVUDXyMBnoigd77L24l0DDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1668201084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7S3ir/l0uio8KcE29E9g1I1ku+YQ2IOl6IeYpDw0JQ=;
	b=/PzWSF+/wH/o7jmzgXua5xS2zXgpo6HJYo8MgFHd54Zsg7axAmEtLGVdOXAsTZCnRAy9nG
	yc+PAI+mm0RLOlDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB4F613273;
	Fri, 11 Nov 2022 21:11:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hu7oLHy6bmNyYQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Fri, 11 Nov 2022 21:11:24 +0000
Message-ID: <eebc9dc8-6a45-c099-61da-230d06cb3157@suse.cz>
Date: Fri, 11 Nov 2022 22:11:24 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [lkp] [+5395 bytes kernel size regression] [i386-tinyconfig]
 [b7c8731082] Deprecating and removing SLOB
Content-Language: en-US
To: Josh Triplett <josh@joshtriplett.org>, oe-kbuild-all@lists.linux.dev,
 Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: kernel test robot <lkp@intel.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
References: <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>
 <Y25E9cJbhDAKi1vd@99bb1221be19> <Y26FN02o7jhV87wl@localhost>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Y26FN02o7jhV87wl@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/22 18:24, Josh Triplett wrote:
> On Fri, Nov 11, 2022 at 08:49:57PM +0800, kernel test robot wrote:
>> FYI, we noticed a +5395 bytes kernel size regression due to commit:
>> 
>> commit: b7c873108294f0fd19c7e4d6b038a05375b3cd33 (Deprecating and removing SLOB)
>> url: https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slob-rename-CONFIG_SLOB-to-CONFIG_SLOB_DEPRECATED/20221111-183529
>> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
>> patch subject: [PATCH] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
>> 
>> 
>> Details as below (size data is obtained by `nm --size-sort vmlinux`):
>> 
>> e1e3de44: Merge branch 'mm-nonmm-unstable' into mm-everything
>> b7c87310: Deprecating and removing SLOB
> 
> This patch has the net effect of switching tiny over from SLOB to SLUB,
> which causes a 5k+ size regression.
> 
> I *absolutely* appreciate the value of removing this much code, and I'm
> not going to propose keeping SLOB for the sole reason of being 5k
> smaller; it's not worth keeping a whole allocator for that. I also
> wouldn't be surprised if we get *some* of that back by simplifications
> this change enables in the rest of the kernel.

+Cc more slab people and linux-mm, the lkp report is here:
https://lore.kernel.org/all/Y25E9cJbhDAKi1vd@99bb1221be19/

Yeah, probably not immediately but if we succeed in removing SLAB as well,
the mm/slab_common.c wrapper can go away which should reduce the code.

> But I'm wondering if there might be any low-hanging fruit that could
> slim down SLUB to the tune of 5k or so, that has been previously ignored
> because SLOB served that use case? For instance, largely self-contained
> bits of SLUB functionality that could be omitted on the tiniest of
> systems?

Maybe not the whole of 5k, but looking at the symbol sizes we could get
something back with less aggressive inlining. Maybe add something like a
SLUB_TINY config that sets the other configs correctly for minimal footprint
and does tweaks like that to inlining or more code removal. Besides the code
size, the less obvious but probably more important is how many slab pages it
needs to allocate at runtime.
E.g. for the configs, "make tinyconfig" seems to not set those like
SLUB_DEBUG and SLUB_CPU_PARTIAL, which is good for making both code and page
allocation smaller, but it also doesn't set SLAB_MERGE_DEFAULT which should
result in fewer slab pages allocated if enabled.
With SLUB_TINY we could also ditch completely percpu caches and associated
code and just rely on the spin_lock protected partial list...

> - Josh Triplett

