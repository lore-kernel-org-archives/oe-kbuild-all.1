Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05AD15C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 00:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou6CmSAh"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7b357e43cc2so6366939f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 16:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701302533; x=1701907333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQPF4MPwH/jMfAF13F5NsZ7T7VPUowHmiGPk9/r/gxw=;
        b=Ou6CmSAhaemskQYbhHd4a60xxDeVygN3fd0gQA2YmoPkxPgKrx/nN+NQRWCm+lu/sm
         U/I+/ByGO3xsQoctdQUEeHBWrdEgpHqbW5Q6QKA0zJCSjqSBUX136xaFzvvfJ9kw6ACa
         A7qHbZQQJ8zWUTMEir6rFFi4aCazw+PaP075pPmdk9msJ17oqz5vUMs5f/3rCYb2SMnM
         yFrZ35t98fs6PfVj76+itPLQrnJTX4VI9RGjrFYXi0dzUzT6L2QS7Az653jjcT+6LYGK
         IqOEK0Imv81h8karIq6YJGt9aqSSXV5L5NgjGy13GmIazbBb+fw9dF4WRn0v0MQ4dg7S
         NKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701302533; x=1701907333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQPF4MPwH/jMfAF13F5NsZ7T7VPUowHmiGPk9/r/gxw=;
        b=r7Y7vEZSwKbIfNHOt0klAdnlTHOrfC431Xae0KhEnljBmv5r/Jti9G/sUaCM9YGhpr
         zIFZPzJPW8Dj5o42Ug8DDT+yzpUmGtrnKoGjn4w5exVDOKUe9BAj7KvwA0HV3BmdXb2M
         fqpe62Rn6ZWfzcnDYQ8T05GO9QdzzmgOpH2eqXvwiSIIslCzxIoqpd70ZFNl93an40rS
         m1+2b7jbx1yVPQAYc18eOmboS1mSJzI2A4sKjJMIl1AZxS6mjh6Yen7g64C+RAJXY1n7
         ZbUoNjiwUx6CyFSslX1wa+xEAV3nXGEy/Cbuex5OsheWFZfxXfnW/0ZCqjYi8Q7XnHtw
         GViQ==
X-Gm-Message-State: AOJu0Yx5anijYXJMcIDT5wHklGHCSo+FvhYbrPJ+Z1vN63DAI1KMcCD7
	uW4iP10tcov84tr1+UI+rxRPocwqSHN60l8kM+w=
X-Google-Smtp-Source: AGHT+IEvGKUtR1h6T2hlJHW2sorR3kG4m1XN4/Yp/Zr0siI7nKTQvZ+GDecpum6gBmMiYu6vOUei4V4WJUPAPeWiWH4=
X-Received: by 2002:a5e:8d18:0:b0:79f:c9ad:19ce with SMTP id
 m24-20020a5e8d18000000b0079fc9ad19cemr17955758ioj.15.1701302533662; Wed, 29
 Nov 2023 16:02:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311292250.RUfWGNgx-lkp@intel.com> <20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
 <20231129135342.5697165df1adfff04c749082@linux-foundation.org>
 <CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com>
 <20231129142935.d9c76a2fe35efd9a4c7b4087@linux-foundation.org> <CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com>
In-Reply-To: <CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 29 Nov 2023 16:02:02 -0800
Message-ID: <CAKEwX=O63CqcBs=Ayc6VhJ4DLEw=YQitRKDM7odBsJqBgS6Pnw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 2:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Wed, Nov 29, 2023 at 2:29=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> >
> > On Wed, 29 Nov 2023 14:18:15 -0800 Yosry Ahmed <yosryahmed@google.com> =
wrote:
> >
> > > On Wed, Nov 29, 2023 at 1:53=E2=80=AFPM Andrew Morton <akpm@linux-fou=
ndation.org> wrote:
> > > >
> > > > On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-founda=
tion.org> wrote:
> > > >
> > > > > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel.c=
om> wrote:
> > > > >
> > > > > > >> mm/zswap.c:825:17: error: dereferencing pointer to incomplet=
e type 'struct mem_cgroup'
> > > > > >       css_get(&memcg->css);
> > > > > >                     ^~
> > > > >
> > > > > OK, thanks, patchset needs work for CONFIG_MEMCG=3Dn.  I'll drop =
this version.
> > > >
> > > > Well that's annoying - the "mm: memcg: subtree stats flushing and
> > > > thresholds" series had lots of dependencies on this series.
> > >
> > > FWIW, the "mm: memcg: subtree stats flushing and thresholds" series
> > > has no actual dependency on the zswap series. The conflicts come from
> > > patch 2, which moves some code in mm/memcontrol.c, which happens to b=
e
> > > touched by the zswap series. The first 2 patches of the stats series
> > > are just refactoring with no functional changes, so if those two can
> > > remain in mm-unstable, independent of the remaining of the series or
> > > the zswap series, then either Nhat or I could easily rebased our
> > > patches on top of them, and you can easily move the series in & out o=
f
> > > mm-unstable without conflicts.
> > >
> > > Another thing is, the only difference between v3 & v4 of the "mm:
> > > memcg: subtree stats flushing and thresholds" series is the rebase on
> > > top of the zswap series. So if you want, you can take both series out=
,
> > > and add in v3 of the stats series instead of v4. If you need to remov=
e
> > > the stast series again in the future, you can leave the first two
> > > patches to avoid conflicts with the zswap series.
> > >
> >
> > Ok, thanks.  I prefer not to make what is in mm.git too different from
> > what was sent.
> >
> > I've left everything in place:
> >
> > list_lru-allows-explicit-memcg-and-numa-node-selection.patch
> > memcontrol-add-a-new-function-to-traverse-online-only-memcg-hierarchy.p=
atch
> > zswap-make-shrinking-memcg-aware.patch
> > zswap-make-shrinking-memcg-aware-fix.patch
> > mm-memcg-add-per-memcg-zswap-writeback-stat.patch
> > selftests-cgroup-update-per-memcg-zswap-writeback-selftest.patch
> > zswap-shrinks-zswap-pool-based-on-memory-pressure.patch
> > #
> > ...
> > #
> > mm-memcg-change-flush_next_time-to-flush_last_time.patch
> > mm-memcg-move-vmstats-structs-definition-above-flushing-code.patch
> > mm-memcg-make-stats-flushing-threshold-per-memcg.patch
> > mm-workingset-move-the-stats-flush-into-workingset_test_recent.patch
> > mm-memcg-restore-subtree-stats-flushing.patch
> >
> > in the hope that a new version of the first series ("workload-specific
> > and memory pressure-driven zswap writeback") can be dropped in place of
> > the old version.
> >
>
> I see. So Nhat needs to *not* rebase his patches on top of the current
> mm-unstable, right?

FWIW, I'll have to re-send a v8 to fix the kernel test robots/build
issues that I've missed and incorporate the comments/suggestions from
Michal and Johannes. IIUC, your series is ready right? Then we can
have your v3 in mm-unstable first, then I can rebase my patch's v8 on
top of that (fixing any merge conflicts along the way), then send out
the whole thing again.

Does this sound good?
