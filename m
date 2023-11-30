Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933A180
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K7lJrVib"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a0064353af8so295639866b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 16:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701303227; x=1701908027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11YcQpvrcYwGdbDHiJnv0GW13Xm7hfI2sS8fXcsJGPQ=;
        b=K7lJrVibHK63Cipaot82/0QC4W86FcJ3OXKYZ5mOg+A19cLMjIKJMn9eZAkuyWI4A8
         DGYtWJib1VXHYNN27HmOWB3S0eaiW6SUEJVpRdXMiHnCmU6MGY9b4cNL9hTwmoPqyIX6
         8P533jQ+PLvv2cZe4Y56BW7BXEg8pMLxNbSpKaCNzthABJ7+clLpTTUXC/uynVk6hvG4
         9rCGK3x3w3mbZMi3rwbtZOkPsmHo0KubgnwrJNITrryWdQidNCjj11fXIeFcyeqKiDwI
         N4RNgRJbgmzRT8VMmcg4RJ7QjK3oind9gunvCjZaTMPMfl1FSA1EEAGTlEM+vKqg1E5C
         36+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701303227; x=1701908027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11YcQpvrcYwGdbDHiJnv0GW13Xm7hfI2sS8fXcsJGPQ=;
        b=nJxz7oTaU8Q7FGWgHIXZyPrCc3qk0RB1Hl6IQWaw+Ddo3i0Nx4aZRVhkRGNG6ALsaL
         lkESXAegfQQYYgRnqmR40Qc7NTTNtx/w30P43TXDQy4sFAk4yDlMohysZR85JaM8upjN
         KrAuI7XejPkpxlPas21rvkkWqByjqftIukvKmbcGjnEfIi95+uUHJph8YgzLf0i4luF1
         v2YYwkArkEDerUpHqDeavi7gJRhUOZGZ35UOvGWALBpc1OqExJecsAcIrL66HBQsX7su
         W7fHdV060Vj+Q/Viu9vtWp13IAfTXJJ0fvHbu35VtdMkva1eKjeGS+a9/7Pgy4yW+sAp
         QLgg==
X-Gm-Message-State: AOJu0YwFPqLKd+PCwfvWfC/V+G/7vdRMHy20oz+c83M0RfxsP3jjGbl6
	K+k7pc1ldf6iZBV8NaHTrIIjVP/Fgz4HcpjUISzz8C5Oow3KdO86ScM=
X-Google-Smtp-Source: AGHT+IFGeNVtXci5KO/SrTkFfmY4iuPCzrxUwGw4qWHOUmcsFEUWm/lZoVBja0SKb1JosnL4AJggilBr2QHp8Wh3wcs=
X-Received: by 2002:a17:906:3e58:b0:9ad:cbc0:9f47 with SMTP id
 t24-20020a1709063e5800b009adcbc09f47mr21347752eji.12.1701303226441; Wed, 29
 Nov 2023 16:13:46 -0800 (PST)
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
 <CAJD7tkZVRPfR6jN3ymuD3Ae2h4tZ3ga6un2ieFKoKrb7YE2JRg@mail.gmail.com> <CAKEwX=O63CqcBs=Ayc6VhJ4DLEw=YQitRKDM7odBsJqBgS6Pnw@mail.gmail.com>
