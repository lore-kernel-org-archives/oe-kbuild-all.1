Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94593EA9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 22:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714085156; cv=none; b=LpGLLdDebVkaxD1ojPVfWW+W4d8MSKsD9O05xG2aqoPq2hy2YnlukyjFseetTPdkirtSmVhEK2tEGvimXCcZ9GkAveqVI9YXJ+R+FISEjthM85lWTFju6DN2rrn8jsxKsZVJ84zAfm6tS7DOU+Jy45ferHIIMciC5MZz3SnE6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714085156; c=relaxed/simple;
	bh=jxeYLbFIO3qrKWZkoNdHv4O2h0rfDqP4aBN95HlAjIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Da9Vsb95sERcOO31H1/TPsNEcTMmnzw60pEaBxwdXPNQ174D/Fc56mjQf+9JigXxMRYnYq5xtTQ89f/HvGgNya8Fq9S0JNxzfeXfL67s08qCYZdFN9uWLNVWGROgQ71ER0RzRMYf02zocmiLxrjESTYeHaXIZ5CX1t3Y1xsQtDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UaSeLntn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UaSeLntn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714085153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nUaSmzGbXoW6XdSxqdYrfPKfpk8zIxCfRz2a71nXGU=;
	b=UaSeLntnA8IXyvdprbvdt3Jq38koMd2vBxCJ6sgok8cfizHb0nppCFBWUhtHaYTxyfEE/l
	sXBoowMsIeIn3JPM0IABa4jz9VdjGwH9fuMuF0XqvwGfpWvQNn7yQwkS3zLmk08hj+WTYr
	r6+bRTscJEg8oAXxEWQi+jmQyriutlg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-Z9jEN_WIPyG4J9fnEOu88A-1; Thu, 25 Apr 2024 18:45:52 -0400
X-MC-Unique: Z9jEN_WIPyG4J9fnEOu88A-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a4f59746f7so1690364a91.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 15:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714085151; x=1714689951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nUaSmzGbXoW6XdSxqdYrfPKfpk8zIxCfRz2a71nXGU=;
        b=rr0aNUXi+5QUFjN8FauVJLKwYPKYNGk6imIU3QvvcEhmtYAmpfNgjFRvjZUN5roPRD
         IewZRXw9URSnIbweLWWeEO9UyGp7JUixEOoQj3zLr3eO4fYbx2+Dhoz5jcFg++cw9O8G
         gpdgclAJDkKYiVM4P0pLJdxO5Lz018oWFTfB6/ZZ0qAyHryDyZjLmnTFpYZcQ22elZzq
         reI6ims3LeYkOcbOQpV+tKTKX2ozEVZ4u269mT9dxteP+od6kNWtrbSs+jt5HwnnhOxY
         T3zrLO//DeZIcQ5qY9n2ilsl6F855tiFsGcUGDy9J1zVthIfvw2ZM1poxA38hlDlEiBK
         y+2g==
X-Gm-Message-State: AOJu0YwLwyZBDkH7NzQNlXODx7he+wMhJ2KO7wOmdXEtVv89pOdCzoAg
	W5vibdlflPhHtQMwW4teiIl8Eci5GBGCCEJepbXgz95+3IOEQVACF3piztd0SfUDVZDwg3gYqdQ
	HXB2fxeKcE3YTgPZ7em/Fx3KA6X5RphYkrjTA1/Cl/BKb+8KSO3uDxbIieiAnzvE=
X-Received: by 2002:a17:90a:e641:b0:2af:ff3:e14a with SMTP id ep1-20020a17090ae64100b002af0ff3e14amr988542pjb.16.1714085151122;
        Thu, 25 Apr 2024 15:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnxWn5UoPJJ42z8vEJ1hDvOvdFClinMSMRuOccHoaQeuvslKornt6YigcRd8+yX/ZUX5Pd3Q==
X-Received: by 2002:a17:90a:e641:b0:2af:ff3:e14a with SMTP id ep1-20020a17090ae64100b002af0ff3e14amr988527pjb.16.1714085150743;
        Thu, 25 Apr 2024 15:45:50 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.88])
        by smtp.gmail.com with ESMTPSA id ck16-20020a17090afe1000b002a2f6da006csm13512078pjb.52.2024.04.25.15.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 15:45:49 -0700 (PDT)
Message-ID: <9237d933-406d-4120-a5fd-34a238f2ccdb@redhat.com>
Date: Fri, 26 Apr 2024 08:45:44 +1000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] vhost: Improve vhost_get_avail_head()
To: kernel test robot <lkp@intel.com>, virtualization@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, shan.gavin@gmail.com
References: <20240423032407.262329-4-gshan@redhat.com>
 <202404260448.g7F06v7M-lkp@intel.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <202404260448.g7F06v7M-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/24 06:42, kernel test robot wrote:> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on mst-vhost/linux-next]
> [also build test WARNING on linus/master v6.9-rc5 next-20240424]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Gavin-Shan/vhost-Drop-variable-last_avail_idx-in-vhost_get_vq_desc/20240423-112803
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
> patch link:    https://lore.kernel.org/r/20240423032407.262329-4-gshan%40redhat.com
> patch subject: [PATCH 3/4] vhost: Improve vhost_get_avail_head()
> config: i386-randconfig-141-20240426 (https://download.01.org/0day-ci/archive/20240426/202404260448.g7F06v7M-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404260448.g7F06v7M-lkp@intel.com/
> 
> smatch warnings:
> drivers/vhost/vhost.c:2614 vhost_get_vq_desc() warn: unsigned 'head' is never less than zero.
> drivers/vhost/vhost.c:2614 vhost_get_vq_desc() warn: error code type promoted to positive: 'head'
> 
> vim +/head +2614 drivers/vhost/vhost.c
> 
>    2581	
>    2582	/* This looks in the virtqueue and for the first available buffer, and converts
>    2583	 * it to an iovec for convenient access.  Since descriptors consist of some
>    2584	 * number of output then some number of input descriptors, it's actually two
>    2585	 * iovecs, but we pack them into one and note how many of each there were.
>    2586	 *
>    2587	 * This function returns the descriptor number found, or vq->num (which is
>    2588	 * never a valid descriptor number) if none was found.  A negative code is
>    2589	 * returned on error. */
>    2590	int vhost_get_vq_desc(struct vhost_virtqueue *vq,
>    2591			      struct iovec iov[], unsigned int iov_size,
>    2592			      unsigned int *out_num, unsigned int *in_num,
>    2593			      struct vhost_log *log, unsigned int *log_num)
>    2594	{
>    2595		struct vring_desc desc;
>    2596		unsigned int i, head, found = 0;
>    2597		int ret, access;
>    2598	
>    2599		if (vq->avail_idx == vq->last_avail_idx) {
>    2600			ret = vhost_get_avail_idx(vq);
>    2601			if (unlikely(ret))
>    2602				return ret;
>    2603	
>    2604			/* If there's nothing new since last we looked, return
>    2605			 * invalid.
>    2606			 */
>    2607			if (vq->avail_idx == vq->last_avail_idx)
>    2608				return vq->num;
>    2609		}
>    2610	
>    2611		/* Grab the next descriptor number they're advertising, and increment
>    2612		 * the index we've seen. */
>    2613		head = vhost_get_avail_head(vq);
>>   2614		if (unlikely(head < 0))
>    2615			return head;

Thanks for the report. @head needs to be 'int' instead of 'unsigned int'
so that it can hold the error number from vhost_get_avail_head(). I would
give it more time to see if there are other review comments before I revise
it to fix it up.

Thanks,
Gavin

