Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6413665A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355612; cv=none; b=iq0YpAf2RM4dBfJ3l3Q3Yoh7v7FSgkXzgZFBVaI/efZeC5WlSca3M02mw4al/jquOjf6hXAOMkytJAk2DTASZQHVeQ26G431JxSIHhLvrC4LqfUhnRpuTUhBjuNw/tDacOLfcWm/Pzib6o5MWnHrkUAGPbNFvBuDZ+2lwHyozJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355612; c=relaxed/simple;
	bh=qJ0CMrgVB3TJ9ntKbrbp2fN866WWzCW05ihvPG5c2QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDyczxSfHEQ1xbWTBNY0YlZH19f3tFDjsdmgSfCdwZ7aWvxggc8fpsz1mAyMs6cJwdLyblAC1TFV8f3eKs6D6bOcqvf5VBBBm65X5Mlbhj9VxcwiEgWBOgB/SwyI9gpzQ6+lCwSqArVJUbK442wja5AJOVyhXvG39gY4mOBC4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Emdrv+eT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Emdrv+eT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so2035780a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718355608; x=1718960408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ozy7u2aSwMg61TCq9E1ejy9IPcC9RTdUbAIloxoWJQ=;
        b=Emdrv+eTzaMcxN5xcvK04GvwXZIaP+5otyZujY0WImaEeRYOYCrD6e+VLEJvYFqNAS
         jnUxIgvfpNx2dTwwMfdZCOFjqNuFXKRHzv+8eeCqcXIEwltuY5ymIjEFrTTHf6+VD+ow
         Y5CIg/4wi9ZAWqWh3cDT1H0T2bwOKedDhCbYm+S+yJAevMbEE7+5DIysTEnu3aP2kX/E
         8Q99hPHvHSnjv7cunQKqsX6eAdDYHgMyR8f/X63b2e4a62FZZ/h6/NUHnmtbPlPm0q1n
         tADZALg1htrSJwJlo+1quYvYq3zH19zB6D04q+hPZXW5uNBotopOgl6DnGo25ISBUhOc
         TFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718355608; x=1718960408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ozy7u2aSwMg61TCq9E1ejy9IPcC9RTdUbAIloxoWJQ=;
        b=l/M+0IgUG7ogFLqeKIQE5Pfi8GRGvbq1K3eqnnqgzuX7Q/vkeZnbBxxKQx70/9WTNz
         Yw/0gT/J4Lr6PglP7MQAEAnCdxTbC9PcCR/pd8FYczBb8gXoA4geBM9RSEoOWZvR9lrD
         /vyHkJeG9xg3p5nvUVmRDqB75Eu5ydRXhIxjP/+SoPGI8FziC9e51CpIXaL4aHJ0WbHp
         /nxFeyb0PEX70N/ovuJRfo/5a2HQTkAHkpxfoYoTA/jD1SeRYaiP8ZKc2bT82AOTvCmy
         HG+jsPqD6Fz17FVmSrkwnZi77Udv4B0Nd2wERK5/of5BnTwzEqRHUyKj9cVMASzLFKC3
         hHqw==
X-Gm-Message-State: AOJu0YyiAROijKNootYP4qcvKl08MYlmmRu9NMiASPRiT7nlGwgHtaOC
	vpx5ZmWWPle4cW1GC9l89DZtGTwNws5XrL4cKgcomBixiiZxbVWD57/Jwu7z/8m/9G4VuTFqaDu
	jISnfUkEsN9jqbygLYGkGvKRD3Bdkzunj
X-Google-Smtp-Source: AGHT+IEv/+L1MwFTynk3dSigtgzGF85q0aD7iHdas2CuGHNgeEW3RvoUN9Pn1WJaHxJjsdpvL50BHYzWhjoeg86oZkk=
X-Received: by 2002:a50:9b48:0:b0:57c:7676:ea4d with SMTP id
 4fb4d7f45d1cf-57cbd682be9mr1332840a12.13.1718355607815; Fri, 14 Jun 2024
 02:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406141650.B5cBNrbw-lkp@intel.com>
