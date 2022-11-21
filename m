Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BAA4F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 09:22:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB1F21F45E;
	Mon, 21 Nov 2022 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1669022524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncmJy/GrOxJK5KE7kwDWk65UVGjBhwRiMKTJ82IqkTw=;
	b=w6+ar4YZkbQ+A2y3kkM1KxCoFqHxIEo6nYf5wfVyJnRHGyiSTr8U5wp7gyWc46tWouDe2s
	R0dYpvSbQcy/6UUfpXLEBktJJgk/8sDy/fS/nK05dO8Z4aLES6MjbKkhZco9IcrMavpCVB
	UwHiXo2GpURKVl60If7Z8qvtkKKtDok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1669022524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncmJy/GrOxJK5KE7kwDWk65UVGjBhwRiMKTJ82IqkTw=;
	b=HYhJlYNCaTeeIgK1KItf/zpAg5N8hyZkcZfPM+VsOUGXeyRlGbWOtVtBENPiyfzrkS/8le
	eR9jgdT7M2xOypAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC5771377F;
	Mon, 21 Nov 2022 09:22:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id n+3IKDxDe2NQaQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Mon, 21 Nov 2022 09:22:04 +0000
Message-ID: <5bb911d7-bef2-b8ae-147b-d7febf5cbd91@suse.cz>
Date: Mon, 21 Nov 2022 10:22:04 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
To: Dennis Zhou <dennis@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, 42.hyeyoo@gmail.com
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
 <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz> <Y3MR5ZA6DClG/2rC@fedora>
 <Y3NXJF+hzp/s5FU4@MiWiFi-R3L-srv> <Y3Pv0LwOhBdcnxfX@fedora>
 <Y3TKM38RpvbkloJJ@MiWiFi-R3L-srv> <Y3aKHQ83MmSE+m88@fedora>
 <97b6c8e7-36f3-1181-7ffb-d94e8a8d293e@suse.cz> <Y3fYKnMZ0d/jtoKN@fedora>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Y3fYKnMZ0d/jtoKN@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/22 20:08, Dennis Zhou wrote:
> On Fri, Nov 18, 2022 at 10:49:43AM +0100, Vlastimil Babka wrote:
>> > 
>> > I think I might be overindexing on the out of tree modifications here.
>> > Currently, I think it's clear how modifying PERCPU_DYNAMIC_RESERVE
>> > affects the system with the lower bound being dictated by
>> > PERCPU_DYNAMIC_EARLY_SIZE. If we bump PERCPU_DYNAMIC_EARLY_SIZE, it's
>> > not inherently obvious you can drop that value lower depending on your
>> > system config.
>> > 
>> > Ultimately, it is only a few pages, so is saving it that big of a deal
>> > today? Likely not, just a bit wasteful to potentially orphan a few extra
>> > pages unnecessarily.
>> > 
>> > Let's just fix this now and I can massage this in the future if anything
>> > comes up. I appreciate you taking the time to have this discussion with
>> > me.
>> > 
>> > Vlastimil, can you please pick up this fix.
>> 
>> Sorry, got a bit lost, so do you mean the original uncoditional bump, or the
>> modification with BITS_PER_LONG > 32 (or PAGE_SHIFT > 12)?
>> 
> 
> No I've made this more complicated than necessary. Please pick up the
> original unconditional bump.
> 
> There's a small chance you'll see a merge conflict in my percpu#for-6.2
> tree:
> d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")

Thanks, picked up.

> Thanks,
> Dennis
> 
>> > Acked-by: Dennis Zhou <dennis@kernel.org>
>> > 
>> > Thanks,
>> > Dennis

