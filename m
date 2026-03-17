Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB73AA50F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752673; cv=pass; b=CzIVCuCnW9jdyho1g5XwdqmnMmOv6qqRlCWWPiH936nVrWvPA7jeSi9SiNpe9L7206rqsnXNrTPLM7wWCHR2g5qturCzFAupdHaJUcidexAzz806BB/TbFqbfym59ZUIeUvV7wqR5V9CNVBl4XPE5BZg3XPkKLbW16F+VHDI+oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752673; c=relaxed/simple;
	bh=HOKSjD3DqXm2Q72cQVGdFQMwGQQ1FcKjaSZW8AAyutw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlZMjok2EGID5RRaJS7RENyO3Q84+kZR6unxgFlLrTvfbaeRoUDB6IVDVy7H6kU+CamHbW4pxq2QRPmJyuZgsJQ0xYa/jw6W2s7aOsSp9SJG7fU7WB6hEWCX/K+/7sDnmN8GLubOBkZYzv3/4319Hm7DgvXaBGcq1nqe+SrnYdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GtgwNG/4; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GtgwNG/4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so6644951a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 06:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773752670; cv=none;
        d=google.com; s=arc-20240605;
        b=dE83nFzpjD1PClJTjdg8XqWgJGLt9JMYhWQsdCM8e4mdN7sMCXzJ01/TgA+hkEcf/2
         fqMt1sHXAx5Sgc+y60iMJ1MWWt56EsCZDwGtGlkyXGibhCTEcRyPIGqQg2v4l6U2Ozyt
         M+z99pSHIqgjeq63drU+MORWT7b+IdB+SGUR4IkxwlokDxRE+esNPfRa1V5jRZtN7ufR
         lm2M/qplVac7y3bI3NVWLaPA1NfCvhtn0vG1aSFY+TG5uiv/aFhFNoSYHHCnaPx3y/kH
         JTsiFBX+QB+vuvdhnXht3JOmaQ6I4aWGHQztT/tZr+Kth451iB76iTtN3DHM37byvtHZ
         v6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysuLlj+wUK3hDLUIv/hpeGMF0lK81wTkavGvi0NT4w8=;
        fh=Fg65qRaT34Qzc37Q693/jI491EyGh3cqwk4EZ6jVpbY=;
        b=REakFnzeE3+jwlGwatxINWOZqzpXIKeztG29baHDOpi40NR2j0hHnyAL+yWcikSPN/
         ZYw9G9aII52eIX6NwQ59AWdpKk9XhvaM6Mn6oZqDHwew2T1IxpSlKUj5K7iBZIMzjC3O
         Lq4ueRheEwVLWFTKp7SORWPLOLAAKN++KziJXEEw+DDxYCdUwTuGpsIyrYfHCgywRMWj
         tp+XZFs/QOUUItSC9cSw4FSRPaI/wYafZylm1s4oFEpiLCf6sS//7g+k4vhOw9/T+gts
         0QHyvcwt3Kk+UceC//HnCUGuqvnd/ZGdUhKNEMji9sfIBIWr0iPAXjsT9q/5Uk2FpaIv
         RPKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773752670; x=1774357470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysuLlj+wUK3hDLUIv/hpeGMF0lK81wTkavGvi0NT4w8=;
        b=GtgwNG/4peV40X0hmWoQjbTb9dbPnQFimjNQpGZLgRP/jPo6kkOvfcKu2KBnA5PmCA
         VI5q7P9ge8ElMXFxEAKfk+ug+zJP89HSjlmZb4d+qe0ZadPgYpzF+gjEIk85Eu2Ygj4I
         J9BGgx61j7KvDOV/OBtykArLZQTScwXqUmUJbnUKA2Z+ZnzTMA/I1NtJfcW6oDuAnE7r
         haSK4XRH9NBiFQ/WDBITLpCxUM5xIYhzeaMJ//9EuhUngyBxrgna/yEgoZxhsoAj8cIO
         t9AV0fdo7326OMkyHH3eQz8BluUUZ80adlp8+xUUtYYHdqw0MOA/7oALvJqE+zDr3h9x
         5aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752670; x=1774357470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysuLlj+wUK3hDLUIv/hpeGMF0lK81wTkavGvi0NT4w8=;
        b=Q7cldFwhveFlQwW7fun+l4tFdS7Pgf27WjsS8zqqr7/8XwPf4dIGMiFOoBgeNdFeEJ
         3nWyINK4pxXx1fViLaXG/c3qvRCRiGFFKsYD0euogNqnriWHsEXUMHkyBKoYHyqylqq5
         49b12SOciqpe18AcChNVK7yGRzc2Cfj9VgncHD3FLI0xxncbD2FB3VbfmB0Pf81CJCib
         MkzUtzhx7ogtlcL9JETcj1hJNjoNyaQIRZ8l4bzVdedAVwY0sLFFNo3eruzdHAtUcZc8
         vamJ6RoJQLkfzYUJg1/qu/LUj8Zf0ByonwABtEvLVXcBWj7BF1Bd1WLHokcxjk8uypIB
         ZrGw==
