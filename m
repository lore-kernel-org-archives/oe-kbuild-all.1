Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5E180
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9Y0ZElM"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b060378c47so6395339f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 16:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701303516; x=1701908316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+bEWaLtTDsM8rXiSV0y1h9NASZYkUH3bDX4VG92SEw=;
        b=K9Y0ZElMKywrEXc2hLeYlVbA1pSEyacLWrwNuQwDSQdFKtZMULkPwIkDYBNkivWfg4
         oi7qpM7utCprAcKozF8j6WIl08QRsrbluRxb3+3qgXtgPIzv20ln4kb03MeLQ2TsJyEL
         62jnUEAk37a3vKJb3jLojT8jawDnC6SiwO4AlwqTXXkPv0w+FK4FqBNtfmQmksSM6wQX
         0U4D548sIJtcxXHrUcxVWvihep3mAZ18EZTdUeuXzQbV7oeoEBebxQOKFoVTXVLwCp2U
         zSYSQg2DdhtgijSFOxzdK9QeTDZ5S1VFx1npeF+kr18Ot/aqo1nsqZ8eAK9GgIfsBp9u
         dzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701303516; x=1701908316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+bEWaLtTDsM8rXiSV0y1h9NASZYkUH3bDX4VG92SEw=;
        b=ToKRc7A7DvsGPg/ufuOcYzN7nSAEKa9W2Y18WyVIhfp+D2ttmzdgVTtkcMBDYNLMqn
         yWqD656oP/BP0UL5o9kZKzsVCyGtLuEfs3xh9gkg3B7kxpzxiRzRdqCWPQZbH6c1g0iP
         hfEbdxB2/bKkdw6gQV4Bb4wkmKN4Tqtowpi/d+YdB8DaU8LYHQ268HuvB8PmoiOGSl8T
         QsppROcBLmJyFtTPiwIYCftSY87u26lpciqP2qd0iBMFHqvxrma+rHhx7T9bW6NNCSGC
         oCJSHJG6InHSn1EP/3lDLHbDNahedz/FS6Zqwlt/zPjkY5FUfqzfyIG9f5gaYq9ZS8HW
         F4UQ==
X-Gm-Message-State: AOJu0Yz0AXpMZaQ3voaYw4o4Xvd05VtxXT3rVkkBuKNdyBO/uycT1rpF
	yyjS2qxcDA6OqOgsWpEnv6hF8SHOaylgjBi7juU=
X-Google-Smtp-Source: AGHT+IFGTlpCFsO99/0ZfBSSbS3g84w4StHb6x1TNufg7m4gi97RVCjTBM1VjGz4S+N7pg8go3KChNbhkBTZbq0hZEw=
X-Received: by 2002:a05:6602:4808:b0:7b3:989f:ee4e with SMTP id
 ed8-20020a056602480800b007b3989fee4emr18532726iob.8.1701303516252; Wed, 29
 Nov 2023 16:18:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311292250.RUfWGNgx-lkp@intel.com> <20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
 <20231129135342.5697165df1adfff04c749082@linux-foundation.org>
 <CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com>
 <20231129142935.d9c76a2fe35efd9a4c7b4087@linux-foundation.org>
 <CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com>
 <CAKEwX=O63CqcBs=Ayc6VhJ4DLEw=YQitRKDM7odBsJqBgS6Pnw@mail.gmail.com> <CAJD7tkYspRTdZyczcHYpeKbR8Q8E3NEejaO3NzHEAi=5cVFp3A@mail.gmail.com>
