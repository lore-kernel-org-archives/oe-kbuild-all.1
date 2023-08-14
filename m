Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B2FCA5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:55:19 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d645b95c7b8so4086221276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692046518; x=1692651318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9dZ73eR63TSb0FHn05N7SRusCzdcPNZECU/wwItrsA=;
        b=CT/zqs6lJKr3IfioiSPcoTqQijaIZMdovkYnMzXHL3dISU1OXQVB8oP/rosR6VG1Nk
         lk6QLIMtLfgJrClVCLM5EFZ1ggyfRryLdH9aBG+cZ2+rfRBrd5Lz92/4ZR97/Na2mUEm
         LiekPHyTIbtNI2/hUZvj2pKOac3rjWY3zJ6LVIMkC41sOmd1Q66cUYFRg/WigvWvOrk7
         TVRDn4lw67otYTkb6Fqg5c66mmdw9NaNWCOz34GBrrMFgaAgxQiWJPi15fNb+xwbHRNU
         b0QjqcCKra+VKpc7bPoCqzJWhSYAVeYOZtafUeBN2OCvvCJk7fjh5pWoGlyXiE7KJwKJ
         EH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692046518; x=1692651318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9dZ73eR63TSb0FHn05N7SRusCzdcPNZECU/wwItrsA=;
        b=NwHhFkX9pJ50/k4EZEI3pLV4tf3Ip7pRiFqOUxpKVXLzp8zVPU5tHMXvYFefdAzzjE
         8SNsqLO7QoNqShYTcZVgOvaJF124eyWTXkKcLNiBV2blZjo1CEB7T2zQHpKzPahmYFaZ
         Xf0B3ZhYVH8U+FywnPRGEeZR70HXbVfmo1A8ATxhQS3p5jCN4M49AH/NQuZfqj5OoT7h
         VgFEcBazqIpxgmdNDnA1KnicOj/Wl6x5+poXdHJ3CagpYcG8snzrg1NkFP2Biw7ns7xL
         gg1NQ5QaTvf49gffsjZnnWEMT6EGSWAO9O8Fuy7GIKzhW0/uyC8FCRJIQlSEXymWNkF3
         6sSg==
X-Gm-Message-State: AOJu0Yxj3EdyDXncbX4z7wn52rOL0SDU5xTRkE05hcB/mQWjM/ftDLqw
	4dscqaWur3kUVsHBu1pfroIFjQyAkhukPjuYkXvIqA==
X-Google-Smtp-Source: AGHT+IFfSwl3rDi87AUO872jchrVGVY0U9LzJycxnEERl17SfkCwqGVZyZzMjhHVa+54K2gFqsMvhmfl00YPO/9KzP8=
X-Received: by 2002:a5b:70a:0:b0:d09:33b0:f4e4 with SMTP id
 g10-20020a5b070a000000b00d0933b0f4e4mr10444404ybq.4.1692046518432; Mon, 14
 Aug 2023 13:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308131610.jF4ncWp6-lkp@intel.com> <20230814130623.90cf2bc8c625087ea616dd3c@linux-foundation.org>
 <CAJuCfpGfsZtY5_Qi+Gew1z7Z0_Z_cAkrmxt+6cF6Sp-TR3A_kg@mail.gmail.com>
 <CAJuCfpHF_gJYT6A6PC5YpoVefdF2rSEKNaSc2mH3Vqp51r3hjQ@mail.gmail.com> <20230814134139.1a590870aa184f2ed34fd923@linux-foundation.org>
In-Reply-To: <20230814134139.1a590870aa184f2ed34fd923@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Aug 2023 13:55:07 -0700
Message-ID: <CAJuCfpEKY3n70BmF82oE+0VG9MwFrPhpZZZyZ7RMGb5V1Y+NjA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error: implicit
 declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 1:41=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 14 Aug 2023 13:33:19 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Andrew, is "mm: handle userfaults under VMA lock" merged into
> > mm-stable? I could not find it and in fact the whole "Per-VMA lock
> > support for swap and userfaults" patchset
> > (https://lore.kernel.org/all/CAJuCfpHSFikZ=3Dh34yS980BmUP5M=3D+j6rB4_b-=
q7MCc10Xs24+w@mail.gmail.com/)
> > seems to be missing in mm-stable. That's problematic because Matthew's
> > "Handle most file-backed faults under the VMA lock" patchset
> > (https://lore.kernel.org/all/20230724185410.1124082-1-willy@infradead.o=
rg/)
> > requires at least one patch from my patchset to work correctly, this
> > one: https://lore.kernel.org/all/20230630211957.1341547-4-surenb@google=
.com/.
> >
> > An additional note,
> > https://lore.kernel.org/all/20230812002033.1002367-1-willy@infradead.or=
g/
> > is fixing a known issue in "Handle most file-backed faults under the
> > VMA lock" patchset and it's missing from mm-stable too. As Matthew
> > mentioned in that patch, ideally it should be placed before "mm:
> > handle faults that merely update the accessed bit under the VMA lock"
> >
>
> I was unaware of these dependencies.

I didn't notice the reordering in mm-unstable but now I see them
reordered there as well. Should have warned you earlier :(

>
> All the above-mentioned patches are in mm-unstable, so we have
> bisection holes.
>
> If I get sent a replacement patch series, I'll move it to
> back-of-queue, because I'll assume all previous testing is invalidated.
> I assume this is how this misordering came about.  If I get sent
> little -fix patches, I don't do this reordering.

Possibly the recent riscv fixup for my patch series reordered things...

Reordering my patchset before Matthew's would fix that bisection hole
but up to you. I was just worried that if one patchset is merged
without the other, this hole would produce multiple issues.
