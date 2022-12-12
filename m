Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D61360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670863225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lj9lgNB66oCq/CW4FlnlqPZf6VrO0EKuQ+GU4/qK+bA=;
	b=il+1yImMCZaakZvGM4YLL1ekkFbkJ6NJMoZMwHA6rVEIv8xC/8FbGQYWvDTpwsbbe6tXkA
	tcmo84XyG+ntG2BbWM27GGGxAMONWfTXAwPRR2t2qrZ4FafmX6vqkycw+lW9IE77aQR0Vf
	10Zh31SRU27LiS4+R0GZTJ2p+i5RcAo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-_PFSBHMlNAqo8AkKMluTew-1; Mon, 12 Dec 2022 11:40:24 -0500
X-MC-Unique: _PFSBHMlNAqo8AkKMluTew-1
Received: by mail-wr1-f69.google.com with SMTP id j29-20020adfb31d000000b0024237066261so2392763wrd.14
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 08:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj9lgNB66oCq/CW4FlnlqPZf6VrO0EKuQ+GU4/qK+bA=;
        b=KX+Pa1rHEZztBTQX+l0UW1fW8fB10K8hYdiki7ydXCRgoXrxjZL59VLpU58s3I1URu
         666kGRiqJ8TY82x7PV8eqbBcPDh1YccSHXw0hmRZgqi7IAEieNNco7nfxUkgjovejqoY
         WtpZi2V9mVtk57tHcmLdPC7/uE95jJHYVuu4MyWXlr5mBsxqgc9BsGIgBYPXFEaJu2Oe
         XfU5lWrIpFTwVed8OFhFjL6I8l2jYJWK0fSRMVVOLhiL/ehdGsScLVQEtDQgM8svPeew
         NZpSEhATRJV9KPNfNlAymyjxg5oPogy/ok76h7dUjXJ4feKcgJBKfr31TfIkp9tbvXnW
         zfww==
X-Gm-Message-State: ANoB5plOH3K6SOa6snwewLoBERmbFsVHVpTlNnRE+u7wsxEeZy6DbbW0
	qCySZ3jngeskAYY7ngbTAudQM5UspDZw4ogK5QBCb2qMQLKpv/AOL3IFJLg/UPrEp7gNAtkuO6o
	3O3hHN8sczaHFrqzX44Hfs8xN9Q==
X-Received: by 2002:a05:6000:137a:b0:242:4209:ea73 with SMTP id q26-20020a056000137a00b002424209ea73mr10976615wrz.28.1670863223431;
        Mon, 12 Dec 2022 08:40:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4s2g1sz/k/TFZCx606AZDiQ4pjq6vWtC0cV05btuo6QXRPUqrKa77eeJstc8/boDkZmh+G+A==
X-Received: by 2002:a05:6000:137a:b0:242:4209:ea73 with SMTP id q26-20020a056000137a00b002424209ea73mr10976606wrz.28.1670863223186;
        Mon, 12 Dec 2022 08:40:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:7200:bb8f:4362:97b4:df85? (p200300cbc7017200bb8f436297b4df85.dip0.t-ipconnect.de. [2003:cb:c701:7200:bb8f:4362:97b4:df85])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d526b000000b002422202fa7fsm9241067wrc.39.2022.12.12.08.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 08:40:22 -0800 (PST)
Message-ID: <590404d8-4cb4-839e-c8a0-558fa4d059c4@redhat.com>
Date: Mon, 12 Dec 2022 17:40:21 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-stable 29/237]
 mm/gup_test.c:257:13-14: WARNING kvmalloc is used to allocate this memory at
 line 248 (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Yang Li <yang.lee@linux.alibaba.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>, oe-kbuild-all@lists.linux.dev
References: <bea909-677b-c1f1-6f31-2dd237e7516@inria.fr>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <bea909-677b-c1f1-6f31-2dd237e7516@inria.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.12.22 17:26, Julia Lawall wrote:
> The concern is that pages is allocated with kvcalloc, but freed later
> using kfree.
> 

Indeed, that's wrong. Will send a fix. Thanks!

> julia
> 
> ---------- Forwarded message ----------
> Date: Sat, 10 Dec 2022 22:02:56 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
> Subject: [ammarfaizi2-block:akpm/mm/mm-stable 29/237] mm/gup_test.c:257:13-14:
>      WARNING kvmalloc is used to allocate this memory at line 248
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
> TO: David Hildenbrand <david@redhat.com>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> CC: Yang Li <yang.lee@linux.alibaba.com>
> 
> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-stable
> head:   3b91010500eba3601e906b0e92cf84fab4d895d1
> commit: c77369b437f983a862bb6741814670d4ad38478c [29/237] mm/gup_test: start/stop/read functionality for PIN LONGTERM test
> :::::: branch date: 11 hours ago
> :::::: commit date: 5 weeks ago
> config: arm-randconfig-c44-20221209
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> 
> cocci warnings: (new ones prefixed by >>)
>>> mm/gup_test.c:257:13-14: WARNING kvmalloc is used to allocate this memory at line 248
> 

-- 
Thanks,

David / dhildenb

