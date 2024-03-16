Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FADA1391
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710550602; cv=none; b=O/VEzK9Gq3uBGJYhpYYWukxew9hc5/N//RMlOQv6QT5n0Nayzq6MQKgGVA+U1H3WbrGdKRAsWQs2T9u5YuKgADF5DhA5YRyPQnlifla1Wu/GOYErelwg4jtB52QFWgwLHgSRiHkkX3rqIGxgaluy3aF15TKMW+1IDuJksu66XrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710550602; c=relaxed/simple;
	bh=GzpXGju8r1EMjUXgfiSPBTny+xorxdNlJkRQ9l2G1LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XullWgMGemGBnQftfHehjrmbQtOpPrIRThTCPYzM+zzSH5iy5l64zGUXhHn6n5XkHhIC8Q0IkWDRRQH0vjAmjb+RxUHf0pjc90MESECzTcatYHlMa+hCNsX0cGbj2zMBe+TvyX8j84oQBkEHgP3u4ImUaPKeAsIV2fxH4QO+w7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK+/BHuO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK+/BHuO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29bfc3ca816so2414515a91.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 17:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710550598; x=1711155398; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0qsfZ9Ym0BoNvdxMrPHu/Yx3Zwnm969oPkEv6CYAOd8=;
        b=eK+/BHuOQ/prvNgOIdUfHzE3ssfO6GEnMpv4JCcGfA+D7cdcdS4yZ25eLS5WY46Rau
         yCBbEKO54lLFaPggxWgQQVEM0vqZfxlkMHRo04QtaeMxhfVZ+QoVvHKOBdLS46NP8vH+
         hehI6jUBs2JQFbL1XRpNQShMuCbRvS0BJt+PZB2jbL4OMLmXWYViXl/mZormliioZR6Z
         I/VbFKKj6EhlKBHix2uvxO6YU0jInXV2eMiafLfPZ9iyDYImX9zzIEHVKsJ7D3AQ/EDV
         Y4ss9WsvEBF1IX2OaXdtBCiNG6sf7+VmUNpSs/JlIoKvjW7mf12wRffAezOJU/Z1jXLx
         E1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710550598; x=1711155398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qsfZ9Ym0BoNvdxMrPHu/Yx3Zwnm969oPkEv6CYAOd8=;
        b=s1Or++hAx6hSEyjV8EmbO+q13T4aN4DsBpaMEOeHVNnixstPmR54EoMd3qDuzjwXmF
         CzKqfSC6uvV/+GH7XDp6z8FZ2IPqI1s247q6y3EZh4bBkXF78CuFViBB+YhOZLGuiaZc
         sd2SRmS7kY+Jq2O83GXFUIWNxph2yHzWNV5XLTnTpr4qIBdmC3iiiI5sLn8v8ju3kLLS
         wQd+tpSklzLPH64vsHQMAtUb9J08GZSR3khffnqFbwpEZ0O8jgpN1QopNGT7t7vhYaZH
         II9psNp6MjFy8xxQxjHYxYdqDtJFEui9+JX+yiTzMknyyfu5Z7rFlTaRF2FJm5p3v0BR
         1qaw==
X-Forwarded-Encrypted: i=1; AJvYcCVDTrQXztY4+LAZYOYiyxw9x9iWze2knsFkkIHbaDaH5tYx4mNnim0EaGIKX3CtGUbBVQatTh50km1E+ibgzmL6eqdvB3SmDyff05B9iQ==
X-Gm-Message-State: AOJu0YzfK2d0f62Lox+Eo27HS7ho8WELy4GIjz797pORkz76HdmtoGc5
	DYPMtJGPC90EREhbQZ71QwvZuSmEb6k2BLIfrS5wm7FgchdJBbJ0
X-Google-Smtp-Source: AGHT+IFBm6zYwhE5RfHU0IzIcQGDGO6XLIdq5FAiq4NuYo9C2FF+vuMEgJ9LAO7Uei1MHng6FOjxJA==
X-Received: by 2002:a17:90a:fa0d:b0:29b:dc17:1553 with SMTP id cm13-20020a17090afa0d00b0029bdc171553mr4929400pjb.15.1710550598361;
        Fri, 15 Mar 2024 17:56:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id rr7-20020a17090b2b4700b0029bcf877eabsm3590103pjb.10.2024.03.15.17.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 17:56:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d0be0f7-e988-4ca2-b61b-21853e4268f6@roeck-us.net>
