Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF4219CA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192075; cv=none; b=JWs+4q0asiq00jeaIcZ/U/0WPB3vYBRbgJbo2gU+7USuiIOqju1iiEdBcMMOK+TiLPp11nblIFJorCSmuhG4TdE1th88vkBnxSC0w+yT0iRtaUAOflruDHWEYoTVEX4j9icBmeCWPMSHIPw8dtLxhIwgkpwMarGCIgTNVJcwep8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192075; c=relaxed/simple;
	bh=4+ixJyekF1jl6uiAyjfdWox0tZfOmu1tTOx5QFEdE0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2ex9w0ESSbfmcu8rfntJnggh32aFJyVWtk+l5rphgjTzBFyYA4iZp1vhEaFxAWlqINO1OlucmxJvN4r6CCNUeb0ciq8Uu4r2dPZ7fIXbvVDim84vhcpT8UyEA6RXdP77lbRBWHgy/mhTxs02OkvOW29hSezydf8Kla0DKvrAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OrOLIKCa; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OrOLIKCa"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so4915a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729192067; x=1729796867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uixfl2jtVqbJqFwF+ymcJ/PUl6a3StJk/DrSTA+CVC0=;
        b=OrOLIKCaW0iOFaRbih8C1BlYYPG7r+FMZKrQJTG30s2kxD9jnUDV61Xv9reyrQ0yZn
         8EC/qlnV7EXBEJvajhCMo4/GlWmmclSYp3d0WpbJZJ0/FwNsLOTVA1WwuIYRbJsWEHPh
         Rq3Op0PYuMoUKrmog8E/qZWQvttaRSR9hMDPrgKHZtOFwG5C6gcQcC4u4nhQbEPYlPok
         Pk1b1y+tdpLBWIVAUOL7FXhCfnsre7+gC9G7UOmIoTVJXzCqlQs01GYmcJvWdBDJB4cK
         MMY/M9WTEo6GxMamc/0Y6uTX2zS9+R77tvGCz6JoBLoSI7u1Dg7fPElMRx807FK6fiCs
         JHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729192067; x=1729796867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uixfl2jtVqbJqFwF+ymcJ/PUl6a3StJk/DrSTA+CVC0=;
        b=wavPNZtiD0EWVpDcgNreQOz2mKigiPzDTZczQgp18nllXxiugY+dbOG/+wB/6Mbzy6
         SxpugbJdrSRkM+3/+RXt32dkknbKFBWgwk8ZAMnOYvx1/98y7P7VxQnb2DzaWAG6cKMb
         se4jAz3R/z7TJK7onRimcHbbVBd8biYCMe3L8yZ94OrjzlYoM+Jib/9MP3W/A3lql2Zr
         jkqt7za5LTb0CtHddJW+qnY7Af5wDzWBWvKkQPFHHGD0J2/hQMufb5RD1qOy6y0NxOsj
         /UEla9wUa+j5cVdId/0nT53HZzpvyTc+HvPPAhhoir4N3XzKCMT111QbzuCauiD9nB+W
         9AKg==
X-Forwarded-Encrypted: i=1; AJvYcCU4QVPASOBopVBuFv0JtzYcLQLIrepkWVf7c2ojXk+a9Uz54yB4NQWKmP1bfkdrPm2nnwRwn5BQDhlVY3Rl@lists.linux.dev
X-Gm-Message-State: AOJu0Yza51hdmrfUcxSfKnjbSCHM89hoxWH0hTRPtifuh8zeTwr79Cye
	PfBwVdq3Ko6R0ho9UcVrk4BWn+sBdU1hcszWo9Cs/OyQQwjgTyks/BPTUnV1qbR80hNMOaTnoxy
	obgF36DnDq+a/k2lPgE/1/qI7eMkX9hH4RBsx
