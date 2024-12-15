Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24F174EE4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734269951; cv=none; b=KS80mEtikoQXT5io+1Oy6hcJ49ke6n9gqSZZmdSmgoYeHlxOkBV2cAwO+U0nPA2StSuyQy1oOZYpJBytoRLqsYgfzTkbMQXqJRnkb2PR2AovK8vEq1M3vLCM9MHX4Xi1WYghN7zbp2WG8fXCu0sIsleE2o9cmtToOkDDfF8Mi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734269951; c=relaxed/simple;
	bh=XrmQpKYSflNuoXEKhdYJgDyQhZ51vc8r81OH3xptc9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+H+AN0AWr8evf1upK8lZbQ2ft1SBCPTbyl+ZDo4+qrwhOJ4UTUEjZSDKd/4Oyxw3ZRZZbSKdYrl7fIRDzjEgRs1IGJ1URzX5t8Axcaji4QOtzX17fr1BEI3G3rSBQql1V+1BndkRhoR9hcYfM0jtZSqYaOF5J84mlq5KiS14uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jblgIKUH; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jblgIKUH"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d8adbda583so41759106d6.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 05:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734269949; x=1734874749; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8uqDP/lnio0NPV20RWWSTO61S0pA+rXkOSNzbD4q0Y=;
        b=jblgIKUHGxExxBCByyCumZXtec5iCZ73rQL1gRn4W77hpeJbrh1adpWGNFGenik/BM
         aWq7fAsYKcWsGXc9XNT23noUWGeru7zO0M+zRVxW8uiGQvYgcBMrzXGJrYcWzQHko3+x
         K3rXiMJRikibqpjxcP82ryTnA6cVE7u1gUulQ/oBZxSDefc5HdK+YTuCe9Nxwrfmb4WJ
         4acwtxd1oqndtFQa701TvikjxuZDeywamkE9o3xbXQVxOTaIOZ+lu0e03FH84zOEE7Ev
         HV+QqEwMJDzqD/bnabTK80dskvIWLTtHhsjnPWK0RMbAPu07LGVfTRolsm7tuTu0MvWG
         nDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734269949; x=1734874749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8uqDP/lnio0NPV20RWWSTO61S0pA+rXkOSNzbD4q0Y=;
        b=GsE/7n7EEthjdBoxMXARUrO6JwP7jdONWjmL9yb7UZOsI/04VQf+YpSXXcrvNjfS9U
         BsF8iYAciWsp/G+l2UEMG03JAJUHxS3SbPqbun34mAaJ0CvkQ8kPvuUDVCq6qCVFeROu
         K6Q0bYnZMMQPbh44KBBnERQ4IUGeNc87ksFinXSksRJf9+B78k+LRSnOz2/fvWnRzW+Q
         wOB1CO7Wrl4pMiv2K+eOdFbRmeB7b8Am50hebFOVz1hbxrMArM5NMsHR9wDcObGu2ZmY
         iRyziKot+pyvlfAzhRbA8ON/WXohmCXJfKz1fzpMgPrd431LMpO3OUpu2pQFlXTl3sCM
         vRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9W70toLgqe/E7T3SkOhYkbS64j4rNT9SA7UYmQUPTT5nYnI6KsvWeKhK6vPfOD56mqaIeVtPcY/tPGZgq@lists.linux.dev
X-Gm-Message-State: AOJu0YzRjGKEWKcF1fFN8/KbjiR74VP/8d7GtUueA+Uk+7wjAajovKFN
	nhXAEryPoaROlPDx5In1Nl3t7n4NDCpaERHGNtcgFNyLEiL/OfVEeX37ijikvNaMyckI3MbrzT1
	ANLUDNCrlxabfs4MmpsDaU96HYsE=
X-Gm-Gg: ASbGnct7l87hl4glDHEjhUw2LMkDOllwtwFzrzXsZyiUfkafyk1jwPowrU+w+ZFsTPZ
	Maq8XOcRS7/KTCOo3ypyfQtUQbEQUQ1RgGKSx9tM=
X-Google-Smtp-Source: AGHT+IH1cQTQtahFCfhq2nr+zIjpQm6ClX1Md5Mqi72xfTObwsSxE3+Yv+PNKdT0/pqlixXzv/rqQdqXsGpRjycbFEo=
X-Received: by 2002:a05:6214:2523:b0:6d8:b097:fad3 with SMTP id
 6a1803df08f44-6dc968726bcmr170066866d6.35.1734269948990; Sun, 15 Dec 2024
 05:39:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241215032315.43698-4-laoar.shao@gmail.com> <202412152009.HZ862kna-lkp@intel.com>
In-Reply-To: <202412152009.HZ862kna-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 15 Dec 2024 21:38:33 +0800
Message-ID: <CALOAHbCpO-zeH1u5mQs9FvAP-V9JHf9G8LiQdbapDxoMMKzUhg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] sched, psi: Don't account irq time if
 sched_clock_irqtime is disabled
To: kernel test robot <lkp@intel.com>
Cc: mingo@redhat.com, peterz@infradead.org, mkoutny@suse.com, 
	hannes@cmpxchg.org, oe-kbuild-all@lists.linux.dev, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, surenb@google.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 9:08=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yafang,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on peterz-queue/sched/core linus/master v6.13-rc2 =
next-20241213]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/sched-=
Define-sched_clock_irqtime-as-static-key/20241215-112638
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20241215032315.43698-4-laoar.sha=
o%40gmail.com
> patch subject: [PATCH v7 3/4] sched, psi: Don't account irq time if sched=
_clock_irqtime is disabled
> config: arc-randconfig-001-20241215 (https://download.01.org/0day-ci/arch=
ive/20241215/202412152009.HZ862kna-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241215/202412152009.HZ862kna-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412152009.HZ862kna-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from kernel/sched/build_utility.c:96:
>    kernel/sched/psi.c: In function 'psi_show':
> >> kernel/sched/psi.c:1243:42: error: 'PSI_IRQ' undeclared (first use in =
this function); did you mean 'PSI_IO'?
>     1243 |         if (!irqtime_enabled() && res =3D=3D PSI_IRQ)
>          |                                          ^~~~~~~
>          |                                          PSI_IO
>    kernel/sched/psi.c:1243:42: note: each undeclared identifier is report=
ed only once for each function it appears in

Thanks for the report.
will update it as follows,

#ifdef CONFIG_IRQ_TIME_ACCOUNTING
        if (!irqtime_enabled() && res =3D=3D PSI_IRQ)
                return -EOPNOTSUPP;
#endif

--=20
Regards
Yafang