In-Reply-To: <CAKEwX=O63CqcBs=Ayc6VhJ4DLEw=YQitRKDM7odBsJqBgS6Pnw@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 29 Nov 2023 16:13:06 -0800
Message-ID: <CAJD7tkYspRTdZyczcHYpeKbR8Q8E3NEejaO3NzHEAi=5cVFp3A@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 4:02=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Nov 29, 2023 at 2:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Wed, Nov 29, 2023 at 2:29=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > On Wed, 29 Nov 2023 14:18:15 -0800 Yosry Ahmed <yosryahmed@google.com=
> wrote:
> > >
> > > > On Wed, Nov 29, 2023 at 1:53=E2=80=AFPM Andrew Morton <akpm@linux-f=
oundation.org> wrote:
> > > > >
> > > > > On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-foun=
dation.org> wrote:
> > > > >
> > > > > > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel=
.com> wrote:
> > > > > >
> > > > > > > >> mm/zswap.c:825:17: error: dereferencing pointer to incompl=
ete type 'struct mem_cgroup'
> > > > > > >       css_get(&memcg->css);
> > > > > > >                     ^~
> > > > > >
> > > > > > OK, thanks, patchset needs work for CONFIG_MEMCG=3Dn.  I'll dro=
p this version.
> > > > >
> > > > > Well that's annoying - the "mm: memcg: subtree stats flushing and
> > > > > thresholds" series had lots of dependencies on this series.
> > > >
> > > > FWIW, the "mm: memcg: subtree stats flushing and thresholds" series
> > > > has no actual dependency on the zswap series. The conflicts come fr=
om
> > > > patch 2, which moves some code in mm/memcontrol.c, which happens to=
 be
> > > > touched by the zswap series. The first 2 patches of the stats serie=
s
> > > > are just refactoring with no functional changes, so if those two ca=
n
> > > > remain in mm-unstable, independent of the remaining of the series o=
r
> > > > the zswap series, then either Nhat or I could easily rebased our
> > > > patches on top of them, and you can easily move the series in & out=
 of
> > > > mm-unstable without conflicts.
> > > >
> > > > Another thing is, the only difference between v3 & v4 of the "mm:
> > > > memcg: subtree stats flushing and thresholds" series is the rebase =
on
> > > > top of the zswap series. So if you want, you can take both series o=
ut,
> > > > and add in v3 of the stats series instead of v4. If you need to rem=
ove
> > > > the stast series again in the future, you can leave the first two
> > > > patches to avoid conflicts with the zswap series.
> > > >
> > >
> > > Ok, thanks.  I prefer not to make what is in mm.git too different fro=
m
> > > what was sent.
> > >
> > > I've left everything in place:
> > >
> > > list_lru-allows-explicit-memcg-and-numa-node-selection.patch
> > > memcontrol-add-a-new-function-to-traverse-online-only-memcg-hierarchy=
.patch
> > > zswap-make-shrinking-memcg-aware.patch
> > > zswap-make-shrinking-memcg-aware-fix.patch
> > > mm-memcg-add-per-memcg-zswap-writeback-stat.patch
> > > selftests-cgroup-update-per-memcg-zswap-writeback-selftest.patch
> > > zswap-shrinks-zswap-pool-based-on-memory-pressure.patch
> > > #
> > > ...
> > > #
> > > mm-memcg-change-flush_next_time-to-flush_last_time.patch
> > > mm-memcg-move-vmstats-structs-definition-above-flushing-code.patch
> > > mm-memcg-make-stats-flushing-threshold-per-memcg.patch
> > > mm-workingset-move-the-stats-flush-into-workingset_test_recent.patch
> > > mm-memcg-restore-subtree-stats-flushing.patch
> > >
> > > in the hope that a new version of the first series ("workload-specifi=
c
> > > and memory pressure-driven zswap writeback") can be dropped in place =
of
> > > the old version.
> > >
> >
> > I see. So Nhat needs to *not* rebase his patches on top of the current
> > mm-unstable, right?
>
> FWIW, I'll have to re-send a v8 to fix the kernel test robots/build
> issues that I've missed and incorporate the comments/suggestions from
> Michal and Johannes. IIUC, your series is ready right? Then we can
> have your v3 in mm-unstable first, then I can rebase my patch's v8 on
> top of that (fixing any merge conflicts along the way), then send out
> the whole thing again.
>
> Does this sound good?

Andrew said he expects a new version to be dropped in place of the old
version, and my v4 is already in mm-unstable on top of your series. So
I guess you should send v8 against Linus's tree (or mm-unstable at the
same base as your v7), and Andrew will replace v7 with v8 in place.
