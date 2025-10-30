Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600921CC51
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830371; cv=none; b=XGQwHQL8LqDcwWCLIED0ZQNkYaErw/jlRyRyfTYugQccPxfjW7EAkGYsgowTeNg7+3pEg3twqct56tn+efHpIGIDP9LKJVC3maQsJAw1aJQqahV6HZ39B9sR5Q3/BtZewaVShkp5Ujsvsk9MsXhhomWa5eP7ezijGaMjeeGRVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830371; c=relaxed/simple;
	bh=QpAnzb0D2p1ZWhdbDdMUruh1TJSFKgBm/4FWs7HEmWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xdg4bMGOKWRLp0D2INP/yfAO/JDDPfWuK4zH6AYhsv9I4R0myt1KJnc6axJX0DgQtrLUTYTx/Qm1RgULt9hChq4kU7ZSYqfR0C9d5S8dCs81NxDEpBP/FoKKIhGgs5PVYiY09izkZ14gLRnBVUyR0o9VcyTBz0zlJW0jSQSJuQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfSctaS6; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfSctaS6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso2026785a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761830368; x=1762435168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgNs3notkwlYCfaZUY2EQYuAlm5MUcJUNJzoQ0kz3gY=;
        b=SfSctaS6yjHIl4nfiNJXz7I0cdYaWMUYTleEKDKVuPW7ImCuqj2l+A8226OEEL7fwZ
         P4hGNduXmWKMD6FQRdb72/SZdDJdbJrRBZTTv+c3qT5bEHnKJ41Vfkc7lRiG3MziWmJV
         BLfFROfDZZlFPlvrlJhBahR1GesSQg6f2AWKqs4XBu7p8bCZiV6BK88+R53NkgCkpuT4
         z9UuIqtTxBRAfcfQCBJQrXJ4uUWUIiVkQG/Wf7rjs8SmOUENNNABHWBPH2QF8oMkdkyo
         xZDqo+QL+SAsfkVIdMQxHovotxoxyCbUYclZwbJGX78LUvbMfxAllbtLo7f75szsUIV7
         OL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830368; x=1762435168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgNs3notkwlYCfaZUY2EQYuAlm5MUcJUNJzoQ0kz3gY=;
        b=PPNyYobkK4FZsumz+M3wcDvNd+VNHQCNuz0mL2LBLd+C0p3rNz6H4wg9M6p9VXSgwL
         85y8YsLj9JCHMfBb1+46C80IouyVoOK+Jbl4zNWm9ujV2yFZXZ8uZs/7QtK/sb7HZCjf
         7V0JewUPbo71mCykWlY2VX79QHaYhWSPfikvXLKMXe5wwzX3GYITvZrIo6vJJJOl3wyx
         Xg4eBetWkk8zTSrRGjRU8Hsdxh9U0w1D3korvLmp5UvmKusE+8A6/sodvHUTIQanqrPb
         uYVPYn9llt6FK2sMYBZX/+9eZ2yAT1yJMgIoTqinJ2TkPyqYbNwoEI/gRVswFhDYWe7j
         3nfw==
X-Forwarded-Encrypted: i=1; AJvYcCVMvDjUDNmVBq4EJAs4A/IRjZf508rwy04A5ACICqHIOrrjqOLrK/oQ6C7lWdgfybO2S3i8GM2mJpCErm3b@lists.linux.dev
X-Gm-Message-State: AOJu0YzH1C8Oe8HOD73n13uWQ03BJdcFapcFM5QcKz/AVDAZxFis/54z
	3faIjb0Qhj5tvnOXCYXYFWzm2WOULYQLQq0ZXaus+XspJv0hsM7S1sHzu9r7akWNSk937bzqcW+
	a/SUcLi1S2dBEysIaGTk1rLQJ33B1imw=
X-Gm-Gg: ASbGncvZwL/jfcQwmXcWQRhL7Vpl8amTCoSSmSaxQ8ttb4T/ht403C/aVM45MeSSQ2b
	QzG+53tomMJlk25Iu2gLk1quSZ7E9hppqAf/lb/0OxiN19Q6fcUCRVaG02bb+xfDnjFl55+lcqq
	Qa9iFVbGestdcbukoRm6zXkhBZCMJNDhd91DYQ0QFc/kodJGtXDs3l/NJ2uR5beHx4XXJ5X57YO
	C9D1otW6MJxMFirn1ysIQ4Tz3xa83gElS/dIXLTA+z01W1GcQptPd7NJcNXxujv3lZfbGfVOOag
	7WF8VSgIyJlN2Ww=
X-Google-Smtp-Source: AGHT+IF361R/WAIc8VaDoqQKEUE4CN89kxMMfDi3qcLlX+kAOLMSEQ9qnoXacZXoN+2vKDf2CaGc73KqhA41q7SeDCo=
X-Received: by 2002:a05:6402:5190:b0:634:b7a2:3eaf with SMTP id
 4fb4d7f45d1cf-640442520c3mr6055524a12.18.1761830367848; Thu, 30 Oct 2025
 06:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251030105242.801528-1-mjguzik@gmail.com> <202510302004.OdLRz1Wy-lkp@intel.com>
