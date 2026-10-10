Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35383A7198
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647775; cv=pass; b=p32T4k8layOv1h9LIevp9QZRUl1NuOccGK5KZDuI/RjRNwzqCAdCsZTtJm3EdYOYsj9E3bvZv6jaQ/L8hBb7UM18RkxdEhaDIQCU1iQ3agYmteSe9pa7gPkNJT0cGmn0lgAH+GBBFXRJdPQZ5r4hWW3gVWLV6tYJGaYpfuxjdJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647775; c=relaxed/simple;
	bh=1LlNv9iLTw5kz6VsMVqZfAokfIUtc3HuT5Y1+gdSsVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOyWnehve5I3xKZtk+cvhZBmExXT/ZFKVVGz4UAj+raZg9I7TJ2lbbpTA26HJ6LriuTWjkRhC5mWfUGYenWW35qaUm28eNjuU+6lNdsRTYjKnfG6Gjy3cRxC1yoC0/f4FlljBjUL85kLDyk9yp+Bu2eDg9enexl7IC6eQ5FcfLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAb1muhS; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAb1muhS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c31988fc977so119769566b.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 08:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791647771; cv=none;
        d=google.com; s=arc-20260327;
        b=XPXFlwOpATgMjH32cRmrLN6Rl1tMnTCsJm9GBZ7S65PYn9rdzOVlPqHRl1110/RUCW
         g2u5D0cu729pcjSurNRqhGY2j6opeqFxVoErVoQ+pa24stsX6OeZ21mFgJIcpka2oHUi
         zOh+k+VPlUWDPbrQhj89EGRPSsw0etxmBcpQUiPYyazYZuseWNaOxoJrVW2jvWz1B+0T
         HOjr27JFc/XUwZ2zQb55KhOiB3pQQNoJAzwmh8AFiFH23bEl9OpactRwBwngxVT9bqbH
         KFvrrkwyVrOh6KVFbDxeZNbU7s5yiDi9+rGFcdws76ewRIhc5zWEG71EXYr+sky9y9LP
         /ZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        fh=LgqKxTYV+SYNXTHxh3tPv9LKt2FFQRFRcVZLwemLUxk=;
        b=Q6AtA9+cgioALsSaNcicwDGL3Ctj2lHSdjgILPM6Mrmma4CQkq5WPg9olusW47hAc7
         dIxMoo+aJU4oC1aKtA/hRfg/3mKEAvxL4itLvC+/4x82Ii3dCGYcoNLzyRm0rw3ofg+Q
         NpDTU+5kN7Hi2f88Ow9+ej7uQlWZSMT/l/uCGaoM0VuNC3sGX2n7DiUE4gItflOm4cEX
         pr39m0kWC484wz3egkk9q2mMxWGPNrHmRH4c8tdOUFhGLoRgrZkSq80CFq58MTSVARkG
         d8Idx6JhUvraotDUS9CPtJXQmVe+hKTPFTA61G/k2oUR7x7v/qIhlMQXknN/tDvuS0aZ
         jIRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647771; x=1792252571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        b=RAb1muhSBSTuTF1XJbnqyjvGjqSWPK9ze4b+FA4uW36eNE1xneHc+ZMW2AKi7h7E+G
         atmwvkCw2iW6zFRgRU+2PMRBLvMaCFwOalNaJDTpmBwCJRoOKsXTayr3yInRp5wqhhxa
         OC4YrN+zHI50kyV4IYtsxL2cbJ0I7TuHJPuEaCjbauWA+vB+q64LzKasn68H0mrgqqY8
         zBUaK/1hppm4DgeWoxv3mBiKFgEvfkEjIIYF4QW50WEUFFe6o7M2rcWKR69/p6j2XbDB
         PuqRH7UBXjDUV8FuQQ/Yb3MtSJ229XaGpZ/nyGD/fecVwDAE6NbdkF6IJ8otBzTN1eUj
         PvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647771; x=1792252571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        b=m4oOswrbv0SXuPDmixdsCMhGAqcLH2BVkV0JcOQ3XHUVcKfN6rU22RGJCZB8qknbu0
         0y/z9CPoZrVRVnkcpvyDhOgRk2G8xLBcMH1/L6jQnIsP9ldsUsqn7eCrwVDv0bdjSLGk
         vvsMgfAct2H+bk5iT7Bi4SADnSF5cNacJS5OZUljia32IFPCrTxa9oO4GJSRpUAJSVpD
         4MEvAdL5kyXGB1hAmPuu7jDv/VJduYXND2uQW3JHCsA3BbfOtmw3NCmQ1A3b25sWu3FQ
         ntlhbG7js8z8PUwp33M7Uo0H0za4KjSexcdfBJHnksJfixl0EERDlaX05HJS4JY4LpkD
         yaHg==
X-Forwarded-Encrypted: i=1; AKwUvBzYdcomCVrgfvOZHYJNXRIdv8UztmyECcYSKl7RQzASjcugjwUOKJcLA8EKHzExIRIALcyMUrC7/Z8c4lfI@lists.linux.dev
X-Gm-Message-State: AFq9FYLk0Q1iOuAuMm9wUewUb2vj7m8CPgctcXT7PGvJD+7R1tG//zLf
	XCk71zwtf9W9+QUaRJ2WXFA5CU1cdt8gfG8LqCaLVHHxgATWWdWJ1HUfywxdSyrqFwAB8F5Rxi1
	gJmh7KQI2TmXpIZpxOApWkMMmFCWma8c=
