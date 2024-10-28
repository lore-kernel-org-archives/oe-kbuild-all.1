Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED48192D70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730156447; cv=none; b=LKAiHIjXZb2Nde3KpiIRGimOsIMfV2q0NohQGFZbO2I+AHeuYwVxfTSUBOhETZ1UYO2hFKzetdeYVwJ+Y2kpv0DRJkfZzxIOZ9ui6UnpOAQ88YKcUVRCYyJDePuVMGfC75B91+g2yL+DTVaeFpqTvQ8nvBEJydkGSCYSbIZGbvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730156447; c=relaxed/simple;
	bh=pvsYqFnCG+hOE26m9YhNNqKJGnCofp4oo9NVw1Ivhb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLVpRF7dXokebKaZShrLrJnrcN8XlhLLTtFH6BbQgxnlYDl62Kw4JtvrNxJez5c0cqen+RWsrKse0EwSYfv0iw01tHrL9Hun+JbTNug8b2eU/F9alqNTDriG7XSsue79GgmBXtPGDlciLT3mGY41Wtm2nmiZRFfc5yInQDgWoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XIZGhb5k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XIZGhb5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730156443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MRxJgB3YgSnw1yTqaH+7yOrW0eKlxXbG1X2H8gPR5g0=;
	b=XIZGhb5kxxOjJGjloCDzE5jIwmFXmgD9eslmZuGhA8WMAgRSyMn2zCHFPjSaFCnAd2LErh
	dLsVqiAvnd2Pq2lIfBIK1WxTpYXr2ntJIsOxAI9R8XnuJfMyr0dab1vo1V2pXhXeFhzLPi
	LjpDIV0zJ/V98CvVV6OnrpEx+LspOKM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-csq43aEWOBSTqaw7BNgpLw-1; Mon, 28 Oct 2024 19:00:42 -0400
X-MC-Unique: csq43aEWOBSTqaw7BNgpLw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe4a123fdso74829546d6.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 16:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730156442; x=1730761242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRxJgB3YgSnw1yTqaH+7yOrW0eKlxXbG1X2H8gPR5g0=;
        b=eXS1DGVl7fCBsvEbePJGXoaS9XlHYgSAmeXCqGdV6MP8hBX+BYlmqkK4uP4fxRdTY9
         YRtktxLR/ZI8W4gmEHpyicCj5VizarIHXrLvBVAqC6GRJR+HXVdJ7Mfq38cDzPPp7Qxz
         dfAK67JeiD0/2TfnLR4VtOu0Ts7MdhMz3vS26m8REclwvNk8nAFHpGCswIbx8Te4jHEq
         p+KC66HM/J92+kArty5LPpiw8sB5v3yTItN4pe0wfT+oRGz3oiwApgFWMVNFIU7Fg7NX
         TVUqruu7f8ezF1AESv5uwcFBPUfcxxvLIqjdo9yk3Rqsd/BpAZcPPsuJd/hY4K9sKrrj
         rW+A==
X-Forwarded-Encrypted: i=1; AJvYcCU/AkwoZFOnFGaDGD8NUjRKvekvJ4nawWS4WRU8QYh+SgreMqrfrJTp3jckX1ZGGCKDkn0kRq3UUA1b8AFC@lists.linux.dev
X-Gm-Message-State: AOJu0YztiEQ+gs5Gdtjkq3VnUXBNB8QrE2pqwk7mw4tPG5btGDNou/7+
	hf3E0DTne3sihablJ1q2FUjRJZjfARufBos4iSInSoVT/5Rexq94DoqSxSVtLb/LZDpbsUGqCNA
	4ssOfoztSMolvsQ22TXnFL5C/LDrVaVa1EqxoOD5xHsKo9/g3QijL751mAmbATio=
