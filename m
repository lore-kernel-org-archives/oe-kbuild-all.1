Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E25A3B4EA4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779864553; cv=none; b=WHosj8A0YwVDbcTYtaqPXMrHXplGx+bmWSnIB3iNYRRinO/gMi7madwbzvSELp/M7gPEZ1qpeKCIkL25P+2Co6bmgQv3+0/wgfNY9zf51S9Cg+LNxh+fNlHBASKkgzruLVxBtzKcO0JeXiPENLzwiduV6u4agLpLjU4Wjyi+jIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779864553; c=relaxed/simple;
	bh=CTTcgJIuFGfR0NeAr+JNPvCyCJ27p/lX3VRVPU1/L6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgxVxhP7rHsI1BTmHixhBFdcz7o50RuO9gRvdgMRG2qPN6qxFyNrtsB+CdGjD75/A0/x3Dqh5VQtiDYExGbEyTrcHoh4Rs/mSQTxg5lbKZdIHMJgLwJdlbRQ3XNkBFwrLbtwCMmKmGgQ/ajY8MPN0Yob16b/e90YLPzAFFOoo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57512b86273so8280937e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 23:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779864550; x=1780469350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGQsN8kWbUvqVHkHzuwD1FaM65zfktEyANqUCmyB2cw=;
        b=Fl1efv4q5R2h2yD3ZB1wuYpmEAxu3wIdpQiM5yx+cJa1AQ1NfPanycs1a6od+9imp/
         fzO4r+T/NXE4TI3MyD5uQf36PekoLO5UnuAH1QN2S71amauEOIIVcWyg2DRbRP8OccjA
         XHaX39YJaO1Zy4tCPU2iBqBTZhU9CbUMvjaCEhW8Vh/HhcafzPb6+qR1p0LHi4yqnfaa
         2iVH4QQe4hCWXal6tGB1TXu0L3wQiNdDNQjiSnEZnvkuSwuZ0oaRlmTlSKKUlHRSSRtU
         Cq/2QEu9KiM1+KZcRSKPTRxeabeLMgq3DcU9IFVgDWq73cd6ydMQFTWvH1CfwIDTqmHs
         om9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+wIbsyNdydueqAPqQmYotIoT78FDDqb8YXNDlULbqY/ArgIT+7HoPpo+r3Ywc2sBOTrLyw+aOzVxyY3GlT@lists.linux.dev
X-Gm-Message-State: AOJu0YzCG9qFEbEDVgxlKpkvUtZ0v5pDDDmLponkgvt+Mjy1lNFk6FNx
	fpaW9q249y58WWDRGtLcqfCviWLZSmHWewKtndEFPhZayoTVb/thj+YxK6HFOZW2PX8=
X-Gm-Gg: Acq92OHHb0OYO/NADEiGmIBJ7lLx+I2DEk6jATq38gXmP0ib2v0d1+fmwDh6eUE9EHM
	DucILVn1TOR45+ThqVhm6sYF6W3T4IeV2O8rtjfHftYeV1Ap4E8njF4UDQ9YtftmYoAvEUr7VQP
	359rBfo6aXHe4/Mb5VhLW7pK6/ovPmhqVE1Q8KuMfuVVIewI7KigV1Kc5azv+gkbx66XnO7mqrS
	SVuWwImMpBiKNUKPW3huAXmnpC/r4qrXnk4MUHGizSq4wQeje0jJDWg5KQrvoei3Gv3xuFQgU1W
	X/v6NfOkb2+eoRk61br/elwJ0wcnscpuFgF38gZcOlmLH43dKl6KqS5wcqOHCdjQIqIsmalZWUp
	ni3+ZBGj4PR/ccyowRCvCpBFtUzIc4/qVMU+VpPT06mAtSMOeONQEkrCKn0kjT3LzK0vsbzrJe+
	NJINzHJuHpk2chVRkreoT/VrPyRlC8zVFYJwlAQRMc2b5tRK9PB3wb3TzU99En
