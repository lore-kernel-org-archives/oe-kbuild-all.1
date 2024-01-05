Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698321FB4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J1QIeE9P"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-556ea884968so1247717a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 16:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704414809; x=1705019609; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jW3PYuiGpDI9Y46QXBSVasJWKk1a/5VUlFNdiuTF92c=;
        b=J1QIeE9PxnyGegPj2l2SIY93tOKgQR0sQJ+K1N5WqBp7pzoZDeoqbrYleasjBmnc5M
         TBHbjNmuPqIPduPcVsFGgcs2Fdmr4vfdgOEKErYoVom0jB5/xVmErZtstLCqlfIoJNEB
         oe8EM1JOx3M50j8WwL7VHQ1nXn7/6N42rCorw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704414809; x=1705019609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jW3PYuiGpDI9Y46QXBSVasJWKk1a/5VUlFNdiuTF92c=;
        b=ZgSvqS81mCtmL8DDB0wKqj98PiGvZoNzOlHAuXKdvL5jHV/WjjDIJHdmGUVJCn22n3
         cwcaqcAnMbwAMJdrbJ46z8z5UUW+H+h8klkU/Wrn17dXd9zmj9P7S+Yqsx7Pt6WkbRH7
         8W9Hl5NdgoF5INd5gC5gHFnamoWxHchRyvoAP6s5IxS+TwedGzO9Wb6Ie8ECiiotzP6p
         Mcye40E6wrHakjEzhIueH3tkv81EeHycl2xvLFW866hbm/F5A/Bv3dZ0zSyc3JjliSnG
         r8FTU6CGWpweSLQYC48vXsIQsEWCHkDAZReLSqL7povZ0AzAafPYVAaCai57IwbFw7Mm
         +mYg==
X-Gm-Message-State: AOJu0Yzk1Z2CMkH0w0bF32O71vnmIJfuNwm4yzIM8RXT3uZk4B/WfUGx
	zNKsFFUCG3+Xhl2cQNc8hysUR/PiRCBL166DJyy8dFG0QVMabX70
X-Google-Smtp-Source: AGHT+IEH/5vZ+HX0XZ8CuDL4HOezeTyLcmT1lxhKIDYs5Phep9P7wg5HkXQMaCAq/rSpck9NG8ugsA==
X-Received: by 2002:a50:d750:0:b0:551:86d9:6252 with SMTP id i16-20020a50d750000000b0055186d96252mr798440edj.55.1704414809042;
        Thu, 04 Jan 2024 16:33:29 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id f18-20020a05640214d200b00552cf686df3sm297230edx.52.2024.01.04.16.33.27
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 16:33:28 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so1253740a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 16:33:27 -0800 (PST)
X-Received: by 2002:a17:906:489a:b0:a27:7da8:aaee with SMTP id
 v26-20020a170906489a00b00a277da8aaeemr676587ejq.12.1704414807557; Thu, 04 Jan
 2024 16:33:27 -0800 (PST)
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
 <CAFUsyfLuo0_Sm91mqbM8Sbo-ncwnM4RaRq=GxQXDmkAN-nQ3uw@mail.gmail.com> <CAHk-=wgv6h4ru=z8UR5XyutoRKveOetNpwovHburvRgG9NSa3g@mail.gmail.com>
In-Reply-To: <CAHk-=wgv6h4ru=z8UR5XyutoRKveOetNpwovHburvRgG9NSa3g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jan 2024 16:33:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiNUucmvTKGmveWzXXe99SpOwU65nFtH-A2_aUpPsAPJQ@mail.gmail.com>
Message-ID: <CAHk-=wiNUucmvTKGmveWzXXe99SpOwU65nFtH-A2_aUpPsAPJQ@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: Noah Goldstein <goldstein.w.n@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, kernel test robot <lkp@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 at 15:36, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, since I looked at the thing originally, and feel like I know
> the x86 side and understand the strange IP csum too, I just applied it
> directly.

I ended up just applying my 40-byte cleanup thing too that I've been
keeping in my own tree since posting it (as the "Silly csum
improvement. Maybe" patch).

I've been running it on my own machine since last June, and I finally
even enabled the csum KUnit test just to double-check it.

               Linus