In-Reply-To: <202406141650.B5cBNrbw-lkp@intel.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 14 Jun 2024 16:59:56 +0800
Message-ID: <CAK1f24nhnY9-Fk9G8x7BPELubHzxO+Pz-Voq17P152o8u+KYWg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 201/281] mm/rmap.c:1635:14: warning:
 variable 'pmd_mapped' set but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This issue appeared in the v7[1], but it has been fixed in the v8[2],
so there's no need for concern.

[1] https://lore.kernel.org/linux-mm/20240610120809.66601-1-ioworker0@gmail=
.com
[2] https://lore.kernel.org/linux-mm/20240614015138.31461-4-ioworker0@gmail=
.com

Thanks,
Lance

On Fri, Jun 14, 2024 at 4:37=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   8d0a686ea94347949eb0b689bb2a7c6028c0fa28
> commit: fa687ca2801a5b5ec92912abc362507242fd5cbc [201/281] mm-vmscan-avoi=
d-split-lazyfree-thp-during-shrink_folio_list-fix
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/202=
40614/202406141650.B5cBNrbw-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240614/202406141650.B5cBNrbw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406141650.B5cBNrbw-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/rmap.c: In function 'try_to_unmap_one':
> >> mm/rmap.c:1635:14: warning: variable 'pmd_mapped' set but not used [-W=
unused-but-set-variable]
>     1635 |         bool pmd_mapped =3D false;
>          |              ^~~~~~~~~~
>
>
> vim +/pmd_mapped +1635 mm/rmap.c
>
> b06dc281aa99010 David Hildenbrand          2023-12-20  1619
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1620  /*
> 52629506420ce32 Joonsoo Kim                2014-01-21  1621   * @arg: enu=
m ttu_flags will be passed to this argument
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1622   */
> 2f031c6f042cb8a Matthew Wilcox (Oracle     2022-01-29  1623) static bool =
try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> 52629506420ce32 Joonsoo Kim                2014-01-21  1624              =
    unsigned long address, void *arg)
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1625  {
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1626     struct mm=
_struct *mm =3D vma->vm_mm;
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1627)    DEFINE_FO=
LIO_VMA_WALK(pvmw, folio, vma, address, 0);
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1628     pte_t pte=
val;
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1629     struct pa=
ge *subpage;
> 6c287605fd56466 David Hildenbrand          2022-05-09  1630     bool anon=
_exclusive, ret =3D true;
> ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse              2018-12-28  1631    =
 struct mmu_notifier_range range;
> 4708f31885a0d3e Palmer Dabbelt             2020-04-06  1632     enum ttu_=
flags flags =3D (enum ttu_flags)(long)arg;
> c33c794828f2121 Ryan Roberts               2023-06-12  1633     unsigned =
long pfn;
> 935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1634     unsigned =
long hsz =3D 0;
> 87b8388b6693bea Lance Yang                 2024-06-10 @1635     bool pmd_=
mapped =3D false;
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1636
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1637     /*
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1638      * When r=
acing against e.g. zap_pte_range() on another cpu,
> ca1a0746182c3c0 David Hildenbrand          2023-12-20  1639      * in bet=
ween its ptep_get_and_clear_full() and folio_remove_rmap_*(),
> 1fb08ac63beedf5 Yang Shi                   2021-06-30  1640      * try_to=
_unmap() may return before page_mapped() has become false,
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1641      * if pag=
e table locking is skipped: use TTU_SYNC to wait for that.
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1642      */
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1643     if (flags=
 & TTU_SYNC)
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1644             p=
vmw.flags =3D PVMW_SYNC;
> 732ed55823fc3ad Hugh Dickins               2021-06-15  1645
> 369ea8242c0fb52 J=C3=A9r=C3=B4me Glisse              2017-08-31  1646    =
 /*
> 017b1660df89f5f Mike Kravetz               2018-10-05  1647      * For TH=
P, we have to assume the worse case ie pmd for invalidation.
> 017b1660df89f5f Mike Kravetz               2018-10-05  1648      * For hu=
getlb, it could be much worse if we need to do pud
> 017b1660df89f5f Mike Kravetz               2018-10-05  1649      * invali=
dation in the case of pmd sharing.
> 017b1660df89f5f Mike Kravetz               2018-10-05  1650      *
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1651)     * Note t=
hat the folio can not be freed in this function as call of
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1652)     * try_to=
_unmap() must hold a reference on the folio.
> 369ea8242c0fb52 J=C3=A9r=C3=B4me Glisse              2017-08-31  1653    =
  */
