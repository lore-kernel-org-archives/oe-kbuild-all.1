Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0C80B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Nov 2022 20:45:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id cl5so17157212wrb.9
        for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Nov 2022 12:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yH4lroM0lccRjMmDthb5fhzeP4eDRl234TJfi4eO4zY=;
        b=BmrW7Pb8PgH85NJmjsaLP3Wagkr+GFcL6qZ4f62fN3RJDq/6a/c9hBuH/m3Cj3Kyjt
         owAfUe19VnDQso7lFyvwE0owxl/XtPPlRKC+MPtS3GRwMU4w4soOX/ochq4yiFnpu+6U
         X/kUOwpwe6pxXSo+z/0wsAnNG4kXKKIOtJ5CW8iqcG0SWtBFE3sYONmoZVGUMfDOKnr3
         1X9ZI5V1zXm4haAO4q2a3pMmYMbs0370ckx9YtDIGmTDHWG0GAATz5p7Bor2MUQE2SCL
         s4C+tsxB6T/6JFqNBSYe3shWeVMjy+ENr4s07wD3dlvFWTA4kr1gNKAg/uWQT4uUmLxC
         tv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH4lroM0lccRjMmDthb5fhzeP4eDRl234TJfi4eO4zY=;
        b=huno/KQOuO5cbcIsNWjfZF7iM8un5GBTkte95TlA5EjQM6wibBSNkKiH8LXdmTfHZ4
         aCv4AW6tN+OaQbUz4nSgo73Yc99auBtnG6XOJNTpsgZe1uNyoVjexyriSTWIosjpV8Eu
         +UCmL0ZU2eW+DHHkLKN33G3I94uSyImRCR8hipIAvtwkdQJvqIMCh/tn7yAj8XG1Pbhb
         AcFIx5E5b4m+dDF22PorRALjf6V/zbOkILVQeu9Rl+LIBH50Rap01rsAak3hENe//X4O
         joEhyF+e6KKbv6kZEv6rSV4Qdk0ILff+37j1+keLivKuk54Yg9wcMMsb3LWnO0j6Bduq
         S+Zg==
X-Gm-Message-State: ANoB5pkFJp9loz6PM1aUNdc7HccbS5YR8Eaupswt22LN7kUBYqQTBw6G
	uLTmnIKN+emSce5OkE14jeoh7Q==
X-Google-Smtp-Source: AA0mqf4vW45zfKzlNKIug6pa0YB7LuiYwzDGKiVPReyAmOX4sa8PbfSYPyhVoVKIyn4LFc/GJjFm2g==
X-Received: by 2002:adf:e647:0:b0:236:69fd:643e with SMTP id b7-20020adfe647000000b0023669fd643emr8894200wrn.560.1668977138383;
        Sun, 20 Nov 2022 12:45:38 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d43cb000000b00241bd177f89sm8667302wrr.14.2022.11.20.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 12:45:38 -0800 (PST)
Date: Sun, 20 Nov 2022 20:45:36 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Qais Yousef <qais.yousef@arm.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip:sched/core 3/19] kernel/sched/fair.c:7263
 find_energy_efficient_cpu() error: uninitialized symbol 'util_min'.
Message-ID: <20221120204536.ei2st4yv76lboe6x@airbuntu>
References: <202211121723.P4V3w801-lkp@intel.com>
 <20221112174705.pymjyzr4nqhkqfoc@airbuntu>
 <Y3H7AcgnGMq5p+nn@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3H7AcgnGMq5p+nn@kadam>

