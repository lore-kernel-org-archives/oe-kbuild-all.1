Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE947A50
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wpK4oDWt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so36592966b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 14:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701297108; x=1701901908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JhsGGqS71bK1UUounxYTwpbhCJBb/sdoMDafmdlVMQ=;
        b=wpK4oDWtuVC+aWjZBE5z+tZWPylUk+8H6HeRyUHUnONrQol64MYS0KJdYWxIkfih0f
         LyrBsGDcJ5B+yeHw41Fwwb2pAvni0pAKN7wJ6w0HorPWnL6de7Pnbt1sG5++XGOjXlJW
         HIvSXYI4aLaLjbzmMwN+VydVmzfLFvgW54TnrRgusmei5s8atrSYRaIauZe2esZwpbph
         7k90/XcSLUw2jZxHGPhwg6jsBVmdbFV3CjwHWYyY2qbgeQWFk5b8dIPaG6vUZFJNEXO3
         0cKqIewvKCd2mm9b10VlcQN85YuBH39y0isrJGx+iDvekeCXh5vNb4fe2aa6U3GRDdDj
         I3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297108; x=1701901908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JhsGGqS71bK1UUounxYTwpbhCJBb/sdoMDafmdlVMQ=;
        b=q61eilCoUIjCcA00oGQmyUJVKq1+Q8bOoifSJcO1Zo+fyBewG5Enu9lVtE/1nz3cSK
         F8hnGwuc/J2Uq5OugrTtdNqe3US0b6E1Kc4QlPSeLKOX9daYsMgIYP3Rikwtj/pAU0J6
         8eda7O2G1sSIbfkiBp342cZDFoueNh32WAekHtESinr6p0CsOfYpPt77SM2uvSiCLL5J
         UUTycmuA+z5ONbQ22jTKLT3bIXRHMdvJFctkyu0Sq0W7bxIMZsmfdBh0c96NLV6x/dZy
         /nMEdKjyaOB71FMm8S/gCeIZGeKiqwjX8C2F9FIgZM//uECKJnh9icXFMbqZNXn7ptSp
         ygsw==
X-Gm-Message-State: AOJu0Yz6K0GnLGf/w3PKZjwhJZLHzGR5MsK58oLDchvth/nNEGwzTEvd
	eqKCW4r7uHpCr/0suhrkwBXjj2ogSjTC1nYkWGdy7w==
X-Google-Smtp-Source: AGHT+IEdOHepzllFyUV9+Dg16tA5jdOXWM9dRvwFf15zZI9af1Md173X8xnGqOdIUfmMalNEd1jGJPCuIm7oUABOJ7A=
X-Received: by 2002:a17:906:39c9:b0:9fe:5d39:41c6 with SMTP id
 i9-20020a17090639c900b009fe5d3941c6mr14272551eje.51.1701297108476; Wed, 29
 Nov 2023 14:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311292250.RUfWGNgx-lkp@intel.com> <20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
 <20231129135342.5697165df1adfff04c749082@linux-foundation.org>
 <CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com> <20231129142935.d9c76a2fe35efd9a4c7b4087@linux-foundation.org>
In-Reply-To: <20231129142935.d9c76a2fe35efd9a4c7b4087@linux-foundation.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 29 Nov 2023 14:31:12 -0800
Message-ID: <CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 2:29=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 29 Nov 2023 14:18:15 -0800 Yosry Ahmed <yosryahmed@google.com> wr=
ote:
>
> > On Wed, Nov 29, 2023 at 1:53=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> > >
> > > > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel.com=
> wrote:
> > > >
> > > > > >> mm/zswap.c:825:17: error: dereferencing pointer to incomplete =
type 'struct mem_cgroup'
> > > > >       css_get(&memcg->css);
> > > > >                     ^~
> > > >
> > > > OK, thanks, patchset needs work for CONFIG_MEMCG=3Dn.  I'll drop th=
is version.
> > >
> > > Well that's annoying - the "mm: memcg: subtree stats flushing and
> > > thresholds" series had lots of dependencies on this series.
> >
> > FWIW, the "mm: memcg: subtree stats flushing and thresholds" series
> > has no actual dependency on the zswap series. The conflicts come from
> > patch 2, which moves some code in mm/memcontrol.c, which happens to be
> > touched by the zswap series. The first 2 patches of the stats series
> > are just refactoring with no functional changes, so if those two can
> > remain in mm-unstable, independent of the remaining of the series or
> > the zswap series, then either Nhat or I could easily rebased our
> > patches on top of them, and you can easily move the series in & out of
> > mm-unstable without conflicts.
> >
> > Another thing is, the only difference between v3 & v4 of the "mm:
> > memcg: subtree stats flushing and thresholds" series is the rebase on
> > top of the zswap series. So if you want, you can take both series out,
> > and add in v3 of the stats series instead of v4. If you need to remove
> > the stast series again in the future, you can leave the first two
> > patches to avoid conflicts with the zswap series.
> >
>
> Ok, thanks.  I prefer not to make what is in mm.git too different from
> what was sent.
>
> I've left everything in place:
>
> list_lru-allows-explicit-memcg-and-numa-node-selection.patch
> memcontrol-add-a-new-function-to-traverse-online-only-memcg-hierarchy.pat=
ch
> zswap-make-shrinking-memcg-aware.patch
> zswap-make-shrinking-memcg-aware-fix.patch
> mm-memcg-add-per-memcg-zswap-writeback-stat.patch
> selftests-cgroup-update-per-memcg-zswap-writeback-selftest.patch
> zswap-shrinks-zswap-pool-based-on-memory-pressure.patch
> #
> ...
> #
> mm-memcg-change-flush_next_time-to-flush_last_time.patch
> mm-memcg-move-vmstats-structs-definition-above-flushing-code.patch
> mm-memcg-make-stats-flushing-threshold-per-memcg.patch
> mm-workingset-move-the-stats-flush-into-workingset_test_recent.patch
> mm-memcg-restore-subtree-stats-flushing.patch
>
> in the hope that a new version of the first series ("workload-specific
> and memory pressure-driven zswap writeback") can be dropped in place of
> the old version.
>

I see. So Nhat needs to *not* rebase his patches on top of the current
mm-unstable, right?