Date: Fri, 15 Mar 2024 17:56:36 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 5/9] x86: Cure per CPU madness on UP
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Uros Bizjak <ubizjak@gmail.com>, linux-sparse@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <20240303235029.555787150@linutronix.de>
 <20240304005104.622511517@linutronix.de>
 <e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net>
 <CAHk-=whK=G1o6RtS9DS3wEGF1KU7WLgLL1+6Se86bj8m7wwqrQ@mail.gmail.com>
 <87y1ajjsv9.ffs@tglx> <87o7bfjeae.ffs@tglx>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <87o7bfjeae.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/24 15:55, Thomas Gleixner wrote:
> On Fri, Mar 15 2024 at 18:40, Thomas Gleixner wrote:
>> On Fri, Mar 15 2024 at 09:42, Linus Torvalds wrote:
>>> On Fri, 15 Mar 2024 at 09:17, Guenter Roeck <linux@roeck-us.net> wrote:
>>> Thomas, over to you. I wonder if maybe all those topology macros
>>> should just return 0 on an UP build, but that
>>> topology_get_logical_id() thing looks a bit wrong regardless.
>>>
>>> It really shouldn't depend on local apic data for configs that may not
>>> *have* a local apic.
>>
>> Right. Let me look.
> 
> Not really. The problem is that a SMP build can run on a UP machine w/o
> APIC or command line disables the APIC and will run into the exactly
> same problem. The only case where we know that it is impossible is when
> APIC support is disabled, which is silly but topic for a different
> discussion.
> 
> So the proper thing to do is to check for num_possible_cpus() == 1 in
> that function.
> 
> Sure you can argue that we could avoid it for SMP=n builds completely,
> but I think the right thing to do is to aim for removing CONFIG_SMP and
> make the UP build a subset of a generic SMP capable build which has
> CONFIG_NR_CPUS=1, i.e. num_possible_cpus() = 1. Why?
> 
> Because it consolidates the code and makes UP use exactly the same
> mechanisms as SMP which pretty much avoids the problem we see today that
> UP lacks test coverage and becomes more esoteric and untested over time.
> 
> The downside is a slightly larger kernel image for such a build.
> 
> Though if we pretend that we seriously care about that 10% larger memory
> footprint or about the marginal performance benefit of SMP=n on dead
> hardware, then we are just taking the wrong pills.
> 

FWIW, I would very much prefer for SMP=n builds to go away for x86.
I don't think anyone uses that in the real world nowadays, and I never
know if I should report problems like this one or just stop testing it.

> The point is that this very commit in question was heading deliberately
> into the direction of removing the by now silly differences of UP/SMP
> for correctness sake. It just happened to unearth the missing check in
> topology_get_logical_id(), but that check is required independent of
> SMP=y/n as I pointed out above.
> 
> Thanks,
> 
>          tglx
> 
> ---
> diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
> index 3259b1d4fefe..118d9f7792ee 100644
> --- a/arch/x86/kernel/cpu/topology.c
> +++ b/arch/x86/kernel/cpu/topology.c
> @@ -279,6 +279,15 @@ int topology_get_logical_id(u32 apicid, enum x86_topology_domains at_level)
>   
>   	if (lvlid >= MAX_LOCAL_APIC)
>   		return -ERANGE;
> +	/*
> +	 * Spare the exercise on UP as there is only one instance at any
> +	 * level and the map check below might fail because the CPU does
> +	 * not have a local APIC or local APIC has been disabled on the
> +	 * kernel command line.
> +	 */
> +	if (num_possible_cpus() == 1)
> +		return 0;
> +

That works.

Tested-by: Guenter Roeck <linux@roeck-us.net>

>   	if (!test_bit(lvlid, apic_maps[at_level].map))
>   		return -ENODEV;
>   	/* Get the number of set bits before @lvlid. */

