Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30771FB35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 21:26:03 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso13025e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 14:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692825961; x=1693430761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE5NUi80BYiMWmMQEl2r329pNGrPmM5nPALAZHC39A8=;
        b=gyVSt5OXIy9m33InJl2cRqgjTnAXbscfq16qPU8ezve9IYTQsTSP5HdhxOX+DoxKLn
         ZYPT+ALh7vZnEZoxXFyZXlPTcxdSm5cNO6JxpZlLh9mwB4wUS2kVFfPtLdL+DTKjR3ii
         CvTlFQJf3XvbjN8QRnmnUp/Hi1yeld4e7t4TP1xxaB6JknbqVlFfo11S9vvR/eUpSiwK
         IC1K12qEHGfIK3dqtZ3jF4b25uB1Veaz8Rls8/4g+sxIXKQNJrD6TCUWyOgMoxhhrKXr
         CQ8C533uzQnegYLv3BvKUOGIgyqHyNBK+4++27nRAocXKbBxncTb0UKgGbW8XumSoh/M
         RxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825961; x=1693430761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE5NUi80BYiMWmMQEl2r329pNGrPmM5nPALAZHC39A8=;
        b=YxmdYJnar9so2tHJRhemicieELpydh3JH11PAfo5ji1MsZzi/AtelZQqBtVQKgbYx9
         6tx1W3hKKGG6WymU/OJeoiIPQLORqqc484JrWNe6hk/EcsfWSEinCraCY686/IwViyKJ
         uP1hjqmh+9p8qwvqxdhcK1B93QOsfnGIu2FuRuwmHP2LTpmqL0dbscenWc8OM7vVtFi3
         slX0nAMOhY3F+ixq8QCXKIkUcHvsRROmV1UCAFfbeqjrIXbPiIY1IQ7YtaWguwz74eWU
         pmACbEWNx2MutxisSZDpQHNWr7CDD6Dz0sDaWOSPJhv7/otu2qTBQMqe1J5jj2wbYTJa
         EhmQ==
X-Gm-Message-State: AOJu0Yz/GQjuPM75Nt6CKDQ8jdDu4G7rFdgUOEPnPxstxEPa26yyopFa
	loFLZbEEgZ/SEOCkf5EGi+w0Yu0Ba7I6xNgi3XlD
X-Google-Smtp-Source: AGHT+IGyZvegz/OMu2JzbjOWZUXuqzRYNJvCk+urb/uxPw44a1nWVrvdjKbzjjJTWgDt8+60lSyMmAMzeWYEoBaYYeE=
X-Received: by 2002:a05:600c:512a:b0:3f7:3e85:36a with SMTP id
 o42-20020a05600c512a00b003f73e85036amr299558wms.7.1692825961407; Wed, 23 Aug
 2023 14:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230819060915.3001568-14-jstultz@google.com> <202308240439.2aDXO6Ks-lkp@intel.com>
In-Reply-To: <202308240439.2aDXO6Ks-lkp@intel.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 23 Aug 2023 14:25:50 -0700
Message-ID: <CANDhNCpuozSe7Ygf84iRmmUtA2C+MhNUj+TfBn-rqe=7BwVu3Q@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] sched: Split out __sched() deactivate task logic
 into a helper
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Youssef Esmat <youssefesmat@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 2:13=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi John,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/locking/core]
> [also build test WARNING on linus/master tip/auto-latest v6.5-rc7]
> [cannot apply to tip/sched/core tip/master next-20230823]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/sched-=
Unify-runtime-accounting-across-classes/20230821-121604
> base:   tip/locking/core
> patch link:    https://lore.kernel.org/r/20230819060915.3001568-14-jstult=
z%40google.com
> patch subject: [PATCH v5 13/19] sched: Split out __sched() deactivate tas=
k logic into a helper
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/202308=
24/202308240439.2aDXO6Ks-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240439=
.2aDXO6Ks-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308240439.2aDXO6Ks-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/sched/core.c:6565:6: warning: no previous prototype for 'try_to=
_deactivate_task' [-Wmissing-prototypes]
>     6565 | bool try_to_deactivate_task(struct rq *rq, struct task_struct =
*p, unsigned long state)
>          |      ^~~~~~~~~~~~~~~~~~~~~~

Ah, thanks for pointing this out. Switched it to being static.

thanks
-john
