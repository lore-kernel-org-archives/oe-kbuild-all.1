Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310542AD3E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265362; cv=none; b=AXX+xXBIwJylE0ptsMXJ0YI7KHDfVyvzYNE2TQAIdnfcMqBNUPNP5kI91juxhwG7m3SZLL51MwUv3ELmgNdtQGF2fc7XoTbwDx5EebXuDcbBHANkogiTVWMmpb/TOX8QKBKlb/P/gYbT5y5UfudHRd4zo/zbhZSDTXp3FWYCNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265362; c=relaxed/simple;
	bh=Y43MVgoYCK2w9pwminAGbFyUqf3DeM14oCsnDjRobHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jksigMGSlQ0Eo6vuxzRyFjWSravm2IoNTjzIdzow0HKNkDDu+/ZF5XwjUIUcAmwuFiwA/d08ukLPp68NZJuJN2iksmAgSvdo7TbACL9WmYwspM66SokzyH1PgiiBaqFqgoCuVJAJu3LLFSDcBsgs+FRSKGj+7wgfVvhnzNk6XGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fUZ8x6+L; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fUZ8x6+L"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31d489a76dso5623952a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1753265359; x=1753870159; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QfdjgPzUCQA0b0bQ/jSwtPcxuHgkS9Iiqt4tSnO/IQ=;
        b=fUZ8x6+LwblKxpkCmyFNjMXn2cqp2dPzh4+hZBypSxp7QDXh6Q5eM0BOlX3n8pLAe0
         ubC7jC2QUhzENWgIE4zTaeZzmoSB5og7q1dMKqa7grbE3w5aluVpa6wvuu9XLZQti3V2
         3htEt6AhARz9fYz6Pbb0tlV0KJarL4b70CpKQzzjYA1Puw29fEbARDgBheqob4st5gcu
         yqixNDQjxPRKi0uAblXuOhnaQm15fkfeh24+1Kd0ddKKe+YkqH6QMeYay/f/5ia7EICK
         ja2m/0ZQHL5M2GmYhP/KS9v4UqfrbeAk9fEN3F24U3PmVWZ/xSl8FLh7HVkyi0UZObbk
         k3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265359; x=1753870159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QfdjgPzUCQA0b0bQ/jSwtPcxuHgkS9Iiqt4tSnO/IQ=;
        b=Bjb/370c8WFYUy2F0Hn2I+83yjg5LEcyYu/sBUTUvaKDoSan1V46GbMIpt7oVXznvP
         v/bXKGdETnXPGESjtQBNsSgpz3+GXwPiw6e2cJ9UECCuJ8JsjEtEokVZlGTNn7RtXcg8
         wAV2jttoqa3nvKe693fG9/y4EHM00z8+NpxHzP5y77aQK7yCutwMhQCGobzL5ZPK26RF
         qzHTScWB55HBqG27pcX8KxlkSFURWoE3WeieucuMM1vMvR1M5DceKmqXlCRH2lRCkwzg
         N0dKJ5e1PNeUnX6Kc+BF0YFghkGmAqCqmW5tCZQlfCxE8FDs8jBsLycE2cPMAJhiMS5r
         9GHA==
X-Forwarded-Encrypted: i=1; AJvYcCXDk0X5IR6gfOr9Kf3MtxyIyG3oC8EIMwLCZb4aaZUwp1tLwt4CNfvw3dPeDSXE1P6QXyh6bVgCm3hShB89@lists.linux.dev
X-Gm-Message-State: AOJu0YyvWE87dELzuaxbXb5uiUz27MomoKoXYzyPKLaEOTN2y8oqisOv
	F50SgXYULzYWLKBTBb9ffszXZRN/szx7h9GHBhUiJ+ZuNL6AGGVQQ+cXsEKYZh7MQA==
