Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1A659B71
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710545011; cv=none; b=L/d/HcFRZZo9hE4/DO+HVQ7mW65nstjY6Is0gVLhANHqVV/jwJQamUdLHRCSRrDRf5pubp5XzR4atP25Fjsq3AbfmKrRKPUEUyurKRbicVT0Kr/yWHeTAtFHhYFs/wpe1fhYJLeyNG75e3zx5PGGNUtt/ajRXDpL9EVU+pxqDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710545011; c=relaxed/simple;
	bh=sytlPHzECdx/TQnD3Z0Odvtgw7GxrNRoLcw66cnO0n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZD/ZV20QTcJcRLEh1WQWzCEqEHEphVbAsz9zXOkHUFkv3zlJn8DkQEk9F5TBD1bki6zvcKBmibrJNUycgoQ4wuU53KoXrxIx/rlhM1rWAqiAxJlgqh5P2ar6f2RCoa2R1yGz3HOh49P66Fwa7PM3kWJ2fAKASdwHS6tQi7dfuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IokwaWot; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IokwaWot"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513d599dbabso2400276e87.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 16:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710545007; x=1711149807; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Md0NRsaNOOwAL+jub1moMYrNKunx652Xm1e//iAuX8U=;
        b=IokwaWotyu0x6ZkrZf/vdrhDpvUocrqftbuEuAjPE8fBqd3FmWnlT9PaAx740hNe9X
         MNHidPIyzY2EuEVLUS7+0UMegFbC7WJTk/LNyL66pKxj96+9EVvJ7SVpLc+VfYIsClqJ
         HbPjxlfjgvkH6KEaKy+NceZiecjnUuc+JgXYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710545007; x=1711149807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md0NRsaNOOwAL+jub1moMYrNKunx652Xm1e//iAuX8U=;
        b=fMNQefEIHsaY3okUhoAGYwd2kGd3ryAU9ptJSRgn2z1yUX4cuh7Lz2RcIUNY4ARms4
         EBDau32+Ro5TFtgvGB8FM5/zJZSP9t1TKuo5s3z1kAaIgjzKJT2Dwf3T7UJ2igMbotAH
         WjptI8GChhd/Ivg0X/3jzdJouUWzgt4CTi4FXVT6d1ai/dnEqGL+GgmP4+Mp8KEozUAW
         P7jv7H5obirsj2M0tZSe6XCLPcDHtcYplsyRu8AxLUj9Yqi2NWpD7fiV0rBLzmtcyUMF
         bWuH0duZleVmzMgsD71vl6zivPHcwpROFX+5AGCsJi3/0vsPkcbCXx5e1qiKRLV/VeaV
         cPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxbme/Fmoy6Na8yAjWvN5VwtRaHsgN+qcHDYQMPov3OGLAKDUB03Dr0Kry9grDKy8FlrwsdOa1u7afhPqKeRVpSZTBkI9s8NH6XSEt+A==
X-Gm-Message-State: AOJu0YxHGLyQn77c3wOlIuNo4lYtJPpP61VooPa4U+mjiAJ9Dn55qngr
	4MKlbMm2vk+dJf9odI5UTddqVPK9WsoMLKDTSMAOONVt5/cy0oyuV0P5MWI99CSw9MDBIbO5F5I
	Tg+0SXQ==
X-Google-Smtp-Source: AGHT+IGR+kqQR8UbHy+algGoqAe0O2BgIqVy1eeMLRkCFWYqelv5qAq9MH6SL3xu7yT4/QXl39jdzg==
X-Received: by 2002:a05:6512:3111:b0:513:d46d:92f5 with SMTP id n17-20020a056512311100b00513d46d92f5mr3597779lfb.23.1710545006852;
        Fri, 15 Mar 2024 16:23:26 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id d11-20020a056512368b00b00513a53acdd4sm776398lfs.104.2024.03.15.16.23.25
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 16:23:25 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512bde3d197so2597386e87.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 16:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsKComzNMTY/KuS4KFzy8LpV4lmMhYJyFRm86bMMU6fa5Q+jXwRrq7x2YTyNUjujKSWBAJV5AojWrTFnPIWjQqs2AgP/WmXxsMUv9Sbg==
X-Received: by 2002:a19:5f45:0:b0:512:ed8e:97ce with SMTP id
 a5-20020a195f45000000b00512ed8e97cemr3783714lfj.16.1710545005123; Fri, 15 Mar
 2024 16:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240303235029.555787150@linutronix.de> <20240304005104.622511517@linutronix.de>
 <e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net> <CAHk-=whK=G1o6RtS9DS3wEGF1KU7WLgLL1+6Se86bj8m7wwqrQ@mail.gmail.com>
 <87y1ajjsv9.ffs@tglx> <87o7bfjeae.ffs@tglx>
In-Reply-To: <87o7bfjeae.ffs@tglx>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 15 Mar 2024 16:23:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP+XMGHr8NU13sSOG_oasNZN02O9_c1PzCJNG7+O-GPw@mail.gmail.com>
Message-ID: <CAHk-=wiP+XMGHr8NU13sSOG_oasNZN02O9_c1PzCJNG7+O-GPw@mail.gmail.com>
Subject: Re: [patch 5/9] x86: Cure per CPU madness on UP
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	Uros Bizjak <ubizjak@gmail.com>, linux-sparse@vger.kernel.org, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Mar 2024 at 15:55, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Not really. The problem is that a SMP build can run on a UP machine w/o
> APIC or command line disables the APIC and will run into the exactly
> same problem. The only case where we know that it is impossible is when
> APIC support is disabled, which is silly but topic for a different
> discussion.

Oh, I agree - that was why I said that it shouldn't depend on a local
APIC on machines that may not even have one.

That "may not even have one" can still be a static option - we
technically allow 32-bit UP kernel to not enable X86_UP_APIC, although
it might be time to drop that option.

> So the proper thing to do is to check for num_possible_cpus() == 1 in
> that function.

I think that's _one_ proper thing. I still think that the deeper
problem is that it still looks at local apic rules even when those
rules are completely nonsensical.

For example, that MAX_LOCAL_APIC range test may not matter simply
because it's testing a constant value, but it still smells entirely
wrong to even check for that, when the system doesn't necessarily have
one.

So I think your patch may fix the immediate bug, but I think it's
still just a band-aid.

Either we should just make all machines look like they have the proper
local apic mappings, or we shouldn't look at any local apic rules AT
ALL.

So I'd rather see those apic_maps[] just be properly filled in.

> Sure you can argue that we could avoid it for SMP=n builds completely,
> but I think the right thing to do is to aim for removing CONFIG_SMP and
> make the UP build a subset of a generic SMP capable build which has
> CONFIG_NR_CPUS=1, i.e. num_possible_cpus() = 1. Why?

I wouldn't be entirely opposed to just doing that. UP has become
fairly irrelevant.

That said, UP is *not* entirely irrelevant on other architectures, and
if we drop UP support on x86, we'll be effectively dropping a lot of
coverage testing. The number of people who do cross-compilers is
pretty small.

End result: I'd *much* rather get rid of X86_UP_APIC and the "nolapic"
kernel command line, and say "even UP has to have a local APIC".

We already require a Pentium-class CPU, so in practice we already
require that local APIC setup. And yes, machines existed where it
could be turned off, but I don't think that is relevant any more.

Put another way: I think "UP config for wider build testing" is a
_lot_ more relevant than "no LAPIC support".

             Linus
