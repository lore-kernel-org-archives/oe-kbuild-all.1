Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447143A8F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731254659; cv=none; b=CnyM7j3f8bPnR4IBtv52E+hmolmOZn4DzBF69RVSJHkP411iq60/vuH+cLQOTnaAENNiEDqL439K907FUFp0tcq/7C0kuToLC8yoPAZ7O35rQa4Up9RSoxBPf+4yB3AG6cEanoddYMX2Dbty5SjnsObw+/H6Jg0j2iYWbWHNnt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731254659; c=relaxed/simple;
	bh=nHRE6WZmDmxm6cz61isRvnuji8FzBy90v8oGifTA5xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTNxcLUummE9zBVeAVfuqkMh0/6jOxbOidoy9mesff7tEm4NQpweBubrUgt6oJ70hIGnpRQ+uE6jsNwwimhXXrVrAzKfQ66LauhsEFK1yyRdgUko0rryRXr9NakQxQvCMPmWhHWQ+ntgBkLvtBcU5YzvUVffQBy2RE5SV864qY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2bUD9zju; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2bUD9zju"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e5a5a59094so33477547b3.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731254657; x=1731859457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CNLnBAFHpBPWxzZ1Zk0tYkCjdbAVe0IGKVgCD+DJas=;
        b=2bUD9zjuWN94M9JciR09wSUq6m5E7I1aocx/d6/oxLPcODHKf6qfQZmhgup0dZhvzZ
         V6BaZBUDgbG/B62LQJuwt4Qyd64vhr0q5jTH+NBeV5sRDYgRC6DiZB0FI7rIt12z6Atg
         i6btjC6FlTcAr9VzAkkh+UaFv9LMkiK+VjPWJhLMUmTth+e9zPYmBfmX/SAMxVo2J6tB
         ZfZsKjyumK51ZMGQrTIKYnxo44D4LRZ7rFA48lyKApK0m8SBwnkvTaYID3ohBYJLplId
         cmy45jvquiUlQXABuv8iq3TJbvRmX4w6fS0b919Nsp9Xbx8U3zhsZI0ZddLweV1+EEQu
         SVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731254657; x=1731859457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CNLnBAFHpBPWxzZ1Zk0tYkCjdbAVe0IGKVgCD+DJas=;
        b=UPolGoc+Zhi/tGBfxbJBZ97+jGSoKOyACHMJNTE0c0Zu/eiD0k9YE3jM59/tWmPu9X
         2GOgWKZCX/b6jU1GDUxd75FAV6aQ4XMb1yq4Q6ht/eaFbdf3nPuuoeR8Kj77nwygtcJ4
         SqEp2Dl2AnJbUybD+SZu8s9Dr5GeliRX82pPumn6NBCpYxtLWO2lr3tXcGUKK9d3p7ka
         sjk7h0ZZBG4sK1+R8sNl6Q5h5ZSu3xwqtxQaB8iM4dS+9eJ0FHD8OSP70TPy5Ne/ZJvQ
         NXyvECx+/JR65Hx/B52X7WWrNcII/4fmkA9qtpjRzCUwWiZElVICDRBVySh4NxTccV7p
         z+bg==
X-Forwarded-Encrypted: i=1; AJvYcCXwsI9WKaUe9atOVpXSTtBDe6/nkdUbUQFi8dQSvyAZg9a8xKNCTgJOgY2TH+FtWbAk4p55Bdbd4C5sFzlM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Au/KZC+8MSdPgUW3N4rYFIZtbRXJktH+MP/JibLQ9EOHXRyr
	Aw9NTx1W/8nr5y4UT0LfvQlB9Wc6WTlJTR4i/wO6G+7ytudVSoCOuqcsXAsRKCz0e9h3p+eMqjn
	WCZyFwDB7jRrmKDZYaYhBmqfDD0qqa0BUOaZa
X-Google-Smtp-Source: AGHT+IHYOc+K90gPkGm8yETeFrM7lrTDeWTKOwf1O8X62M9lupAJjFOOS+Dl9aJoc/4r3l5hr7bVY/C4FysxiRvsleM=
X-Received: by 2002:a05:690c:3501:b0:6dd:d0fa:159e with SMTP id
 00721157ae682-6eaddf8e3b9mr101861267b3.30.1731254657264; Sun, 10 Nov 2024
 08:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411091538.PGSTqUBi-lkp@intel.com>
In-Reply-To: <202411091538.PGSTqUBi-lkp@intel.com>
From: Willem de Bruijn <willemb@google.com>
Date: Sun, 10 Nov 2024 11:03:40 -0500
Message-ID: <CA+FuTScwvZDxX6OVAnde+hBCKp5P5UF74jFAL-6HEQ3v1Wg_sA@mail.gmail.com>
Subject: Re: net/ipv4/inet_diag.c:1511:17: sparse: sparse: Using plain integer
 as NULL pointer
To: kernel test robot <lkp@intel.com>
Cc: Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Guillaume Nault <gnault@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	David Howells <dhowells@redhat.com>, linux-hexagon@vger.kernel.org, bcain@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 3:00=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   da4373fbcf006deda90e5e6a87c499e0ff747572
> commit: 223f55196bbdb182a9b8de6108a0834b5e5e832e inet_diag: allow concurr=
ent operations
> date:   10 months ago
> config: hexagon-randconfig-r112-20241109 (https://download.01.org/0day-ci=
/archive/20241109/202411091538.PGSTqUBi-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5=
92c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce: (https://download.01.org/0day-ci/archive/20241109/202411091538=
.PGSTqUBi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411091538.PGSTqUBi-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> net/ipv4/inet_diag.c:1511:17: sparse: sparse: Using plain integer as N=
ULL pointer
>
> vim +1511 net/ipv4/inet_diag.c
>
>   1503
>   1504  int inet_diag_register(const struct inet_diag_handler *h)
>   1505  {
>   1506          const __u16 type =3D h->idiag_type;
>   1507
>   1508          if (type >=3D IPPROTO_MAX)
>   1509                  return -EINVAL;
>   1510
> > 1511          return !cmpxchg((const struct inet_diag_handler **)&inet_=
diag_table[type],
>   1512                          NULL, h) ? 0 : -EEXIST;
>   1513  }
>   1514  EXPORT_SYMBOL_GPL(inet_diag_register);
>   1515


The code is still present in latest net-next.

But this appears specific to the hexagon architecture. Specifically to
that initialization of __oldval to 0.

define arch_cmpxchg(ptr, old, new)                             \
({                                                              \
        __typeof__(ptr) __ptr =3D (ptr);                          \
        __typeof__(*(ptr)) __old =3D (old);                       \
        __typeof__(*(ptr)) __new =3D (new);                       \
        __typeof__(*(ptr)) __oldval =3D 0;                        \

While here *ptr is of type const struct inet_diag_handler *.

Another typeof as cast seems to fix it:

+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -56,7 +56,7 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size=
)
        __typeof__(ptr) __ptr =3D (ptr);                          \
        __typeof__(*(ptr)) __old =3D (old);                       \
        __typeof__(*(ptr)) __new =3D (new);                       \
-       __typeof__(*(ptr)) __oldval =3D 0;                        \
+       __typeof__(*(ptr)) __oldval =3D (__typeof__(*(ptr))) 0;   \

Easily reproduced with

make LLVM=3D1 ARCH=3Dhexagon defconfig
make C=3D1 LLVM=3D1 ARCH=3Dhexagon net/ipv4/inet_diag.o
