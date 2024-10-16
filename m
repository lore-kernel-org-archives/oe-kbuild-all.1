Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA61D2780
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116348; cv=none; b=PgJGbezAp1cfNAz2k8oJIL9vcx0zEJcbJYBhoBEJfOSNnWW7UKnAE+WtNdIeyJ6VogJuJdx1fiP3wBgHtwbH97Vu7EAwfk80zv51SE2L7T0j5Yo92YDq4EmiyqUWRaNzB0GjJvqNx3RbbahcLJIgZRb9qpgsM14kFjYEI8QTNqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116348; c=relaxed/simple;
	bh=yaHkrgyzxpqCXu/uo343VjqBZzEv+dPomLknhyVwq/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gi60S3PQ/bshyqNv9uCLMYz7fWyrh3jZlI55mlkWC85PePwbhBOT1V0IH8+54oc3RWnbTJEVBfXBLLzGC0/viIiKWTwp0YTt52yV96vYMtlQ/PP3G2CjGuS7za7mgGupDK81S72YFJuoxIi5wdv+ji1/QG4N8YJYnrDQoFqBDaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xYuFgAU+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xYuFgAU+"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so9994a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 15:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729116343; x=1729721143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF2hnyZnur4FAKXfn/pZIiJIZnA1uCI/DSTuBMf9wzw=;
        b=xYuFgAU+yw5kR//Z8RUASTtrzw5pu/WqQnAVMvR5U1TSE5M5hZadERakMY3iym/C8e
         3Y/4CXnnWFT3ufFAuCdl4hmjCE+v1ex8UX24FQtO26rAiJtDTGjvbPqJqHCGwiOBDWjn
         pm0kYQoZzbkNT/uTZ5ipqG7qVGUp4Htes/Wqzg0DL4GGrURA6mXMipo25DK3L+SdR2LG
         akRenVaeaEU6iZQ335/TVng8xshSpwIhnvdlnMhLAhQYOtopThGL2pH80IvZzW16+GG8
         xiaWCEeN461A+y9QQ0ZkzYDt2PdwG1jqTr0qfnYT4s6tpE4hniu58Fi5UfJo6KE75c7p
         s2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729116343; x=1729721143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF2hnyZnur4FAKXfn/pZIiJIZnA1uCI/DSTuBMf9wzw=;
        b=sv7Ba8KTMcEWfxht/N+MOZ8NcmOTMdkk/V/Ua68tei75WEp5Y5Uu5n/9mRTGicRJYW
         zM9ophExcsSG/T9qhTGyM8g9fWYuWCnSWanbgjRmHvUaUZlQLgbF2A0w9ohSgZKd96gN
         eAsm5f7TRMyZaqBAjI4AXrM/+yiKo7NEXw8nwPCv2iPc3/zgiHZis36SKt021KgbH3c4
         3i5SQNxyJptoMGqakJ+KQ7gC5IrgRQWwwTidpxBooXk2BhNNCcLbRJbTawCnY927F4YE
         657P8Hco+V/nFDnSsX/kB+HOXS6aO6L3gpWWZrnaeUOCIJkbo3DemUbjtw2uvTb7dBGN
         9pyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZsL31roQ+35vurCrwUxfpPUMz3qR3wMJsXDB/Km4NeI3NheE4WCpCc96KxoOrrY33dtuL3Gqqb4zFmqfj@lists.linux.dev
X-Gm-Message-State: AOJu0YwozNeFlSYKVkHj5bVljxu291+8vduRt6l5rSmfUDgmWFGHsosY
	TIZo+Ck04Sd0+clQgjpXW4xDJ4ZhVee86u/KKbkrTEnTr/YKLfXUJ/wHBLvS604Y4j4JQeqhycB
	xl0LmYYBS8VGVsTzZCl/bK7Uez+hG4v62pDWz
X-Google-Smtp-Source: AGHT+IGWQlAeC6qRe3pdoM5AfU64wh8xVIi8TV2ZZ0HmaHRYqEs3AU7jnrQDT6YQ/IkPj8v31ncDQjs3jK8USoOl9Ho=
X-Received: by 2002:a05:6402:5107:b0:5c5:c44d:484e with SMTP id
 4fb4d7f45d1cf-5c9ebb55cf8mr64042a12.1.1729116342627; Wed, 16 Oct 2024
 15:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015-comedi-tlb-v2-1-cafb0e27dd9a@google.com> <202410170111.K30oyTWa-lkp@intel.com>
In-Reply-To: <202410170111.K30oyTWa-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 17 Oct 2024 00:05:04 +0200
Message-ID: <CAG48ez2T7i_qCAcGi3nZqQeT8A3x42YSdL=rWqXOUDy5Eyaf6A@mail.gmail.com>
Subject: Re: [PATCH v2] comedi: Flush partial mappings in error case
To: kernel test robot <lkp@intel.com>, Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>, Frank Mori Hess <fmh6jj@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:05=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> [auto build test ERROR on 6485cf5ea253d40d507cd71253c9568c5470cd27]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/comedi-F=
lush-partial-mappings-in-error-case/20241016-022809
> base:   6485cf5ea253d40d507cd71253c9568c5470cd27
> patch link:    https://lore.kernel.org/r/20241015-comedi-tlb-v2-1-cafb0e2=
7dd9a%40google.com
> patch subject: [PATCH v2] comedi: Flush partial mappings in error case
> config: arm-randconfig-004-20241016 (https://download.01.org/0day-ci/arch=
ive/20241017/202410170111.K30oyTWa-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241017/202410170111.K30oyTWa-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410170111.K30oyTWa-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arm-linux-gnueabi-ld: drivers/comedi/comedi_fops.o: in function `comed=
i_mmap':
> >> comedi_fops.c:(.text+0x4be): undefined reference to `zap_vma_ptes'

Ugh, this one is from a nommu build ("# CONFIG_MMU is not set"), it
makes sense that you can't zap PTEs when you don't have any PTEs at
all... what really impresses me about this is that the rest of the
code compiles on nommu. I'm pretty sure this codepath wouldn't
actually _work_ on nommu, but apparently compiling it works?

I don't know what the right fix is here - should the entire comedi
driver be gated on CONFIG_MMU, or only a subset of the mmap handler,
or something else?
