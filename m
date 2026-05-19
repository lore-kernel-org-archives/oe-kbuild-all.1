Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0535E931
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 23:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779232012; cv=pass; b=OtOeCadi50MK+Y5CebrGk7Z6yCCDFPS/t2z1PyBfZKLGKX3hhg4p4PaeUy8A2RYPfWLaurp9ykzu0rvBoAW+aAKNa/MakQ8w/O9H47xglWA0F+NU6QIzqHfsvmagV4A6ZeibxLk8pYODAK0VNX59BIoRtMLEw2KpzXx1n3OW/G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779232012; c=relaxed/simple;
	bh=jIZEmjvwYy9RVOk7S1MbVNZighIXJh7mICaS99qfxUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otr3MD48VAQLbJa2ARBMnU0UgZC+cgAPFrdH8N/vgeUgGBS2w8d2hA6F7/5l8Ur2zcZe59apiyICgszfPYBCoDuxex/R3PxbskCpMG6ldTGU0PJXn7zSU11vng2PUta20l/oZUpIBR0bY/+IEoGwWZKPm6ECAldXNP29gmk2drA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+fFvSCa; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+fFvSCa"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so761700466b.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 16:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779232009; cv=none;
        d=google.com; s=arc-20240605;
        b=kQyxvxwU57eeBd5Tn4oIe7YFZyrT5r6s6wNKzpPALH+DpmHIVG/29I8mX37M0e8blc
         vdwV72QIDYzQPJCtIW58Q3A+HO4l0//9RFWWYiy545wCL1PwZOx4NgWgeZEoRsIbHZgH
         1rWaJco7vsMb8YMqKROxYxS5sX/ep5vhBXE9iw553WpvbDb/gr2bAM/c3xRSA/ROjN8O
         GqtG90PPwX1tJA+HRBXzjO3BfzzcU7HeM18nsdpfw8HstC6bcNmIVbS8jAFJS/hpKgzB
         iUqfwf3r4YyeKG3OglE07szwIAxPR0JtsMeScFtv/D0T9Lynbc9oypLioBkjRhUxzYUB
         OC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2ndSCx1NYxmALkVN+ocbFmG5ARFNJ21dFSfz95APIA=;
        fh=VBHqhpmprZSVm96fErOIYNV5XEOsDb/sAXj61YjcvK0=;
        b=DM4WyFc+IcKeAklMjSMh8/uBLtWXLlbChG33oxjbb9VLFUUQpG8rxBEFyKw4iNxHK2
         CZAz9UbM4QKIbBZIijmv2FMqUa6m9U5EWi/Vi41M05WIIL7dd9aotHm6kPiJbgtgPZ/f
         hxPW485oC1bMF9B4Rrdb4GaT+IJJUArMEpCAs4+b68PidSAqGqLfuYQlERFtIO61u6Hn
         abw6ei/RlnnZqrbERRsWGXNQtM5SssdmQo0jcz1NLxREbbJuEY5B5IZ2S1ctf6IAAcl1
         eL6GFFiI1KDhJ9lw39dZT1SvunI7x1AkYTQxpkIXwRlPhA0lF8nhC5OJ+NhwpdZVzZhK
         +q3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779232009; x=1779836809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2ndSCx1NYxmALkVN+ocbFmG5ARFNJ21dFSfz95APIA=;
        b=r+fFvSCaKb0Bu7DEfjb5rrrcsp+CHOXfixnJAuX8ZAMEf9zYjXqM7w9bcJPncLBm3Y
         Y9x2Wy6RhSz9jsi+C6cV1uAdU4GdEtA2bbAjwBWBoC8D9kMfCBKX/A4S1xa9DGRVL5Ri
         80DF9ICnRNeC2L1lc9648Ss/fogXugKWM6JJWR01eCzilAUzTqHR2E0zbKR5q/oZ32tO
         ZfcsUildjYOCjDPtwbsNUPek3VZ1wf93R530gaNqYwPOn6J8MKdgLQlNppnXD0WS39LF
         m6UuvBByUAwrc3qUqTUaQoYQjHE3wBVNZVTnfX8vyjCOHx2aAMoIJbxxqCq5/d+aWHaj
         7WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779232009; x=1779836809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y2ndSCx1NYxmALkVN+ocbFmG5ARFNJ21dFSfz95APIA=;
        b=FODcGg0nejuHzZZ/OIhNQlb522zMxspMTQPQsHq0W2d2VwoBs4aAMgxzpvT8VG4v+B
         eixpD0ngdtAq5xHtzUL7r2WIEJSHJaPBplSVd7dIxsLt6+/2UiaUXJsFEg4m7eOvq1xl
         kZRxL50GS83yqrUqp+Ftf04W3lGtLIjEzAic9vlTYN5h4aMuCF1urSicy7PbvYwMzHIm
         yx4DhH+6/De2efin20E9vWkaC4sIBcwOPIXiyZp9BJ/3GKQn8E3mjBHOj+u8IKdAsqcA
         t9EhdK97IIjAWUQICLnQRk27SKbH26Ta0A7iGs9i25oaeaZCKb0+s78XMTlGnyoRJux2
         Ikqw==
