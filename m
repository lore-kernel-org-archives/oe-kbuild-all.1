Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ADD71B2C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706645422; cv=none; b=JIGx3vp7YmI6gQHShmb4KCBW8EmqKb6gcz7ce7KVKIsbk64CmuS/aoX6Xp9UooR3FHuIxrDSbrvJwYDHbLn0zen4YVpBM/IRTXDNjR3M0taMnaWyA8HcTcGIcqhtFf7Qi35iG/kPu5G+tfEeM+jR7S9wcJ7imzUpf65Mdd7v9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706645422; c=relaxed/simple;
	bh=dnzM/zE76d643dXkvLEnaP3GumsqwCortapN4aVnanE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugYRv096cBafHiFKdQitIEsKIC9bpaChXeGTLyztKAJ5n9oH/XOlHI8iNC7vD8i93/iUW0h+gbUIK5mMjQs3ZLKQMRZqIqXTZjSNSVSHLxyaq3AOGGVhIVB4IL6xPswddRoI78eSsqC0TvDRfagYeU3wNhWjUdAPVJ7kwmoZ2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDMw2dxy; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDMw2dxy"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d7431e702dso30739075ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 12:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706645420; x=1707250220; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l22OWnqlZ4HtgkXrLwUqw37/KvyyFbZuqbzU2ACeloY=;
        b=aDMw2dxyRWKcuytIBtdfTD3urhHgDIJHPC+AbSt2tmXVf05qkb1EVoA3DtQqP9E4Yc
         MPQTpcWnsbqZQt5tvXZUm1P7M/tpetH8wBqqhODrzLiB0/fFN4+5sprJMHDNoKPGQ2nA
         VOAlvRSU9sYL9yANzW48zZ0o3m8HXxioFyzYDi0n4kwhDilsDt8FVOGzzeXST50CoHN5
         OBkwbzfWy90QCERANK2nEYOaKE3P0iIvx7JC1s011/P457nkj4ssxjMraVHKNxxyQ1Li
         BCjseESjqjxnGqFxYODSj0euWBhEIPFftjoXNNpuc1BZomSVClZ+UaXIzNEOZPH/Fhyc
         dEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706645420; x=1707250220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l22OWnqlZ4HtgkXrLwUqw37/KvyyFbZuqbzU2ACeloY=;
        b=VCnaORbVDe89qn+dCFNWUGxDqq6eiNA45TWMEyYQ5+y2xX4WmVnWQPD/0Exahi4xgt
         glY7SyQOAC1w8CddI6WDTtHCuu4dBrz5wn0ixccUDfRM25/1WKGwHcfepGc8XX7fxt4z
         Qm8hT4uWnfJn7zBNbgghCyPXpud5dY1pjN2eAQ1i/JVscbN/pumoNRPlTk/SnflDHpD0
         3SVH03Ye8/L8uZKECMQNMZ7nZxevRFa0736gUYvx+nxB2XtcRs44M0Fu7kZv0LGnyjdP
         qWlksKsOFiDiLoQ5xLpPHt9wLOvy9l9/HHbmIHzDNeM1UVXRra+3XjVBxfg0T3Nq1JYG
         3eog==
X-Gm-Message-State: AOJu0Yy1EnKTPWIIeHgIzDpPeruSV4DEsO6F/WmmgbBE/znoQML7Eg/H
	L0Mb7dsQuju+gluliKHQGYuV0Iw6/f8SI79ILMXh+H5aApdUbGFd4CdfFN0x
X-Google-Smtp-Source: AGHT+IHX4h1nfKs4Ca6IMfC9sIEkKuUseDuQfowbSKSB5l5YdBIK+km4355Sx0x6eD4kcifS/TMUNw==
X-Received: by 2002:a17:903:208b:b0:1d9:342:e6bd with SMTP id d11-20020a170903208b00b001d90342e6bdmr2439087plc.13.1706645419942;
        Tue, 30 Jan 2024 12:10:19 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:f41b:ed67:576b:7c22? ([2001:df0:0:200c:f41b:ed67:576b:7c22])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902eb1200b001d901c2087esm2072157plb.302.2024.01.30.12.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 12:10:19 -0800 (PST)
Message-ID: <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
Date: Wed, 31 Jan 2024 09:10:15 +1300
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
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
 Sasha Levin <sashal@kernel.org>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 31/01/24 04:26, Geert Uytterhoeven wrote:
> On Tue, Jan 30, 2024 at 4:23 PM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
>> head:   4daf8df4558b5aae717516f7e941014c463772c2
>> commit: 193e83a8194fcb23b6fb4aea9518a67b786df1c5 [878/1809] m68k: Only force 030 bus error if PC not in exception table
>> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 7.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No such file or directory
>>      #include <linux/extable.h>
>>               ^~~~~~~~~~~~~~~~~
>>     compilation terminated.
> Either include <linux/module.h> instead, or backport commit
> 0ef7653797addea8 ("exceptions: fork exception table content from
> module.h into extable.h") in v4.8?

The latter, for preference. Thanks for spotting that. Where would I send 
such a patch?

Does the /proc/sysrq_trigger mechanism exist in 4.4? Might otherwise 
drop that patch from 4.4.

Cheers,

     Michael


> Gr{oetje,eeting}s,
>
>                          Geert
>
