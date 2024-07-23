Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663B8814
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721723302; cv=none; b=c9iVMGhD9wUhOV9wbK3rJS2meBBaU4pynoM2AGyrarPqG4+ii3Vn34IUzt6aHJto6/BGEn7Rt9QzrK+HVwV8GhiNZIIOsi7BHEktXH8v3HedWz9/X0mTvu2/wNMH5UeZO9Aan/LDYh7KstyuDsM4OS5iKCGWSiLHbmf37T2RLhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721723302; c=relaxed/simple;
	bh=kWuaM8GtZRlsxrMBp3vycagdkqQSvEWak1sWven5hqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4IC0HAGLcKZ+3vnkHvqIyQ/Q/6Z+ggwsQVYxEcp4fZuQc8jXSEZ9XZdMEM0WkMpX+iGtyNE33YOawBb4Ywb/wgJSUtqH1HoUSjonw1jj9eAPVc3jeqsWEW4twuv4A4RUCVlXW0ZVMjhGzWS9Euw9gSaL6Tbz1WJA03rMlTZAYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHyw+kDw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHyw+kDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721723299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rxTezTxo6GKuuHDEKO5V3fYzrV/tq+hnpV84mQy4geA=;
	b=DHyw+kDw69Z30Px+B9xcRTNrm4PqZ5blNJpKad89D9saX23D5aTbmI1GiiwsdPf0VLDq8b
	ORH5nKp5Fq9YVi0GSjzT/4xW42VUL0TD3rwBnF4HWaEDozWTrpbxzTOkaHvQUFc8BwZ31Y
	pC3yX4YtN3pww5ahj5ulwC8qCNovOAg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-kTHE6uYMN-S3D66mKqDL-w-1; Tue, 23 Jul 2024 04:28:18 -0400
X-MC-Unique: kTHE6uYMN-S3D66mKqDL-w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42667cc80e8so39057605e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 01:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721723297; x=1722328097;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rxTezTxo6GKuuHDEKO5V3fYzrV/tq+hnpV84mQy4geA=;
        b=GcmyQSS6007eDaa4ZFC/bRvG25aolscKkQcX23e1PhIfvirP0vOIYfrJdzqZM8i8Zg
         BUCS08oOPnZlHMUqR8SJA4WMbqEkoYlXdA5ekxcYaMIURsUW6ygilBw1nhQvpRJ8QBRl
         GWbMW86IOIUa4/3Qg+v4lyuw98I+g9Lp11CEZT19ynLPVBztC6WV3sF4FlT5olVkpmsY
         IPSr9Zc8KO29Hxp05OLHEVGzIrjOkdqeVi1+/3rPihO2PDElc2gAMuXB8KfBa4uVNWbp
         hUVEL8mpnQQqeH7EvqzesQCJ4jEjdxIrp+ul6PP8bNf15fIFVtl0TyO85zImKGGZIoBG
         Y8ww==
X-Gm-Message-State: AOJu0YyUgxgmDitTg6RNv/F5VQZ01m6Vt0Mbx/8/Af0Kn3enX9WGfPop
	1znpuOcSxbRgdnx2Fs+t9l+L5e499expAqxssN/wTTM2Xc1Is0IRulhFG84bOJBjyZwFl3gNksN
	CEQle8EqY6WyPDk1sgKYGGIdZaG+ABUbLZy8mHXcu9EEyishPQVZHEid+JyO5LwI=
X-Received: by 2002:a05:600c:198f:b0:426:54c9:dfed with SMTP id 5b1f17b1804b1-427ed059c10mr14419585e9.28.1721723297023;
        Tue, 23 Jul 2024 01:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy4CEmA4JcAfxG7LLbAWl0jocVLaLoP0eyKUczhXGMI5C0jMj0h/iQ7jjGjokFXNKdvElyyA==
X-Received: by 2002:a05:600c:198f:b0:426:54c9:dfed with SMTP id 5b1f17b1804b1-427ed059c10mr14419425e9.28.1721723296578;
        Tue, 23 Jul 2024 01:28:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ed00:9dc2:1adb:d133:4434? (p200300cbc72fed009dc21adbd1334434.dip0.t-ipconnect.de. [2003:cb:c72f:ed00:9dc2:1adb:d133:4434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868ac54sm10652507f8f.28.2024.07.23.01.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 01:28:16 -0700 (PDT)
Message-ID: <c8db754f-57b0-4430-b22a-87f8f3758ce9@redhat.com>
Date: Tue, 23 Jul 2024 10:28:15 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/gup.o: warning: objtool: faultin_page_range+0x100: unreachable
 instruction
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202407230630.3vGhnlFB-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202407230630.3vGhnlFB-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.07.24 00:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   933069701c1b507825b514317d4edd5d3fd9d417
> commit: 631426ba1d45a8672b177ee85ad4cabe760dd131 mm/madvise: make MADV_POPULATE_(READ|WRITE) handle VM_FAULT_RETRY properly
> date:   3 months ago
> config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240723/202407230630.3vGhnlFB-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230630.3vGhnlFB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407230630.3vGhnlFB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     mm/gup.o: warning: objtool: get_user_pages_remote+0x160: unreachable instruction
>     mm/gup.o: warning: objtool: get_user_pages+0x12c: unreachable instruction
>     mm/gup.o: warning: objtool: get_user_pages_unlocked+0x138: unreachable instruction
>     mm/gup.o: warning: objtool: __gup_longterm_locked+0x3d8: unreachable instruction
>>> mm/gup.o: warning: objtool: faultin_page_range+0x100: unreachable instruction
> 
> 
> objdump-func vmlinux.o faultin_page_range:
> 

I'm afraid I don't know how serious I should take this report :/

The commit is 3 month old and was found on some toolchain with some 
randconfig on some architecture, in code that is not particularly 
architecture specific.

I wish I could even understand from the report what is happening here 
("unreachable instruction" -- isn't that the compilers fault if it 
generates that such that objtool would complain? Why is that a C code 
issue?)

Please, someone shout if I should take a closer look at this.

-- 
Cheers,

David / dhildenb