> 2aff7a4755bed28 Matthew Wilcox (Oracle     2022-02-03  1654)    range.end=
 =3D vma_address_end(&pvmw);
> 7d4a8be0c4b2b7f Alistair Popple            2023-01-10  1655     mmu_notif=
ier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
> 494334e43c16d63 Hugh Dickins               2021-06-15  1656              =
               address, range.end);
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1657)    if (folio=
_test_hugetlb(folio)) {
> 017b1660df89f5f Mike Kravetz               2018-10-05  1658             /=
*
> 017b1660df89f5f Mike Kravetz               2018-10-05  1659              =
* If sharing is possible, start and end will be adjusted
> 017b1660df89f5f Mike Kravetz               2018-10-05  1660              =
* accordingly.
> 017b1660df89f5f Mike Kravetz               2018-10-05  1661              =
*/
> ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse              2018-12-28  1662    =
         adjust_range_if_pmd_sharing_possible(vma, &range.start,
> ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse              2018-12-28  1663    =
                                              &range.end);
> 935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1664
> 935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1665             /=
* We need the huge page size for set_huge_pte_at() */
> 935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1666             h=
sz =3D huge_page_size(hstate_vma(vma));
> 017b1660df89f5f Mike Kravetz               2018-10-05  1667     }
> ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse              2018-12-28  1668    =
 mmu_notifier_invalidate_range_start(&range);
> 369ea8242c0fb52 J=C3=A9r=C3=B4me Glisse              2017-08-31  1669
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1670     while (pa=
ge_vma_mapped_walk(&pvmw)) {
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1671             /=
*
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1672)             =
* If the folio is in an mlock()d vma, we must not swap it out.
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1673              =
*/
> efdb6720b44b2f0 Hugh Dickins               2021-07-11  1674             i=
f (!(flags & TTU_IGNORE_MLOCK) &&
> efdb6720b44b2f0 Hugh Dickins               2021-07-11  1675              =
   (vma->vm_flags & VM_LOCKED)) {
> cea86fe246b694a Hugh Dickins               2022-02-14  1676              =
       /* Restore the mlock which got missed */
> 1acbc3f936146d1 Yin Fengwei                2023-09-18  1677              =
       if (!folio_test_large(folio))
> 1acbc3f936146d1 Yin Fengwei                2023-09-18  1678              =
               mlock_vma_folio(folio, vma);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1679              =
       goto walk_done_err;
> b87537d9e2feb30 Hugh Dickins               2015-11-05  1680             }
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1681
> 87b8388b6693bea Lance Yang                 2024-06-10  1682             i=
f (!pvmw.pte) {
> 87b8388b6693bea Lance Yang                 2024-06-10  1683              =
       pmd_mapped =3D true;
> 87b8388b6693bea Lance Yang                 2024-06-10  1684              =
       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
> 87b8388b6693bea Lance Yang                 2024-06-10  1685              =
                                 folio))
> 87b8388b6693bea Lance Yang                 2024-06-10  1686              =
               goto walk_done;
> 87b8388b6693bea Lance Yang                 2024-06-10  1687
> 87b8388b6693bea Lance Yang                 2024-06-10  1688              =
       if (flags & TTU_SPLIT_HUGE_PMD) {
> df0f2ce432be374 Lance Yang                 2024-06-10  1689              =
               /*
> 87b8388b6693bea Lance Yang                 2024-06-10  1690              =
                * We temporarily have to drop the PTL and start
> 87b8388b6693bea Lance Yang                 2024-06-10  1691              =
                * once again from that now-PTE-mapped page
> 87b8388b6693bea Lance Yang                 2024-06-10  1692              =
                * table.
> df0f2ce432be374 Lance Yang                 2024-06-10  1693              =
                */
> 87b8388b6693bea Lance Yang                 2024-06-10  1694              =
               split_huge_pmd_locked(vma, pvmw.address,
> 87b8388b6693bea Lance Yang                 2024-06-10  1695              =
                                     pvmw.pmd, false, folio);
> df0f2ce432be374 Lance Yang                 2024-06-10  1696              =
               flags &=3D ~TTU_SPLIT_HUGE_PMD;
> df0f2ce432be374 Lance Yang                 2024-06-10  1697              =
               page_vma_mapped_walk_restart(&pvmw);
> df0f2ce432be374 Lance Yang                 2024-06-10  1698              =
               continue;
> df0f2ce432be374 Lance Yang                 2024-06-10  1699              =
       }
