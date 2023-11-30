Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F55FEE6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4sUpTei"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7ad501cb1f9so39075639f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701373599; x=1701978399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rufcR4lX+RrlOWOmJM9CdkzmFM5TZdyS+jKScEzDUI=;
        b=L4sUpTei760fjLwJAr9jJe3eYaodhsqT2zdjySuxpYY9LKwXvz7C3wb8rL8LarFjNp
         ct3Y573PEf9JfnbRqOvPTYsEXEZG+yOUxLfXiRaVJ4V2Pcr8Yj/trDgmhtE32VjiAnsg
         /s7Mi0wtggGE0wf4gW/7frzDrDK6C4bwUQas2RbOvpQhcqBJvEOxh///rxs/+yjWN5Sm
         1jE1Dn8BGX3RnpxcqxllqyHLIaJ4Za8ED9qwxA23d3FPU3qOIz1HNkxNox7ogaBLonW+
         IOty8VDqEnVWer1Cy5jKpik2PdAQlw6mfRhEkDPsLJ7360Kr0mQYCpi4BxYaK3SPkwSs
         zVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701373599; x=1701978399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rufcR4lX+RrlOWOmJM9CdkzmFM5TZdyS+jKScEzDUI=;
        b=rzVSP48N4PMqI+8B8/37Ew9FhGU8YViQhZM9CNkQFuYdbX/b+lWH2uk7epMi/TO5y9
         +orWTbkPWv2OeHuJ0XXgI1ebQXGsbDd+Q55CQsZ2y+zpn34h5g/0VrponLC/RF0jWAB8
         LDrnQPU9LcU/7a9S4nwmsl5EMFC0JCXvjfC6d3IabJ3sbIl4f6TNtm4RBBMHEAObG3AB
         YYkz1vA3pSlR7khh5D01Mxtrc3Bc5OP1y01028Rxvga5x8YogoNylwkoIrYWoBFITLNC
         rv2NnCjja/TfExZHuw75SYwZ1vMhh7gUMOaUtrrav/GGS+KtOMQK8HA7GWl/zSWhxrMQ
         3e7g==
X-Gm-Message-State: AOJu0YyE+gVh6oUza/8I6IPLDcRFzSBofXZWaDQQR28d3fuHa1f+U9JF
	Hi8eS4ioUCuHxe3nhFwgabt+s/J0ze8tq8S1JJk=
X-Google-Smtp-Source: AGHT+IHIBObiFw8rrVdvdA4iKUTr2wPZcnBTXQGRu58bspBp+ehLKMRKF274kg8dWwRwtDY8B7MH14X/iJ3nN3Di2bU=
X-Received: by 2002:a05:6602:3705:b0:7b3:9597:fab1 with SMTP id
 bh5-20020a056602370500b007b39597fab1mr20488639iob.20.1701373599166; Thu, 30
 Nov 2023 11:46:39 -0800 (PST)
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
 <CAKEwX=O63CqcBs=Ayc6VhJ4DLEw=YQitRKDM7odBsJqBgS6Pnw@mail.gmail.com>
 <CAJD7tkYspRTdZyczcHYpeKbR8Q8E3NEejaO3NzHEAi=5cVFp3A@mail.gmail.com> <CAKEwX=NcgASfJR49DCzUTev+RNUa5_-PBahvErPi6vij6CgRuQ@mail.gmail.com>
In-Reply-To: <CAKEwX=NcgASfJR49DCzUTev+RNUa5_-PBahvErPi6vij6CgRuQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 30 Nov 2023 11:46:28 -0800
Message-ID: <CAKEwX=Ph0OQ4uP2jQXVFQ=OQcYBwOCPCKT_Xy-DrQUhrYTmC-g@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok I just sent out v8. I've tried to build the kernel with 4
combinations of CONFIG_ZSWAP and CONFIG_MEMCG - hopefully there is no
further build error.

