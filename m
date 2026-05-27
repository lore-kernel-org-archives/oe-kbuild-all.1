Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD4248F57
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 23:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924642; cv=pass; b=Ya+uVph/tc5DgRxlpZG8fv4ki5CE5t2ZRdbDAq2YV/HB42oJIoEwfNVTEzH1vaU6LZqnWkISJCTNK/R8B1pr2ELeMNTnj+SHt+1G5N3Be8IpbC2cmKf83edL04YEeUEeID3c6q8Vr566ybYe5fKcnqAnnxTLoB16l3V5o83ju0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924642; c=relaxed/simple;
	bh=Gnt4wi0bCMB53Z6IUixdWP2lLZ4CuAm622QZ3jaK+vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpTgqC7sIYkh759mSrMsNQ4rwZUh/sHUMQeZNmEDEv86EL6t+Qw4jCuL6QR+f8V8jMiYDiW85X1dlKP6eX+UuQwPHbDuiPm6O6LlmGX1mR6bRatpJZjqZwCBCGX6Pg1UHFjyE0E5Q40BKQgYPyMbOpje2lAcLCo9byvL1hIrtc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Xp6cGAMt; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Xp6cGAMt"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1353c2f35cfso2921777c88.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 16:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779924639; cv=none;
        d=google.com; s=arc-20240605;
        b=Qy8nDdcRtl9DHwf1gjT7k0UJe6Bgk9XLY6Byus0ATmT5KL7A1oyU7IHngTakfSIFcd
         +14yM81JwTLYHyhBNZhZ8fcMjAzo5/IHCFlZEe+5PVzjdec+k4JSloL7zCyQwfSIQTeh
         uXTiYo+ONT0qOWXTzZ+lKGGY3UuESsezULkxaANx/EbCRpIcFgeIIYkTTumev1/OePKk
         NK7ItXbt3AfDvbisYkSX/ber4AF5nNNg4/qLaPAKbmLWlTkUM+w+79M+f5H8kRE22fUc
         hqLd8MVtXrjT3e5UJd8KWTyNgPxyUj3pMdZstOUuZpNqn4p3/3y4dDR68f7XrCkS3hyO
         oWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GJdc0DhVsUFFOT3DbExPdG7o7NgePYwM6ifnagufjdY=;
        fh=Q6eC3KLLO38h71hT0xxM6EiCILRWK/TPIi9F+IodBwE=;
        b=GKOqT1+F9jkPYBXBxZlE39nPjUrWtlKFi+9JVnoQEMfQyK6XzxwlG9uvgs9ugn72oH
         zKymY/f59FaJrwBQrg1mA8hPonoxbfoyVhVV9TDN55+/+huw95IB4lWqIuLEswEWQ43S
         SnDqFankFwWwGDBNPsPryTI95SmGLA8yRvRT09F850Bgn686luL9yKSvLw2YGxt/oYnK
         x48L14YX5byRBTMMROyEygdQwaq8BMStVd8mLgeVEgmKtRlIHUOF7QKRShNMB/xGcXAK
         VeZ2QSJ8Si1Jp+YqdOaWUY8upxpQSBZ/Stet9ZJHfkO4VNpR7ZfcJNi8MEkeX7c/hhdQ
         Tqeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1779924639; x=1780529439; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJdc0DhVsUFFOT3DbExPdG7o7NgePYwM6ifnagufjdY=;
        b=Xp6cGAMtQJQeMwlyWAiXJ5XW4tjqtSCJfhUoc0+9s+yyAdqSpOknGqvAf4AEG3txaB
         yKWRL79KAWHV1m/GDVZNp3ZN4FHixpgosYS9N/kXgFyf/AcTX3ogCGEGFDyhW6ZaAK5t
         YByyT8f/MCpE2NiLzJO06HbdBR4oySd2bftHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779924639; x=1780529439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJdc0DhVsUFFOT3DbExPdG7o7NgePYwM6ifnagufjdY=;
        b=S31F1UHy+NH2YOo4nyJ3BfMSxpMZ5hCxTHailuhQUoEXoG6OAUuxWgvCzo8W4Xpn/J
         y1B4zfv/jviASBK2+mA1r62jgv10JE50GEgf9DPd3aik2cQGFM4ROvFy8tYJrEzKM2oz
         okBt/9VfdxJrntPqen7xnY81gJZdv1z10OQWggljPWZt7TKRsBPfAci8f1OaDHssV3zz
         595whbjFUvJrO+0y7OOOvBq+pyU8isxpceyAEzWfF0qC2lYl9HjJ3C2Q+xN+aBnCMmuC
         2es6u0YN45ukFW+aPd7oPR55dtVWwleB/xyYxMGWm+V7zIoMUr+55Vap5edM4tU53GLp
         k2KQ==
