Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55048C8D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808679; cv=none; b=pEPMKURPR5qpUV1Nm2tTl3UZLHjPfA6w5IFS/nZ3yNajUwwf9fqAuUOWg6Ic1+E+w/58ON1lvH6yjY4AkEDh7Tv/WCNvwV/hq0zh4BcwVvRHR6P015q3w8DGIizfKCxWQXIE8/P7uzV1mmUpEdUrjrTx1asEUPcjG2ecVemMiEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808679; c=relaxed/simple;
	bh=VH0AM69Ra+gB3iZQ6SWDCq1VTBUq+NfYyh42eZTZN6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QO83RxoCG5bPwxMOBPCzKwS4WIIxMz8dZMyB29L0L/wrj/lRcLZwnAqQnI/kPx1icGQnd1HYK4SUD9AKSMfWpqN3SZADU2PaSLtFpdno2ZIv4o8NTe+NXv1L5KYugaeKwFTPqdRv1CC7h2IDJ2yX92HdzPUo7YwlvQsPvixZ0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBk6zHSp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBk6zHSp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1052609f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791808676; x=1792413476; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAa1zh2oFmbuGXbuxB3nKxDGq0l8J98l2LtUP9fmNNc=;
        b=SBk6zHSp7iL0pOom5vaqM9TC45iZAEBW5XlrWdl9i/5JjD1gwgsJ9O2PY/aL6Jmvg0
         SLMS/IL+vSkW4xIDJ7lPt9sWmmfJZHsEEefZEfp8mFYNHN1W8Tsv3k0jvK/CWqEDiydc
         QFMmT/HcBgTF3DotGXFr6gEjkbZrR0seIRm062BthHioY6Y8+tSCbcMyjWWW0GSiozTD
         gt1u/CNDRkmmkq8j5Zt//G8ZlSjI11I89PLHhNKUGkAwhtFPM0rVDaopYvxFy0CZfPw/
         xOYtSH7D5w8FooXJVG0qEhwacFQpqFGxRRo7Y239YbmX+GLJLpFTCf/KnbjBmR576G53
         0FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808676; x=1792413476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAa1zh2oFmbuGXbuxB3nKxDGq0l8J98l2LtUP9fmNNc=;
        b=Evm+PYF6VzJorbyo90o6I1ckXfkOsSe1i3PL0GlHSKKqASs/bKeHa+WB+44SgaMQe4
         N2HWLbuBh0sVUai2VC9F9JqarlCiaQ8SetL1FIPcl4462239X+IVycphpVwPrrlzi7d3
         Ai9fD2PPzNcnJp6sHfkL/rgVCnDLy9wB2mjSZbTlsu4PrrXHdjcdo2hcUti0vgGiLbLV
         pFsp5a4MWrY14wf57kyDu9j4xpeqiwDcrmU6+QF5Pv/bJWr/55dNljFGG5x5KRRZZcNz
         bvpwj7owa2pQoEDmncvT6YfuIkxwKK44l0/k3KhGE1eSId6nAUcPJt3/A597uoR/RQUa
         EtnA==
X-Forwarded-Encrypted: i=1; AKwUvByii6yMBjJkZxvkjodBQAr26tL2fhzJG07UCmNzpUZaMg9H0zt8W0Bo/awv6XDwKFC14ftwJSNx362ZpcVP@lists.linux.dev
X-Gm-Message-State: AFq9FYID6EVdTwy4KbIoF2AOmciIaVu6NbKMv3nlOhiw3rMhj54ELg0t
	W8yj3TNz5jvVEZMsJS4qw5dEkg49FlAVr/0c49dzgkn9JACAglhHhBtb
