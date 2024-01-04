Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF23E2D050
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EpnQIuH+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a275b3a1167so122988866b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 15:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704411410; x=1705016210; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2tCIapFlQ8RuTR5nGU7S5pDnR7Si2VyfexSEg/0jado=;
        b=EpnQIuH+7xqWexx0gHZ+QWJrVUCilvK9VGp/gC0PndQfwZIsm/zpGCg+KxRAz0OHHk
         /e1+gx9nh4JBB0LAUUV1w98tcB9wNtxampzKPu7gOYBPMnenEwNoBBotrFIQfMcTWAjE
         Zv+fF+N5YdfsWNTyEOBCLpSZtKXUFXDhgMxZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704411410; x=1705016210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tCIapFlQ8RuTR5nGU7S5pDnR7Si2VyfexSEg/0jado=;
        b=fSi616cddkripnxvi3b6Y8DpZtGaR7+eeuFKb0HhOmjUkPUgK6z6HLXXOmDPDFgUkG
         VbzD6rN1v37HYofExMIaTphju7nBNb/5lgaK+6J2kz/UZiOnbqeLACl7rGGC8lR8Xx73
         OaviEkhZsab+d4YiErPCx1fa6SnSHsoqxXQrIPbK1Nn8rcdupkHJwyljznfTR+maEbvP
         wQxC4oIIhEo4yiB+hc2IreZez13wnVc6tVqieh1ed0Ee+mm2BjJ4bU0lI/+iUL5CFi6f
         RVdiDBoE+wCgvKOZJEVQWmJNRBLZDduYEn7SRdasEpYQCbKsC5o3+Lc5WP7vVeqTx/4D
         yIkg==
X-Gm-Message-State: AOJu0Yy91gKblQXeHbwlAj5e5mPie0JIBl2yt5OQtUc0sPllaNiEzr7d
	8Gma2s/0xZOAOArSvG4khGygf7yTBU2WV8Rs8ap4tfYDzh9eShAV
X-Google-Smtp-Source: AGHT+IEXtr8v5NMxIKQw8H2hegiKe6FSegjBdNrlTjE2ceIusmLOGBt1fiXXXri93GaMgC11fmqIvw==
X-Received: by 2002:a17:906:7389:b0:a28:abb3:dd74 with SMTP id f9-20020a170906738900b00a28abb3dd74mr630272ejl.81.1704411409955;
        Thu, 04 Jan 2024 15:36:49 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id mj18-20020a170906af9200b00a28acfac149sm184999ejb.53.2024.01.04.15.36.49
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 15:36:49 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-556fc91aba9so1369762a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 15:36:49 -0800 (PST)
X-Received: by 2002:a17:906:71d2:b0:a27:4219:75f with SMTP id
 i18-20020a17090671d200b00a274219075fmr718565ejk.58.1704411409275; Thu, 04 Jan
 2024 15:36:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com>
 <202309231130.ZI5MdlDc-lkp@intel.com> <CAFUsyfKDRiX9kKOhHcA4PLqqT6Q5faHF0eRGiKN+9NSbvrUfDw@mail.gmail.com>
 <d02bd4f823534a00ae4915ead3d92773@AcuMS.aculab.com> <CAFUsyfL0M5P4+4s_b1kvJ_fE-ax8YBK0ammbKfoy7yKs1obzrA@mail.gmail.com>
 <CAFUsyfJduB29c6=BNmTtgoWcHAWA1AZ-sdbhyp02JVhvA6Gp0w@mail.gmail.com> <CAFUsyfLuo0_Sm91mqbM8Sbo-ncwnM4RaRq=GxQXDmkAN-nQ3uw@mail.gmail.com>
In-Reply-To: <CAFUsyfLuo0_Sm91mqbM8Sbo-ncwnM4RaRq=GxQXDmkAN-nQ3uw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jan 2024 15:36:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgv6h4ru=z8UR5XyutoRKveOetNpwovHburvRgG9NSa3g@mail.gmail.com>
Message-ID: <CAHk-=wgv6h4ru=z8UR5XyutoRKveOetNpwovHburvRgG9NSa3g@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: Noah Goldstein <goldstein.w.n@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, kernel test robot <lkp@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 at 15:28, Noah Goldstein <goldstein.w.n@gmail.com> wrote:
>
> ping

Bah. I think this keeps falling through the cracks because the
networking people consider this an architecture thing, and the x86
people probably consider this a networking thing.

Anyway, since I looked at the thing originally, and feel like I know
the x86 side and understand the strange IP csum too, I just applied it
directly.

              Linus