On Wed, Nov 29, 2023 at 4:18=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Nov 29, 2023 at 4:13=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Wed, Nov 29, 2023 at 4:02=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > On Wed, Nov 29, 2023 at 2:31=E2=80=AFPM Yosry Ahmed <yosryahmed@googl=
e.com> wrote:
> > > >
> > > > On Wed, Nov 29, 2023 at 2:29=E2=80=AFPM Andrew Morton <akpm@linux-f=
oundation.org> wrote:
> > > > >
> > > > > On Wed, 29 Nov 2023 14:18:15 -0800 Yosry Ahmed <yosryahmed@google=
.com> wrote:
> > > > >
> > > > > > On Wed, Nov 29, 2023 at 1:53=E2=80=AFPM Andrew Morton <akpm@lin=
ux-foundation.org> wrote:
> > > > > > >
> > > > > > > On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-=
foundation.org> wrote:
> > > > > > >
> > > > > > > > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@i=
ntel.com> wrote:
> > > > > > > >
> > > > > > > > > >> mm/zswap.c:825:17: error: dereferencing pointer to inc=
omplete type 'struct mem_cgroup'
> > > > > > > > >       css_get(&memcg->css);
> > > > > > > > >                     ^~
> > > > > > > >
> > > > > > > > OK, thanks, patchset needs work for CONFIG_MEMCG=3Dn.  I'll=
 drop this version.
> > > > > > >
> > > > > > > Well that's annoying - the "mm: memcg: subtree stats flushing=
 and
> > > > > > > thresholds" series had lots of dependencies on this series.
> > > > > >
> > > > > > FWIW, the "mm: memcg: subtree stats flushing and thresholds" se=
ries
> > > > > > has no actual dependency on the zswap series. The conflicts com=
e from
> > > > > > patch 2, which moves some code in mm/memcontrol.c, which happen=
s to be
> > > > > > touched by the zswap series. The first 2 patches of the stats s=
eries
> > > > > > are just refactoring with no functional changes, so if those tw=
o can
> > > > > > remain in mm-unstable, independent of the remaining of the seri=
es or
> > > > > > the zswap series, then either Nhat or I could easily rebased ou=
r
> > > > > > patches on top of them, and you can easily move the series in &=
 out of
> > > > > > mm-unstable without conflicts.
> > > > > >
> > > > > > Another thing is, the only difference between v3 & v4 of the "m=
m:
> > > > > > memcg: subtree stats flushing and thresholds" series is the reb=
ase on
> > > > > > top of the zswap series. So if you want, you can take both seri=
es out,
> > > > > > and add in v3 of the stats series instead of v4. If you need to=
 remove
> > > > > > the stast series again in the future, you can leave the first t=
wo
> > > > > > patches to avoid conflicts with the zswap series.
> > > > > >
> > > > >
> > > > > Ok, thanks.  I prefer not to make what is in mm.git too different=
 from
> > > > > what was sent.
> > > > >
> > > > > I've left everything in place:
> > > > >
> > > > > list_lru-allows-explicit-memcg-and-numa-node-selection.patch
> > > > > memcontrol-add-a-new-function-to-traverse-online-only-memcg-hiera=
rchy.patch
> > > > > zswap-make-shrinking-memcg-aware.patch
> > > > > zswap-make-shrinking-memcg-aware-fix.patch
> > > > > mm-memcg-add-per-memcg-zswap-writeback-stat.patch
> > > > > selftests-cgroup-update-per-memcg-zswap-writeback-selftest.patch
> > > > > zswap-shrinks-zswap-pool-based-on-memory-pressure.patch
> > > > > #
> > > > > ...
> > > > > #
> > > > > mm-memcg-change-flush_next_time-to-flush_last_time.patch
> > > > > mm-memcg-move-vmstats-structs-definition-above-flushing-code.patc=
h
> > > > > mm-memcg-make-stats-flushing-threshold-per-memcg.patch
> > > > > mm-workingset-move-the-stats-flush-into-workingset_test_recent.pa=
tch
> > > > > mm-memcg-restore-subtree-stats-flushing.patch
> > > > >
> > > > > in the hope that a new version of the first series ("workload-spe=
cific
> > > > > and memory pressure-driven zswap writeback") can be dropped in pl=
ace of
> > > > > the old version.
> > > > >
> > > >
> > > > I see. So Nhat needs to *not* rebase his patches on top of the curr=
ent
> > > > mm-unstable, right?
> > >
> > > FWIW, I'll have to re-send a v8 to fix the kernel test robots/build
> > > issues that I've missed and incorporate the comments/suggestions from
> > > Michal and Johannes. IIUC, your series is ready right? Then we can
> > > have your v3 in mm-unstable first, then I can rebase my patch's v8 on
> > > top of that (fixing any merge conflicts along the way), then send out
> > > the whole thing again.
> > >
> > > Does this sound good?
> >
> > Andrew said he expects a new version to be dropped in place of the old
> > version, and my v4 is already in mm-unstable on top of your series. So
> > I guess you should send v8 against Linus's tree (or mm-unstable at the
> > same base as your v7), and Andrew will replace v7 with v8 in place.
>
> Ohhh I totally misunderstood this email chain then. Woopsies. Ok cool wil=
l do.