In-Reply-To: <202510302004.OdLRz1Wy-lkp@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 30 Oct 2025 14:19:15 +0100
X-Gm-Features: AWmQ_bmaKWvJPGMNKaZCzAmtObzJjTdnoe9rbiYXJSLj7hTzf1ubwz2J_gkLKmg
Message-ID: <CAGudoHGORCV7Gx5Yj+32eU7k4=yu_hjbtS3+PPJ7AtQGxCcqpQ@mail.gmail.com>
Subject: Re: [PATCH v4] fs: hide names_cachep behind runtime access machinery
To: kernel test robot <lkp@intel.com>
Cc: brauner@kernel.org, oe-kbuild-all@lists.linux.dev, viro@zeniv.linux.org.uk, 
	jack@suse.cz, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, pfalcato@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not sending a v5. If you guys are fine with the patch I'm going to
fix up whatever other fallout later.

On Thu, Oct 30, 2025 at 2:14=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mateusz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on arnd-asm-generic/master]
> [also build test ERROR on linus/master brauner-vfs/vfs.all linux/master v=
6.18-rc3 next-20251030]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/fs-h=
ide-names_cachep-behind-runtime-access-machinery/20251030-185523
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.=
git master
> patch link:    https://lore.kernel.org/r/20251030105242.801528-1-mjguzik%=
40gmail.com
> patch subject: [PATCH v4] fs: hide names_cachep behind runtime access mac=
hinery
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/202510=
30/202510302004.OdLRz1Wy-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251030/202510302004.OdLRz1Wy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510302004.OdLRz1Wy-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/riscv/include/asm/runtime-const.h:7,
>                     from include/linux/fs.h:53,
>                     from include/linux/huge_mm.h:7,
>                     from include/linux/mm.h:1016,
>                     from arch/riscv/kernel/asm-offsets.c:8:
>    arch/riscv/include/asm/cacheflush.h: In function 'flush_cache_vmap':
> >> arch/riscv/include/asm/cacheflush.h:49:13: error: implicit declaration=
 of function 'is_vmalloc_or_module_addr' [-Wimplicit-function-declaration]
>       49 |         if (is_vmalloc_or_module_addr((void *)start)) {
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/compat.h:18,
>                     from arch/riscv/include/asm/elf.h:12,
>                     from include/linux/elf.h:6,
>                     from include/linux/module.h:20,
>                     from include/linux/device/driver.h:21,
>                     from include/linux/device.h:32,
>                     from include/linux/node.h:18,
>                     from include/linux/memory.h:19,
>                     from arch/riscv/include/asm/runtime-const.h:9:
>    include/uapi/linux/aio_abi.h: At top level:
> >> include/uapi/linux/aio_abi.h:79:9: error: unknown type name '__kernel_=
rwf_t'; did you mean '__kernel_off_t'?
>       79 |         __kernel_rwf_t aio_rw_flags;    /* RWF_* flags */
>          |         ^~~~~~~~~~~~~~
>          |         __kernel_off_t
>    make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offset=
s.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1282: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +/is_vmalloc_or_module_addr +49 arch/riscv/include/asm/cacheflush.h
>
> 08f051eda33b51 Andrew Waterman 2017-10-25  42
> 7e3811521dc393 Alexandre Ghiti 2023-07-25  43  #ifdef CONFIG_64BIT
> 503638e0babf36 Alexandre Ghiti 2024-07-17  44  extern u64 new_vmalloc[NR_=
CPUS / sizeof(u64) + 1];
> 503638e0babf36 Alexandre Ghiti 2024-07-17  45  extern char _end[];
> 503638e0babf36 Alexandre Ghiti 2024-07-17  46  #define flush_cache_vmap f=
lush_cache_vmap
> 503638e0babf36 Alexandre Ghiti 2024-07-17  47  static inline void flush_c=
ache_vmap(unsigned long start, unsigned long end)
> 503638e0babf36 Alexandre Ghiti 2024-07-17  48  {
> 503638e0babf36 Alexandre Ghiti 2024-07-17 @49   if (is_vmalloc_or_module_=
addr((void *)start)) {
> 503638e0babf36 Alexandre Ghiti 2024-07-17  50           int i;
> 503638e0babf36 Alexandre Ghiti 2024-07-17  51
> 503638e0babf36 Alexandre Ghiti 2024-07-17  52           /*
> 503638e0babf36 Alexandre Ghiti 2024-07-17  53            * We don't care =
if concurrently a cpu resets this value since
> 503638e0babf36 Alexandre Ghiti 2024-07-17  54            * the only place=
 this can happen is in handle_exception() where
> 503638e0babf36 Alexandre Ghiti 2024-07-17  55            * an sfence.vma =
is emitted.
> 503638e0babf36 Alexandre Ghiti 2024-07-17  56            */
> 503638e0babf36 Alexandre Ghiti 2024-07-17  57           for (i =3D 0; i <=
 ARRAY_SIZE(new_vmalloc); ++i)
> 503638e0babf36 Alexandre Ghiti 2024-07-17  58                   new_vmall=
oc[i] =3D -1ULL;
> 503638e0babf36 Alexandre Ghiti 2024-07-17  59   }
> 503638e0babf36 Alexandre Ghiti 2024-07-17  60  }
> 7a92fc8b4d2068 Alexandre Ghiti 2023-12-12  61  #define flush_cache_vmap_e=
arly(start, end)       local_flush_tlb_kernel_range(start, end)
> 7e3811521dc393 Alexandre Ghiti 2023-07-25  62  #endif
> 7e3811521dc393 Alexandre Ghiti 2023-07-25  63
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
