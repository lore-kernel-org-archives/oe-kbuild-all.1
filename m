Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9C2FB632
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416123; cv=pass; b=g7Impp0KetdqJOVyRS1elxDThsgWtacwh4nk1pREGXxNi42fZ63fhoPw+cNsWeMtbRgjAoHUyZpcsPfcG7U2PqlXFPijsSN9pe3RLEuIEONGx1TY6mnoUK0Gx7l441A32C0kKXD8rJlEWOmdtom51h7644EzDdYL5CMBtcqStEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416123; c=relaxed/simple;
	bh=IChdIJUhRMDHLJJyyMM7C09xoDho5XgoklbM0lDLFHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hY8Jw1I4ptBYYohECadNDiYlpwiAi8eAnO7rJuLMiAyjOY3WxZSY4yl2HlVB+sw/0pUag1m9aHrO/aLAfjgY/7muEfaBL0/UYpzZFdAJG3LGWLjmV5q/fW2IMVI8HS9tDytiNjybX+atV8eDo+ZRGax3jiUEdyVW/ZscbmqzfxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqR7F3a5; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqR7F3a5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so438768766b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 00:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769416120; cv=none;
        d=google.com; s=arc-20240605;
        b=hMzLyuNR35bh++VT7FP3gUOuySTU9lYQ1METKzweEPCrkFwlr1KRgfc0LJZxMpROYB
         uex8AGHXWDgYPNri/prbTih8hHEDc+92OwfO7N46kXB9AUNtKEUlVFWGN1mgNx5n/5RR
         QXB45i3mWWdKzSR0gNzyMlNMNZW+Bo8MdEnnT9pyBmFLo//8vN//5en4dxfglodCps7J
         EHVMS0YC3dZvJdA+2vpDLSBJa5js7it1LD3SVkpgKtYRsaWIRRfHULPbNDLWourSXvaw
         k6B+1DfdJJF/hDuUTzfgYOmnBXlM1+PrdWv8mwJwYcmXjaaxp+ji2U7b54+6iOWiTBPa
         Rung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cq+fCPk8KJ9iRXfyMvxZCksWGZNw2PsDH5Tkw+tm140=;
        fh=7Q70bag0tX0BELDJl+JH3Jgpp/BXp3jwW0Pppm2oLfo=;
        b=JQVNkZIF8gpJE+xHmxL07Q4dn+j57HsWdyj2BZvroR3Ep3ZLGkPFMI1iJXqPHv2tCM
         v4uMCBxhEdE3P1eiUWCbSjBlYDLT3BZLQ0LezHLRQptbvcWKVoZgO/1nfL3QdJnELENx
         uZo6q4KS/pSXQoWTGFFFs/Iwd00488BwE2jYUxUhKy0A5m2hxIZCMugq3m3fKvXyU4hd
         UvcOA46uGyTm1frkwoPMl1Nz9R+QW7XDZ0LCIKaAvgFqoWV43VmLdj1hxI3PgalC2VPn
         eVzvgSP/lXBUrvUza+zEyy49aTLpElNhYCYDmlY+HnY0Tvsg/kNNAyhX8L3TvvRXq0bz
         9ZJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769416120; x=1770020920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq+fCPk8KJ9iRXfyMvxZCksWGZNw2PsDH5Tkw+tm140=;
        b=YqR7F3a5kyBZA/XtpwJ9JQYSg3ti/PGmcze3A3/vHEdkHTUQqQFi3NlTxvJ7+bGLBY
         aPbt7JtiOK+CHe5kfDckuuhJuXrSgHMqX253lfZVF4BpOAdkLBfux1UDG5uOW6ofa/20
         UL86lA9949jJ+s+ORz+pldDfuFhwbi49mIizvs4bW9xKxaWZk7+3jCnryFhb7PPcoXEd
         2z3tjl6pmrUIrAMMn3vJPyB8sb+j2b2fsRd6QnaY2aK7ptNGEZ78eO4XX0oFlktBcRBV
         3czRV04Pn+nBoGsaYnPST6g8SpS1A4hpUePYZcuts7qKD0RaSq4+qP95FUu2ZPk+O6Ml
         sUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416120; x=1770020920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cq+fCPk8KJ9iRXfyMvxZCksWGZNw2PsDH5Tkw+tm140=;
        b=wxeDPgXX43jAS3OSlzQI3e4kmDov023eXGYOq5By3XPzo8ildBeGKBXBqWn/JRS+4o
         oG0RriQH0PkmglGSiDEgBmN/485w8hp54N7JrW6vgisM7XerYQIIEr0p8CQc5dyIi+81
         pr73qX1rJSSNPnMC8mRCWo495kqYwVSSvJ47C84ZCkY4rvjuLyxwwct1q2RkZHLshpGb
         eN04U+Akw3bF3bn4rJJvC3avwEh05lA89HLMvoREt/Z7u/fZ5kW94Q5UAfMJQWDDm0sm
         SSQV4k8lePGYGqJkjKv8+nQL77WUqBB3he7yghX3wxq0GWxuD1CzyQ4b338uXXllABoc
         aRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkzZmD+q2DrlCKPgC6y2NGSCxXzVdD9JJYl7bOLblHh4bXQwL92EyftnYVh2NBdbETu8QZ+YEb2j/HEz/9@lists.linux.dev
