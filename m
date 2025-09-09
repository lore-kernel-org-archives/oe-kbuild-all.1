Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27E2586E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411235; cv=none; b=itapP+WIE3wVqpkbxESzd9agj/8P7XJicW/x7AEzG6+xHNRzRVtIVEW8krm8Qb6C3XiNbdX0n/YxF1X7h6XSJoDRzV9auv5z9l+2QuLJqCOvMksiXnCTDmlSENfLgN85NqXmb0jIpFZm843dXWbg8DZVxLogK8Ln0m2ef8HJjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411235; c=relaxed/simple;
	bh=TExbovcPVbiswLv8ylbaP2CY6tRAT1zPKs+M9dfIDq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVvUb5M24Nbgy4v+Nw17/K5fxqhhurmvijzD0jshuB6HaJBjBM+qrPIS+oSitr8lH4dcP3YUN3z9fjTSbklEVcfg2inwne26wABZMjKkFHvAcmBatMyAd1AmsBeFcqhiuwDSBGwDMs/uwbSrerTmy2+f2cxXhNHJWYoiaeAro50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yq8oJR+9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yq8oJR+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757411231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SKiiv6JCU2xJOp3QwKpH5ri794nlOX8D39yyZK9KigY=;
	b=Yq8oJR+9VrtIhMgpn+VVEaCwborHRrDBPeGvl1sZR4MKqSWz9sTlXMGFCPKGq98MKr+32+
	AJzZDaQh98J4FESkPNfJ7EOLwpZmyP7zcbyahPjlAM6WpLtksYBt3fvc1NJLa9SLyHhe/Y
	iy/la22ClG27lRU0H8KtZXMjazv1B1s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-wXWX_t_cPhyj7eQuNPW5tQ-1; Tue, 09 Sep 2025 05:47:09 -0400
X-MC-Unique: wXWX_t_cPhyj7eQuNPW5tQ-1
X-Mimecast-MFC-AGG-ID: wXWX_t_cPhyj7eQuNPW5tQ_1757411229
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45ddbdb92c5so19183395e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Sep 2025 02:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411229; x=1758016029;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKiiv6JCU2xJOp3QwKpH5ri794nlOX8D39yyZK9KigY=;
        b=XGVxt2S7zYRsWJ/7c/ZvTEp4ZlR3JDNEp/x9IyN2i6iX3uo6ADEpxopBDkPBpvXg7u
         /MtCHp/1yj2XVPH2SlpUkMUU5YzqjnbZmPpihw2MQgWs1HWs4aifoaeszBwdrgUX5VQW
         ZR9mMUZymHPmoOpYjtFpPFSudSOF4tIZ/568ob5YWVQ70yGJf9evHJiImjBYa0yV9N7L
         otpBn9KnVh3eKm3JYf6pP5tbca0zraDe54h5JoB2oESew1+g6PTIJyzQUaG1uOF2F2UA
         Sf0fZAxZ/2g9J7zUap8R2QkIU7hZ4jl/BKitb+P1EqeGsICTlbFYhyoVDDse1GLAVuW3
         Agng==
X-Gm-Message-State: AOJu0YwzyWTfjxzkkMg81+2flKXsAftYcZr55gy/tZNenGwwyVeeI9iU
	eZdrbfL4SAgl+Eo+mki/HpoYFIyItm+V8iM96AUv6HKUe0feWK3zx8TZl9kOeeWxv4XxiIF17wT
	4gfQz17E7PRli/abH9FCkABgQaMmwFhWAlSU6pxRPYTE0Lv2LxnHKZOR1YsLiNJZJiZo=
X-Gm-Gg: ASbGncsfodRrnFYtKJpppthga0fFTIrd4R61/NamXry5jG3TGtOqd+dsRm+4ed3Djul
	JSlxZiIlToQDWmKEATCmqfEUEA0EkrwHLPNCLKhAL2BuBwNA46Utymvq42jR3Gg8V/JiqAxtsKB
	IfqU87KgplB/doejRilPgq2w4yS/lXwO+jqQeClbnW1oxhqTnEKu+yW01TgQGaSriUe5Xffnxd/
	thE31lLGsP1PQPELzFMHcm3p6zjFuFgdMtPM5L7AU9hkqu2sXFuXuxYb1uCXu+e8RIWUmMN9Ur8
	0yko4CJA2DhKw04rX9NFcEd2pFkaaPfTiO8tzv32LzPZHGdys/SprMIZ8CnxkhnlgE8mTTrIKGK
	bs5uJ9jVew6mn8MXNX/JSL5VLEJkQoOIsiCNPLNRXyPz9x82xrfQzYH2rUFXjastNtJU=