On 11/14/22 11:23, Dan Carpenter wrote:
> On Sat, Nov 12, 2022 at 05:47:05PM +0000, Qais Yousef wrote:
> > On 11/12/22 13:16, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> > > head:   52b33d87b9197c51e8ffdc61873739d90dd0a16f
> > > commit: 244226035a1f9b2b6c326e55ae5188fab4f428cb [3/19] sched/uclamp: Fix fits_capacity() check in feec()
> > > config: riscv-randconfig-m031-20221111
> > > compiler: riscv64-linux-gcc (GCC) 12.1.0
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > 
> > > smatch warnings:
> > > kernel/sched/fair.c:7263 find_energy_efficient_cpu() error: uninitialized symbol 'util_min'.
> > > kernel/sched/fair.c:7263 find_energy_efficient_cpu() error: uninitialized symbol 'util_max'.
> > > 
> > > vim +/util_min +7263 kernel/sched/fair.c
> > 
> > [...]
> > 
> > > util_min/max not initialized if uclamp_is_used() is false.  (I thought
> > > I had reported this earlier but I don't see it on vger).
> > 
> > Thanks Dan!
> > 
> > It's harmless since util_min/max are ignored in util_fits_cpu() too;
> > uclamp_is_used() is checked there as well.
> > 
> > I couldn't reproduce, I need to get GCC 12.1.0, but the below ought to cure it.
> > Let me test it a bit more and send a patch.
> 
> In that case it's fine.  This is inlined.  I guess, generally, we are
> going to only consider passing uninitialized variables to functions as
> bugs when the functions are not inlined.  I believe that one of the
> KMsan things will trigger a warning at runtime for this as well but it's
> the same situation, where it's considered a false positive because it's
> inlined.  (Technically it's undefined behavior either way according to
> the C standard, but the standard is sometimes useless).
> 
> It's not a GCC warning, it's from Smatch.
> 
> GCC uninitialized warnings were disabled by defualt because they have
> too many false positives.  Use "make W=2" to enable them.  GCC will
> complain.

Thanks Dan. I could reproduce it a while ago and I have the full patch below
- but I couldn't run it on real hardware just to do some sanity check and it
seems I'll have to wait for a while longer.

Putting it down here in case Peter fancies picking it up. I'll be posting it
along with other fixes in this area as soon as I get chance to run them
somewhere.


Cheers

--
Qais Yousef


--->8----

commit 8539b7d7b9e3c3bb6d817cbbd5be002f80f6eb31
Author: Qais Yousef <qyousef@layalina.io>
Date:   Sat Nov 19 23:12:34 2022 +0000

    sched/uclamp: Fix a uninitialized variable warnings
    
    Addresses the following warnings:
    
    > config: riscv-randconfig-m031-20221111
    > compiler: riscv64-linux-gcc (GCC) 12.1.0
    >
    > smatch warnings:
    > kernel/sched/fair.c:7263 find_energy_efficient_cpu() error: uninitialized symbol 'util_min'.
    > kernel/sched/fair.c:7263 find_energy_efficient_cpu() error: uninitialized symbol 'util_max'.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <error27@gmail.com>
    Signed-off-by: Qais Yousef (Google) <qyousef@layalina.io>

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4cc56c91e06e..89dadaafc1ec 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7217,10 +7217,10 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	eenv_task_busy_time(&eenv, p, prev_cpu);
 
 	for (; pd; pd = pd->next) {
+		unsigned long util_min = p_util_min, util_max = p_util_max;
 		unsigned long cpu_cap, cpu_thermal_cap, util;
 		unsigned long cur_delta, max_spare_cap = 0;
 		unsigned long rq_util_min, rq_util_max;
-		unsigned long util_min, util_max;
 		unsigned long prev_spare_cap = 0;
 		int max_spare_cap_cpu = -1;
 		unsigned long base_energy;
@@ -7258,10 +7258,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 			 * aligned with sched_cpu_util().
 			 */
 			if (uclamp_is_used()) {
-				if (uclamp_rq_is_idle(cpu_rq(cpu))) {
-					util_min = p_util_min;
-					util_max = p_util_max;
-				} else {
+				if (!uclamp_rq_is_idle(cpu_rq(cpu))) {
 					/*
 					 * Open code uclamp_rq_util_with() except for
 					 * the clamp() part. Ie: apply max aggregation