X-Gm-Gg: AYBFou1QcV16iC6CXI6QLr6cqOws6rUjRHtTSa7fS2IGOhc200TZDBrpj4Txx5SGJo2
	4JiqauA+fBrWy03VjREjPPNLTgggflwy9c7y0uaUNybd2W2h4xTQLytpsfFhYUeSW813zJI2nJp
	7R7Dw9hD8BX3Jwdd1AggKr+VrAJNuvbFu9Fft2ZhQg7AuawVPIeG6ff0Ij3LGror5Rm5Jkc44S5
	wbfSK5HMTE6/AEod66nu1GQy+i9s1EaT51wjIyoeGVCSYJzTOt2GjvcI5Lb0jBdCy5uc3oW2d+5
	lkHtEKFzgKHUKHE/kZDCyh3BxH7UhMpGq64UA/Xs4qogAVFSnMiEoj7/I4zNXgxIF29LKTh8dvr
	ZROnvZP46I9xw9D/89J0pp9vujQOnrZMl+1TkBsLwbg==
X-Received: by 2002:a17:906:7305:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c31aa09edfdmr448825766b.31.1791647770611; Sat, 10 Oct 2026
 08:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
 <20261010022039.1610210-1-mattst88@gmail.com>
In-Reply-To: <20261010022039.1610210-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 17:55:59 +0200
X-Gm-Features: AclHuK_4R9ladkJBFXKnSPR1Gb2rGeGfvuj5KKc4PC21RA5o7-m4C9wi3sPQdTc
Message-ID: <CA+=Fv5Q0p+v5dp-P_pQJ6ks3pZXEO3VPB-E+=t8HYRRAypH=yQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,


On Sat, Oct 10, 2026 at 4:20=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
> a variable count. gcc open-codes such a shift when optimizing for speed,
> but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls the libgcc routines
> __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> against libgcc and Alpha does not provide them, so the link fails:
>
>   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>   (.text+0x1c0): undefined reference to `__ashlti3'
>   (.text+0x1f8): undefined reference to `__ashrti3'
>   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_saf=
e':
>   (.text+0x2ac): undefined reference to `__lshrti3'
>
> Provide the three helpers in C, as s390 does, and export them for
> modules. They are built into the kernel proper rather than lib.a so the
> exports are present even when nothing built in references them.
>
> The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
> so no __multi3 is needed.
>
> Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@i=
ntel.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Magnus, this is an alternative to dropping the select. It applies on top
> of for-next (496e328c6107). If you would rather drop "alpha: select
> ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
> followed by the select, as a two-patch series.
>

I'll apply this on top of my for-next, no need for a separate series


> Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy and
> CONFIG_UBSAN=3Dy builds and links (vmlinux and modules, W=3D1), and the
> helpers match the compiler's inline shifts for every count from 0 to 127
> in a userspace test. Not boot tested.
>
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
>
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include=
/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsign=
ed long , unsigned long);
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_INT128
> +extern __int128_t __ashlti3(__int128_t a, int shift);
> +extern __int128_t __ashrti3(__int128_t a, int shift);
> +extern __int128_t __lshrti3(__int128_t a, int shift);
> +#endif
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 84046e730e6d..f77d4a46f2e6 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -35,6 +35,8 @@ lib-y =3D       __divqu.o __remqu.o __divlu.o __remlu.o=
 \
>         callback_srm.o srm_puts.o srm_printk.o \
>         fls.o
>
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) +=3D tishift.o
> +
>  # The division routines are built from single source, with different def=
ines.
>  AFLAGS___divqu.o =3D -DDIV
>  AFLAGS___remqu.o =3D       -DREM
> diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
> new file mode 100644
> index 000000000000..488e1e483d48
> --- /dev/null
> +++ b/arch/alpha/lib/tishift.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * 128-bit shift helpers.
> + *
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, bu=
t
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +       __int128_t val;
> +       struct {
> +               u64 low;
> +               u64 high;
> +       };
> +};
> +
> +__int128_t __ashlti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.high =3D (ti.high << shift) | (ti.low >> (64 - shift))=
;
> +               ti.low <<=3D shift;
> +       } else {
> +               ti.high =3D ti.low << (shift - 64);
> +               ti.low =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +__int128_t __ashrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high =3D (s64)ti.high >> shift;
> +       } else {
> +               ti.low =3D (s64)ti.high >> (shift - 64);
> +               ti.high =3D (s64)ti.high >> 63;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +__int128_t __lshrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high >>=3D shift;
> +       } else {
> +               ti.low =3D ti.high >> (shift - 64);
> +               ti.high =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);
> --
> 2.55.0
>

I build-tested this on top of the current Alpha for-next branch with
CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy and CONFIG_UBSAN=3Dy. Both vmlinux and the
configured modules built successfully, with no unresolved references
to the new 128-bit shift helpers.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
