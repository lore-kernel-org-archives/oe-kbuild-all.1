Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F15515A0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 00:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VNejiONG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28ee72913aso193433266b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Jan 2024 16:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704500342; x=1705105142; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KkrCdBNLcmk3x1SV45s/V/SWlteI2qUXSQc1BGercgY=;
        b=VNejiONGkqQUD3uJEzxGcQKCwaUfARvtK91K8FThbFjelurjRrfHt1rzzQW3vQDcx2
         eWQfJoq5OFRCs2uZxuOCrZb5sVOcVZD1ekKClxqxYl+iSstF0fAEpqZRtaFxd/V84eUr
         dNtQQeeWAxVTkXz/XXPQ47a5ABZU+aF3HFY3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704500342; x=1705105142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkrCdBNLcmk3x1SV45s/V/SWlteI2qUXSQc1BGercgY=;
        b=X4TmxD+e6WRra4mlSAI0fF5zM6rOPERwKNZYYH6P534kmcifeD+KKK/GIY8FbXCKKx
         EklJlJHrGgqXprpJuS3n70IOWF0iZAKlYmeT48Q2sB9lu4Yo0ZhzZKBJvNJPxzBu0pxl
         2me8N+C2+YIqo/Im5iYd0s75JYexR6YlMA+6tGGbfzWS24G9bRhw32J2bQP11G+m4MJs
         4fsjMyAvVBFgYChZbYty9lyXT7i/5L22fr6ktqW06pUACncmi89ft23g0BoOmfPX9o/z
         jR2VfMcHjRU4jsqu0btFK1NRGYtZg/USa3dJZciS77gqVgxI2oSGKWSK3FIOx6I9oAGb
         VK/w==
X-Gm-Message-State: AOJu0YwACFwoZUVwdOYoyUp2HKCUm6E95qnaoceFm9OoQDFaynqvuNb8
	LBWXYebbESPgIbkFJG/Zbp/mSa+O+J25CCMMHb27+aCJ2xk8Vo+I
X-Google-Smtp-Source: AGHT+IE+RZNcSKZEFjo8jdIb2sL6LWUiKhRfJXGNPxs/IrzAP8tsUA3uFKQ7+2hZEk4rLOQNpLtA3A==
X-Received: by 2002:a17:906:3e16:b0:a27:97a5:2424 with SMTP id k22-20020a1709063e1600b00a2797a52424mr257192eji.41.1704500342254;
        Fri, 05 Jan 2024 16:19:02 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709060d4a00b00a2825a9e1d0sm1404885ejh.174.2024.01.05.16.19.01
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 16:19:01 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a28da6285c1so24014466b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Jan 2024 16:19:01 -0800 (PST)
X-Received: by 2002:a17:906:fe05:b0:a23:5939:759e with SMTP id
 wy5-20020a170906fe0500b00a235939759emr344150ejb.26.1704500340786; Fri, 05 Jan
 2024 16:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com>
 <202309231130.ZI5MdlDc-lkp@intel.com> <CAFUsyfKDRiX9kKOhHcA4PLqqT6Q5faHF0eRGiKN+9NSbvrUfDw@mail.gmail.com>
 <d02bd4f823534a00ae4915ead3d92773@AcuMS.aculab.com> <CAFUsyfL0M5P4+4s_b1kvJ_fE-ax8YBK0ammbKfoy7yKs1obzrA@mail.gmail.com>
 <CAFUsyfJduB29c6=BNmTtgoWcHAWA1AZ-sdbhyp02JVhvA6Gp0w@mail.gmail.com>
 <CAFUsyfLuo0_Sm91mqbM8Sbo-ncwnM4RaRq=GxQXDmkAN-nQ3uw@mail.gmail.com>
 <CAHk-=wgv6h4ru=z8UR5XyutoRKveOetNpwovHburvRgG9NSa3g@mail.gmail.com>
 <CAHk-=wiNUucmvTKGmveWzXXe99SpOwU65nFtH-A2_aUpPsAPJQ@mail.gmail.com>
 <5354eeec562345f6a1de84f0b2081b75@AcuMS.aculab.com> <CAHk-=wg8vssPVO68_qH_BHBCj6_DDawKQHBOgZh4gw5YFmpCKA@mail.gmail.com>
 <204bf145e6ad47219c005e9a4407ebdc@AcuMS.aculab.com>
In-Reply-To: <204bf145e6ad47219c005e9a4407ebdc@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Jan 2024 16:18:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjGaH6oA47WkphTweMiy15Zjfuk-aVcXSasMX=aX9rFLQ@mail.gmail.com>
Message-ID: <CAHk-=wjGaH6oA47WkphTweMiy15Zjfuk-aVcXSasMX=aX9rFLQ@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: David Laight <David.Laight@aculab.com>
Cc: Noah Goldstein <goldstein.w.n@gmail.com>, kernel test robot <lkp@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jan 2024 at 15:53, David Laight <David.Laight@aculab.com> wrote:
>
> I'd have to fix his benchmark code first :-)
> You can't use the TSC unless you lock the cpu frequency.
> The longer the test runs for the faster the cpu will run.

They'll stabilize, it has soem cycle result aging code.

But yes, set the CPU policy to 'performance' or do performance
counters if you care deeply.

> On a related point, do you remember what the 'killer app'
> was for doing the checksum in copy_to/from_user?

No. It's a long time ago, and many things have changed since.

It's possible the copy-and-csum it's not worth it any more, simply
because all modern network cards will do the csum for us, and I think
loopback sets a flag saying "no need to checksum" too.

But I do have a strong memory of it being a big deal back when. A
_loong_ time ago.

          Linus
