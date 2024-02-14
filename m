Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05F1B5AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707913006; cv=none; b=bam4+H8yzq27kg01VwSP0jJvPSgyE1+VlmmkleMrsfd4xgygiMPoUhUPGq/TQCjpeqe+hLNXEeL9BtIVddS9xtanwxOkk78edhT2v9kKB/czG44grDJpVpSaxbsaOez5RiWFgI+GSPtcMNgC09ki8htxfBz1HHBhhbO1GqgJcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707913006; c=relaxed/simple;
	bh=7TA3LfAbCdnQRIGZnXgtNshvZpZ2o4/w7KMIbm92kIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSE3sfJFSgc7/3MLZ10WBHqabHk+igfBAyvCiQU3aLoUuf5jf9obgk/fBo2FbJENPZxKASHUNsJv7StYkvXCV2pMw6/NJf/SFsAJ1h2cjzyKQVIaOTsxZyahOrGrGmwJ+7euHRkgf1HGJifP39pfo73eBXoFNRtTKveCtYxOezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JyzM6/Kc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JyzM6/Kc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a30e445602cso143072566b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 04:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707913001; x=1708517801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq56mU3kzs0YZfavPzE3ppk//dLjqXu5kzMLeRDlQkc=;
        b=JyzM6/KcxtrOtsdULgC5BIslfCqoIG3DZppiD6e/cT2/xrrac50+IqUR0Do+i7zf3s
         E7oa2U1cjJLFBLsu6uF/+sMBVJFPljV6bCdf9ev6Qvj700VkzRbJl2flT/HYPm8EgH0P
         bewh3SKDhJXMuJSJOfPmIbUq3/aTk6m/473wEIQWO1IXqVQuwNGrV0rs71qT9NffYSCr
         KmX/WV3FPiQcBVNV7kz7n0qv1rmEPxwsXkk+bYbJypFQt9QtfDk2BbQr8LbDTlO0s6cN
         63ZOK6ll0d9AJdbcLtlRbFDF7j33ht+hLZFAs1mnxqLsxTg6fZ1qFZ9m+wkOCocW/pwL
         SEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707913001; x=1708517801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lq56mU3kzs0YZfavPzE3ppk//dLjqXu5kzMLeRDlQkc=;
        b=NAdrQneVLE1PpPL52qgQ6NaL/1hPaToVBR7eG6jokZBn5HmkC/u4vVGS4o3B62d58o
         grot0NeuCQepESKiJhjY/dEXuVxnNc/hLvPVBDswjMN/CjCJsbyd2MWlEP2zaYH+4QIR
         sW8BF4zzJqQJNSkUvo9rENqGyQq/nIDusAcoQvvxWrM3XM6KmIxUD2SNSYJjTnzRr3tb
         39dTqz0q1YVHMBHWSQCGW4Bo/3f7FGuwehhqAOHYttTFnt7jlIhoTEEKfwlL7xqguVPC
         pUiAnQDaVJjM/nhUsEw89Ldd7aDfHkSz+jNjLjT6OvLGTt6EwYIFMH+h56OSXTdFHbv8
         a1kg==
X-Gm-Message-State: AOJu0YzPM8rVa+8+KzWbzwREmqFS1Rnbkiw0mKDCp6nm6msZSKQFrjYL
	bnZhPH3qB07hY1Ki6Io8rA+Wv8YFiCUwybplaJkXw/iwl82CzGG1xno0MZnQmWYH1vN5eGAeST4
	LOd5ePIWyXzO/yMtehT8Xy+qsL6s8UV8K5ijiPA==
X-Google-Smtp-Source: AGHT+IFT3kXJCupIXjFyOzJiZDZsYOWuAxsQAIVhl5i/hEZMgBhxRnVxH0NkHYxB8Gi8J6Snm2qRBO9F2hQAQm0UjZM=
X-Received: by 2002:a17:906:2485:b0:a3c:ce03:5d45 with SMTP id
 e5-20020a170906248500b00a3cce035d45mr1667371ejb.11.1707913000805; Wed, 14 Feb
 2024 04:16:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402142035.Aq7hibAu-lkp@intel.com>
