Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C16AB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 13:20:07 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id t16so2401794ybi.13
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681392006; x=1683984006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEYIJxcj5kmzNVXSipi1HyC65eTywMQLwhS5DFReugM=;
        b=tQ6wJTzCLuhE8bfXNSfUCszgAi37G4ZhBl+WQz1oQmfYFytFaCY0Oh67v858OE5AXc
         V/JHLD2pK/I9YKCATu0KIGtLbNWE+Q4heAs/kqfaHUmI+5i3p7MmPvVs8uOMudb2y5hb
         NFjcqWCUQ3ML208RfeF96TWVB3hDsfVakdBsNxx8dS8iY8IFSlM8p8+as1svnuhRaWdi
         wdZeobyTFV5I8AlGyW/GyMaYIYeTLYK0ZXwQBQ/2lLkEAXiWME2lJnddrQATjTz/yPU9
         P65DG16JWYVuRUJjLfxf8rgu2YfakSB1QAyGLkDPIE/PFPLFeyzSl5CbqARP25pGuIRE
         T4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681392006; x=1683984006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEYIJxcj5kmzNVXSipi1HyC65eTywMQLwhS5DFReugM=;
        b=ZVglXLEiD7UsxqYKvm0anvlvEETKKyCR2+bJSZe6DYkVBjp+ih1UQYLgFq1wliEt92
         IuYu1eMsdPsKoS8dmZMNWe9QjrlIfnv17N1bm6Z/LrriShYrJbJde9MAfjF5TPz/m6Cn
         x8OZ/mYhxqK0UZRxjJUQI4Pz2SOc/SCXT828GXsFFCPlzjUb0sKQmoDrtIjS0owOt98X
         ZYbHrHy7dQ8FUOGve7QDbMG0423XlNemFMkxayKexm9BiRpdnlgPwBFfYpS/Ndcd0QFL
         afI9rknoV3K5y08ws3zaam7qnQukNeW3mrlt1WdQ5QYdc0F6yZ7fd+Q4zuDXqtU8RUo8
         FWiw==
X-Gm-Message-State: AAQBX9esM5/RDNN7b/44e1Gkm+34Q5fK2Nss5WiCDblArGnU02bi78WK
	hMbkYUWuvBtf6uxuPAEyvzAxPR8S+1BWwzfculsEQA==
X-Google-Smtp-Source: AKy350bze9rRwSEH8mQHkOzRLi/0g5jEhOn91d5G//UCGeCd2mlUYHNEOpMVXezcQc9ZFgn8VYY0YoReb5GDXy4TB7Y=
X-Received: by 2002:a25:d003:0:b0:b8f:32c4:c6f8 with SMTP id
 h3-20020a25d003000000b00b8f32c4c6f8mr1775428ybg.42.1681392006415; Thu, 13 Apr
 2023 06:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230412145300.3651840-1-glider@google.com> <202304130223.epEIvA1E-lkp@intel.com>
 <20230412140601.9308b871e38acb842c119478@linux-foundation.org>
In-Reply-To: <20230412140601.9308b871e38acb842c119478@linux-foundation.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 13 Apr 2023 15:19:29 +0200
Message-ID: <CAG_fn=Wqf0E0Uo8wA5pdhgpreKZB7TPU-DiyERyG=T7bqqiJ9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	urezki@gmail.com, hch@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, elver@google.com, dvyukov@google.com, 
	kasan-dev@googlegroups.com, Dipanjan Das <mail.dipanjan.das@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Thu, 13 Apr 2023 02:27:19 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > Hi Alexander,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on akpm-mm/mm-everything]
> >
> > >> include/linux/kmsan.h:291:1: error: non-void function does not retur=
n a value [-Werror,-Wreturn-type]
>
> Thanks, I'll do this:
Thanks!
I sent an updated version of the patch series, which includes your fix
as well as a couple more improvements (__must_check annotations in
particular)
