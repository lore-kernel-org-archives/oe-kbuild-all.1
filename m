Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A079DF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707031290; cv=none; b=kBVwR03BxQQ51rEf1FbnMIxKqfh/N6VpfdkcMJdr8d9TpqQsFBhbh03HOaN+XigCJSqtao+Dll9xook+v7QU9bBB81U2YRGlTBuSXsiS7CWcRLlqQzdE6VVRsiEyUaySn9qm3bTPaT1whKskuZvNHtBzOQiNktfyaG8fwaGLEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707031290; c=relaxed/simple;
	bh=gEevg+1dxDe/QAYL6JsXxGvTkbcC8kki97kAPPCkmUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgxWS95pQdKU07wWIfyz1BRfEuWISwuZ1EZD4txkOVeRndRy6oVTg9V36OWEZg//yz7zibTf37UX+4Z0sroaSH1QgAjjiYcN3T93Vs2R1SAXITsZtcD/CsLhLtibju01sIywaSxXKYqn1y1BIKx1yO+++IxA9e7bJsmjpNQwKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWo05hnJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWo05hnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707031287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kn4EMczR8KRHC+2SPU7ejPLyHZhOk5FjkDgRN4af+co=;
	b=KWo05hnJW6I1UzzUIy3aEzmTbSCUiuD1Hv8eBBdlq2h4Wbo2rPzvaR7/vy2Yymg5eVvxvN
	/ru0wbaxOperyigJ4f4cIyB2VVk4Qu8LZh+oj7oeMpeIraB+a17XJXp3KrN3IIlj/d+W4Y
	GqAtmTeo7+fHWkv2z03KO3ALUir368w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-M3ssqwAnP0KzhxBPsYs8xA-1; Sun, 04 Feb 2024 02:21:26 -0500
X-MC-Unique: M3ssqwAnP0KzhxBPsYs8xA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40fbb0e8128so17621155e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 03 Feb 2024 23:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707031285; x=1707636085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kn4EMczR8KRHC+2SPU7ejPLyHZhOk5FjkDgRN4af+co=;
        b=GMdK08lDDiKpM24zUxGXjHd1PmuANO2Ae8XcS6ea+C7Kn1speSL+ayzwCi5njp39bB
         yAMVm65Px8XZboObeUqNd6rSk1gXRPVO9PqeXyLtXC4Y4KIM6wgbysL4YkYhbv/xgcfG
         x+n+wnw8QGEXxJC4W/iVqZqfczUMAM8kQIfCz6mxpNV8ch4TBS2e5fYt+utYLOSVDumf
         NlLlARvPbav+h98ciCYGLrfRzCWyvcQfoaaeBQwS21Kn1GvMnIMbpNIW9hM5YruqjSHI
         kw/4qS2kjnc8yVLlPfcjtHQMuLkVFRPrL/GM8YesQGd++dBEkw+cE+4TuN0Rfo/5u1L9
         hGwA==
X-Gm-Message-State: AOJu0YyoTQBSoR+s0gWA2m2J/pUU0zn4XMTjrIiCAMXhNuJo573q2rgQ
	j+Cq6P2vFnWtgjbK1zgMHy7QIGlxTLBigSagNe9OGoPrTxQZJ6+ixl19gv4LVY6MO6tLFbFJJq9
	OlaCvA0hKGyzRkcaQ85UQlWRPM3VHrH6UOCBtGBG2hCACoRaS+AQFgj+B38lUODw=
X-Received: by 2002:a05:600c:4fc8:b0:40f:c5cc:e756 with SMTP id o8-20020a05600c4fc800b0040fc5cce756mr2016727wmq.32.1707031285489;
        Sat, 03 Feb 2024 23:21:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHge0h/NvoTSnDo+I/rmQq8+cW0nD55RkqsJL52QTAyMzp1mhlRek+4MnAC6mX8o5TAWAnRRQ==
X-Received: by 2002:a05:600c:4fc8:b0:40f:c5cc:e756 with SMTP id o8-20020a05600c4fc800b0040fc5cce756mr2016716wmq.32.1707031285215;
        Sat, 03 Feb 2024 23:21:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXyoBvcf3og8OCdSpDWCLa6qNDnPDdEg8dgG/XT/AKQc4+UIDwwPU5pPP1cfsQAQyRe6Z0bFQeLLmCZZmhXINDK5e51XswgC4FBUcro+2a/frBNOhnODCY4aA+7/Y6Vqq5QbpMYS3flwmE8DtU=
Received: from [192.168.1.149] ([212.76.254.34])
        by smtp.gmail.com with ESMTPSA id h8-20020adffd48000000b0033b0797cc14sm5395709wrs.51.2024.02.03.23.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 23:21:24 -0800 (PST)
Message-ID: <23509de3-beab-4afd-b76f-4d675797e7d7@redhat.com>
Date: Sun, 4 Feb 2024 08:21:23 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, linux-doc@vger.kernel.org
References: <202401070202.BQvPxgyp-lkp@intel.com>
 <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On 2/4/24 02:26, Randy Dunlap wrote:
> Hi ktr,
> 
> Sorry for the late reply.
> 
> 
> On 1/6/24 10:13, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
>> commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>> reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
>>
> 
> but what was the warning or problem here?
> I don't see it.

This has already been fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41237735ccde2cc3fe1d83ae0b776a085be6a22f

Regards,

Hans

