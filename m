Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679C21362
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706726859; cv=none; b=NTv5zRmkzeyUR+do9KKbgeTv7ZEmBaZfiCIAtTmCUDabp2r5pcLSZRKLfcTSc23e5K5LFuBMfJPNlYUXtsyhIhGg/rWnQ1+6IQbFiUrrf7X/EMC7WkdWLnFnTocSxCAth6QDqBI9yclc4nu4NsXWVNzxrKauAMcnPsbGiZhSHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706726859; c=relaxed/simple;
	bh=7wYXS/SlkJ8AOrdGvl0ZYXtpU339epgU9Os3p8q6l0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN9hPE0KAPDYjrpq+H40K0HWWDOIH8HlCV2CPel4TW90yDHtGfH/y6f0/cp5E2pr7HPt2mH2DjRPB1KU2L0gxCFHJG0q2DBqJkHWWzoOvubQZd1NA3M1OciUX4n8vms7n4liGtkC2r6YevNJ+nCUQrOzkgywT+HfVs+op5jQHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VScw7qk4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VScw7qk4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d944e8f367so799305ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 10:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706726857; x=1707331657; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wh3vBVgFANL09xItQULxD8UoFSKaimbGy2fWeN+Wyyc=;
        b=VScw7qk4+iHEPNUnIWLZh/OZNOxJ0Wya9/UxipV+Czm7+0S5rkZ6nqZpylXIEZrMhs
         Q7avj0gahWQKWgINGDfMLRijmo/fBSgz2i2MppSsWtogwnFb9Hs+AOEXvzGMJYXfbwf4
         D7PrraS7ZZ9kyoCMyiVyzbgVrAC/LSxmci8r5l7WfymzjOMs9xyPmwtulLpwS6/sXwF6
         eMkj/qP4IDM2TaXGQbJTSaV5jLQqzTYjWKsM2FfFLqT8Ka6nHMABawfUKt3TMGUeGm2K
         Sng1P7m1FfWd+2P29SgNV7IIvPlWOQc8Ul4tVwSZxH1Mcj8r+5MoiDYxTUSjyXD+5cpc
         xxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706726857; x=1707331657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh3vBVgFANL09xItQULxD8UoFSKaimbGy2fWeN+Wyyc=;
        b=ZgZ01s4y+u0f+kdo/ZbB9uWQMsrhtJcSueqDjopCMdR+2C0J5bxs0dBHWok9RIcb/5
         fqVtEpQQNR7vFJd0ppNAlOA0TUi7GjLGwPIEKbcQKXJIFSrMt11Iq+wlIqVxdLHykzFV
         mfZOz8azf9xoMuRlkbBWg/JLi4pDTTQ92LjX+UBqRZ4z30Y5cil/xtKYAlZGHpbRSghS
         7X4aIDZmgyUB1sZQ45S7y+7hbQmH6S/KOXz42HYRj8RHGUPmkJ0lLehgjfvhxqiC3pTv
         3ksqpnD7ySO3bfjEzlRymbYF+FNbWJeBJ4ICeiyFTiewuJUyVAwaSldBnz55t78+jl3Q
         zBVw==
X-Gm-Message-State: AOJu0Yx5jrvhhfBROhKQQSZiTiwo/+db4MaOka9WFNyLiWwEfFFtS6wi
	p6UWV7LUIGpAq0cDIYSEnV42UXnzLBMs/KKxdC8MFYx7QMcm3KS7
X-Google-Smtp-Source: AGHT+IFCRgqn6mXE5KCdEiY94CAv/G9LonZ1v8TYBKZyc09F5vR87OjIXYx+uM0DW7tavSF5iKRdRA==
X-Received: by 2002:a17:902:e5c5:b0:1d9:36af:dd2a with SMTP id u5-20020a170902e5c500b001d936afdd2amr2043058plf.31.1706726856790;
        Wed, 31 Jan 2024 10:47:36 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:444c:3f95:978c:b46e? ([2001:df0:0:200c:444c:3f95:978c:b46e])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902d4c400b001d8a5c08277sm9098693plg.260.2024.01.31.10.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 10:47:36 -0800 (PST)
Message-ID: <17eb05e1-256d-d3da-5f3d-47af2fed0cf6@gmail.com>
Date: Thu, 1 Feb 2024 07:47:32 +1300
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Ulrich Hecht <uli+cip@fpond.eu>, Sasha Levin <sashal@kernel.org>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
 <8cfa0192-769a-6ef0-4b59-bcfd0eb43453@gmail.com>
 <CAMuHMdVhjCJqOpLA1VYMCLDrXVkhV6qBJzUOMVA324-UyfUxSQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVhjCJqOpLA1VYMCLDrXVkhV6qBJzUOMVA324-UyfUxSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 31/01/24 21:27, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Tue, Jan 30, 2024 at 9:16 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 31/01/24 09:10, Michael Schmitz wrote:
>>> On 31/01/24 04:26, Geert Uytterhoeven wrote:
>>>> On Tue, Jan 30, 2024 at 4:23 PM kernel test robot <lkp@intel.com> wrote:
>>>>> tree:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
>>>>> linux-4.4.y-st-rc
>>>>> head:   4daf8df4558b5aae717516f7e941014c463772c2
>>>>> commit: 193e83a8194fcb23b6fb4aea9518a67b786df1c5 [878/1809] m68k:
>>>>> Only force 030 bus error if PC not in exception table
>>>>> config: m68k-allnoconfig
>>>>> (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/config)
>>>>> compiler: m68k-linux-gcc (GCC) 7.5.0
>>>>> reproduce (this is a W=1 build):
>>>>> (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tgup-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new
>>>>> version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes:
>>>>> https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/
>>>>>
>>>>> All errors (new ones prefixed by >>):
>>>>>
>>>>>>> arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No
>>>>>>> such file or directory
>>>>>       #include <linux/extable.h>
>>>>>                ^~~~~~~~~~~~~~~~~
>>>>>      compilation terminated.
>>>> Either include <linux/module.h> instead, or backport commit
>>>> 0ef7653797addea8 ("exceptions: fork exception table content from
>>>> module.h into extable.h") in v4.8?
>>> The latter, for preference. Thanks for spotting that. Where would I
>>> send such a patch?
>> On second thought - backporting that commit would break anything in 4.4
>> that includes module.h for exception table stuff.
> Why? <linux/module.h> still includes the new <linux/extable.h>, so
> existing users of <linux/module.h.> should be fine.

You are correct, of course. I missed the inclusion of extable.h by that 
commit.

Would adding 0ef7653797addea8 to the list of v4.4 patches be acceptable, 
Uli? No functional change as a result of that commit.

Cheers,

     Michael

> Plain v4.4 + these two commits seems to build fine for me (modulo
> the issues due to my cross-compiler being too new for v4.4 ;-).
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