X-Received: by 2002:a05:6122:4885:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5865fc03296mr12779782e0c.6.1779864549920;
        Tue, 26 May 2026 23:49:09 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f37281e7sm19166503e0c.7.2026.05.26.23.49.09
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 23:49:09 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-63127c440ccso8720052137.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 23:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8xgwCmoM6Eoyvd4wXw/dnpMPGe0N0G7eO/yUd694gOJ2VaFGIKFBcYqQ9vlw6FSQyLpnAJQUabIj23Z2py@lists.linux.dev
X-Received: by 2002:a05:6102:4424:b0:631:3bbb:f23f with SMTP id
 ada2fe7eead31-67c8113bf3dmr10713469137.26.1779864548971; Tue, 26 May 2026
 23:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526071537.17460-1-likunyu10@163.com> <202605270352.wVynZOtB-lkp@intel.com>
In-Reply-To: <202605270352.wVynZOtB-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 08:48:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7Bu57UyjtkYWwNjt_HTHMGMGQp5eXARDu7BaRfwHeQg@mail.gmail.com>
X-Gm-Features: AVHnY4L19Z4TB8Namr2IRXH8HebcyxQK18c7Wbbb4ad0PngUbjXHbSlaowDD2NE
Message-ID: <CAMuHMdV7Bu57UyjtkYWwNjt_HTHMGMGQp5eXARDu7BaRfwHeQg@mail.gmail.com>
Subject: Re: [PATCH] kernel/sched/fair: Fix the issue of virtual runtime
 conversion error
To: kernel test robot <lkp@intel.com>
Cc: Li kunyu <likunyu10@163.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 03:17, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on peterz-queue/sched/core linus/master v7.1-rc5 next-20260526]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/kernel-sched-fair-Fix-the-issue-of-virtual-runtime-conversion-error/20260526-151853
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20260526071537.17460-1-likunyu10%40163.com
> patch subject: [PATCH] kernel/sched/fair: Fix the issue of virtual runtime conversion error
> config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260527/202605270352.wVynZOtB-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270352.wVynZOtB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605270352.wVynZOtB-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: kernel/sched/fair.o: in function `hrtick_start_fair':
> >> kernel/sched/fair.c:7633:(.text+0x701): undefined reference to `__udivdi3'
>
>
> vim +7633 kernel/sched/fair.c
>
>   7603
>   7604  /**************************************************
>   7605   * CFS operations on tasks:
>   7606   */
>   7607
>   7608  #ifdef CONFIG_SCHED_HRTICK
>   7609  static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
>   7610  {
>   7611          struct sched_entity *se = &p->se;
>   7612          unsigned long scale = 1024;
>   7613          unsigned long util = 0;
>   7614          u64 vdelta;
>   7615          u64 delta;
>   7616
>   7617          WARN_ON_ONCE(task_rq(p) != rq);
>   7618
>   7619          if (rq->cfs.h_nr_queued <= 1)
>   7620                  return;
>   7621
>   7622          /*
>   7623           * Compute time until virtual deadline
>   7624           */
>   7625          vdelta = se->deadline - se->vruntime;
>   7626          if ((s64)vdelta < 0) {
>   7627                  if (task_current_donor(rq, p))
>   7628                          resched_curr(rq);
>   7629                  return;
>   7630          }
>   7631
>   7632          if (unlikely(se->load.weight != NICE_0_LOAD))
> > 7633                  delta = (NICE_0_LOAD * vdelta) / se->load.weight;

vdelta is u64, load_weight.weight is unsigned long, so please use
div64_ul() instead of an open-coded division.

>   7634
>   7635          /*
>   7636           * Correct for instantaneous load of other classes.
>   7637           */
>   7638          util += cpu_util_irq(rq);
>   7639          if (util && util < 1024) {
>   7640                  scale *= 1024;
>   7641                  scale /= (1024 - util);
>   7642          }
>   7643
>   7644          hrtick_start(rq, (scale * delta) / 1024);
>   7645  }
>   7646

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
