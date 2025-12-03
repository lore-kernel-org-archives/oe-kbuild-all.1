Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD27299AA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749225; cv=none; b=mi2GYZA576kPET3gGK+WdGAh/M1Sk4ZoA5sK2IMlq91xJYIBiXDQsG+NAbGB16cARvqDjhYW/w14Aib4qrT6COrRI/nIWfxPowMfo9mx4+7JmuNbhbzUcVhIPvsWN4CR5e7eO+NMt+NodiY7jb0M2PNoFCMB0kkhCcckDZeMu/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749225; c=relaxed/simple;
	bh=XmJumtI+ZX1fKQfNtehDcFq+vRT9lsWZ957G0wow+s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to9+k2fNRoLj1kA/Xks9dhtUJOR1iCyJgvSqWNLt0DoDqnjZtQFkCBqjKgmg3Dg/Bqp5fHiUJBpD4bLkfiEFF+Hsa76sl5y86Ezy2RDTad1OVD0+Xt4YfdMgjG8pwy/8Ei6K5rUhIfecatvp0YCKXbIW0Yu2eef+mvE4uRfpiFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=VJl5CPyF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="VJl5CPyF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3437af8444cso7512548a91.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Dec 2025 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764749223; x=1765354023; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XmJumtI+ZX1fKQfNtehDcFq+vRT9lsWZ957G0wow+s0=;
        b=VJl5CPyF1/RHefQW/5UMoVlX0nwFI2oT/v9aagJ3uPzqNA/K0dcDDoIdaCmYJu8IEb
         2SeNf8KdXgdDoWY9ZG2Izyq/o2kVREDfAwmNaDOPFh99aLWqChLZQmlCkgnAQPrTsURF
         y32DemKaUrr74lsoBa47VRZWjgbe3d2ZgQIYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749223; x=1765354023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmJumtI+ZX1fKQfNtehDcFq+vRT9lsWZ957G0wow+s0=;
        b=TLRxBCGI7Op4SDF4BR7k4XiURz7J4s+tOCouh5epn/Ha+7v91GDjKTBRliM1vMg1OG
         kTQxx4AIfR1qWG+bFEqIjiRyuOVKiPHhoTNcEk5RhfNh+YxU7ARnElJxJQTDgOoOn5lD
         d8bP0GNMKzas8yJUrMZnLu9QtTEKpdtF/abbeoASnyFyYsiJCtaCTas6hbQzs+EEhUS/
         JpHa5gwvVchLfZLMYp7UddzVI1N9Bo2NFLgazrJ1LVgh5gd1vwNj1UsL7Ks61BZdj6Rz
         TTycsLHGlOu+poBJrgHItHYFmeCR/mVRC7oBVk/IIoTjfskxwUMxqYtmS6r1O6Ik9dJ8
         2LDg==
X-Forwarded-Encrypted: i=1; AJvYcCV5HNLCeV/rd3XO4ixE95iBwp7Yuzamzgq7r72xOzJViMBfBH7VSGKae0z5Iubwz+weK6PSmWs3tjEdV3yW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+bW50CJOt4SqHVvVfxg9ZKMZtgXafUaMc0yCgqfW3+OJURtVD
	TjhvNmlFq27UrbrmyPOvwMFiljAHiLgvSIUSfa1DSft4JKrBvjpqrdgM3HyHVaYWwJLgqr/Pl5Y
	cZZRLt4PNcTeYjnZ2u9qKODZYp8qlLKgV2jmA9wYd3A==
X-Gm-Gg: ASbGncujKjSlbEQoWviAaprW1z5bzaoEadTg9vpTCNs3eWIOT5t2YOMaDcd/SI6XrTq
	UBsFeeAGRRDIXeY+Bb+k9fVEamc54drWd0dBfEDHIBC2wfgTyBFNAR3ZsA5E0b1ulehjf3wu2JI
	rfOY19lEi56pwIAGT2JWNoVu5sZO3joGOac/qEqASNE8fmkUWzIv1c1mpkg7Y2ttUp1YBlj/vKK
	zu0hbAf7QgWjigZS91zz+LSJ2Zjcz88y1AmtqBFcZsFd9bn+nKVRC5QYik077kkyXGlp6y1
X-Google-Smtp-Source: AGHT+IEkhPS/1t5aWn66HdrhuKIufecStZBHy4HAaA+gH5GymYQAa2QcZdly0X0LFCKmADzkkz/N+CfyjLmyH6GwNyQ=
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-349126f0736mr1811981a91.27.1764749223337; Wed, 03 Dec 2025
 00:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com> <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
In-Reply-To: <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 3 Dec 2025 17:06:52 +0900
X-Gm-Features: AWmQ_bnS9BDxaDFZorffwfoU6u2xuAk1McRav0PjgsGRdFzJ_fhtggnUthokDX8
Message-ID: <CAFr9PXm_8Lyk5rPMWw+mAzu97RRfjLj8NLqz5K0Po4p9PM6FOw@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, kas@kernel.org, 
	mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Thu, 27 Nov 2025 at 19:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

>
> Replacing the macros by static inline functions should fix that.

Thanks. I've done that now. Any comments on the rest of this?
I have a few things like implementing jump labels, a vDSO to get
around the sys_get_thread_area() bottleneck to come after this.

Cheers,

Daniel
