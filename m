Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72C3328EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386263; cv=none; b=NuN0gB4EQ1FzrqWQ+GgWdmRdyRWhymxBk97YEF3KiTZvq5DY6ghF/XgjKPGViFB3k7ijiUKAvias+zK86gAhetOArllEQL/oHm8lkm0Uo907hLwZRVqq3qPLzgZlEGpWkSOjBcuJOIInyas9gz9jR8iKudviu30OtMTSYR6rcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386263; c=relaxed/simple;
	bh=aAG3dg1Ea5O5mkP5tsP4StKWxbWtl456DQ0+bVmR4nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvdaER9g5OqzgbP3jRV924SvfEhdAuhlFpxD1VhmTDfuJDnirecWQz8bJ5JrpS32xF/IeR0uUfn9S6NNJlcqqnzflcETCju8RsHvwGidmDNWz4TuOBntobHyJaXnCdML7INo9T+tlaffYf3snzOFrC8fXmubGEgcpcBFL7Oum2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxYxnREZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxYxnREZ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso6600277a12.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763386260; x=1763991060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaWyh0QzcwKqBgx0baGTRcI+URglOSNILMpQRbc2ndI=;
        b=JxYxnREZHek4zi/ZwBJ38Cb9cLO3HHA/RCCp0ITB+f5kyLFsRjclj7Jwc7nG7c7FdS
         mwEnCy6RHKTlQEjxVX1wXNseoW67vBhwtFzjfz7y96dcbTsTjjpJOWR3ZxjJtR70l+mt
         Vkf13ZJBs7BYRjKoF17hGTas5CojZ+KEZwh61bWoAshxtsNFArDeE0IO7QDi/ZiSZ3fD
         MOf+M30oISGUhXh6rRjZ7yFfFd8AZuUAGtjYJL3Nx6nMVt5bqHaoggxkjOQ19qZ2dyqA
         bjdD3qV6/srYYkEGTZeNQs7CiOa9U4Epdnq3FrsBHsriCWBnpNT+uNx+YbzLrdKaSxoB
         9IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386260; x=1763991060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PaWyh0QzcwKqBgx0baGTRcI+URglOSNILMpQRbc2ndI=;
        b=dhqiz7gc5BE0s1iYnNjZVs+7N3LoICbRJh8IrTWcyIC3i2i5GJOIGmRoRm6z4CWfmE
         ub7hlZFv4sJo3FFqF6L8ItpqIknSjoS9g7OQ8ykc5WnbtJsRHH80ivSXmXdZa6k0P7ry
         aAuAfdAPEUoZ9bGS098FvRGo10zijYzFmsZIXhpYpZILmH7rh5oYJyRkSnwa92OZT8fw
         /O7nTig5nWIEFlasMKKhvTR68XbRyKtOXmfRum3VmzZQRRDWTh7fgIowcZiHn8O6/45k
         vcABU3maW0adnsn3jJ5wSsjzSJBnm0OdJDrDBuiOdX2162JsDON8UKPHkOr6+VOqM0sD
         71Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXUnsPEHtnXDYhmHS0PWETI4kXqnmXun85kkMrJT7PASQqiF1t4b/+8B5sH7CqoVDIGyYWVK7ml4fra41UG@lists.linux.dev
X-Gm-Message-State: AOJu0YyK5L5CgIHycEiXxxd2t2JE+lINKT/eo7ykpkeCzmCuzmYNO1pe
	ShEZ1wG4Ikq8JScEZ5YoPNNxdkkzGKTQK2JqG43I2q+Zn0qpp7QPvxtHTYEPLgIZf1gEq3aN6eZ
	eF6KCyHGYumGmxIsVvKEwQlPBODIWnmI=
X-Gm-Gg: ASbGncvmYxeJcJnmQeqDnyCHoKflgYfRXvkBRpNRHXAx6slqaUtAKxy4zC3a3NkS1Kr
	fFVOLKq5hzP4KxwgE4xAFhqkOVbxv0ObUYmpTMTuhIybDSLtTgoJ65q25B8cluzZUM0DQBOpskY
	z3LS7L0oOZbliu9K7JD+lZYiHKzlfY1G9WkU65tuYrqkY2ph7kuaZZ5ArP88/VHQkZ4wCn4WHlQ
	rGcsuEBkYNDoFkxdiJRtYSXeISZ5WSxFdNyrqxb1MVe2Kt/aseSuUW/cUiHIpKrLduWYk9GGIHS
	e5G4v9KWf0/K0qEriK6q/pCdv9d3LQs9eoyoEEkSyw==
X-Google-Smtp-Source: AGHT+IE2q9cxzQ11eFckik+jwI+m8CZlnmGQQBueLgQqdoDLrH76cSm/7gOLaMpuIbhqOlMuKvvP+9chgs8sOX9SjVQ=
X-Received: by 2002:a05:6402:3507:b0:640:fb00:9b0b with SMTP id
 4fb4d7f45d1cf-64350ec2ff9mr12960547a12.32.1763386259350; Mon, 17 Nov 2025
 05:30:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-swap-table-p2-v2-18-37730e6ea6d5@tencent.com> <202511171912.yMOEajkV-lkp@intel.com>
In-Reply-To: <202511171912.yMOEajkV-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 17 Nov 2025 21:30:22 +0800
X-Gm-Features: AWmQ_bn6RSoBiaqmn6kqmtyhsS-hftve9ZnkvXr-GPymXU6BoQ87Qrz5mZ6aFLk
Message-ID: <CAMgjq7BbvKUjZprvP+nOgkF59+KnX5PZwuvcfSUChu4pci_i3g@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] mm, swap: drop the SWAP_HAS_CACHE flag
To: linux-mm@kvack.org
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Youngjun Park <youngjun.park@lge.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 7:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kairui,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 41218ede767f6b218185af65ce919d0cade75f6b]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swa=
p-rename-__read_swap_cache_async-to-swap_cache_alloc_folio/20251117-021532
> base:   41218ede767f6b218185af65ce919d0cade75f6b
> patch link:    https://lore.kernel.org/r/20251117-swap-table-p2-v2-18-377=
30e6ea6d5%40tencent.com
> patch subject: [PATCH v2 18/19] mm, swap: drop the SWAP_HAS_CACHE flag
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251117=
/202511171912.yMOEajkV-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0=
bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251117/202511171912.yMOEajkV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511171912.yMOEajkV-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/swapfile.c:88:19: warning: unused variable 'Unused_offset' [-Wunuse=
d-const-variable]
>       88 | static const char Unused_offset[] =3D "Unused swap offset entr=
y ";
>          |                   ^~~~~~~~~~~~~
>    1 warning generated.
>
>
> vim +/Unused_offset +88 mm/swapfile.c
>
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  84
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  85  static const char Bad_file[=
] =3D "Bad swap file entry ";
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  86  static const char Unused_fi=
le[] =3D "Unused swap file entry ";
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  87  static const char Bad_offse=
t[] =3D "Bad swap offset entry ";
> ^1da177e4c3f41 Linus Torvalds 2005-04-16 @88  static const char Unused_of=
fset[] =3D "Unused swap offset entry ";
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  89
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

My bad, should move the `Unused_offset` related change to the next
commit, and remove it by then. It's just an unused variable so it can
be dropped easily.