> 87b8388b6693bea Lance Yang                 2024-06-10  1700             }
> df0f2ce432be374 Lance Yang                 2024-06-10  1701
> df0f2ce432be374 Lance Yang                 2024-06-10  1702             /=
* Unexpected PMD-mapped THP? */
> df0f2ce432be374 Lance Yang                 2024-06-10  1703             V=
M_BUG_ON_FOLIO(!pvmw.pte, folio);
> df0f2ce432be374 Lance Yang                 2024-06-10  1704
> c33c794828f2121 Ryan Roberts               2023-06-12  1705             p=
fn =3D pte_pfn(ptep_get(pvmw.pte));
> c33c794828f2121 Ryan Roberts               2023-06-12  1706             s=
ubpage =3D folio_page(folio, pfn - folio_pfn(folio));
> 785373b4c38719f Linus Torvalds             2017-08-29  1707             a=
ddress =3D pvmw.address;
> 6c287605fd56466 David Hildenbrand          2022-05-09  1708             a=
non_exclusive =3D folio_test_anon(folio) &&
> 6c287605fd56466 David Hildenbrand          2022-05-09  1709              =
                PageAnonExclusive(subpage);
> 785373b4c38719f Linus Torvalds             2017-08-29  1710
> dfc7ab57560da38 Baolin Wang                2022-05-09  1711             i=
f (folio_test_hugetlb(folio)) {
> 0506c31d0a8443a Baolin Wang                2022-06-20  1712              =
       bool anon =3D folio_test_anon(folio);
> 0506c31d0a8443a Baolin Wang                2022-06-20  1713
> a00a875925a418b Baolin Wang                2022-05-13  1714              =
       /*
> a00a875925a418b Baolin Wang                2022-05-13  1715              =
        * The try_to_unmap() is only passed a hugetlb page
> a00a875925a418b Baolin Wang                2022-05-13  1716              =
        * in the case where the hugetlb page is poisoned.
> a00a875925a418b Baolin Wang                2022-05-13  1717              =
        */
> a00a875925a418b Baolin Wang                2022-05-13  1718              =
       VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
> 017b1660df89f5f Mike Kravetz               2018-10-05  1719              =
       /*
> 54205e9c5425049 Baolin Wang                2022-05-09  1720              =
        * huge_pmd_unshare may unmap an entire PMD page.
> 54205e9c5425049 Baolin Wang                2022-05-09  1721              =
        * There is no way of knowing exactly which PMDs may
> 54205e9c5425049 Baolin Wang                2022-05-09  1722              =
        * be cached for this mm, so we must flush them all.
> 54205e9c5425049 Baolin Wang                2022-05-09  1723              =
        * start/end were already adjusted above to cover this
> 54205e9c5425049 Baolin Wang                2022-05-09  1724              =
        * range.
> 017b1660df89f5f Mike Kravetz               2018-10-05  1725              =
        */
> ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse              2018-12-28  1726    =
                 flush_cache_range(vma, range.start, range.end);
> 54205e9c5425049 Baolin Wang                2022-05-09  1727
> dfc7ab57560da38 Baolin Wang                2022-05-09  1728              =
       /*
> dfc7ab57560da38 Baolin Wang                2022-05-09  1729              =
        * To call huge_pmd_unshare, i_mmap_rwsem must be
> dfc7ab57560da38 Baolin Wang                2022-05-09  1730              =
        * held in write mode.  Caller needs to explicitly
> dfc7ab57560da38 Baolin Wang                2022-05-09  1731              =
        * do this outside rmap routines.
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1732              =
        *
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1733              =
        * We also must hold hugetlb vma_lock in write mode.
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1734              =
        * Lock order dictates acquiring vma_lock BEFORE
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1735              =
        * i_mmap_rwsem.  We can only try lock here and fail
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1736              =
        * if unsuccessful.
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1737              =
        */
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1738              =
       if (!anon) {
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1739              =
               VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1740              =
               if (!hugetlb_vma_trylock_write(vma))
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1741              =
                       goto walk_done_err;
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1742              =
               if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1743              =
                       hugetlb_vma_unlock_write(vma);
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1744              =
                       flush_tlb_range(vma,
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1745              =
                               range.start, range.end);
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1746              =
                       /*
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1747              =
                        * The ref count of the PMD page was
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1748              =
                        * dropped which is part of the way map
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1749              =
                        * counting is done for shared PMDs.
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1750              =
                        * Return 'true' here.  When there is
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1751              =
                        * no other sharing, huge_pmd_unshare
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1752              =
                        * returns false and we will unmap the
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1753              =
                        * actual page and drop map count
> 017b1660df89f5f Mike Kravetz               2018-10-05  1754              =
                        * to zero.
> 017b1660df89f5f Mike Kravetz               2018-10-05  1755              =
                        */
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1756              =
                       goto walk_done;
> 017b1660df89f5f Mike Kravetz               2018-10-05  1757              =
               }
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1758              =
               hugetlb_vma_unlock_write(vma);
> 40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1759              =
       }
> a00a875925a418b Baolin Wang                2022-05-13  1760              =
       pteval =3D huge_ptep_clear_flush(vma, address, pvmw.pte);
> 54205e9c5425049 Baolin Wang                2022-05-09  1761             }=
 else {
> c33c794828f2121 Ryan Roberts               2023-06-12  1762              =
       flush_cache_page(vma, address, pfn);
> 088b8aa537c2c76 David Hildenbrand          2022-09-01  1763              =
       /* Nuke the page table entry. */
> 088b8aa537c2c76 David Hildenbrand          2022-09-01  1764              =
       if (should_defer_flush(mm, flags)) {
> 72b252aed506b8f Mel Gorman                 2015-09-04  1765              =
               /*
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1766              =
                * We clear the PTE but do not flush so potentially
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1767)             =
                * a remote CPU could still be writing to the folio.
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1768              =
                * If the entry was previously clean then the
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1769              =
                * architecture must guarantee that a clear->dirty
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1770              =
                * transition on a cached TLB entry is written through
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1771              =
                * and traps if the PTE is unmapped.
> 72b252aed506b8f Mel Gorman                 2015-09-04  1772              =
                */
> 785373b4c38719f Linus Torvalds             2017-08-29  1773              =
               pteval =3D ptep_get_and_clear(mm, address, pvmw.pte);
> 72b252aed506b8f Mel Gorman                 2015-09-04  1774
> f73419bb89d606d Barry Song                 2023-07-17  1775              =
               set_tlb_ubc_flush_pending(mm, pteval, address);
> 72b252aed506b8f Mel Gorman                 2015-09-04  1776              =
       } else {
> 785373b4c38719f Linus Torvalds             2017-08-29  1777              =
               pteval =3D ptep_clear_flush(vma, address, pvmw.pte);
> 72b252aed506b8f Mel Gorman                 2015-09-04  1778              =
       }
> a00a875925a418b Baolin Wang                2022-05-13  1779             }
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1780
> 999dad824c39ed1 Peter Xu                   2022-05-12  1781             /=
*
> 999dad824c39ed1 Peter Xu                   2022-05-12  1782              =
* Now the pte is cleared. If this pte was uffd-wp armed,
> 999dad824c39ed1 Peter Xu                   2022-05-12  1783              =
* we may want to replace a none pte with a marker pte if
> 999dad824c39ed1 Peter Xu                   2022-05-12  1784              =
* it's file-backed, so we don't lose the tracking info.
> 999dad824c39ed1 Peter Xu                   2022-05-12  1785              =
*/
> 999dad824c39ed1 Peter Xu                   2022-05-12  1786             p=
te_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
> 999dad824c39ed1 Peter Xu                   2022-05-12  1787
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1788)            /=
* Set the dirty flag on the folio now the pte is gone. */
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1789             i=
f (pte_dirty(pteval))
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1790)             =
       folio_mark_dirty(folio);
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1791
> 365e9c87a982c03 Hugh Dickins               2005-10-29  1792             /=
* Update high watermark before we lower rss */
> 365e9c87a982c03 Hugh Dickins               2005-10-29  1793             u=
pdate_hiwater_rss(mm);
> 365e9c87a982c03 Hugh Dickins               2005-10-29  1794
> 6da6b1d4a7df8c3 Naoya Horiguchi            2023-02-21  1795             i=
f (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
> 5fd27b8e7dbcab0 Punit Agrawal              2017-07-06  1796              =
       pteval =3D swp_entry_to_pte(make_hwpoison_entry(subpage));
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1797)             =
       if (folio_test_hugetlb(folio)) {
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1798)             =
               hugetlb_count_sub(folio_nr_pages(folio), mm);
