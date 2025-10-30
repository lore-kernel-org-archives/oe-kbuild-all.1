Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4384732C944
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 05:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761801944; cv=none; b=IzlZVRJXKFEIs394jGRNFJU1w287DmR40RWYm6y/3nyleH9YMEbwCRvClkEph3XjDqrYaED47oGNpPhKlbjw7E9DXseY5+5w50c/2GZyXzx3/RDb9ukl/sWlcJT+gFxEfNygqf7P+cC5dEcu6Yem3+UzbLBFHCaxsq8i91s6p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761801944; c=relaxed/simple;
	bh=GpxJRWhQ3eXHwdU9ZgpR7Yuo3ekC6UL+YpfvAE70JCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5nizreEMSbJFwNbCPbbf8nGyPED+l2DBwAR+SGrgHRvEgf6zXcWeBKi3JNpv4iPiRw9tvyPUfhQWJpek04cJZLbzgbSWWg3Igqd2q84MQm3URn+VSi7b/xL5a0w2H6K3Zd5nLSmcWgWQvyoaM9NFD2HB5Ws7IrgyS/hFTwB8C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rdtohea0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rdtohea0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e9d633b78so164438566b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 22:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761801940; x=1762406740; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfysZUiKw0ccehvHsLCa5x6Zv8Uvqd+yTXJjIb1Wj5Q=;
        b=Rdtohea0wIk9zQOnqorQkNBWPN9+KhKS6J0F30aB3qWvy03F+9XuMzqH2/a10+Yw2z
         G8FjT8oFdQVj6f2ZxEywO7AaVmvIpMhla1rtKgX2qtKRPgqmtZYj14hZhmjJx4B+RuVH
         bNhQqnzL/2m1aWZoYSibPQbKGfKHlH2iPr+PYhH9ciyTnhfQqqmIrsWJq1MU0GgFuTrn
         +UEvjn8PAkQkzpE/Ceh2G0X7LPA1iMA8zFc4Vi9noQMtpNgPrY2+KjcbJWKfsDUqy5Sz
         p3U6i5YQQkIiNfc5r1fG7R26lEaC+tCPk9+f+5cYLcd/uMupYq2ZfwD8/ifTGisg4RlF
         S5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761801940; x=1762406740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfysZUiKw0ccehvHsLCa5x6Zv8Uvqd+yTXJjIb1Wj5Q=;
        b=T35Yc7XfHmoohF8WwElosnh7VcD69IEZ6fqhHh+gVchax58JW0KRDNr6HN+mMqLFjH
         7GNGQpST0sYHAzT3CJwQcPd1L4kb9pR+iQ/qvgJ0GsSF/tiIqa2JWASyf+ISBaTrdUsA
         3qegnyuB+NwTqANyGslK6z9j5P0a/c2BZbY5cD45R2Ik7I9XBQabQZ5qtlQ0Kj6PbNhv
         y/j9kKBE6JKbPlfjR5Tg4oCXMyq3Krq1cHdb3rJCOJm8G5IV3LtNMmue/25u2Dp45yjE
         4QCIh3OypuQqO4CekYpNZZ4qqTCDKowPBDhiAhH1P1yuYd3YO/tj1clcTSTUxSXgqmfq
         UZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWb9JZEjTndQmViGnekwlfde5lX5PSxDJnjzpUG2wdqCEJ2VQ6htf/q6aZYIlqadq/TdoaCMMVLKnfWfP/d@lists.linux.dev
X-Gm-Message-State: AOJu0YwslJBA/7U/ddwS/yZ9coE62KoK3WbUR91PHCtHRT/GNBg+tTmM
	J0MYvJuG/62CYR4ohg32YrdXl1o7tt7p6towasnW3WTaHG5sUim9+TvoT6HuKet5aiCoJzqefdi
	h13RN0QHe9T/c2UxHiTiXRLRbe0Jz69E=
X-Gm-Gg: ASbGnctNN6Y6yV7OUeKR5FBnS7LOIegbQ/uK6QC9fOKeSMpVWh5YQIzneGY1SKOMDsn
	K/EPgXpxBBUi4zFGA7/yFh4eZn3kcj92OQUqnRpUle94VfrssGmwShwebcE7v+G5yzQidEC9P03
	nqcUg+sezLVimCtEo+iW8fIRSu+uyC14/D9cWHK9gTUAKJkoaNcamPPsZCr7PFKj4ByGmJgEjkY
	qwyrN8fmEzktNOLuG3bBRynp2jV3lq52Un6IiJ9BhyP5nJFP3ck4OPBhRGryiwF
