Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D279F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 17:58:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B57A201FE;
	Mon, 14 Nov 2022 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1668448694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wP8ZO4htUVRSV+3nuqbFQg3/1CH/TVAUi5zLdVrnUh0=;
	b=Oa+K94gGlPfTZoPCgreEAWe+4c0kGgtoS3Ti4xGhqd2eOul5fB7XrYe0s5Gs6hw/s38YtN
	byJW7HlRmB2OXM3V1QkTCQDSj7qAUXvdqGL+gF0GV2Zse4pIkhBussjZc05kxcVV4sDgeP
	D6C9foHofLKaYzz4E5hWw/qG9KcGQM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1668448694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wP8ZO4htUVRSV+3nuqbFQg3/1CH/TVAUi5zLdVrnUh0=;
	b=1OfG5JVBkRJs+l3u1vdWDa22saA8ueBqSJBL1+BgL6cu7XnSIO/sR02YWH9YJipCYJZaZK
	b2+yEPbd7+sFsbBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 112D313A8C;
	Mon, 14 Nov 2022 17:58:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hS51A7aBcmNOaQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Mon, 14 Nov 2022 17:58:14 +0000
Message-ID: <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>
Date: Mon, 14 Nov 2022 18:58:13 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Dennis Zhou <dennis@kernel.org>, 42.hyeyoo@gmail.com
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/22 08:44, Baoquan He wrote:
> Hi,
> 
> I reproduced the build failure according to lkp report and made a patch
> as below to fix it.
> 
> From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Sun, 13 Nov 2022 18:08:27 +0800
> Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
> Content-type: text/plain
> 
> LKP reported a build failure as below on the patch "mm/slub, percpu:
> correct the calculation of early percpu allocation size"

Since I have that patch in slab.git exposed to -next, should I take this fix
too, to make things simpler? Dennis?

> ~~~~~~
> In file included from <command-line>:
> In function 'alloc_kmem_cache_cpus',
>    inlined from 'kmem_cache_open' at mm/slub.c:4340:6:
>>> include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_474' declared with attribute error:
> BUILD_BUG_ON failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH * sizeof(struct kmem_cache_cpu)
>      357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> ~~~~~~
> 
> From the kernel config file provided by LKP, the building was made on
> arm64 with below Kconfig item enabled:
> 
>   CONFIG_ZONE_DMA=y
>   CONFIG_SLUB_CPU_PARTIAL=y
>   CONFIG_DEBUG_LOCK_ALLOC=y
>   CONFIG_SLUB_STATS=y
>   CONFIG_ARM64_PAGE_SHIFT=16
>   CONFIG_ARM64_64K_PAGES=y
> 
> Then we will have:
>   NR_KMALLOC_TYPES:4
>   KMALLOC_SHIFT_HIGH:17
>   sizeof(struct kmem_cache_cpu):184
> 
> The product of them is 12512, which is bigger than PERCPU_DYNAMIC_EARLY_SIZE,
> 12K. Hence, the BUILD_BUG_ON in alloc_kmem_cache_cpus() is triggered.
> 
> Earlier, in commit 099a19d91ca4 ("percpu: allow limited allocation
> before slab is online"), PERCPU_DYNAMIC_EARLY_SIZE was introduced and
> set to 12K which is equal to the then PERPCU_DYNAMIC_RESERVE.
> Later, in commit 1a4d76076cda ("percpu: implement asynchronous chunk
> population"), PERPCU_DYNAMIC_RESERVE was increased by 8K, while
> PERCPU_DYNAMIC_EARLY_SIZE was kept unchanged.
> 
> So, here increase PERCPU_DYNAMIC_EARLY_SIZE by 8K too to accommodate to
> the slub's requirement.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  include/linux/percpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index 70bc17db00a6..1338ea2aa720 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -41,7 +41,7 @@
>   * for this.  Keep PERCPU_DYNAMIC_RESERVE equal to or larger than
>   * PERCPU_DYNAMIC_EARLY_SIZE.
>   */
> -#define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
> +#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
>  
>  /*
>   * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy

