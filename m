Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDCA3314A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384776; cv=none; b=ifL355A/lJ2VptzK1TtZuT+pR8V+6Q2UKZIiHRaruwqoRKdBwbqjKZEVfoRHRSWAKaNVCw214rXdHvhucFhxsZKEoLGZ2Ak2K4gQfZQ5YK9NrqoueBEcZRl9okTNmfTO1inLzPhcvqQFgxYNCAGNNav6FDs1xAtxjfVmn6NByjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384776; c=relaxed/simple;
	bh=m3OL8AyMbHbrNVKacBSZn0hUzCvhl8MUsvirhFgMsLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugXNuieInH4Pbew16ibMRS9+tY4vgmSnpy1GXbvgaCYjf/FJIufC8S1S1cUq1SIVC/Pw5AZBMdBg7u2YUGXuAEIM2QyJ4foKgNORVxrLGeiqvCOIXiXrpCEFcYkBr6AxfopFk9FV3tFOd8YnCUcivMGNZQHwntl/HFu9oIWke+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lzupfpa+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lzupfpa+"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73b24f1784so20644166b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 05:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384772; x=1763989572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzmClbvPyvBeE+q//jkriOQoEKo3zwFbzk31wn2QdMo=;
        b=Lzupfpa+Q7xWsFA1xevvtMapNlIdSYV0oKQEVtAIKFeAH++IdsIuvEFU6+vNAxNClN
         Hy+POk14uVYu6CezTqeDvD3rPVAKKCj0ekcRLjPAVkt9izQS5gDBm68V44McHeoKQMqk
         r/22Zgl2T/piQ6lRHELpolR9ULTei5GsX4+ohSg1XX9XRamOIAJdRtrWRR3VsP4fpITX
         v0Dn9ROpq2Iyvw1YNedonu16xKtG17nx3IgNJzA3vRwetsPq49sYsmU0secTQ2Oau7b0
         wlBu3FVZ8kg1/xcu0dY2SyqWSL0z2CbCPfr1SvzallrPyu0/N3SYdvsIemt7wMWH7zHL
         sPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384772; x=1763989572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzmClbvPyvBeE+q//jkriOQoEKo3zwFbzk31wn2QdMo=;
        b=g1EK+v1VGJRA8gxdXo8fpteJDE775D1x+LYseKOBJ/c7M3nU/bCs7Z5zROw35EorQn
         ZVFQRvF4/n642Qa4salkkMik0YkXWHqOgKm5Xatf8ZdTSb+o3r4anedOGotCtf3pCLNk
         POgjW+Sdoz6pft9WsipRZb2zijqlhPx4aDeR4tvsfWum3BQbVhxzpczWdagAiJwc3DJs
         Eh83v4VFUo5XCpa3GfWjuSpSI4DPkSfqbaQ5vFLNHg7hBRTmWLoxFv1LuET41/CZy0p1
         9lu5gJkq+VCHH7g9/j9WHotYvbr+P1cGY0EvHm7gPuDNrn/zPsW9KxJop2r0PtpeGxBt
         F4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7xgJt1TGZ+108hhHebzhhmVr8cZrlaQd/9FvFw7ClhOYJTlpB1KL4w76VdPMLdzrIsZ26U4Co6cqCNira@lists.linux.dev
X-Gm-Message-State: AOJu0YwG0d4L+LH66L23T4pRbZBdF0RQbOiw+iWudzBEYGzMi4B1ioz7
	QYRcPbtlSXob6AkpAazOrD9ocYNP/f3bdtkGTDabNZm/s5RsWkHCz9XtpDPOo5mf0f0274ea5XA
	vULBMPlZzGjCoQ17HZUIhsKAhRXAmrJY=
X-Gm-Gg: ASbGncsZ5Ckew+7APnAQeiymYUkyheWNXEYlASGVhPk6G5ngRYfC18fS8qKiIknIEG7
	/EfA+WIhf+nWmrJUcQgBqoaAc8c3iZNBURs3kpW2c7ae4gyaax2EaR8+yI6TG+cKtt8/qUNdu22
	X+huDuI2DzbZn+1NluEMH9fBIhjYKf43NKpC5CR3F4fqSiRnLM0ARXzOdWoacQPUtKro5pkeH2T
	eLJVGyDQLGRLlM/Dkf9Js9pFBVd2+tlhpz7Oyee+hnkwKZULAzDXbeg3JvnTzotUk3DuohWkjir
	39kN86knSJ4UDCYx4jWmNqZvZK/+bjI=
X-Google-Smtp-Source: AGHT+IHqj3i2HRsibRzHKXf1dtPdvhXDhojSOWprepzSXOkYrPFcbb3l46Wk1jAyobY6QdZ9jWIdnMjC6+X5l2p7ueM=
X-Received: by 2002:a17:906:fe4d:b0:b72:7e7c:e848 with SMTP id
 a640c23a62f3a-b7348570745mr810309066b.17.1763384772052; Mon, 17 Nov 2025
 05:06:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-swap-table-p2-v2-14-37730e6ea6d5@tencent.com> <202511171942.psG9jTRx-lkp@intel.com>
In-Reply-To: <202511171942.psG9jTRx-lkp@intel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 17 Nov 2025 21:05:35 +0800
X-Gm-Features: AWmQ_bnUFnm0x-eDcpgtaE3URJs_3MiIsOAITzpaSFBE-GfFvya8ZTJD0VLBPq0
Message-ID: <CAMgjq7BkVvhsCzk2r53159hDoZ+b+AvP1iUTBHA9zvb+SJFg=Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] mm, swap: sanitize swap entry management workflow
To: linux-mm@kvack.org
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Youngjun Park <youngjun.park@lge.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 7:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kairui,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 41218ede767f6b218185af65ce919d0cade75f6b]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swa=
p-rename-__read_swap_cache_async-to-swap_cache_alloc_folio/20251117-021532
> base:   41218ede767f6b218185af65ce919d0cade75f6b
> patch link:    https://lore.kernel.org/r/20251117-swap-table-p2-v2-14-377=
30e6ea6d5%40tencent.com
> patch subject: [PATCH v2 14/19] mm, swap: sanitize swap entry management =
workflow
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20251117/=
202511171942.psG9jTRx-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0=
bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251117/202511171942.psG9jTRx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511171942.psG9jTRx-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/s390/mm/gmap_helpers.c:35:2: error: call to undeclared function '=
free_swap_and_cache'; ISO C99 and later do not support implicit function de=
clarations [-Wimplicit-function-declaration]
>       35 |         free_swap_and_cache(entry);
>          |         ^
>    arch/s390/mm/gmap_helpers.c:35:2: note: did you mean 'free_swap_cache'=
?
>    include/linux/swap.h:435:6: note: 'free_swap_cache' declared here
>      435 | void free_swap_cache(struct folio *folio);
>          |      ^
>    1 error generated.
>
>
> vim +/free_swap_and_cache +35 arch/s390/mm/gmap_helpers.c
>
> 200197908dc4af Claudio Imbrenda 2025-05-28  19
> 200197908dc4af Claudio Imbrenda 2025-05-28  20  /**
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  21   * ptep_zap_softleaf_entr=
y() - discard a software leaf entry.
> 200197908dc4af Claudio Imbrenda 2025-05-28  22   * @mm: the mm
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  23   * @entry: the software l=
eaf entry that needs to be zapped
> 200197908dc4af Claudio Imbrenda 2025-05-28  24   *
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  25   * Discards the given sof=
tware leaf entry. If the leaf entry was an actual
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  26   * swap entry (and not a =
migration entry, for example), the actual swapped
> 200197908dc4af Claudio Imbrenda 2025-05-28  27   * page is also discarded=
 from swap.
> 200197908dc4af Claudio Imbrenda 2025-05-28  28   */
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  29  static void ptep_zap_soft=
leaf_entry(struct mm_struct *mm, softleaf_t entry)
> 200197908dc4af Claudio Imbrenda 2025-05-28  30  {
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  31          if (softleaf_is_s=
wap(entry))
> 200197908dc4af Claudio Imbrenda 2025-05-28  32                  dec_mm_co=
unter(mm, MM_SWAPENTS);
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  33          else if (softleaf=
_is_migration(entry))
> 6539cf8c98a8cc Lorenzo Stoakes  2025-11-10  34                  dec_mm_co=
unter(mm, mm_counter(softleaf_to_folio(entry)));
> 200197908dc4af Claudio Imbrenda 2025-05-28 @35          free_swap_and_cac=
he(entry);
> 200197908dc4af Claudio Imbrenda 2025-05-28  36  }
> 200197908dc4af Claudio Imbrenda 2025-05-28  37

Ops, not sure why this callsite was missed during the renaming
conversion, probably lost it during a rebase as there are some
conflicts here. This should fix it:

diff --git a/arch/s390/mm/gmap_helpers.c b/arch/s390/mm/gmap_helpers.c
index 549f14ad08af..c3f56a096e8c 100644
--- a/arch/s390/mm/gmap_helpers.c
+++ b/arch/s390/mm/gmap_helpers.c
@@ -32,7 +32,7 @@ static void ptep_zap_softleaf_entry(struct mm_struct
*mm, softleaf_t entry)
                dec_mm_counter(mm, MM_SWAPENTS);
        else if (softleaf_is_migration(entry))
                dec_mm_counter(mm, mm_counter(softleaf_to_folio(entry)));
-       free_swap_and_cache(entry);
+       swap_put_entries_direct(entry, 1);
 }

Will include it in the next update.
