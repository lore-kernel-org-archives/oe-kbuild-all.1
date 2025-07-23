Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE01EF39F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753287116; cv=none; b=AaITZmKgEd7LvY8793hUC6Plu44zzWqCaj3BOhJKi3K2kwvA/CXF6ToQMUjrcP7twukVDDDzLiUcuz6ZoUzSTzmJuLHExs3pPoVLMp+eJyLcrvPfNqNfUKhtb1opWYzcLp+NOajQAhb0F15lgx25AUYo5dlcr5YHuE8kz6YAC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753287116; c=relaxed/simple;
	bh=rtxGwpegLORvQBEbPYS0PTFtkd9ieN1vLVcF8F6f+q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLLedQq04QCD7DlGRWVE9FDOs5h8sNZpYniSXAXhPHlv7E8HgMLWv6jbaCV56eLtFLBHVyELdduKMeQI7DuirR60CBp7x/4rVp+w5wGJrhmr3llQ93T2L+0J1+dxQ9rgBo/SpJQIfFZ0+CgKUzxZd76vDbfgyTdFS8/Y5PCx+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rpN+7JCM; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rpN+7JCM"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e283b2d065so247245ab.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753287113; x=1753891913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3C0WkHfBhCBetBl394jJtlyzYpWkePUkyD3d8tSiYk=;
        b=rpN+7JCMY5SBY1GHdM2F8diX3mcUn8aebSXYJ6/vfZQ0HLOTp0IFW7a6IIhMN2JnmY
         oIO40mvDHXxQBXRTxslC6S23b2FIorkt22jhFq90NbR0o/1AhM20Fi7qQZSTldyzRzR1
         DesVKm19SouzU/ErTaKwk3Ufn0Q5Oha6JL+ED2//3Xs4cetUIUnOLOGA7jR9Uk2Ty4u8
         fZH0XH0bmcKkLB+UM5HJOzB7GBxhR3vAILhfrSFBr0iRAnsP/KSW9r0uNJOrxrAXa7r1
         1K6fSdhmoHlr7bo84S1/UMtu/P1nWiUYrNY8ixKKXnmRrDDYvJa9Vmv2JCJd9g6SrT5c
         K6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753287113; x=1753891913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3C0WkHfBhCBetBl394jJtlyzYpWkePUkyD3d8tSiYk=;
        b=B/d22e7dNWd3W0u5XNb7QKCFgR5OBCDwFJLPBTP64A7fKNyFgG4BayzvoUJgAotOhd
         WzLYPJXNQd5ue9Nddzn7tWS7//WY0lDS+ASe/F+B2MdhCXg3Wrbe2xlXwHudW+xsqCps
         FY60Jwk2Uu08mWl5/ZjSqWvjFX9PfaAeNMH0Z/NSMaEz6oXQ4wguVx1/AJ/z7Fk9/5OT
         uPJM/EvvtRsAahfIekOzHZmo/e1bWU589ELkVhgs0b/ps4+1RKZr7Blikr0K4GW3946f
         akhtlg9/nnxSYHe6D5Se8QKbtAp0ngNBy2LXujnkAoWtUE3koUNGcMHzOZI5XAIWmMyr
         WExA==
X-Gm-Message-State: AOJu0YzMdA8rOzqotesF1VM7VI4Z4+I73MlIewXCzQ5kd6l/THgJDa+t
	h6X9Ys6s3E08AOufu00AlW3t+6w8WA5NVR+DegreM+QLbHmMX2JkvNIkJFWVjmK/FmHEV5OqomH
	EFHAfHF8A/P3QyY14Plu00Fv/lY3P3mYDXYM+Vn+3
X-Gm-Gg: ASbGncs6xRGSJcOvHZqrN3oPrhxOQyVDN93NrHzGfzSrnGz9YmSKCW1Ei39gZg+mpne
	HjVadnRTQzqdVXjJonJLcjLJUSBgGQXAVl5fNJEH2dXflMWPO4GCwa2mI+pkaQNiCA9t5X5wLzl
	FAqaYto8rkVjCHm4BRWvWNPtl7U8gqgitWxuJKATAKjk6HrpebikDs/8qBL9HRjSzOPsOxsJKni
	0c+7YlhDofhXbVNp3ZWGPXKcojkzYNguty/
X-Google-Smtp-Source: AGHT+IG5RLz5nygO1p3fdFsYtaf1fvLM6+An1Ff5N0geLaG02ZtSSd9AZhrgRbAX3/mlm5RMlSRZNbCcUpUltCo47WE=
X-Received: by 2002:a05:6e02:b2e:b0:3dd:a562:ce54 with SMTP id
 e9e14a558f8ab-3e384388d3dmr3589385ab.15.1753287113143; Wed, 23 Jul 2025
 09:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507231135.OtEGYfnQ-lkp@intel.com>