> 935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1799              =
               set_huge_pte_at(mm, address, pvmw.pte, pteval,
> 935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1800              =
                               hsz);
> 5d317b2b6536592 Naoya Horiguchi            2015-11-05  1801              =
       } else {
> a23f517b0e15544 Kefeng Wang                2024-01-11  1802              =
               dec_mm_counter(mm, mm_counter(folio));
> 785373b4c38719f Linus Torvalds             2017-08-29  1803              =
               set_pte_at(mm, address, pvmw.pte, pteval);
> 5f24ae585be9856 Naoya Horiguchi            2012-12-12  1804              =
       }
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1805
> bce73e4842390f7 Christian Borntraeger      2018-07-13  1806             }=
 else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
> 45961722f8e30ce Konstantin Weitz           2013-04-17  1807              =
       /*
> 45961722f8e30ce Konstantin Weitz           2013-04-17  1808              =
        * The guest indicated that the page content is of no
> 45961722f8e30ce Konstantin Weitz           2013-04-17  1809              =
        * interest anymore. Simply discard the pte, vmscan
> 45961722f8e30ce Konstantin Weitz           2013-04-17  1810              =
        * will take care of the rest.
> bce73e4842390f7 Christian Borntraeger      2018-07-13  1811              =
        * A future reference will then fault in a new zero
> bce73e4842390f7 Christian Borntraeger      2018-07-13  1812              =
        * page. When userfaultfd is active, we must not drop
> bce73e4842390f7 Christian Borntraeger      2018-07-13  1813              =
        * this page though, as its main user (postcopy
> bce73e4842390f7 Christian Borntraeger      2018-07-13  1814              =
        * migration) will not expect userfaults on already
> bce73e4842390f7 Christian Borntraeger      2018-07-13  1815              =
        * copied pages.
> 45961722f8e30ce Konstantin Weitz           2013-04-17  1816              =
        */
> a23f517b0e15544 Kefeng Wang                2024-01-11  1817              =
       dec_mm_counter(mm, mm_counter(folio));
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1818)            }=
 else if (folio_test_anon(folio)) {
> cfeed8ffe55b37f David Hildenbrand          2023-08-21  1819              =
       swp_entry_t entry =3D page_swap_entry(subpage);
> 179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1820              =
       pte_t swp_pte;
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1821              =
       /*
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1822              =
        * Store the swap location in the pte.
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1823              =
        * See handle_pte_fault() ...
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1824              =
        */
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1825)             =
       if (unlikely(folio_test_swapbacked(folio) !=3D
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1826)             =
                       folio_test_swapcache(folio))) {
> fa687ca2801a5b5 Lance Yang                 2024-06-13  1827              =
               WARN_ON_ONCE(1);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1828              =
               goto walk_done_err;
> eb94a8784427b28 Minchan Kim                2017-05-03  1829              =
       }