In-Reply-To: <CAJD7tkYspRTdZyczcHYpeKbR8Q8E3NEejaO3NzHEAi=5cVFp3A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 29 Nov 2023 16:18:25 -0800
Message-ID: <CAKEwX=NcgASfJR49DCzUTev+RNUa5_-PBahvErPi6vij6CgRuQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 4:13=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Wed, Nov 29, 2023 at 4:02=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Wed, Nov 29, 2023 at 2:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.=
com> wrote:
> > >
> > > On Wed, Nov 29, 2023 at 2:29=E2=80=AFPM Andrew Morton <akpm@linux-fou=
ndation.org> wrote:
> > > >
> > > > On Wed, 29 Nov 2023 14:18:15 -0800 Yosry Ahmed <yosryahmed@google.c=
om> wrote:
> > > >
> > > > > On Wed, Nov 29, 2023 at 1:53=E2=80=AFPM Andrew Morton <akpm@linux=
-foundation.org> wrote:
> > > > > >
> > > > > > On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-fo=
undation.org> wrote:
> > > > > >
> > > > > > > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@int=
el.com> wrote:
> > > > > > >
> > > > > > > > >> mm/zswap.c:825:17: error: dereferencing pointer to incom=
plete type 'struct mem_cgroup'
> > > > > > > >       css_get(&memcg->css);
> > > > > > > >                     ^~
> > > > > > >
> > > > > > > OK, thanks, patchset needs work for CONFIG_MEMCG=3Dn.  I'll d=
rop this version.
> > > > > >
> > > > > > Well that's annoying - the "mm: memcg: subtree stats flushing a=
nd
> > > > > > thresholds" series had lots of dependencies on this series.
> > > > >
> > > > > FWIW, the "mm: memcg: subtree stats flushing and thresholds" seri=
es
> > > > > has no actual dependency on the zswap series. The conflicts come =
from
> > > > > patch 2, which moves some code in mm/memcontrol.c, which happens =
to be
> > > > > touched by the zswap series. The first 2 patches of the stats ser=
ies
> > > > > are just refactoring with no functional changes, so if those two =
can
> > > > > remain in mm-unstable, independent of the remaining of the series=
 or
> > > > > the zswap series, then either Nhat or I could easily rebased our
> > > > > patches on top of them, and you can easily move the series in & o=
ut of
> > > > > mm-unstable without conflicts.
> > > > >
> > > > > Another thing is, the only difference between v3 & v4 of the "mm:
> > > > > memcg: subtree stats flushing and thresholds" series is the rebas=
e on
> > > > > top of the zswap series. So if you want, you can take both series=
 out,
> > > > > and add in v3 of the stats series instead of v4. If you need to r=
emove
> > > > > the stast series again in the future, you can leave the first two
> > > > > patches to avoid conflicts with the zswap series.
> > > > >
> > > >
> > > > Ok, thanks.  I prefer not to make what is in mm.git too different f=
rom
> > > > what was sent.
> > > >
> > > > I've left everything in place:
> > > >
> > > > list_lru-allows-explicit-memcg-and-numa-node-selection.patch
> > > > memcontrol-add-a-new-function-to-traverse-online-only-memcg-hierarc=
hy.patch
> > > > zswap-make-shrinking-memcg-aware.patch
> > > > zswap-make-shrinking-memcg-aware-fix.patch
> > > > mm-memcg-add-per-memcg-zswap-writeback-stat.patch
> > > > selftests-cgroup-update-per-memcg-zswap-writeback-selftest.patch
> > > > zswap-shrinks-zswap-pool-based-on-memory-pressure.patch
> > > > #
> > > > ...
> > > > #
> > > > mm-memcg-change-flush_next_time-to-flush_last_time.patch
> > > > mm-memcg-move-vmstats-structs-definition-above-flushing-code.patch
> > > > mm-memcg-make-stats-flushing-threshold-per-memcg.patch
> > > > mm-workingset-move-the-stats-flush-into-workingset_test_recent.patc=
h
> > > > mm-memcg-restore-subtree-stats-flushing.patch
> > > >
> > > > in the hope that a new version of the first series ("workload-speci=
fic
> > > > and memory pressure-driven zswap writeback") can be dropped in plac=
e of
> > > > the old version.
> > > >
> > >
> > > I see. So Nhat needs to *not* rebase his patches on top of the curren=
t
> > > mm-unstable, right?
> >
> > FWIW, I'll have to re-send a v8 to fix the kernel test robots/build
> > issues that I've missed and incorporate the comments/suggestions from
> > Michal and Johannes. IIUC, your series is ready right? Then we can
> > have your v3 in mm-unstable first, then I can rebase my patch's v8 on
> > top of that (fixing any merge conflicts along the way), then send out
> > the whole thing again.
> >
> > Does this sound good?
>
> Andrew said he expects a new version to be dropped in place of the old
> version, and my v4 is already in mm-unstable on top of your series. So
> I guess you should send v8 against Linus's tree (or mm-unstable at the
> same base as your v7), and Andrew will replace v7 with v8 in place.

Ohhh I totally misunderstood this email chain then. Woopsies. Ok cool will =
do.