X-Forwarded-Encrypted: i=1; AJvYcCUvehihJBUg8Wa1ulprc6jYKPfe6ee5hTokybhiu4beTZ64+BHYra9zZFfRvfh74sNbQjPBVnJGlViXjt8X@lists.linux.dev
X-Gm-Message-State: AOJu0YzvIiXgPVC+RInVyPXyIp+4U9eO96lhHhqqN6LfB+uetrw0nvYp
	8UqHZaH9LjGcwuIb1kkMWBqakGbvZi0UjF4OdXcEFD354Kcs1lB+WhGUAxk+dcV/RvFmevf2Gh3
	ytSLLqzAQCOyxW9Oe9dvidtf8ZesDggXFJbSPmOUgdQ==
X-Gm-Gg: ATEYQzwjyBUhdJ+UZkaCZiDMFxsudMqqcdLn0249UmbajstXaKz7i2gnmfB46HX1l3B
	M/fRJmOI/XDj2hSkrP4NtH5Pa98ujVriQoWKnnUTVXrUh+vrqDrhYOdAHjvqAUw3QqAMV3onnkB
	JE5Gyc6Sj1zBXQemi0iWWoMVJyKWY16G84AImFCu8JYZ+nGepLOQKqNtRtRIm0GtseaL+5nP2WR
	cP7q7KmDgOa3bX9iLG0kNi1Q1an2nGx3AhRTbkBmTxcOY00Kkqh953EDf7fnPFHd25BAs6s/LLb
	X4kc+FZsOdMQM2BIuSfqvt7hJ8XhtAKM2bTrMQ==
X-Received: by 2002:a05:6402:f01:b0:658:d1b0:9970 with SMTP id
 4fb4d7f45d1cf-663ba0ffedemr7428895a12.5.1773752669881; Tue, 17 Mar 2026
 06:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317025049.494931-6-pasha.tatashin@soleen.com> <202603171111.YBKWkKnp-lkp@intel.com>
In-Reply-To: <202603171111.YBKWkKnp-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 17 Mar 2026 09:03:52 -0400
X-Gm-Features: AaiRm53BOiJuI_VHcpORXajPgafrQwkAny2SxrdtOShKer-_ZbanQn5yTzxfajY
Message-ID: <CA+CK2bALxiExWL3LuF_+fhctKGYmdBQejjFiw09jFiV1UtPZ3A@mail.gmail.com>
Subject: Re: [PATCH 5/6] liveupdate: Make unregister functions return void
To: kernel test robot <lkp@intel.com>
Cc: rppt@kernel.org, pratyush@kernel.org, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, akpm@linux-foundation.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 6:11=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Pasha,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-nonmm-unstable]
> [also build test WARNING on akpm-mm/mm-everything linus/master v7.0-rc4 n=
ext-20260316]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/liv=
eupdate-Protect-file-handler-list-with-rwsem/20260317-105522
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> patch link:    https://lore.kernel.org/r/20260317025049.494931-6-pasha.ta=
tashin%40soleen.com
> patch subject: [PATCH 5/6] liveupdate: Make unregister functions return v=
oid
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260317/20=
2603171111.YBKWkKnp-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260317/202603171111.YBKWkKnp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603171111.YBKWkKnp-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from kernel/kexec_core.c:18:
> >> include/linux/liveupdate.h:274:2: warning: void function 'liveupdate_u=
nregister_flb' should not return a value [-Wreturn-mismatch]
>      274 |         return -EOPNOTSUPP;
>          |         ^      ~~~~~~~~~~~
>    1 warning generated.

Ah, forgot to update these. Will send v2 soon.

Pasha

>
>
> vim +/liveupdate_unregister_flb +274 include/linux/liveupdate.h
>
> cab056f2aae725 Pasha Tatashin 2025-12-18  270
> e62bd1ab0687a1 Pasha Tatashin 2026-03-16  271  static inline void liveupd=
ate_unregister_flb(struct liveupdate_file_handler *fh,
> cab056f2aae725 Pasha Tatashin 2025-12-18  272                            =
            struct liveupdate_flb *flb)
> cab056f2aae725 Pasha Tatashin 2025-12-18  273  {
> cab056f2aae725 Pasha Tatashin 2025-12-18 @274   return -EOPNOTSUPP;
> cab056f2aae725 Pasha Tatashin 2025-12-18  275  }
> cab056f2aae725 Pasha Tatashin 2025-12-18  276
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