> 854e9ed09dedf0c Minchan Kim                2016-01-15  1830
> 802a3a92ad7ac0b Shaohua Li                 2017-05-03  1831              =
       /* MADV_FREE page check */
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1832)             =
       if (!folio_test_swapbacked(folio)) {
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1833              =
               int ref_count, map_count;
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1834
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1835              =
               /*
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1836              =
                * Synchronize with gup_pte_range():
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1837              =
                * - clear PTE; barrier; read refcount
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1838              =
                * - inc refcount; barrier; read PTE
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1839              =
                */
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1840              =
               smp_mb();
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1841
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1842              =
               ref_count =3D folio_ref_count(folio);
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1843              =
               map_count =3D folio_mapcount(folio);
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1844
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1845              =
               /*
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1846              =
                * Order reads for page refcount and dirty flag
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1847              =
                * (see comments in __remove_mapping()).
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1848              =
                */
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1849              =
               smp_rmb();
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1850
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1851              =
               /*
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1852              =
                * The only page refs must be one from isolation
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1853              =
                * plus the rmap(s) (dropped by discard:).
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1854              =
                */
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1855              =
               if (ref_count =3D=3D 1 + map_count &&
> 6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1856              =
                   !folio_test_dirty(folio)) {
> 854e9ed09dedf0c Minchan Kim                2016-01-15  1857              =
                       dec_mm_counter(mm, MM_ANONPAGES);
> 854e9ed09dedf0c Minchan Kim                2016-01-15  1858              =
                       goto discard;
> 854e9ed09dedf0c Minchan Kim                2016-01-15  1859              =
               }
> 854e9ed09dedf0c Minchan Kim                2016-01-15  1860
> 802a3a92ad7ac0b Shaohua Li                 2017-05-03  1861              =
               /*
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1862)             =
                * If the folio was redirtied, it cannot be
> 802a3a92ad7ac0b Shaohua Li                 2017-05-03  1863              =
                * discarded. Remap the page to page table.
> 802a3a92ad7ac0b Shaohua Li                 2017-05-03  1864              =
                */
> 785373b4c38719f Linus Torvalds             2017-08-29  1865              =
               set_pte_at(mm, address, pvmw.pte, pteval);
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1866)             =
               folio_set_swapbacked(folio);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1867              =
               goto walk_done_err;
> 802a3a92ad7ac0b Shaohua Li                 2017-05-03  1868              =
       }
> 802a3a92ad7ac0b Shaohua Li                 2017-05-03  1869
> 570a335b8e22579 Hugh Dickins               2009-12-14  1870              =
       if (swap_duplicate(entry) < 0) {
> 785373b4c38719f Linus Torvalds             2017-08-29  1871              =
               set_pte_at(mm, address, pvmw.pte, pteval);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1872              =
               goto walk_done_err;
> 570a335b8e22579 Hugh Dickins               2009-12-14  1873              =
       }
> ca827d55ebaa24d Khalid Aziz                2018-02-21  1874              =
       if (arch_unmap_one(mm, vma, address, pteval) < 0) {
> 322842ea3c72649 David Hildenbrand          2022-05-09  1875              =
               swap_free(entry);
> ca827d55ebaa24d Khalid Aziz                2018-02-21  1876              =
               set_pte_at(mm, address, pvmw.pte, pteval);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1877              =
               goto walk_done_err;
> ca827d55ebaa24d Khalid Aziz                2018-02-21  1878              =
       }
> 088b8aa537c2c76 David Hildenbrand          2022-09-01  1879
> e3b4b1374f87c71 David Hildenbrand          2023-12-20  1880              =
       /* See folio_try_share_anon_rmap(): clear PTE first. */
> 6c287605fd56466 David Hildenbrand          2022-05-09  1881              =
       if (anon_exclusive &&
> e3b4b1374f87c71 David Hildenbrand          2023-12-20  1882              =
           folio_try_share_anon_rmap_pte(folio, subpage)) {
> 6c287605fd56466 David Hildenbrand          2022-05-09  1883              =
               swap_free(entry);
> 6c287605fd56466 David Hildenbrand          2022-05-09  1884              =
               set_pte_at(mm, address, pvmw.pte, pteval);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1885              =
               goto walk_done_err;
> 6c287605fd56466 David Hildenbrand          2022-05-09  1886              =
       }
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1887              =
       if (list_empty(&mm->mmlist)) {
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1888              =
               spin_lock(&mmlist_lock);
> f412ac08c9861b4 Hugh Dickins               2005-10-29  1889              =
               if (list_empty(&mm->mmlist))
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1890              =
                       list_add(&mm->mmlist, &init_mm.mmlist);
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1891              =
               spin_unlock(&mmlist_lock);
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1892              =
       }
> d559db086ff5be9 KAMEZAWA Hiroyuki          2010-03-05  1893              =
       dec_mm_counter(mm, MM_ANONPAGES);