X-Gm-Gg: AYBFou1bQbVncxg8xOfDdbjK1saz3sEeaI3Wh+VhrIibjPZ80wJavHOMi+/ByMK2yoK
	MWHIjjsYBUZZIUcw4ExxUZNEfXAKokZPVuhVAVaPIiusFo9NtSj4pe+h3VZgjHudcPFBSUO376e
	SN/Z/u4Nnh8tZsaDCGrtmIB8tDl+dbUp+Ti8T0+oWxYNZ/DNhGujR0CP8AMrNjwJWDbzqYXQlzk
	5dJm2Mooic66FSYDn9nJ32VhDM6JQZYEQbf5nAw2RdDkYxjUjbd9KGV65dB6yQ8letqO7kyt/Sa
	tDJtrtAnjeURpjTBpgZewv1SI5YMxyFZHDL62ffu2CLK17gKQPx0FBtKouL6/x9Cq6+fqKTM2BA
	KoTKrzSqW4hu7YFjPeNwpnnW0lxQYQ7yhLLGqkGv56/bp4gkxtCqRr0M02bMxGnXmFHAYfbvh3v
	rMbSWdjn4mi0oYyt8AlkhORmDjROGEZ5595g0gUi4ae2+B1W2HYsB+mxO6183iO/Fb42gVNThkO
	6m98reAJ27jm3fFH8meWU0Q3zJgUJM/MlE=
X-Received: by 2002:a5d:43cb:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48dbaae4c6cmr13859682f8f.46.1791808675476;
        Mon, 12 Oct 2026 05:37:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm19599710f8f.57.2026.10.12.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:37:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:37:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Matt Turner <mattst88@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
Message-ID: <20261012133753.3a5868e9@pumpkin>
In-Reply-To: <20261010022039.1610210-1-mattst88@gmail.com>
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
	<20261010022039.1610210-1-mattst88@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 22:20:39 -0400
Matt Turner <mattst88@gmail.com> wrote:

> Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
> a variable count. gcc open-codes such a shift when optimizing for speed,
> but with CONFIG_CC_OPTIMIZE_FOR_SIZE=y it calls the libgcc routines
> __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> against libgcc and Alpha does not provide them, so the link fails:
> 
>   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>   (.text+0x1c0): undefined reference to `__ashlti3'
>   (.text+0x1f8): undefined reference to `__ashrti3'
>   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
>   (.text+0x2ac): undefined reference to `__lshrti3'
> 
> Provide the three helpers in C, as s390 does, and export them for
> modules. They are built into the kernel proper rather than lib.a so the
> exports are present even when nothing built in references them.

Do they need an explicit (shift &= 63)?
I've seen gcc/clang remove an explicit '&= 63' because they know the
hardware instruction ignores the high bits.
But I'm not sure what happens here.
Adding it won't make much difference - unless it matters.

David

> 
> The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
> so no __multi3 is needed.
> 
> Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Magnus, this is an alternative to dropping the select. It applies on top
> of for-next (496e328c6107). If you would rather drop "alpha: select
> ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
> followed by the select, as a two-patch series.
> 
> Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=y and
> CONFIG_UBSAN=y builds and links (vmlinux and modules, W=1), and the
> helpers match the compiler's inline shifts for every count from 0 to 127
> in a userspace test. Not boot tested.
> 
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
> 
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsigned long , unsigned long);
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
> @@ -35,6 +35,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
>  	callback_srm.o srm_puts.o srm_printk.o \
>  	fls.o
>  
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
> +
>  # The division routines are built from single source, with different defines.
>  AFLAGS___divqu.o = -DDIV
>  AFLAGS___remqu.o =       -DREM
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
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, but
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +	__int128_t val;
> +	struct {
> +		u64 low;
> +		u64 high;
> +	};
> +};
> +
> +__int128_t __ashlti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.high = (ti.high << shift) | (ti.low >> (64 - shift));
> +		ti.low <<= shift;
> +	} else {
> +		ti.high = ti.low << (shift - 64);
> +		ti.low = 0;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +__int128_t __ashrti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
> +		ti.high = (s64)ti.high >> shift;
> +	} else {
> +		ti.low = (s64)ti.high >> (shift - 64);
> +		ti.high = (s64)ti.high >> 63;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +__int128_t __lshrti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
> +		ti.high >>= shift;
> +	} else {
> +		ti.low = ti.high >> (shift - 64);
> +		ti.high = 0;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);