X-Gm-Gg: ASbGncsaEu1qwWQC4lwXy1+DtunZO2CKq4F52VJjyeiZhCgWpG8vLhvP7NqwJAWbKzz
	tXdUrU0s7pmGspRaYAo8QtzQHP6XCycHKMsMDGHhYWpOl4JzwSNZFwttyMSisnqlYjgBCrz8jaq
	dAFWWsnOXZi9Iw1+Z/tpCFVGk5k8YGkdrWu6GpcUf7l0heCtIsEfp1bXhmnstGA3pO5z4CFXcOd
	vS+lH319KCehaAzYpdu6B0l5ExrpxNmRlKvJ9jEWbRBaYEKb25HZ9vgStZ5G1dvun1abTlQBQ0K
	z8hCw7wkfrme8PPE+/h5jVe+bRDqw7KSOmDkdCOfco5sJ+vJCgmgqBiQ4v9TeygM8scrHh+oKtG
	75gJcizfzHtf1fjbC+RZH4JSXuZ4S2m+fJw==
X-Google-Smtp-Source: AGHT+IEUKbvODSjekeF5b2WIPYBxcQtVjL9BpBkd+wvWjE0rRVo3cAawMq8sREm28HfrlePoCNtbyQ==
X-Received: by 2002:a05:6a21:3995:b0:232:1668:848d with SMTP id adf61e73a8af0-23d49122195mr4025470637.27.1753265359325;
        Wed, 23 Jul 2025 03:09:19 -0700 (PDT)
Received: from bytedance ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e244fsm9439934b3a.20.2025.07.23.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:09:18 -0700 (PDT)
Date: Wed, 23 Jul 2025 18:08:59 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Songtang Liu <liusongtang@bytedance.com>
Subject: Re: [PATCH v3 3/5] sched/fair: Switch to task based throttle model
Message-ID: <20250723100859.GA25@bytedance>
References: <20250715071658.267-4-ziqianlu@bytedance.com>
 <202507162238.qiw7kyu0-lkp@intel.com>
 <20250717035243.GC32@bytedance>
 <aICbpytNfGRRrqq3@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aICbpytNfGRRrqq3@xsang-OptiPlex-9020>

Hi Oliver,

On Wed, Jul 23, 2025 at 04:21:59PM +0800, Oliver Sang wrote:
> hi, Aaron,
> 
> On Thu, Jul 17, 2025 at 11:52:43AM +0800, Aaron Lu wrote:
> > On Wed, Jul 16, 2025 at 11:20:55PM +0800, kernel test robot wrote:
> > > Hi Aaron,
> > > 
> > > kernel test robot noticed the following build warnings:
> > > 
> > > [auto build test WARNING on tip/sched/core]
> > > [also build test WARNING on next-20250716]
> > > [cannot apply to linus/master v6.16-rc6]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Lu/sched-fair-Add-related-data-structure-for-task-based-throttle/20250715-152307
> > > base:   tip/sched/core
> > > patch link:    https://lore.kernel.org/r/20250715071658.267-4-ziqianlu%40bytedance.com
> > > patch subject: [PATCH v3 3/5] sched/fair: Switch to task based throttle model
> > > config: xtensa-randconfig-r121-20250716 (https://download.01.org/0day-ci/archive/20250716/202507162238.qiw7kyu0-lkp@intel.com/config)
> > > compiler: xtensa-linux-gcc (GCC) 8.5.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20250716/202507162238.qiw7kyu0-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202507162238.qiw7kyu0-lkp@intel.com/
> > > 
> > > sparse warnings: (new ones prefixed by >>)
> > >    kernel/sched/core.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/thread_info.h, ...):
> > >    arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
> > >    arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
> > >    kernel/sched/core.c: note: in included file:
> > > >> kernel/sched/sched.h:741:44: sparse: sparse: dubious one-bit signed bitfield
> > 
> > Same problem as last report.
> > 
> > I've downloaded this compiler from kernel.org and confirmed there is no
> > such warnings after using bool.
> 
> 
> want to confirm, do you mean you can reproduce the build sparse error
> > kernel/sched/sched.h:741:44: sparse: sparse: dubious one-bit signed bitfield
>

Right.

> 
> then after doing below change:
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 3c3ea0089b0b5..6eb15b00edccd 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -738,7 +738,7 @@ struct cfs_rq {
>         u64                     throttled_clock_pelt_time;
>         u64                     throttled_clock_self;
>         u64                     throttled_clock_self_time;
> -       int                     throttled:1;
> +       bool                    throttled:1;
>         int                     pelt_clock_throttled:1;
>         int                     throttle_count;
>         struct list_head        throttled_list;
> 
> 
> the issue will disappear?
> 

Yes, that's correct.
