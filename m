Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED1946D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 20:05:08 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54ee108142eso181601427b3.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 13:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681243507; x=1683835507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO8SDydNd+IrXInu2nXrTfrv/eWoGcO3nUlpv8kIz+w=;
        b=G+KL9n8F2o5F1xizPS1iMiV6akiuzoW8/frfb3Ysj9ZZ0XyCjpL11PHn21/xL0RXzt
         uq96fAhswYFJlWFhY/9OBgErWkwDreJCCHK/P1mgTQY0kJhJCWvo4U9aWXPDMXfiiGPC
         JjxDNSOMA9t7W1KMRqS/2CRGiEcJPrZhQdJ8UCfO7j+tT7OBm5WIxwChlvuojkXnwgBP
         D9hk8oOkWiQQwNOoPdubhxdgRPAqhOFl3LwQ/fxEPnDInGx6/+MB+08K+lyEsT3UWRXT
         oNysdW8zFRbRYG5LlZ8Zf2HgKH7obQEYL9rpspO4UesK23KT5+pCcbkY5QmA2tdDdPsp
         Rl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243507; x=1683835507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO8SDydNd+IrXInu2nXrTfrv/eWoGcO3nUlpv8kIz+w=;
        b=M6WsYd5rk+gjJ5Pf0VdEsXLXQFkulkqTOFRsT8bKFkWZRJTUS07K1Fhqe/qpgmRyQp
         plOUEIPD1avzEngfMrluWXpTv9BG+ykhXsZ/70ImPJuj7wqC0u89Pf2q6glYmvr0O1Ol
         hSHsliJUrz7OHypuBPOiiVHfmWlSrDKyyzHvdN+Pl7o0L68OpzAg12OsTJsHvNaWL2YF
         gGDcp1sOY36/fg1r0Eee5VSan0lGwvlW5beMkL1PsbfzD+duiWqXembdHc95tuJq1x4Q
         fePSgaAr41DuP3+EfMcyeIkab4z9+OmFlQBRjBrVi1Ya7FXxagdY0yL79S7YrNkNxYZ0
         axag==
X-Gm-Message-State: AAQBX9dbGHNThhwpon1jSY6d1Sn8GMWkHD7DQOrRZDvAr4fl594liIYz
	7VO38lP8BRSamHpLtMn58vcwAYnlPeZi1DZ8GdCp
X-Google-Smtp-Source: AKy350bzBr36gmvHkDb7HsTaZ6dYaCXyNbEjdyvMQi4LYv598zEptXnjPiUHqtXDKRAepxmnyYsy5eYS0y83+SbbXXQ=
X-Received: by 2002:a81:b70e:0:b0:54c:5102:2196 with SMTP id
 v14-20020a81b70e000000b0054c51022196mr8668345ywh.5.1681243507053; Tue, 11 Apr
 2023 13:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230411042511.1606592-9-jstultz@google.com> <202304112129.2DLHpwAl-lkp@intel.com>
In-Reply-To: <202304112129.2DLHpwAl-lkp@intel.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 11 Apr 2023 13:04:56 -0700
Message-ID: <CANDhNCrO282Hre0H4Yr+Qg1Nv+eAKGMoTHZ8r4Ka1fZhbVx8wA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] sched: Replace rq->curr access w/ rq_curr(rq)
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 7:07=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi John,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/locking/core]
> [also build test ERROR on tip/master tip/auto-latest linus/master v6.3-rc=
6 next-20230411]
> [cannot apply to tip/sched/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/lockin=
g-ww_mutex-Remove-wakeups-from-under-mutex-wait_lock/20230411-122859
> patch link:    https://lore.kernel.org/r/20230411042511.1606592-9-jstultz=
%40google.com
> patch subject: [PATCH v3 08/14] sched: Replace rq->curr access w/ rq_curr=
(rq)
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/202304=
11/202304112129.2DLHpwAl-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/b562351b6a0f874c8=
0020dfc83b22a6f8959aaec
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review John-Stultz/locking-ww_mutex-Rem=
ove-wakeups-from-under-mutex-wait_lock/20230411-122859
>         git checkout b562351b6a0f874c80020dfc83b22a6f8959aaec
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Ds390 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash kernel/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304112129.2DLHpwAl-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/s390/include/asm/rwonce.h:29,
>                     from include/linux/compiler.h:247,
>                     from include/linux/kernel.h:20,
>                     from include/linux/cpumask.h:10,
>                     from include/linux/energy_model.h:4,
>                     from kernel/sched/fair.c:23:
>    kernel/sched/fair.c: In function 'task_numa_compare':
> >> include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&=
' operand
>       44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_type=
of(x) *)&(x))
>          |                                                               =
        ^
>    include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ=
_ONCE'
>       50 |         __READ_ONCE(x);                                       =
          \
>          |         ^~~~~~~~~~~
>    include/linux/rcupdate.h:462:50: note: in expansion of macro 'READ_ONC=
E'
>      462 |         typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p=
); \
>          |                                                  ^~~~~~~~~
>    include/linux/rcupdate.h:610:9: note: in expansion of macro '__rcu_der=
eference_check'
>      610 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dere=
ference_check'
>      682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
>          |                            ^~~~~~~~~~~~~~~~~~~~~
>    kernel/sched/fair.c:1961:15: note: in expansion of macro 'rcu_derefere=
nce'
>     1961 |         cur =3D rcu_dereference(rq_curr(dst_rq));
>          |               ^~~~~~~~~~~~~~~
>    kernel/sched/fair.c: In function 'task_numa_group':

Many thanks for this report! I've just fixed this up, and if any folks
are hitting this, they can pull updated patches here:
     https://github.com/johnstultz-work/linux-dev.git proxy-exec-WIP

thanks!
-john