X-Gm-Message-State: AOJu0YxPnWFtHpS0y6qlaBQp/dFmn2zacCYV0rqTq3oCAur85CUJZ7C4
	Wqb06Hfl6y2QtQmcXOgdDHPVEnHoXRCHvIZVYkLvVKaLaP1i4r34oJ0GGAcii3cnX4S8bM00nI9
	+lQwt7Sm/R4S3gti9H9aejcO9yo68EU1R44hwYhrL2QkADevHjpz2
X-Gm-Gg: Acq92OHvotQ+m1tWfE/YgrMxbCXtKRVbWESATZWxiW8PJ0ke2Xgc2A/0+SSBFSYE3h2
	EY9OCxa9i5tgRyFVq3qfh+2CSElhiKQx2nABEJMK5aOsuC295h6PFNWAZktvOximlN1SVwekDG6
	+VDeLwCwsfvaVguYejWBBlOLkdBjfVXtplReIO/5JgvaOEwyjfUOymiuMDFzC1KXISRVOIGVzW1
	1IUer2DZley7mZvEeLY446igf5PDsXrXgIn6LklA1F3wbv3ge3zOQMxpYSx8Rm1kNT3zJfh1N4S
	yvOEtAk8MXH4EK1xvg==
X-Received: by 2002:a05:7022:201:b0:137:6bdb:5842 with SMTP id
 a92af1059eb24-1376bdb5875mr1375907c88.0.1779924639432; Wed, 27 May 2026
 16:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605280422.S2WDpmPf-lkp@intel.com>
In-Reply-To: <202605280422.S2WDpmPf-lkp@intel.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 28 May 2026 08:30:27 +0900
X-Gm-Features: AVHnY4IBiDz9jMGBcWlRA9SrgdTK9hy4tAXbjb6uH5yBu4RGq_kNEj3TSPp01E4
Message-ID: <CAFr9PXm=-3knCUg+x0j97SKbtdqtCScZki7TcuSg2nJx5vY5AA@mail.gmail.com>
Subject: Re: tc358746.c:(.text.tc358746_probe+0x4aa): undefined reference to `devm_clk_hw_register'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

I think I've seen this 3 times now. It wasn't me and I sent a patch to
fix it but no one replied. I've done all I can do :)

On Thu, 28 May 2026 at 05:16, kernel test robot <lkp@intel.com> wrote:
>
> Hi Daniel,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
> commit: 4fbdd56edf1f0b3e338c90a011bbae1a677ac884 m68k: Enable dead code elimination
> date:   11 months ago
> config: m68k-randconfig-r061-20260527 (https://download.01.org/0day-ci/archive/20260528/202605280422.S2WDpmPf-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280422.S2WDpmPf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605280422.S2WDpmPf-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
> >> tc358746.c:(.text.tc358746_probe+0x4aa): undefined reference to `devm_clk_hw_register'
> >> m68k-linux-ld: tc358746.c:(.text.tc358746_probe+0x4fe): undefined reference to `of_clk_hw_simple_get'
> >> m68k-linux-ld: tc358746.c:(.text.tc358746_probe+0x506): undefined reference to `devm_of_clk_add_hw_provider'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
