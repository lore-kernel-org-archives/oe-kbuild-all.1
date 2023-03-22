Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B9E15BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 03:50:48 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id l16so10075377ybe.6
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 20:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679457047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0VhsPPpparLUNdAbe0j6h80lVgFzUm7YaynPl05M0Y=;
        b=nKYq8dWuPfnWtGwtat/C+wgBZTbS19b8glC8jBbV0VqStowtRRf+QEWssa96OamjmH
         hTNuozEcTYFz+0SlnnEUTCPdZYRnwfporxdPl55CvAI5td2Bwv52J+XxmFDSX44hyVy/
         ddUs2jswSP6ztRzIojmxKA6Gbd12DoJ4dmetX6++rEmOQJP7DlBmFfUImddgoj4fpupS
         l13pir9HtjvOcjHxM7R1UltJbPZQ6oVQgMYuyqXGN/hgsA1+8Y0o7PMItv3iDosTRytP
         I+u/QFrLedODJvoqsDFgVYLCgSsOhXUkFfNli/1uSweBK5MTcXfvyPGMvGNa1CzMwh54
         BMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679457047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0VhsPPpparLUNdAbe0j6h80lVgFzUm7YaynPl05M0Y=;
        b=mDFTYXmKc04ImcCDzYt/h9Uihy+7b+reZvbPasKCgVEYl7P4f6cmmTyOePVMA/2XQi
         fy12wd12uX89DHbAHoLIj9PJjMa2ohEWEUfHMBHPA+flsx5JrD9NPoo/yzmnO6ZRvBwY
         q5+C3D9s/E0gAjX+KCQA85w3qWchyj0jGVi4A8DFlm5ZGxur6a2hQX4DO3e8QvhPpWj5
         TVrJhvvZ/OVZhEAVr1qRsMFVYMS/3WkAQ/sHW9pfW81t+mWgCm+UD+0Y6sJi4AuV7+rs
         Lx3cjskk558wHLiT5WJ6rYUWaHEpOE2iIuZJjQ9AUGHPXFJM3SsIpu+0TevUNKP53ZXX
         ByTg==
X-Gm-Message-State: AAQBX9d+3P/Sp9/xJNR3BVUTpYxAAep1GkeJ9UOvrJzNa4ylDHBu+aMe
	9tNou9WSWOp0lABSTafRwf0GvLLQT8riAR/8v79b
X-Google-Smtp-Source: AKy350b53zG/5QAQ5I/YqLKtRbtkfqZAKp748OqC6MN+2F+jWaJOYucp9LrzLrPeTgTMflajIql700MYWPpyzuqRfgg=
X-Received: by 2002:a25:e90f:0:b0:b3d:c59:4d26 with SMTP id
 n15-20020a25e90f000000b00b3d0c594d26mr3091540ybd.5.1679457047185; Tue, 21 Mar
 2023 20:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320233720.3488453-8-jstultz@google.com> <202303211827.IXnKJ5rO-lkp@intel.com>
In-Reply-To: <202303211827.IXnKJ5rO-lkp@intel.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 21 Mar 2023 20:50:36 -0700
Message-ID: <CANDhNConSPK78JXv5=Jok6T7y7F8APERYsCFD6h7J+ULRjzasA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] sched: Replace rq->curr access w/ rq_curr(rq)
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 4:12=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi John,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on tip/locking/core tip/master tip/auto-latest lin=
us/master v6.3-rc3 next-20230321]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/lockin=
g-ww_mutex-Remove-wakeups-from-under-mutex-wait_lock/20230321-074149
> patch link:    https://lore.kernel.org/r/20230320233720.3488453-8-jstultz=
%40google.com
> patch subject: [PATCH v2 07/12] sched: Replace rq->curr access w/ rq_curr=
(rq)
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230321=
/202303211827.IXnKJ5rO-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/77507c3a77e09cdc6=
27a73364246f252d918de41
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review John-Stultz/locking-ww_mutex-Rem=
ove-wakeups-from-under-mutex-wait_lock/20230321-074149
>         git checkout 77507c3a77e09cdc627a73364246f252d918de41
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303211827.IXnKJ5rO-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/rculist.h:11,
>                     from include/linux/sched/signal.h:5,
>                     from include/linux/sched/cputime.h:5,
>                     from kernel/sched/build_policy.c:17:
>    kernel/sched/cputime.c: In function 'kcpustat_field':
> >> kernel/sched/cputime.c:997:42: error: 'struct rq' has no member named =
'curr'
>      997 |                 curr =3D rcu_dereference(rq->curr);
>          |                                          ^~


Ah! Thanks for catching this. I've fixed it up for the next revision.
-john