X-Gm-Message-State: AOJu0YwU8rG+1o2KQGixjeQppA16CRjCDBbuhp1v5GglzfDbCyXUj5GV
	Z9t9t8cv11ia8akUg1A3hXoFSpodwTIOUMhNIeFwEisLbX55S6/sUvmi47RIC1O4UrmGYp6f7LG
	ljMSBHsd8gbZg7xLrySwBQ8BT9RIU8jg=
X-Gm-Gg: AZuq6aLVVTg/vvCwwDnfbnmcLELlethtSuZbAqmuXY/foR6hH4Gf7Vr9YaUJOXRuRSj
	zCoylCUTy7r93UOgVZx/XOrxuMFh+kgEV6QMxFsoyg7NtuTiiZzt9e58iDCelBRTN9LL9YjHVqt
	toMSfqiMoqc12/wMHNnk+jHTTOgsKC4diK62duACLyX5z9vE+soxHPMjzg/DT3B26oYQ0klAhkZ
	Rq5LXXhwcP11T/tf1+aVZex6NdwseV8wICjHmcoOAx/FC3d7rUeL+57PfPZGDy9mzXqP0CMuHYU
	rf4x+vAA+FzTu+AAikcr2rUYMFk=
X-Received: by 2002:a17:907:745:b0:b88:5158:d10e with SMTP id
 a640c23a62f3a-b8d3f9fbc54mr259128766b.21.1769416120083; Mon, 26 Jan 2026
 00:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126-swap-table-p3-v1-6-a74155fab9b0@tencent.com> <202601261555.3oBvFZIt-lkp@intel.com>
In-Reply-To: <202601261555.3oBvFZIt-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 26 Jan 2026 16:28:02 +0800
X-Gm-Features: AZwV_Qgonn_1_M6o2-084NZVOdJiyhj0M59xAlSN4R8mXMx23SHqrmLkmWC0ORo
Message-ID: <CAMgjq7A3PP6H4_OAq+_rdKCa1h8zjbzO2nHXxo_kSrLTCirvWA@mail.gmail.com>
Subject: Re: [PATCH 06/12] mm, swap: implement helpers for reserving data in
 the swap table
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 3:16=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kairui,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 10de4550639e9df9242e32e9affc90ed75a27c7d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swa=
p-protect-si-swap_file-properly-and-use-as-a-mount-indicator/20260126-02014=
9
> base:   10de4550639e9df9242e32e9affc90ed75a27c7d
> patch link:    https://lore.kernel.org/r/20260126-swap-table-p3-v1-6-a741=
55fab9b0%40tencent.com
> patch subject: [PATCH 06/12] mm, swap: implement helpers for reserving da=
ta in the swap table
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/2026012=
6/202601261555.3oBvFZIt-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260126/202601261555.3oBvFZIt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601261555.3oBvFZIt-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from <command-line>:
>    In function 'pfn_to_swp_tb',
>        inlined from 'folio_to_swp_tb' at mm/swap_table.h:115:9,
>        inlined from '__swap_cache_add_folio' at mm/swap_state.c:151:11:
> >> include/linux/compiler_types.h:631:45: error: call to '__compiletime_a=
ssert_601' declared with attribute error: BUILD_BUG_ON failed: SWAP_CACHE_P=
FN_BITS > (BITS_PER_LONG - SWP_TB_PFN_MARK_BITS - SWP_TB_COUNT_BITS)

So IIUC ARC may have MAX_POSSIBLE_PHYSMEM_BITS =3D=3D 40 with PAGE_SHIFT
=3D=3D 13, BITS_PER_LONG =3D=3D 32. So SWAP_CACHE_PFN_BITS has to be shrunk=
 to
3 on that arch (Currently SWAP_CACHE_PFN_BITS =3D=3D 4). That is
acceptable, swap count value beyond (1 << 3) is still offloaded to the
extended table just fine and that's the unlikely case.

I'll update the macro definitions to let SWAP_CACHE_PFN_BITS shrink
automatically when there are not enough bits, and trigger a build
error if SWAP_CACHE_PFN_BITS <=3D 1, and test the ARC build.
