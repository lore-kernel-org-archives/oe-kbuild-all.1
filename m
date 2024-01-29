Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493EA657A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536379; cv=none; b=GJ6eG2S9AVPXfURUvb6gJE7MOQw8jCxGAw2Pq28kxU/hC+DA/n2PkrGUr8HQN8sFzjB0lTVvTzCler8pXslnrKDQeLieXxm9h/2Gz5RhTxtM4SrPiiBkhwmvoQQt4F3SAR5FX9ua1coqgmyq5PLFawRC2gCVYrufbJoCoQqZ6+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536379; c=relaxed/simple;
	bh=QkBJG514QTsVVm1ReQsuRgPo6BNdHE+uFKrvZQTXv7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLRuy8zM7pP5MBi+xTPay+b+n9WcpX3Cu6e6FjXyBYghQIYy3C7cPtOtMhUg8xub9ztpvFhmYRDRQR7eeQdz94c2fvNVRCTzuDl4fEKG1/17V1XuMF1Epza0PdJ+t0XwQGzxHin2lj2O4BP5UMTDBPMmjA+HE0uP2Io43Aqkp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amCFMGxz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amCFMGxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706536377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KK0R+7acTGoxy1kBeLw7LxpOro2O8KMQLg8/NGVFrhA=;
	b=amCFMGxzzNVnUWX7j7WgXWaiEzQO5vCRzEWncgTNemuphCzEqxfWMKMlnpi87ijb2RKONq
	QJ0p/RTGCcEisszq6xf0XQnIlvNO8Gxp+O+8eYI/BLdNSz4M5d1P5bQ4nNFv+yMUY1OVCp
	aIQFSH9beF7xU6vuBDiqNfEujiT1emY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-0uwClFuiPqe-1UQD5tSvGA-1; Mon, 29 Jan 2024 08:52:55 -0500
X-MC-Unique: 0uwClFuiPqe-1UQD5tSvGA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51014392c67so2038824e87.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 05:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536374; x=1707141174;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK0R+7acTGoxy1kBeLw7LxpOro2O8KMQLg8/NGVFrhA=;
        b=aLsZLHj3M57kCML0eFEjoJ4dFwCTgkirkQGTUagstJ1trAh4YXhXC4b4vRblDnLyri
         Ppy0HrMVfe3/Vi6Rw9bTYCrePk+hSaNSA4h6ZRVUMacZX45xkrY7u+YSBQikKfp5xf1v
         C3kBwKHDbUNNs0Tq7e488XY7uYWTQPO+LF8o+W3tXM1s4x35LzK1u+qpIA6T7/qtTwWF
         0WjxB4gOxMGzdNws16gf/KOJNA+uoRxCm4F0cp4VBYhbhcxuqMPzy1GApMcPkGpqDevS
         2Sd5kmfKVNBm5PMn9ylLNAlhKltYu/PI1kpn8VOXVe5548tVLc259qL9Vsz73/Yxb+l9
         dZbw==
X-Gm-Message-State: AOJu0Yw47l3TrxZYuKw6VJBfAEcpYItwyXdAbXaBlnKfNLxKGsABn4fZ
	/qC0p6GnZ68BB70vr7Xn6quTRdZ4oAhw6GdoOyvfaGgOKBiwdBGZTbauYt3P2zVBneBChnMmcwa
	rVHvu8SPvpa9Yx4hquTQ7LunUwbRG7DbrF/Ep56K2fBYdZ4qZQJluJgk3+oOgA2bYyfg+BbE=
X-Received: by 2002:a05:6512:6d5:b0:510:1ac1:6535 with SMTP id u21-20020a05651206d500b005101ac16535mr4603469lff.42.1706536374235;
        Mon, 29 Jan 2024 05:52:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBxfxdYS+jK9EU41wAxB1o0Yo2QJtQz8bFuDwOJglpqEINvfS668BUpCUFwQ5i8NrTPj3qug==
X-Received: by 2002:a05:6512:6d5:b0:510:1ac1:6535 with SMTP id u21-20020a05651206d500b005101ac16535mr4603450lff.42.1706536373788;
        Mon, 29 Jan 2024 05:52:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c721:aa00:3221:f685:1200:6d03? (p200300cbc721aa003221f68512006d03.dip0.t-ipconnect.de. [2003:cb:c721:aa00:3221:f685:1200:6d03])
        by smtp.gmail.com with ESMTPSA id he9-20020a05600c540900b0040ed1df542bsm10194016wmb.20.2024.01.29.05.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:52:53 -0800 (PST)
Message-ID: <83d5e5c2-6e3b-466a-aaae-78cd23b4d3c7@redhat.com>
Date: Mon, 29 Jan 2024 14:52:52 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [davidhildenbrand:fork_rmap_batching_mm_unstable 104/141]
 make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by
 'kernel/built-in.a'.
To: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202401292018.RTtZWk0P-lkp@intel.com>
 <ZbespUe8SwF7L3g2@MiWiFi-R3L-srv>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZbespUe8SwF7L3g2@MiWiFi-R3L-srv>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.01.24 14:48, Baoquan He wrote:
> On 01/29/24 at 08:12pm, kernel test robot wrote:
>> Hi Baoquan,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://github.com/davidhildenbrand/linux fork_rmap_batching_mm_unstable
>> head:   b652ec55c236cca5d0247cf66864971cc2ffea2d
>> commit: 21b8f7d4d9d70fec7ff6bbd973e485fa1226b156 [104/141] crash: remove dependency of FA_DUMP on CRASH_DUMP
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292018.RTtZWk0P-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401292018.RTtZWk0P-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
> ......
>>>> make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.
> 
> This is fixed by Stephen at bottom. Now I can see it on linux-next:
> 

Yes, thanks for the note (note that this branch was based on 
mm-unstable, not linux-next directly), I spotted that yesterday as well 
and got my builds going again. I think it's fixed in mm-unstable today 
as well.

It's weird that the build bot sometimes only sends stuff related to my 
WIP github branches to only me, but sometimes it decides to CC the MM 
mailing list.

Anyhow, that ahead-of-submit buildbot runs on my branches is absolutely 
fantastic, independent of who else gets CCed. (I still do cross-compiles 
for weird architectures, but at least this way I get fast feedback for 
the more common architectures)

-- 
Cheers,

David / dhildenb

