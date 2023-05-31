Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE9C8E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 14:48:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae141785bso4978256f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685544537; x=1688136537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V4aOa0uoRUYdUYR7nYgnOP0GeYZb+MEHjtYTAKUMpk=;
        b=I7yQjZAPk+FyhtHqaIyqfNSBEuTn/tUjS1WTW8UzUCyC/TPspyBMOpyTVe5C1UwtkW
         zBIUHtPdwRHfvbhwsf/wrk3TZBGgEQuIhkgigULoUwO1yazAQEuRaaZsDhHEKsroFnz9
         jQgMaoPnkbVQ+IkipzRg9w//UbrJh0BjFT0XcgUHj+yvQCQoWs7opHwh2+cwqzFB8tJy
         eJJxaAvRqAnF2ejEw79yQ0tyHKvikpJApcAM8hzWPj4KKGvU0hKx2liyXjHlLK3+VAYK
         kOSi+WDzR1BVszmXwArP1TpCqoAjt0XjvrlTm40UldWxydE4tt/pSHH6L2gvKNb2i1LU
         zpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685544537; x=1688136537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7V4aOa0uoRUYdUYR7nYgnOP0GeYZb+MEHjtYTAKUMpk=;
        b=Ucb7l3DaH44Nw3fBLopUZbHYbU1K7pZGeBP7e/Fa556VcxVEq/v/rS+Sblyuv1U7rv
         8W0QeTcMjzhh7GPZB7fFYNVkdXQfuveTxrS2p/i/WNBteIVXvmUSee4qETRMVveSpnR+
         FQKsJoo9mIok/oxYaUg1ciBxH0tDJ1T5wiA4FqrI1NCKbCSMz+/OdRlUMllbk8JekXTT
         eJt3HLqVQA9vxbqeSj99JX3TCFiQuBYt+ZqYn0i07cgtTnohahoSfBrUw/Z60HZX719L
         T0h4NMfdlUzbRYoUX3WYGNcjQ1vGdS9jplKV3zrLFUKqesqYxlV2KAk0LC0VddFMXDDJ
         MvdQ==
X-Gm-Message-State: AC+VfDzTJiejq3j4jLPVdarQK3ZHrDqF9s/6ZcYDj4U6fT5lyWxGXsyu
	DgEqlCBvtCTg0VXWYlmE9Lt96FMgwHrQw6BooGY=
X-Google-Smtp-Source: ACHHUZ76Ha8CZKICeSBhZyU4Oyb1eBY8UiUyGLLhoB9dAjS/BuxWDWVoT4O+XDFk7Ug65aGOLRPzLbhLSjSA+TzBi4Q=
X-Received: by 2002:adf:d851:0:b0:304:8147:f0ba with SMTP id
 k17-20020adfd851000000b003048147f0bamr4748357wrl.3.1685544536973; Wed, 31 May
 2023 07:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230530164004.986750-1-azeemshaikh38@gmail.com>
 <202305311135.zGMT1gYR-lkp@intel.com> <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org>
 <103925562.158061.1685514200368.JavaMail.zimbra@nod.at> <CAMuHMdU70uRxnMNb8KCJe8M3BRPPxowRXtj+POcrh+KLkfQyAA@mail.gmail.com>
In-Reply-To: <CAMuHMdU70uRxnMNb8KCJe8M3BRPPxowRXtj+POcrh+KLkfQyAA@mail.gmail.com>
From: Azeem Shaikh <azeemshaikh38@gmail.com>
Date: Wed, 31 May 2023 10:48:45 -0400
Message-ID: <CADmuW3WXDg-5SFXkMDE6BmvSwLNHmXpTzBonaOL8eErc4+d3qQ@mail.gmail.com>
Subject: Re: [PATCH] uml: Replace all non-returning strlcpy with strscpy
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Kees Cook <kees@kernel.org>, kernel test robot <lkp@intel.com>, 
	Maxim Krasnyansky <maxk@qti.qualcomm.com>, oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, 
	linux-hardening@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Geert and Richard for the review.

On Wed, May 31, 2023 at 4:05=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Wed, May 31, 2023 at 8:23=E2=80=AFAM Richard Weinberger <richard@nod.a=
t> wrote:
> > ----- Urspr=C3=BCngliche Mail -----
> > >>>> arch/um/os-Linux/drivers/tuntap_user.c:149:17: error: implicit dec=
laration of
> > >>>> function 'strscpy'; did you mean 'strncpy'?
> > >>>> [-Werror=3Dimplicit-function-declaration]
> > >>     149 |                 strscpy(ifr.ifr_name, pri->dev_name,
> > >>     sizeof(ifr.ifr_name));
> > >>         |                 ^~~~~~~
> > >>         |                 strncpy
> > >>   cc1: some warnings being treated as errors
> > >
> > > Ah, yeah, this is another "not actually in the kernel" cases. Let's i=
gnore this
> > > strlcpy for now.
> >
> > Well, actually it's another case of "not even compile tested". :-(

Argh, my test script wasn't cross-compiling for um. Sorry about that :(

> > Well, strlcpy() isn't part of libc either, so all this would need is to
> > add it to user.h just like strlcpy() is now?
>
> I think so.
> Azeem, can you please test your changes with this fixup applied?
>
> diff --git a/arch/um/include/shared/user.h b/arch/um/include/shared/user.=
h
> index bda66e5a9d4e3..e5d3fbbafe4d2 100644
> --- a/arch/um/include/shared/user.h
> +++ b/arch/um/include/shared/user.h
> @@ -52,6 +52,7 @@ static inline int printk(const char *fmt, ...)
>  extern int in_aton(char *str);
>  extern size_t strlcpy(char *, const char *, size_t);
>  extern size_t strlcat(char *, const char *, size_t);
> +extern ssize_t strscpy(char *, const char *, size_t);
>
>  /* Copied from linux/compiler-gcc.h since we can't include it directly *=
/
>  #define barrier() __asm__ __volatile__("": : :"memory")
>

Tested with this fixup, and it builds successfully on ARCH=3Dum
SUBARCH=3Di386. Let me know if I need to test with any other
cross-compilation options before I send out v2.

>
> Ah, yeah, this is another "not actually in the kernel" cases. Let's ignor=
e this strlcpy for now.
>
> -Keed

Planning to send out v2 with the fixup from Richard applied. Let me
know if that's ok.