X-Received: by 2002:a05:600c:1993:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-45ddde80fd3mr102080965e9.5.1757411228588;
        Tue, 09 Sep 2025 02:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI1+DChPACtKX63ACmNUkDbz+brz6ApvDkQYyqmH7m2P3PUb3SzMq80PuogArkKrAlYYqt8w==
X-Received: by 2002:a05:600c:1993:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-45ddde80fd3mr102080655e9.5.1757411228082;
        Tue, 09 Sep 2025 02:47:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda202112sm183745345e9.5.2025.09.09.02.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:47:07 -0700 (PDT)
Message-ID: <d3c68577-131f-48e0-84be-cb4424e3fa9e@redhat.com>
Date: Tue, 9 Sep 2025 11:47:06 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6034/7427]
 arch/sh/include/asm/atomic-irq.h:69:undefined reference to
 `page_range_contiguous'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <202509100708.5mJZ2cLm-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <202509100708.5mJZ2cLm-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _FALhsAlp9is4TxC0xKHkRNi2_R4t80aykJ5RI1MO4Q_1757411229
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.09.25 11:31, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   65dd046ef55861190ecde44c6d9fcde54b9fb77d
> commit: 73f5c4c5c6a36a130ccba6809337e42ccf8350fa [6034/7427] mm/gup: drop nth_page() usage in unpin_user_page_range_dirty_lock()
> config: sh-randconfig-r121-20250908 (https://download.01.org/0day-ci/archive/20250910/202509100708.5mJZ2cLm-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20250910/202509100708.5mJZ2cLm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509100708.5mJZ2cLm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     sh4-linux-ld: crypto/testmgr.o: in function `sg_set_buf':
>     testmgr.c:(.text+0x8fc): undefined reference to `page_range_contiguous'
>     sh4-linux-ld: drivers/usb/core/devio.o: in function `sg_set_buf':
>     devio.c:(.text+0xd54): undefined reference to `page_range_contiguous'
>     sh4-linux-ld: drivers/media/common/videobuf2/videobuf2-dma-contig.o: in function `vb2_dc_dmabuf_ops_attach':
>     videobuf2-dma-contig.c:(.text+0x920): undefined reference to `page_range_contiguous'
>     sh4-linux-ld: net/core/skbuff.o: in function `__skb_to_sgvec':
>     skbuff.c:(.text+0x2180): undefined reference to `page_range_contiguous'
>     sh4-linux-ld: mm/gup.o: in function `unpin_user_page_range_dirty_lock':
>>> arch/sh/include/asm/atomic-irq.h:69:(.text+0xe34): undefined reference to `page_range_contiguous'
>     sh4-linux-ld: fs/ecryptfs/crypto.o:crypto.c:(.text+0x954): more undefined references to `page_range_contiguous' follow
> 

Yes, can reproduce that. The config has CONFIG_SPARSEMEM without VMEMMAP and:

# CONFIG_MMU is not set

I'm surprised that we can have SPARSEMEM with NOMMU. What a time to be alive.

The following seems to fix it:

diff --git a/mm/util.c b/mm/util.c
index 248f877f629b..6c1d64ed0221 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1306,6 +1306,7 @@ unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
  {
         return folio_pte_batch_flags(folio, NULL, ptep, &pte, max_nr, 0);
  }
+#endif /* CONFIG_MMU */
  
  #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
  /**
@@ -1342,4 +1343,3 @@ bool page_range_contiguous(const struct page *page, unsigned long nr_pages)
  }
  EXPORT_SYMBOL(page_range_contiguous);
  #endif
-#endif /* CONFIG_MMU */


-- 
Cheers

David / dhildenb

