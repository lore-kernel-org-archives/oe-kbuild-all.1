Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF55B5BD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707161163; cv=none; b=PUYhglDDGieIKgj0XOnqAJUZ9MYuXf3CgNU12Z+WRLkEM6cCk4CApOrWhkLgoaH4WSRK19MEj3Mf8jrPBJIBEp3gvgJ9vjpxc2chrHgGU2j7j52aHZS87LDbd5Qs9e5iKLYMcMs+yHVHHodWOaQ2z5mL+jBQtryWc/lSFhlR+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707161163; c=relaxed/simple;
	bh=f2aRudQ/B8RzJQqWkCaA+d7OPXEXPCZLCgVAmkRdK7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0UKAAAqy0jhdgTl0+nDvwc03+qyvL6iGO+Rhlqwl9FxpSIgmhDN+gbdm1xWIoIvb9ByHrgdwE1OIUoVI7PRJMqxBUiS8BFeR5Gql4QQPrGi1hhMn8t+82omF3lHUXIm4Ja4URYbSBe45Y0qYxukChru2eCUU/PNWjgUYpFe1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtkkYMeH; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtkkYMeH"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60412a23225so45359687b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Feb 2024 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707161161; x=1707765961; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIg1YK6wsUmUELLzBLV0hX7nWmpSR8fVYvUDf0KeMu4=;
        b=LtkkYMeHTRG8eu4GKtpJnZ7vUleuqDaVUPkB5dmzWv0wsCuEOy2YJaWlvQScFmrc99
         3Yc+wC3g1EcCfIoowGRitntlrbYVzeBPC5iib2uR5Yqrf2ROqnWGslLYIJzP+YrjYTnf
         3pjJZa+7oBC79ySJXi4XnaN4QQCN1wOBzV/R43c7a1LcLrK0atQBQKGloRDvFti2zCoN
         RY/IRAuaoljL+yVr/JxSHye0/xLUKx9cZDEcMGXr5uRGzoe/IMf5mzS2h5xVXTr5LY4D
         Gzb25TU63/aoiMxF5S9yggFQpj8IyIGteQD4nYag2TfMT4Xu1Yp6SesXDar0do7ynyg8
         y9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707161161; x=1707765961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIg1YK6wsUmUELLzBLV0hX7nWmpSR8fVYvUDf0KeMu4=;
        b=BLT6HYtuqlftE/MAjOd0fAgWSw+sx/GYVRXfhSwA3JOQkgiMeNqnUEQELqUfPwGJ4I
         GuebE9jleurRqF5GOhEcB0MiAu0M5OB8ZFN6ET7/QQjyYbKz1Zk5QfsK9Zd7UvnY6liI
         K3PgVGKglA5DG+12AusU1Ngl+HrGOtfl4ZCAudKZdUSRSxu7yS00uKGJ8z7SD44PHc3i
         WNagIIzgXuWnyuciHs5nqcbc2yKgSQvP9l18UnAUsHQdor9UvSTxr+myiqsBD9cRtsbu
         bvasS6s8wH1//iTfVM7tDuX8uN3tWWBcRC8DzEQilv2CBBsarcjWUOsmieTN6GKw10/d
         LKZA==
X-Gm-Message-State: AOJu0Ywf2hDq2Fjkeh51O7EFSweBNxj/U2hKbdpBauEGi07VIWrnMjHl
	xK/DiqbzlcEN2nuh2mDcjUPhdD1/6TqNE/FGgoCfCbTbYmx/XHdT
X-Google-Smtp-Source: AGHT+IFJrTbs7PrjtMyeQ1A1SniAgW4UAdI1ptFY8rfcmcWhV7L7gz4qy8iEh4hErDD9HqtvEapd+Q==
X-Received: by 2002:a81:6c41:0:b0:5ff:81fa:16e6 with SMTP id h62-20020a816c41000000b005ff81fa16e6mr605531ywc.38.1707161160902;
        Mon, 05 Feb 2024 11:26:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU/YCAvKqDfIvCaFG+ey/ZgXqH+IZ4ePiwW5oHQzO36KFAH27zTyNNQfWHHv/RClOPvnZjdeB4e3REi9jY96+ozmR7qlyAb452T9yQxbwyGIlq7Fr1CfH6EI7XO5Tzzceq0IrM5nDkAiu7TXgrll5/UJhS28cQb2nr6r9/dYqFQ
Received: from ?IPV6:2600:1700:6cf8:1240:8b69:db05:cad3:f30f? ([2600:1700:6cf8:1240:8b69:db05:cad3:f30f])
        by smtp.gmail.com with ESMTPSA id g140-20020a0ddd92000000b006029cdd22cbsm91680ywe.97.2024.02.05.11.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 11:26:00 -0800 (PST)
Message-ID: <3230d5b6-dca3-4b41-bf04-479127628713@gmail.com>
Date: Mon, 5 Feb 2024 11:25:59 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1465/2825]
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:557:13: warning:
 variable 'r' set but not used
Content-Language: en-US
To: Martin KaFai Lau <martin.lau@linux.dev>,
 Kui-Feng Lee <thinker.li@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>,
 kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>
References: <202401300557.z5vzn8FM-lkp@intel.com>
 <79df5a1a-3d7d-4a6a-8ebb-aaf4d9e89aaf@linux.dev>
From: Kui-Feng Lee <sinquersw@gmail.com>
In-Reply-To: <79df5a1a-3d7d-4a6a-8ebb-aaf4d9e89aaf@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/1/24 12:36, Martin KaFai Lau wrote:
>> vim +/r +557 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
>>
>>     553
>>     554    static int bpf_dummy_reg(void *kdata)
>>     555    {
>>     556        struct bpf_testmod_ops *ops = kdata;
>>   > 557        int r;
> 
> Kui-Feng, Please take a look. May be change the ".test_2" return type to 
> "void" since it is not used.
> 
>>     558
>>     559        r = ops->test_2(4, 3);
>>     560
>>     561        return 0;
>>     562    }
>>     563
>>
> 

The fix has been landed.  FYI!
https://lore.kernel.org/all/20240204061204.1864529-1-thinker.li@gmail.com/
