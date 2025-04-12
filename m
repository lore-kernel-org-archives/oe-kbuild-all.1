Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C61F666B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744472566; cv=none; b=kWtINNxvILz4gcr4r1YC/01vnLtOcYPEASqad1escl3yYnH6vL1s7RN/ckELruzVBx4XJSQ6fZlEr2csw3c9DDiwWS9fTj9fa1cn6QkkWE4ZkdBkRrpZH2k7k+8te4PHikr6M5daVYc6/risU5fkOcLKQqEuNcjUEHoyuen13DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744472566; c=relaxed/simple;
	bh=ikR8zpKuK6iSSiCTim3scw7wAQGZTAj9MOga5PJ12tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rU1BNT4bTPrcZyi9ItzgfPn+oZCVp5ISqriIlcuwo5nQHzy7JLUz5cDLuecYQiiXSXf0G7JAOwdzJstDvyYa1CnGYdZSqmuViLjXgOMkpZxfGo1F9gQaYfGnR3imPbrG3z5HSAuotDtK/1xGZt8yng3FrkcjyxacTpVogiov4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=DviyxoTi; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="DviyxoTi"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef60e500d7so25805097b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744472563; x=1745077363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ConPm8IJT23r+6UcU3AxVgkNM3TyFNN+jLy1yNFH5Ck=;
        b=DviyxoTiGvggPst2Ib40GpY8ciQ12J71wmJR3z9UV0nkoaHPOhonE+TwcGw462k+R3
         wzNvzG5GHvQj5WwvXkKHy4OnNkl7QbLW2iXEwz0CAX8gUSHRK/VlI+523V/dE+S2dwKs
         sV1VueXD7TJ0wkhkCaocskHjigjPiqZ2KuPJLwu8Fc4R1kPqHmX2HsLmkOyFiIZU5nkI
         azbRFXUZcFdGq3oMM5T6SSSosQgQIlcHCQ4TX/+MLc3ohSKD6/W/oc1OA20MLW7LLke2
         MBaxileEyTGUTMcHII6Z8Ma++IVt0Ck157ALsU5tqs2NOgWMov8+cHwMf1svgxD5YzEv
         rhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744472563; x=1745077363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ConPm8IJT23r+6UcU3AxVgkNM3TyFNN+jLy1yNFH5Ck=;
        b=Ro9aS8QTiMpjmxGc96qUYDg3Q20sdRiJ00Z3oeaFa06UjF7bgjsCS1cCojX6hmaPvc
         XD7A5O9ju95Qr9cilS0/JzdkSdEh6U0PIfXsGGfxbXRN5eYlSlLumejcuDHbo1DEDVMV
         lAg0sMqWtK7N+je6QwWyZR2mW+7MX4e8VKuRtglW8h9IWhA8SrDGztdeAi0ZenmApCKP
         sjydtva52in0yzRyThbk4IU96zd3rIy3lRfUk79tWJ4n7FfaRL2S+xXu4+iFMFXDCwml
         tAxrMmWiGy2cL40a4PGBkX9BaUa3We0G7mYNqa8TimIbhVtTvVTSuEA7au2XW1UVDLjk
         DFXg==
X-Forwarded-Encrypted: i=1; AJvYcCU52IO3suGxM+oyA6CHSzmMeAlp55ggrEIuasamsIAZ7XML30Efym4r1m/o3r655K16ARZiYNWD4F2yyXmU@lists.linux.dev
X-Gm-Message-State: AOJu0YzsQr0Jtx104g2or2RXl+LTOHqtJ3csVGTsqYi9fQW6fpQSNLXl
	/TbyIU4bMEI8Au9v8IUCkBXcbYoASaUpgdt9I1eyktBgyokQICbslKpP3FkiCPbeR9CN38tj0lg
	l+dHFHJvlM6N5L7MwDy32L7dWXVugQeaOqosx
X-Gm-Gg: ASbGncuq/bBWUO446voAc0utoFKDjSDy9BvymvldHgeWsSFohjNWeynOuR4HnND0Se0
	lnEcJrdwqq9NKUxL/KrKPjvrFi4ZiUce9jxhL/q2WmBuMF2R263/b4JuYWTLkorkGxkvP2VzYCB
	PRa/o1mXwbL47KbG7w3InEDw==
X-Google-Smtp-Source: AGHT+IFHTR/J1ToqOsLLfRswA8bylDousXZSQOr7tW7I+V+agP1IN8sa62DzJO9DPRSzTRFooIitfK1pXLo0cIjLiZE=
X-Received: by 2002:a05:690c:4b89:b0:6f9:b12b:8953 with SMTP id
 00721157ae682-705599f52b5mr119148267b3.20.1744472563546; Sat, 12 Apr 2025
 08:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504121945.Q0GDD0sG-lkp@intel.com>
In-Reply-To: <202504121945.Q0GDD0sG-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 12 Apr 2025 11:42:32 -0400
X-Gm-Features: ATxdqUHZa2n28asX8D_hZjzcFjvbX_5AUbAtNrYRWqf67A6BvveAHXl2YzT_Sm0
Message-ID: <CAHC9VhRst8Z8LH5JcGhi62ZPc3MzXeA9c_eFk6tBZVRVfJMUFg@mail.gmail.com>
Subject: Re: [pcmoore-selinux:next 6/7] security/selinux/ss/services.c:
 linux/parser.h is included more than once.
To: kernel test robot <lkp@intel.com>
Cc: Takaya Saeki <takayas@chromium.org>, oe-kbuild-all@lists.linux.dev, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 7:34=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.g=
it next
> head:   5d7ddc59b3d89b724a5aa8f30d0db94ff8d2d93f
> commit: 8716451a4e57cc82f3656d7a71b67d3b5831ef3f [6/7] selinux: support w=
ildcard match in genfscon
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504121945.Q0GDD0sG-lkp=
@intel.com/
>
> includecheck warnings: (new ones prefixed by >>)
> >> security/selinux/ss/services.c: linux/parser.h is included more than o=
nce.
>
> vim +49 security/selinux/ss/services.c
>
>   > 49  #include <linux/parser.h>
>     50  #include <linux/vmalloc.h>
>     51  #include <linux/lsm_hooks.h>
>   > 52  #include <linux/parser.h>
>     53  #include <net/netlabel.h>
>     54
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Fixed.

https://lore.kernel.org/selinux/20250412153234.23169-2-paul@paul-moore.com/

--=20
paul-moore.com