In-Reply-To: <202402142035.Aq7hibAu-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 14 Feb 2024 13:16:29 +0100
Message-ID: <CAHVXubh2JAzKnOwyTMcR2zCPKeGVYduCzq+iqMLA6HnYcXT1yg@mail.gmail.com>
Subject: Re: include/linux/hugetlb.h:916:20: error: static declaration of
 'arch_hugetlb_migration_supported' follows non-static declaration
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 1:09=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   7e90b5c295ec1e47c8ad865429f046970c549a66
> commit: ce68c035457bdd025a9961e0ba2157323090c581 riscv: Fix arch_hugetlb_=
migration_supported() for NAPOT
> date:   7 days ago
> config: riscv-randconfig-r064-20240214 (https://download.01.org/0day-ci/a=
rchive/20240214/202402142035.Aq7hibAu-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c=
08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240214/202402142035.Aq7hibAu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402142035.Aq7hibAu-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from kernel/fork.c:52:
> >> include/linux/hugetlb.h:916:20: error: static declaration of 'arch_hug=
etlb_migration_supported' follows non-static declaration
>      916 | static inline bool arch_hugetlb_migration_supported(struct hst=
ate *h)
>          |                    ^
>    arch/riscv/include/asm/hugetlb.h:15:42: note: expanded from macro 'arc=
h_hugetlb_migration_supported'
>       15 | #define arch_hugetlb_migration_supported arch_hugetlb_migratio=
n_supported
>          |                                          ^
>    arch/riscv/include/asm/hugetlb.h:14:6: note: previous declaration is h=
ere
>       14 | bool arch_hugetlb_migration_supported(struct hstate *h);
>          |      ^
>    1 error generated.
> --
>    In file included from kernel/sysctl.c:45:
> >> include/linux/hugetlb.h:916:20: error: static declaration of 'arch_hug=
etlb_migration_supported' follows non-static declaration
>      916 | static inline bool arch_hugetlb_migration_supported(struct hst=
ate *h)
>          |                    ^
>    arch/riscv/include/asm/hugetlb.h:15:42: note: expanded from macro 'arc=
h_hugetlb_migration_supported'
>       15 | #define arch_hugetlb_migration_supported arch_hugetlb_migratio=
n_supported
>          |                                          ^
>    arch/riscv/include/asm/hugetlb.h:14:6: note: previous declaration is h=
ere
>       14 | bool arch_hugetlb_migration_supported(struct hstate *h);
>          |      ^
>    In file included from kernel/sysctl.c:53:
>    In file included from include/linux/nfs_fs.h:31:
>    In file included from include/linux/sunrpc/auth.h:13:
>    In file included from include/linux/sunrpc/sched.h:19:
>    include/linux/sunrpc/xdr.h:782:46: warning: result of comparison of co=
nstant 4611686018427387903 with expression of type '__u32' (aka 'unsigned i=
nt') is always false [-Wtautological-constant-out-of-range-compare]
>      782 |         if (U32_MAX >=3D SIZE_MAX / sizeof(*p) && len > SIZE_M=
AX / sizeof(*p))
>          |                                                 ~~~ ^ ~~~~~~~~=
~~~~~~~~~~~~~
>    1 warning and 1 error generated.
> --
>    In file included from kernel/events/core.c:31:
> >> include/linux/hugetlb.h:916:20: error: static declaration of 'arch_hug=
etlb_migration_supported' follows non-static declaration
>      916 | static inline bool arch_hugetlb_migration_supported(struct hst=
ate *h)
>          |                    ^
>    arch/riscv/include/asm/hugetlb.h:15:42: note: expanded from macro 'arc=
h_hugetlb_migration_supported'
>       15 | #define arch_hugetlb_migration_supported arch_hugetlb_migratio=
n_supported
>          |                                          ^
>    arch/riscv/include/asm/hugetlb.h:14:6: note: previous declaration is h=
ere
>       14 | bool arch_hugetlb_migration_supported(struct hstate *h);
>          |      ^
>    In file included from kernel/events/core.c:43:
>    include/linux/mman.h:158:9: warning: division by zero is undefined [-W=
division-by-zero]
>      158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC  =
    ) |
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>    include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans=
'
>      136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
>          |                     ^ ~~~~~~~~~~~~~~~~~
>    1 warning and 1 error generated.
>
>
> vim +/arch_hugetlb_migration_supported +916 include/linux/hugetlb.h
>
> 161df60e9e8965 Naoya Horiguchi   2022-07-14  902
> c177c81e09e517 Naoya Horiguchi   2014-06-04  903  #ifdef CONFIG_ARCH_ENAB=
LE_HUGEPAGE_MIGRATION
> e693de186414ae Anshuman Khandual 2019-03-05  904  #ifndef arch_hugetlb_mi=
gration_supported
> e693de186414ae Anshuman Khandual 2019-03-05  905  static inline bool arch=
_hugetlb_migration_supported(struct hstate *h)
> e693de186414ae Anshuman Khandual 2019-03-05  906  {
> 94310cbcaa3c2b Anshuman Khandual 2017-07-06  907        if ((huge_page_sh=
ift(h) =3D=3D PMD_SHIFT) ||
> 9b553bf5eb99dd Anshuman Khandual 2019-03-05  908                (huge_pag=
e_shift(h) =3D=3D PUD_SHIFT) ||
> 94310cbcaa3c2b Anshuman Khandual 2017-07-06  909                        (=
huge_page_shift(h) =3D=3D PGDIR_SHIFT))
> 94310cbcaa3c2b Anshuman Khandual 2017-07-06  910                return tr=
ue;
> 94310cbcaa3c2b Anshuman Khandual 2017-07-06  911        else
> 94310cbcaa3c2b Anshuman Khandual 2017-07-06  912                return fa=
lse;
> e693de186414ae Anshuman Khandual 2019-03-05  913  }
> e693de186414ae Anshuman Khandual 2019-03-05  914  #endif
> c177c81e09e517 Naoya Horiguchi   2014-06-04  915  #else
> e693de186414ae Anshuman Khandual 2019-03-05 @916  static inline bool arch=
_hugetlb_migration_supported(struct hstate *h)
> e693de186414ae Anshuman Khandual 2019-03-05  917  {
> d70c17d436b3fb Chen Gang         2016-05-20  918        return false;
> e693de186414ae Anshuman Khandual 2019-03-05  919  }
> c177c81e09e517 Naoya Horiguchi   2014-06-04  920  #endif
> e693de186414ae Anshuman Khandual 2019-03-05  921
>
> :::::: The code at line 916 was first introduced by commit
> :::::: e693de186414ae66f2a316ff9befcd2b7a6d07b6 mm/hugetlb: enable arch s=
pecific huge page size support for migration
>
> :::::: TO: Anshuman Khandual <anshuman.khandual@arm.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I sent a fix for this a few days ago here:
https://lore.kernel.org/linux-riscv/20240211083640.756583-1-alexghiti@rivos=
inc.com/T/#u
