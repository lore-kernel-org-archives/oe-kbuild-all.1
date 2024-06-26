Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552318F2EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420004; cv=none; b=gPWdRlQoAAaojFguLF5ZTmUpbjoTG+juOMaPedIasi9IlQJLxBLyVgK5H/BH6uSyO4DW6tACdVEv+CAGT3/JTYLgHQTp4AK+mlCvU1qNAaDNftR0gKcLeCPqV5A4JWfBbtuvPZ3ssatjxgA88UQ+2KIGYUPno1DvA7EPGMaoXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420004; c=relaxed/simple;
	bh=YV9/icVc6lzDEO8OYcJE0XQRXgINYRH3msKg8FFxayo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcadqDGPTnjrYtK/XhpMPvwGlUIrUQn1fdh9Al+ukmJqHiAQCg3puHg9f/Kw06BLCwd0/lFr/py3DLPYQ3lX0fSD5uUZdZnNd+Fti9NEs/CEpM7EmMnzbeMa2QrIzzqh6d8nKKNHuGXgTqgmW6hxZKQvDs2H4PvpmCvaX7V9CIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzaGCLyU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzaGCLyU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c1a4192d55so5295372a91.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719420002; x=1720024802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PmVM/FVjhE1U96ewNkQneTe3zMfXIBmoV2N2qaVWME=;
        b=jzaGCLyUP/k1LzlPi0+6NKz1kfMt0wLaQ3VcWF6rGUREJKORh1eEtb4Xiu54baFPsH
         h59T1dFU1FR87sX1NYNLv1/KFsE1pfrQbLX0k5U2Xft43XavwltJWtt6kB3Kf4KIgbSM
         yrcaLPz7mJ4jtNNIWDEzvBPx20FCeCgLtSnXL8peRxvEeponPqfDvbA1XYFnIXXPeq5y
         gzF65OzlpVUpteSaEVEAYVdC9S/VphhEvjKp0d03Ji1ZKxBzOgDKNsZcmaCy8VUdrzVu
         ntTW9XOgdnhOjYk3+/Zd0b8btgRS84b6zXg5VGTVt2+IXrXuGrXEzrXNjBe1ijPssPnj
         A9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420002; x=1720024802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PmVM/FVjhE1U96ewNkQneTe3zMfXIBmoV2N2qaVWME=;
        b=EVyNhkkmJjWdwuRO7LAKrONXL5binF3SLdM+EVf+VYti5s+4CAY9hkBeY4O2KRs7EF
         AVMmQMt1dsyu7dkYjHu+8q9EvFMDyL7wGu8R7+oIcCsoTl3OWiV/g/S0BQsk/WGUY70s
         QiaCy7NwOEub60tPX4LFYkL9cLVmKbxS9qMIbsA6ZIUJMK4OVECvUuMgW+F6aDSTh3Pc
         eWl4tacoEQyJsy+XTwQH8TEzQykQ5/BCzxKWxIWD8OIfcjc9cLwUs6TrcB+muQeI+ONW
         2gmBkcuEUX70rwOsJ8nortRUDHVCaK+IL8+UwsZ4w74vZBUu6DbeOsLZb+ZYAAwL5t0U
         6UnA==
X-Forwarded-Encrypted: i=1; AJvYcCVbvl6iS++pPHxuRjmDw/mPzmtuOBr7qxD1KjdYjvb9kRw6ERQyINBEWU+CtCUzrjRKbCiZAghMx1pt5EYMNTcPz5SeYRUMH/yXrvKAlQ==
X-Gm-Message-State: AOJu0YyMujz46vxjJ2SqTLXs2IFiu62+ybpD9fyJ8TzBUpwB67+2aNvu
	fbOpgbqpfk3ldH1WHVh9pW1gihrRImMFHZ4O4WgewzKe/V/4FLoHyuNQafo03VF96VgAiMZWgIs
	cx3uvSyDtajaW9KfmgJgOuDfi5RQ=