X-Forwarded-Encrypted: i=1; AFNElJ82UMFmevth1yEgKpmVUtVWc3W+2/ODfBHulHy3WrC8K3t4qBiuiot2Hx2EhgwPCbL9Z3c1I4q0XQ7ZHa+e@lists.linux.dev
X-Gm-Message-State: AOJu0YwTMFpwuvrpZ6nKA74VpLyDuuhZrunNZqkTSbok/B3Y45Q++eLS
	6HWqm5nMm4wtUrLAs+KzBK5x2UP3F4Vh3XEbYbXVwU66ZEpxm5V2VbKUvyjF+5L4l/2EQU6SKan
	otFKjei2x+UpNRAvRL0mvoAIcnTqg/dw=
X-Gm-Gg: Acq92OHnTB3ukG8Jbpgrk3brSBf1lcDIEoP3KRjnMMeMJC6++Nq9Q2JYeUKS3+8Rb89
	RY6bjm2P0IvGC/Vf4JJ4kGZhCO+KSStPYG7h9tTBqirlEt/w9DOQfplp5TNabHRoKBa71cPZbCd
	ca+UYviHjKCyusBpeZe5nOhLfk/eQikjEMs6bmVGKmI+A7FIdG8c0q8I7xGcNk9DpOYX2IoC0pB
	iCnv+7AA8pu7va6pXSqHyHv9mwZf5UV/+TZzZeLDNpZ+FFSWtdqtAkqQngkVzmfrLXtDVqEl/6W
	8BxsorDTwQY9dCC9zBLB95IVAouQ8suSQlww32Y5DU4xl5qvGGXcyggwmIR4CAHKCfek8vuZ9En
	jTLQP2YQZZfLOA2bOORtTGHaugGFKwCypKJQHSq+vjyzj0rCp+ZB95SCgoAAowQIo0Y9x
X-Received: by 2002:a17:907:1c0d:b0:bd3:1b13:7114 with SMTP id
 a640c23a62f3a-bd517a99d50mr1117990866b.37.1779232009290; Tue, 19 May 2026
 16:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605191434.PQkj2Rki-lkp@intel.com> <42228466.J2Yia2DhmK@phil>
In-Reply-To: <42228466.J2Yia2DhmK@phil>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 19 May 2026 16:06:37 -0700
X-Gm-Features: AVHnY4Kb-AL-IPCx-YF5UtrQFjABc9IlSqLB_mcYSC4BmbjKLPLXmYzAKPbzirQ
Message-ID: <CAKxU2N9KxQRH2e=1RTo626pNVWT=TRULOA=xDNUvuEDf+fzANQ@mail.gmail.com>
Subject: Re: [linux-next:master 4652/6115] arch/m68k/include/asm/hash.h:57:24:
 sparse: sparse: cast truncates bits from constant value (18720 becomes 8720)