> b084d4353ff99d8 KAMEZAWA Hiroyuki          2010-03-05  1894              =
       inc_mm_counter(mm, MM_SWAPENTS);
> 179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1895              =
       swp_pte =3D swp_entry_to_pte(entry);
> 1493a1913e34b0a David Hildenbrand          2022-05-09  1896              =
       if (anon_exclusive)
> 1493a1913e34b0a David Hildenbrand          2022-05-09  1897              =
               swp_pte =3D pte_swp_mkexclusive(swp_pte);
> 179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1898              =
       if (pte_soft_dirty(pteval))
> 179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1899              =
               swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
> f45ec5ff16a75f9 Peter Xu                   2020-04-06  1900              =
       if (pte_uffd_wp(pteval))
> f45ec5ff16a75f9 Peter Xu                   2020-04-06  1901              =
               swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
> 785373b4c38719f Linus Torvalds             2017-08-29  1902              =
       set_pte_at(mm, address, pvmw.pte, swp_pte);
> 0f10851ea475e08 J=C3=A9r=C3=B4me Glisse              2017-11-15  1903    =
         } else {
> 0f10851ea475e08 J=C3=A9r=C3=B4me Glisse              2017-11-15  1904    =
                 /*
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1905)             =
        * This is a locked file-backed folio,
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1906)             =
        * so it cannot be removed from the page
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1907)             =
        * cache and replaced by a new folio before
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1908)             =
        * mmu_notifier_invalidate_range_end, so no
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1909)             =
        * concurrent thread might update its page table
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1910)             =
        * to point at a new folio while a device is
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1911)             =
        * still using this folio.
> 0f10851ea475e08 J=C3=A9r=C3=B4me Glisse              2017-11-15  1912    =
                  *
> ee65728e103bb7d Mike Rapoport              2022-06-27  1913              =
        * See Documentation/mm/mmu_notifier.rst
> 0f10851ea475e08 J=C3=A9r=C3=B4me Glisse              2017-11-15  1914    =
                  */
> 6b27cc6c66abf0f Kefeng Wang                2024-01-11  1915              =
       dec_mm_counter(mm, mm_counter_file(folio));
> 0f10851ea475e08 J=C3=A9r=C3=B4me Glisse              2017-11-15  1916    =
         }
> 854e9ed09dedf0c Minchan Kim                2016-01-15  1917  discard:
> e135826b2da0cf2 David Hildenbrand          2023-12-20  1918             i=
f (unlikely(folio_test_hugetlb(folio)))
> e135826b2da0cf2 David Hildenbrand          2023-12-20  1919              =
       hugetlb_remove_rmap(folio);
> e135826b2da0cf2 David Hildenbrand          2023-12-20  1920             e=
lse
> ca1a0746182c3c0 David Hildenbrand          2023-12-20  1921              =
       folio_remove_rmap_pte(folio, subpage, vma);
> b74355078b65542 Hugh Dickins               2022-02-14  1922             i=
f (vma->vm_flags & VM_LOCKED)
> 96f97c438f61ddb Lorenzo Stoakes            2023-01-12  1923              =
       mlock_drain_local();
> 869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1924)            f=
olio_put(folio);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1925             c=
ontinue;
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1926  walk_done_er=
r:
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1927             r=
et =3D false;
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1928  walk_done:
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1929             p=
age_vma_mapped_walk_done(&pvmw);
> 3ee78e6ad3bc52e Lance Yang                 2024-06-10  1930             b=
reak;
> c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1931     }
> 369ea8242c0fb52 J=C3=A9r=C3=B4me Glisse              2017-08-31  1932
> ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse              2018-12-28  1933    =
 mmu_notifier_invalidate_range_end(&range);
> 369ea8242c0fb52 J=C3=A9r=C3=B4me Glisse              2017-08-31  1934
> caed0f486e582ee KOSAKI Motohiro            2009-12-14  1935     return re=
t;
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1936  }
> ^1da177e4c3f415 Linus Torvalds             2005-04-16  1937
>
> :::::: The code at line 1635 was first introduced by commit
> :::::: 87b8388b6693beaad43d5d3f41534d5e042f9388 mm/vmscan: avoid split la=
zyfree THP during shrink_folio_list()
>
> :::::: TO: Lance Yang <ioworker0@gmail.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