In-Reply-To: <202507231135.OtEGYfnQ-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Jul 2025 09:11:41 -0700
X-Gm-Features: Ac12FXy743Yjo7FkOF29oxvWtaE0FOvh6k33rH02UOuJhGYuJGQvop7Rnk3F9UA
Message-ID: <CAP-5=fWXcGiWXeb8=165tCVtEAYX7qkVUpanbpmg=Db=kwEP0g@mail.gmail.com>
Subject: Re: [thomas-weissschuh:vdso/unaligned 1/3] include/vdso/unaligned.h:21:9:
 warning: '__builtin_memcpy' reading 4 bytes from a region of size 1
To: Helge Deller <deller@gmx.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-parisc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 8:49=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh=
/linux.git vdso/unaligned
> head:   d826530fc107faa320a7a88b939b72fa5f6734b5
> commit: 3e7bf09e7bd5dce36df14f6770211fd1bc98a538 [1/3] vdso: Switch get/p=
ut unaligned from packed struct to memcpy
> config: parisc-randconfig-002-20250723 (https://download.01.org/0day-ci/a=
rchive/20250723/202507231135.OtEGYfnQ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250723/202507231135.OtEGYfnQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507231135.OtEGYfnQ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/swab.h:5,
>                     from include/uapi/linux/byteorder/big_endian.h:14,
>                     from include/linux/byteorder/big_endian.h:5,
>                     from arch/parisc/include/uapi/asm/byteorder.h:5,
>                     from arch/parisc/include/asm/bitops.h:11,
>                     from include/linux/bitops.h:67,
>                     from include/linux/kernel.h:23,
>                     from arch/parisc/include/asm/bug.h:5,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/linux/sched.h:14,
>                     from include/linux/uaccess.h:9,
>                     from arch/parisc/boot/compressed/misc.c:7:
>    In function 'get_unaligned_le32',
>        inlined from 'decompress_kernel' at arch/parisc/boot/compressed/mi=
sc.c:312:16:
> >> include/vdso/unaligned.h:21:9: warning: '__builtin_memcpy' reading 4 b=
ytes from a region of size 1 [-Wstringop-overread]
>       21 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr), =
          \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>       22 |                          sizeof(__get_unaligned_val));        =
          \
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab=
32'
>      120 |         __fswab32(x))
>          |                   ^
>    include/linux/byteorder/generic.h:89:21: note: in expansion of macro '=
__le32_to_cpu'
>       89 | #define le32_to_cpu __le32_to_cpu
>          |                     ^~~~~~~~~~~~~
>    include/linux/unaligned.h:23:28: note: in expansion of macro '__get_un=
aligned_t'
>       23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
>          |                            ^~~~~~~~~~~~~~~~~
>    arch/parisc/boot/compressed/misc.c: In function 'decompress_kernel':
>    arch/parisc/boot/compressed/misc.c:29:13: note: source object 'output_=
len' of size 1
>       29 | extern char output_len;
>          |             ^~~~~~~~~~

I agree with the bug report but not that the patch series introduces
the issue. The code:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/parisc/boot/compressed/misc.c#n28
  /* output_len is inserted by the linker possibly at an unaligned address =
*/
  extern char output_len;
...
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/parisc/boot/compressed/misc.c#n312
  vmlinux_len =3D get_unaligned_le32(&output_len);

is reading a char as an le32, so a 1 byte value as a 4-byte le32. It
appears the code didn't originally declare output_len this way but it
was changed in commit  c42813b71a06 ("parisc: Fix unaligned-access
crash in bootloader"):
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/arch/parisc/boot/compressed/misc.c?id=3Dc42813b71a06a2ff4a155aa87ac609fe=
eab76cf3
-extern __le32 output_len __aligned(1);
+extern char output_len;

Using __builtin_memcpy for unaligned values is sound. I'm not clear
what the appropriate parisc fix would be nor how I could test it for
the "unalignment-exception" reported in commit c42813b71a06. I suspect
the fix is to revert that commit. I believe we're seeing this warning
now as the casts of the previous __get_unaligned_t would hide the
issue. If Helge Deller <deller@gmx.de> or someone maintaining
linux-parisc could help it would be greatly appreciated.

Thanks!
Ian

> vim +/__builtin_memcpy +21 include/vdso/unaligned.h
>
>      6
>      7  /**
>      8   * __get_unaligned_t - read an unaligned value from memory.
>      9   * @type:       the type to load from the pointer.
>     10   * @ptr:        the pointer to load from.
>     11   *
>     12   * Use memcpy to affect an unaligned type sized load avoiding und=
efined behavior
>     13   * from approaches like type punning that require -fno-strict-ali=
asing in order
>     14   * to be correct. As type may be const, use __unqual_scalar_typeo=
f to map to a
>     15   * non-const type - you can't memcpy into a const type. The void*=
 cast silences
>     16   * ubsan warnings.
>     17   */
>     18  #define __get_unaligned_t(type, ptr) ({                          =
       \
>     19          type __get_unaligned_ctrl_type __always_unused =3D { 0 };=
                 \
>     20          __unqual_scalar_typeof(__get_unaligned_ctrl_type) __get_u=
naligned_val; \
>   > 21          __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),    =
       \
>     22                           sizeof(__get_unaligned_val));           =
       \
>     23          __get_unaligned_val;                                     =
       \
>     24  })
>     25
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