X-Google-Smtp-Source: AGHT+IEn4h92e7oasT5nnPF64/zAyGdul6Ls6W3EOgRaH3EXdlq177I/VW1OaSkvDKFHAX3lhTICV/rYWDHPrAVCBwU=
X-Received: by 2002:a17:90b:1e08:b0:2c8:84b:8286 with SMTP id
 98e67ed59e1d1-2c8582911a9mr9291693a91.37.1719420002343; Wed, 26 Jun 2024
 09:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625002144.3485799-5-andrii@kernel.org> <202406261300.ebbfM0XJ-lkp@intel.com>
In-Reply-To: <202406261300.ebbfM0XJ-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 26 Jun 2024 09:39:50 -0700
Message-ID: <CAEf4BzZCggouBtRVEXhYuW9zbT6_-1srNVrkvqV085gGygtxdA@mail.gmail.com>
Subject: Re: [PATCH 04/12] uprobes: revamp uprobe refcounting and lifetime management
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, linux-trace-kernel@vger.kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, oleg@redhat.com, 
	oe-kbuild-all@lists.linux.dev, peterz@infradead.org, mingo@redhat.com, 
	bpf@vger.kernel.org, jolsa@kernel.org, paulmck@kernel.org, clm@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 11:03=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Andrii,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on next-20240624]
> [also build test WARNING on v6.10-rc5]
> [cannot apply to perf-tools-next/perf-tools-next tip/perf/core perf-tools=
/perf-tools linus/master acme/perf/core v6.10-rc5 v6.10-rc4 v6.10-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/up=
robes-update-outdated-comment/20240626-001728
> base:   next-20240624
> patch link:    https://lore.kernel.org/r/20240625002144.3485799-5-andrii%=
40kernel.org
> patch subject: [PATCH 04/12] uprobes: revamp uprobe refcounting and lifet=
ime management
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/2024062=
6/202406261300.ebbfM0XJ-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240626/202406261300.ebbfM0XJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406261300.ebbfM0XJ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/events/uprobes.c:638: warning: Function parameter or struct mem=
ber 'uprobe' not described in '__get_uprobe'
> >> kernel/events/uprobes.c:638: warning: expecting prototype for Caller h=
as to make sure that(). Prototype was for __get_uprobe() instead
>
>
> vim +638 kernel/events/uprobes.c
>
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  625
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  626  /**

I shouldn't have used /** here, I'll fix this.

> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  627   * Caller has to make sur=
e that:
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  628   *   a) either uprobe's r=
efcnt is positive before this call;
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  629   *   b) or uprobes_treelo=
ck is held (doesn't matter if for read or write),
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  630   *      preventing uprobe=
's destructor from removing it from uprobes_tree.
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  631   *
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  632   * In the latter case, up=
robe's destructor will "resurrect" uprobe instance if
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  633   * it detects that its re=
fcount went back to being positive again inbetween it
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  634   * dropping to zero at so=
me point and (potentially delayed) destructor
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  635   * callback actually runn=
ing.
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  636   */
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  637  static struct uprobe *__g=
et_uprobe(struct uprobe *uprobe)
> f231722a2b27ee Oleg Nesterov   2015-07-21 @638  {
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  639          s64 v;
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  640
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  641          v =3D atomic64_ad=
d_return(UPROBE_REFCNT_GET, &uprobe->ref);
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  642
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  643          /*
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  644           * If the highest=
 bit is set, we need to clear it. If cmpxchg() fails,
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  645           * we don't retry=
 because there is another CPU that just managed to
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  646           * update refcnt =
and will attempt the same "fix up". Eventually one of
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  647           * them will succ=
eed to clear highset bit.
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  648           */
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  649          if (unlikely(v < =
0))
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  650                  (void)ato=
mic64_cmpxchg(&uprobe->ref, v, v & ~(1ULL << 63));
> b9adadbcb8dfc8 Andrii Nakryiko 2024-06-24  651
> f231722a2b27ee Oleg Nesterov   2015-07-21  652          return uprobe;
> f231722a2b27ee Oleg Nesterov   2015-07-21  653  }
> f231722a2b27ee Oleg Nesterov   2015-07-21  654
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
