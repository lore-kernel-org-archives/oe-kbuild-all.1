Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756671B2C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706645785; cv=none; b=E0cildkjXtEQPiio1GH7bMgQvUYKgazI7Sm5LHBGa1Y9n1+xHprCYGC//B3k/4TnM+iTG+lemLE6wyeVHenbMvdDxVce7ry+hBZ9CHadir5NYDeFJRGiRN35ey9RAeoY5cpCte9PaV2Vafu98MJnKef2rWe5A095/6+OR93kKws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706645785; c=relaxed/simple;
	bh=qEkzVINEzrsv6QknnR3uGopyEGknBNsSC8n1mL+ellA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eoQ4t6XrVOS1aj/8nSz486ytITPUqfssbxAGd2hPDh6hMwmqTDQgaFoPVUGhFnHUWcLC+8WLYptvLb5YxRm1PJ191qBa5195P/G77EAALiioBDM/x4Wfc7Jm9SE2eHsD1l7XuuM/W471ny5d1hpP+QshTxw991uCAxqEEb/1TJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtTy+r5T; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtTy+r5T"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7431e702dso30806595ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 12:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706645784; x=1707250584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggLu+83YHUxh7owokp3m3aEOr88IRbIvhVRD0C/111k=;
        b=NtTy+r5TtZdtiws0ojE2I4OUhvpEg6AtuiVm0hfN3FTewemKl7u1/QABrJADcg0q8L
         JrvlzJbZWJBBtzXiT5f+dqq0OyErH4/g2OuovowXnf0a6FuPyGYF7RSlSBsXlEEUV6ga
         EGxR9716UC8hgA3yksPM+rJnMN533H5WZADUFwI42F7Dtmy3ZELkcgU0EaG3SxhM+ljD
         a9vgLBWUpij00K84G9UIUPvDSgdICRBsu4kN03jnfGQgpm6WUq2usGy29WefFkyVsTfJ
         5g36gvPYnEV+iSwbpPtajomThORmCu2AT8sy/6xYyW5V++g/Lr0FMoD3Gade8DPtFP32
         Kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706645784; x=1707250584;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggLu+83YHUxh7owokp3m3aEOr88IRbIvhVRD0C/111k=;
        b=pm0xkGc33OdiwjkCiZI6GVm29qOrbCGDyO40wAWeT0oAzL8GLEgqSHE7jAKQKxW0CI
         pG2O2LI/rWzE1AJsmjXmFBwnoqhQDaE9uHQXiG+Our7HVA+i1OPvjaDSRsULTgtiTXlZ
         V+NB+75/ZFuQOND/kDOZXTOQGgZXJsm8F+TFtMoCq7DHGIK2gFi62dwwSzlPkpHrWg6s
         fmY3CDoOvlBkLUP9BMXRs0IVrd2UOkjQ2fU6HASB+fM1ZAb5KQJPhht86Z4+sDaN/xfC
         OwKkX+tUunXralcxZAy2HegoS8DFemplJunjfW5DfaJogXbF89j0rJtamI0vvpkAx7J1
         N7Ow==
X-Gm-Message-State: AOJu0YwitGRdI7OOatDg2v+otB/k3rio8khxTGSmS1Rhq4nn1yg7aY1p
	+NCvmw41FfiUwzyZmbce+mYB2KgXrSYI8NZvY80rSU/qjXi4EwFH
X-Google-Smtp-Source: AGHT+IGnDiy/kgMcQpA6zdqjr2COzWdbR1rBCQvEgsBpyME7KGXtypQkMDQFnb7TFGTW1gz4qyr5lg==
X-Received: by 2002:a17:903:2301:b0:1d8:f827:d9d2 with SMTP id d1-20020a170903230100b001d8f827d9d2mr4541297plh.23.1706645783642;
        Tue, 30 Jan 2024 12:16:23 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:f41b:ed67:576b:7c22? ([2001:df0:0:200c:f41b:ed67:576b:7c22])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902a38500b001d8cd7920c7sm5071236pla.130.2024.01.30.12.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 12:16:23 -0800 (PST)
Message-ID: <8cfa0192-769a-6ef0-4b59-bcfd0eb43453@gmail.com>
Date: Wed, 31 Jan 2024 09:16:18 +1300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [cip:linux-4.4.y-st-rc 878/1809] arch/m68k/kernel/traps.c:32:10:
 fatal error: linux/extable.h: No such file or directory
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
 Sasha Levin <sashal@kernel.org>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
In-Reply-To: <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 31/01/24 09:10, Michael Schmitz wrote:
> Hi Geert,
>
> On 31/01/24 04:26, Geert Uytterhoeven wrote:
>> On Tue, Jan 30, 2024 at 4:23 PM kernel test robot <lkp@intel.com> wrote:
>>> tree: 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git 
>>> linux-4.4.y-st-rc
>>> head:   4daf8df4558b5aae717516f7e941014c463772c2
>>> commit: 193e83a8194fcb23b6fb4aea9518a67b786df1c5 [878/1809] m68k: 
>>> Only force 030 bus error if PC not in exception table
>>> config: m68k-allnoconfig 
>>> (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/config)
>>> compiler: m68k-linux-gcc (GCC) 7.5.0
>>> reproduce (this is a W=1 build): 
>>> (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>>> version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: 
>>> https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No 
>>>>> such file or directory
>>>      #include <linux/extable.h>
>>>               ^~~~~~~~~~~~~~~~~
>>>     compilation terminated.
>> Either include <linux/module.h> instead, or backport commit
>> 0ef7653797addea8 ("exceptions: fork exception table content from
>> module.h into extable.h") in v4.8?
>
> The latter, for preference. Thanks for spotting that. Where would I 
> send such a patch?

On second thought - backporting that commit would break anything in 4.4 
that includes module.h for exception table stuff.

module.h was where the exception table handling used to live prior to 
4.8, so my patch ought to be changed to include that one.

Cheers,

     Michael


>
> Does the /proc/sysrq_trigger mechanism exist in 4.4? Might otherwise 
> drop that patch from 4.4.
>
> Cheers,
>
>     Michael
>
>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