X-Google-Smtp-Source: AGHT+IGJ5bOtzlZwtV+s5IaY9jBglbZpjiJuoBwT3AgW89JKzeUwi0aGlcdr06htRSmxbUTs1hCk4iI1TzT9Wa0QxxI=
X-Received: by 2002:a05:6402:2709:b0:5c8:84b5:7e78 with SMTP id
 4fb4d7f45d1cf-5ca0a186b93mr58751a12.4.1729192066673; Thu, 17 Oct 2024
 12:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015-comedi-tlb-v2-1-cafb0e27dd9a@google.com>
 <202410170111.K30oyTWa-lkp@intel.com> <CAG48ez2T7i_qCAcGi3nZqQeT8A3x42YSdL=rWqXOUDy5Eyaf6A@mail.gmail.com>
 <ccc4e0a3-34f5-4793-bd05-ee0955c9c87b@mev.co.uk> <cf1a2818-1b78-4422-bb76-421732c428c0@mev.co.uk>
In-Reply-To: <cf1a2818-1b78-4422-bb76-421732c428c0@mev.co.uk>
From: Jann Horn <jannh@google.com>
Date: Thu, 17 Oct 2024 21:07:10 +0200
Message-ID: <CAG48ez1RWTEW_ZJBYbt6WWJX90haM61pwqqb3u9Pq8C_q71bQQ@mail.gmail.com>
Subject: Re: [PATCH v2] comedi: Flush partial mappings in error case
To: Ian Abbott <abbotti@mev.co.uk>
Cc: kernel test robot <lkp@intel.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, 
	Frank Mori Hess <fmh6jj@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 11:48=E2=80=AFAM Ian Abbott <abbotti@mev.co.uk> wro=
te:
> On 17/10/2024 10:29, Ian Abbott wrote:
> > On 16/10/2024 23:05, Jann Horn wrote:
> >> On Wed, Oct 16, 2024 at 8:05=E2=80=AFPM kernel test robot <lkp@intel.c=
om> wrote:
> >>> [auto build test ERROR on 6485cf5ea253d40d507cd71253c9568c5470cd27]
> >>>
> >>> url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/
> >>> comedi-Flush-partial-mappings-in-error-case/20241016-022809
> >>> base:   6485cf5ea253d40d507cd71253c9568c5470cd27
> >>> patch link:    https://lore.kernel.org/r/20241015-comedi-tlb-v2-1-
> >>> cafb0e27dd9a%40google.com
> >>> patch subject: [PATCH v2] comedi: Flush partial mappings in error cas=
e
> >>> config: arm-randconfig-004-20241016 (https://download.01.org/0day-ci/
> >>> archive/20241017/202410170111.K30oyTWa-lkp@intel.com/config)
> >>> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> >>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/
> >>> archive/20241017/202410170111.K30oyTWa-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new
> >>> version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-
> >>> all/202410170111.K30oyTWa-lkp@intel.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>     arm-linux-gnueabi-ld: drivers/comedi/comedi_fops.o: in function
> >>> `comedi_mmap':
> >>>>> comedi_fops.c:(.text+0x4be): undefined reference to `zap_vma_ptes'
> >>
> >> Ugh, this one is from a nommu build ("# CONFIG_MMU is not set"), it
> >> makes sense that you can't zap PTEs when you don't have any PTEs at
> >> all... what really impresses me about this is that the rest of the
> >> code compiles on nommu. I'm pretty sure this codepath wouldn't
> >> actually _work_ on nommu, but apparently compiling it works?
> >>
> >> I don't know what the right fix is here - should the entire comedi
> >> driver be gated on CONFIG_MMU, or only a subset of the mmap handler,
> >> or something else?
> >
> > Given that it would also affect a lot of fbdev drivers that would also
> > benefit from zapping partial mappings, I suggest that gating on
> > CONFIG_MMU would not be the correct fix.
>
> Perhaps just add an #ifdef CONFIG_MMU around the affected call for now?

Sure, I guess that works, though it's not particularly pretty.
(And this codepath looks like it won't really work on nommu either way...)

I'll change it that way for now.
