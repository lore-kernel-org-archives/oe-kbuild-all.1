Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A21137A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jan 2023 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673513124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRkGofy0rOYQohBlbN5nSy8RN48skKljdqEjml4OAaw=;
	b=iPnMDtmuILR/vGcbTYDNaQGz47PI5WZj/cC7BTD/fhENPTfGhgeveKCxycIG18gy3bZBZY
	4f3/YQNz2MhgEUk4QHoAFZ6i95mM6Kcoa4Eb3t7EF0fvjfh0M3LNqDUb802lP3VfjrD79u
	oW3AMbphzV8caluzXLcn84CMrxjSDB8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-hWduINUcPEagUpYvBw3Q2Q-1; Thu, 12 Jan 2023 03:45:23 -0500
X-MC-Unique: hWduINUcPEagUpYvBw3Q2Q-1
Received: by mail-ej1-f70.google.com with SMTP id sg39-20020a170907a42700b007c19b10a747so12161574ejc.11
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jan 2023 00:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRkGofy0rOYQohBlbN5nSy8RN48skKljdqEjml4OAaw=;
        b=vtQ/ddgzWF/aYWSWi890xlH677H0c0tnnqxQnZzuck6W4esGgWcF+F8NzXrRjTV2xn
         3Gr2fkdaGzakv7ky7BygUogyV87BSxbH6lE5VW6I+qbqAYoCZNibjfvvjIACDRcWT+YS
         nR9CWUdDqc2YE757h07eh3wLvN9sGI4Mp3yGGwP18ziU44UZoHP6KnCewnd62d8iegws
         i5iCsfMPN01VIKQ9RMj6ATaGOsPAdaS3Y7OWDOF8lpIJchYNDeGWyeHHUbq6DH5OdMUc
         OFOm1879Y1C/Zc3WWi+AwEmSc6fg9IVSBmq0OCqGHKG9tcCb46ct3tDggGYqlXmy4AiQ
         MgAA==
X-Gm-Message-State: AFqh2krcDuuRMrx85qndeFRO1GxTn4X09UJHCCm6K2a7FK79RhFNok75
	TNfy4133d89KC5xQ76ToVzUQ+KAYlf+8ZsetGoHD4QC1hDmmUlWRvmHFqOxB7UL+ISXiObHT2yN
	E9TUiTijAzdRtt4XDVe+XJnllKQ==
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id mp11-20020a1709071b0b00b007c16344084amr102056834ejc.5.1673513121921;
        Thu, 12 Jan 2023 00:45:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu54vDYgLEuxRyxp1eTz+c6OzQAOq5kS8s1aP1PTT89lIebzPDO4yj3/Xck4uxhw5HLniQNWw==
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id mp11-20020a1709071b0b00b007c16344084amr102056814ejc.5.1673513121707;
        Thu, 12 Jan 2023 00:45:21 -0800 (PST)
Received: from [192.168.42.222] (nat-cgn9-185-107-15-52.static.kviknet.net. [185.107.15.52])
        by smtp.gmail.com with ESMTPSA id r2-20020a17090609c200b007bd28b50305sm7182953eje.200.2023.01.12.00.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 00:45:21 -0800 (PST)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <95ea32dd-8605-f1ac-3799-400918e29e07@redhat.com>
Date: Thu, 12 Jan 2023 09:45:19 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Cc: brouer@redhat.com, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: Re: [PATCH v3 18/26] page_pool: Allow page_pool_recycle_direct() to
 take a netmem or a page
To: Matthew Wilcox <willy@infradead.org>, kernel test robot <lkp@intel.com>
References: <20230111042214.907030-19-willy@infradead.org>
 <202301112022.zmClDxtO-lkp@intel.com> <Y769E3ZpCCuykk94@casper.infradead.org>
In-Reply-To: <Y769E3ZpCCuykk94@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/01/2023 14.43, Matthew Wilcox wrote:
> On Wed, Jan 11, 2023 at 08:48:30PM +0800, kernel test robot wrote:
>>>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:2978:4: error: controlling expression type 'void *' not compatible with any generic association type
>>                             page_pool_recycle_direct(rxr->page_pool, data);
>>                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I swear I did an allmodconfig build ... don't know how I missed this
> one.  I think I'll make the page_pool_recycle_direct() macro accept
> void * as well, and treat it as a page.  Once we finish the conversion
> to netmem, this problem will go away.
> 
> ie this:
> 
> +++ b/include/net/page_pool.h
> @@ -485,7 +485,8 @@ static inline void __page_pool_recycle_page_direct(struct page_pool *pool,
>   
>   #define page_pool_recycle_direct(pool, mem)    _Generic((mem),         \
>          struct netmem *: __page_pool_recycle_direct(pool, (struct netmem *)mem),                \
> -       struct page *:   __page_pool_recycle_page_direct(pool, (struct page *)mem))
> +       struct page *:   __page_pool_recycle_page_direct(pool, (struct page *)mem),     \
> +       void *:  __page_pool_recycle_page_direct(pool, (struct page *)mem))
>   

I'm okay with this change, and you can add my acked by.

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

Maybe broadcom/bnxt driver should (later) be converted to not use void
pointers... cc. Andy.

--Jesper