X-Received: by 2002:a05:6214:498c:b0:6cd:f6de:8ad2 with SMTP id 6a1803df08f44-6d18585e41amr177057796d6.45.1730156441974;
        Mon, 28 Oct 2024 16:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcjYmJlGC5rsL/bxk9haeN8uptv3mv86VmY+o/GSBPiJW8iqGYHl6BkHsr0flDiyYo77g/1g==
X-Received: by 2002:a05:6214:498c:b0:6cd:f6de:8ad2 with SMTP id 6a1803df08f44-6d18585e41amr177057486d6.45.1730156441631;
        Mon, 28 Oct 2024 16:00:41 -0700 (PDT)
Received: from [192.168.1.165] ([70.22.187.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2b533sm36964306d6.116.2024.10.28.16.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 16:00:41 -0700 (PDT)
Message-ID: <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
Date: Mon, 28 Oct 2024 19:00:40 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Mike Snitzer <snitzer@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This should be addressed upstream by commit 
872564c501b72ae0c84af51084753e8652e4a84b ("dm vdo data-vio: silence 
sparse warnings about locking context imbalances")

That commit is from February. Would it be possible for these checks to 
use a more up-to-date version of the code before warning us about things 
that have already been addressed?

Matt

On 10/21/24 3:19 AM, Dan Carpenter wrote:
> Hi Mike,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
> commit: f36b1d3ba533d21b5b793623f05761b0297d114e dm vdo: use a proper Makefile for dm-vdo
> config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191209.osrd8z9H-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410191209.osrd8z9H-lkp@intel.com/
> 
> smatch warnings:
> drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn: inconsistent returns '&pool->lock'.
> 
> vim +976 drivers/md/dm-vdo/data-vio.c
> 
> 79535a7881c0cb Matthew Sakai 2023-11-16  958  void vdo_launch_bio(struct data_vio_pool *pool, struct bio *bio)
> 79535a7881c0cb Matthew Sakai 2023-11-16  959  {
> 79535a7881c0cb Matthew Sakai 2023-11-16  960  	struct data_vio *data_vio;
> 79535a7881c0cb Matthew Sakai 2023-11-16  961
> 79535a7881c0cb Matthew Sakai 2023-11-16  962  	ASSERT_LOG_ONLY(!vdo_is_state_quiescent(&pool->state),
> 79535a7881c0cb Matthew Sakai 2023-11-16  963  			"data_vio_pool not quiescent on acquire");
> 79535a7881c0cb Matthew Sakai 2023-11-16  964
> 79535a7881c0cb Matthew Sakai 2023-11-16  965  	bio->bi_private = (void *) jiffies;
> 79535a7881c0cb Matthew Sakai 2023-11-16  966  	spin_lock(&pool->lock);
> 79535a7881c0cb Matthew Sakai 2023-11-16  967  	if ((bio_op(bio) == REQ_OP_DISCARD) &&
> 79535a7881c0cb Matthew Sakai 2023-11-16  968  	    !acquire_permit(&pool->discard_limiter, bio))
> 79535a7881c0cb Matthew Sakai 2023-11-16  969  		return;
>                                                          ^^^^^^
> 
> 79535a7881c0cb Matthew Sakai 2023-11-16  970
> 79535a7881c0cb Matthew Sakai 2023-11-16  971  	if (!acquire_permit(&pool->limiter, bio))
> 79535a7881c0cb Matthew Sakai 2023-11-16  972  		return;
>                                                          ^^^^^^
> Still holding pool->lock on these paths.
> 
> 79535a7881c0cb Matthew Sakai 2023-11-16  973
> 79535a7881c0cb Matthew Sakai 2023-11-16  974  	data_vio = get_available_data_vio(pool);
> 79535a7881c0cb Matthew Sakai 2023-11-16  975  	spin_unlock(&pool->lock);
> 79535a7881c0cb Matthew Sakai 2023-11-16 @976  	launch_bio(pool->completion.vdo, data_vio, bio);
> 79535a7881c0cb Matthew Sakai 2023-11-16  977  }
> 79535a7881c0cb Matthew Sakai 2023-11-16  978
> 