X-Google-Smtp-Source: AGHT+IHNyXHD9tuJVWmX0HGoxsmgdCXdnVfsLSRiQVKCm3qLDQttk267xLovDM2ICaKjf/7vxbQtpUFH3F3g94OPSSs=
X-Received: by 2002:a17:907:7f94:b0:b3d:e757:8c36 with SMTP id
 a640c23a62f3a-b7051f28d17mr219852766b.3.1761801940298; Wed, 29 Oct 2025
 22:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029-swap-table-p2-v1-14-3d43f3b6ec32@tencent.com> <202510300316.UL4gxAlC-lkp@intel.com>
In-Reply-To: <202510300316.UL4gxAlC-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 30 Oct 2025 13:25:03 +0800
X-Gm-Features: AWmQ_bn7Lyv0bXlIQEUl3x-IuvN0KJgIKA5RqyN4TyJ6a-kvBKh6n54oDVlmgZo
Message-ID: <CAMgjq7DcxG_8q9Kzwg-4kLBXw8eN8DvwmSR0gRUjYWPoFH8xsw@mail.gmail.com>
Subject: Re: [PATCH 14/19] mm, swap: sanitize swap entry management workflow
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	David Hildenbrand <david@redhat.com>, Youngjun Park <youngjun.park@lge.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 3:30=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kairui,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on f30d294530d939fa4b77d61bc60f25c4284841fa]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swa=
p-rename-__read_swap_cache_async-to-swap_cache_alloc_folio/20251030-000506
> base:   f30d294530d939fa4b77d61bc60f25c4284841fa
> patch link:    https://lore.kernel.org/r/20251029-swap-table-p2-v1-14-3d4=
3f3b6ec32%40tencent.com
> patch subject: [PATCH 14/19] mm, swap: sanitize swap entry management wor=
kflow
> config: i386-allnoconfig (https://download.01.org/0day-ci/archive/2025103=
0/202510300316.UL4gxAlC-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251030/202510300316.UL4gxAlC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510300316.UL4gxAlC-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/vmscan.c:70:
>    mm/swap.h: In function 'swap_cache_add_folio':
>    mm/swap.h:465:1: warning: no return statement in function returning no=
n-void [-Wreturn-type]
>      465 | }
>          | ^
>    mm/vmscan.c: In function 'shrink_folio_list':
> >> mm/vmscan.c:1298:37: error: too few arguments to function 'folio_alloc=
_swap'
>     1298 |                                 if (folio_alloc_swap(folio)) {
>          |                                     ^~~~~~~~~~~~~~~~
>    mm/swap.h:388:19: note: declared here
>      388 | static inline int folio_alloc_swap(struct folio *folio, gfp_t =
gfp)
>          |                   ^~~~~~~~~~~~~~~~
>    mm/vmscan.c:1314:45: error: too few arguments to function 'folio_alloc=
_swap'
>     1314 |                                         if (folio_alloc_swap(f=
olio))
>          |                                             ^~~~~~~~~~~~~~~~
>    mm/swap.h:388:19: note: declared here
>      388 | static inline int folio_alloc_swap(struct folio *folio, gfp_t =
gfp)
>          |                   ^~~~~~~~~~~~~~~~
> --
>    In file included from mm/shmem.c:44:
>    mm/swap.h: In function 'swap_cache_add_folio':
>    mm/swap.h:465:1: warning: no return statement in function returning no=
n-void [-Wreturn-type]
>      465 | }
>          | ^
>    mm/shmem.c: In function 'shmem_writeout':
> >> mm/shmem.c:1649:14: error: too few arguments to function 'folio_alloc_=
swap'
>     1649 |         if (!folio_alloc_swap(folio)) {
>          |              ^~~~~~~~~~~~~~~~
>    mm/swap.h:388:19: note: declared here
>      388 | static inline int folio_alloc_swap(struct folio *folio, gfp_t =
gfp)
>          |                   ^~~~~~~~~~~~~~~~
>

Thanks, I forgot to update the empty place holder for folio_alloc_swap
during rebase:

diff --git a/mm/swap.h b/mm/swap.h
index 74c61129d7b7..9aa99061573a 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -385,7 +385,7 @@ static inline struct swap_info_struct
*__swap_entry_to_info(swp_entry_t entry)
        return NULL;
 }

-static inline int folio_alloc_swap(struct folio *folio, gfp_t gfp)
+static inline int folio_alloc_swap(struct folio *folio)
 {
        return -EINVAL;
 }