To: Heiko Stuebner <heiko@sntech.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:57=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Am Dienstag, 19. Mai 2026, 08:43:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb kernel test robot:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   80dd246accce631c328ea43294e53b2b2dd2aa32
> > commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8 [4652/6115] clk: rockc=
hip: allow COMPILE_TEST builds
> > config: m68k-randconfig-r133-20260519 (https://download.01.org/0day-ci/=
archive/20260519/202605191434.PQkj2Rki-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 8.5.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260519/202605191434.PQkj2Rki-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-l=
kp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through i=
nclude/linux/hash.h, include/linux/slab.h):
> > >> arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates b=
its from constant value (18720 becomes 8720)
> > >> arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates b=
its from constant value (1e8e8 becomes e8e8)
> >
> > vim +57 arch/m68k/include/asm/hash.h
> >
> > 14c44b95b3dcb8f George Spelvin 2016-05-26   4
> > 14c44b95b3dcb8f George Spelvin 2016-05-26   5  /*
> > 14c44b95b3dcb8f George Spelvin 2016-05-26   6   * If CONFIG_M68000=3Dy =
(original mc68000/010), this file is #included
> > 14c44b95b3dcb8f George Spelvin 2016-05-26   7   * to work around the la=
ck of a MULU.L instruction.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26   8   */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26   9
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  10  #define HAVE_ARCH__HASH_=
32 1
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  11  /*
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  12   * While it would be leg=
al to substitute a different hash operation
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  13   * entirely, let's keep =
it simple and just use an optimized multiply
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  14   * by GOLDEN_RATIO_32 =
=3D 0x61C88647.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  15   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  16   * The best way to do th=
at appears to be to multiply by 0x8647 with
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  17   * shifts and adds, and =
use mulu.w to multiply the high half by 0x61C8.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  18   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  19   * Because the 68000 has=
 multi-cycle shifts, this addition chain is
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  20   * chosen to minimise th=
e shift distances.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  21   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  22   * Despite every attempt=
 to spoon-feed it simple operations, GCC
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  23   * 6.1.1 doggedly insist=
s on doing annoying things like converting
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  24   * "lsl.l #2,<reg>" (12 =
cycles) to two adds (8+8 cycles).
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  25   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  26   * It also likes to noti=
ce two shifts in a row, like "a =3D x << 2" and
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  27   * "a <<=3D 7", and conv=
ert that to "a =3D x << 9".  But shifts longer
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  28   * than 8 bits are extra=
-slow on m68k, so that's a lose.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  29   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  30   * Since the 68000 is a =
very simple in-order processor with no
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  31   * instruction schedulin=
g effects on execution time, we can safely
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  32   * take it out of GCC's =
hands and write one big asm() block.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  33   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  34   * Without calling overh=
ead, this operation is 30 bytes (14 instructions
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  35   * plus one immediate co=
nstant) and 166 cycles.
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  36   *
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  37   * (Because %2 is fetche=
d twice, it can't be postincrement, and thus it
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  38   * can't be a fully gene=
ral "g" or "m".  Register is preferred, but
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  39   * offsettable memory or=
 immediate will work.)
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  40   */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  41  static inline u32 __attr=
ibute_const__ __hash_32(u32 x)
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  42  {
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  43         u32 a, b;
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  44
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  45         asm(   "move.l %2=
,%0"   /* a =3D x * 0x0001 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  46         "\n     lsl.l #2,=
%0"    /* a =3D x * 0x0004 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  47         "\n     move.l %0=
,%1"
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  48         "\n     lsl.l #7,=
%0"    /* a =3D x * 0x0200 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  49         "\n     add.l %2,=
%0"    /* a =3D x * 0x0201 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  50         "\n     add.l %0,=
%1"    /* b =3D x * 0x0205 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  51         "\n     add.l %0,=
%0"    /* a =3D x * 0x0402 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  52         "\n     add.l %0,=
%1"    /* b =3D x * 0x0607 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  53         "\n     lsl.l #5,=
%0"    /* a =3D x * 0x8040 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  54         : "=3D&d,d" (a), =
"=3D&r,r" (b)
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  55         : "r,roi?" (x)); =
       /* a+b =3D x*0x8647 */
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  56
> > 14c44b95b3dcb8f George Spelvin 2016-05-26 @57         return ((u16)(x*0=
x61c8) << 16) + a + b;
>
> I'm not really sure what the correct course of action is for this.
>
> The code calling into the hash is the
>         hash_add(ctx->aux_grf_table, &vo_grf_e->node, grf_type_vo); [0]
> with grf_type_vo being part of an enum [1].
>
> So everything 32bits as the function expects, but the m68k hash32 then
> doing that u16 cast.
This AI suggests

--- a/arch/m68k/include/asm/hash.h
+++ b/arch/m68k/include/asm/hash.h
@@ -54,7 +54,7 @@ static inline u32 __attribute_const__ __hash_32(u32 x)
        : "=3D&d,d" (a), "=3D&r,r" (b)
        : "r,roi?" (x));        /* a+b =3D x*0x8647 */

-       return ((u16)(x*0x61c8) << 16) + a + b;
+       return ((x * 0x61c8u & 0xffffu) << 16) + a + b;
 }

 #endif /* _ASM_HASH_H */

Not my call to touch m68k includes.
>
> I guess adding a
>         depends on !M68K
> to the Kconfig?
>
> Other options?
>
> Thanks
> Heiko
>
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/drivers/clk/rockchip/clk-rk3528.c#n1147
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/drivers/clk/rockchip/clk.h#n575
>
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  58  }
> > 14c44b95b3dcb8f George Spelvin 2016-05-26  59
> >
> > :::::: The code at line 57 was first introduced by commit
> > :::::: 14c44b95b3dcb8ff1d627e6b78f57c4373d375cb m68k: Add <asm/hash.h>
> >
> > :::::: TO: George Spelvin <linux@sciencehorizons.net>
> > :::::: CC: George Spelvin <linux@sciencehorizons.net>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
>
>
>
>
