Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D730597F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851848; cv=none; b=YW7g77Ud5KnrmoGIyhdS5+wiS3zo8tDJKdqbc76qbgaCL1UQdUiqOIRZTBMKgqaD9T47TfkcqY4CaMpZan1h8502atnDI0eNR6a8UsumJZIORWteJvRy+2blcJMiw3BAFJqRcPneNVlQ/9WIhxSVH0S1Z4gDe6bGJdhSsIwcvas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851848; c=relaxed/simple;
	bh=I+x50kw7eD/yFvO/RXyr3WRAFE/OaL8Au1f1VOnxJ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsCGa9g9MQqFGf3S44hQ+uIUaDe6/1FJpK4C+/wUTRAc1be5k4JnQQRqfTbdw4D8biKV+l67AiMfBsnpHTmEylpckGkAPIJKubVJoZqzhu3CFwegGaVpTNrTaXaJQLGFUAxfH9wUgdY/wT9cAYJ7/BbX3wVMrFHO4dg5moW3TNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cnfvh1If; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cnfvh1If"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so6207055e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Dec 2025 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764851845; x=1765456645; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ia1NqmdvWfkLXAzH0MNKGnJbJSAy5z/VpGTUT9Z+iC8=;
        b=Cnfvh1If5BWWh1X8g1XPmeY/QzXo7WY5QyePURBk3EELqx4z7Vy4uIUN8qRUMASAb4
         hmO5qOBB4G4ot55GCpXG5ASUFc19DGyhGc8j0uu1Adxcdp43TCpva8P+k5VqmpSgbd5N
         nssGiP+Eyhba4l2VEjR9kS5OXMDAI/8nONzeNj81yY0jhWVVvX0qytgQIjkcvenqxfKV
         uEn3r6rTkKg8eiLxRLHGqkwgBlcyeUOvYDbjtb6xU/65viZuBZYuc4dC8l84elj3JoGx
         zh4rGhmVkHzgv4P9+Z+VJt1N5NuSiqQRjsfvRwih2+5qrdbNefGIvFGwlYwTxEHl4E8S
         PIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851845; x=1765456645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia1NqmdvWfkLXAzH0MNKGnJbJSAy5z/VpGTUT9Z+iC8=;
        b=dFHiZpGo7JfDBsK9HLfCnth1bz5wVcI2W0MiKllGNECSP/PHhqee10+QIcMSlUphR+
         XHBylVWA/H7ZbN/gc46ahf+Y0Jd7eqyPlhXYcX5jxreXFqy5bue0J9uKm5S7aUMz1g7D
         V/mihuzbp9c1Yhj5E1D1iWBw1LtFNjKmjpLmvr5SVNUPx0UvwBrCUVHs2YPHHrJHggRY
         whATAgJ896rqI7K5GzESBKFc1vbQZJEzFLxN6gr8oqaiCfO0VMCQgJjtl2qaKSMBS8NL
         qPk+35mpTBaNTTPgNuSf0G+kUj0uXVgOwgI14ubBM8eXU4xxi6+30rXPMov9bA061iqd
         3rcA==
X-Forwarded-Encrypted: i=1; AJvYcCU5R5iOy/0GUTEtE4+3ENf9MaDoC57HdQ6fXy9rC1L+zBDsZ0zCmsFJEhpJl6DKrGQmcqNUxPY9IW7ml1YG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn6VFDcmID9aLq6uqYscjEpWQb9tWMG5DpZ4VQVxv4g1OP7Y5V
	GFMMKx8ireWN0jlMrg/8FAoil3k3QrEqD1O/v+4WOlxOiYjw4eUxDZwB2R6zx6qXTjI=
X-Gm-Gg: ASbGnctz+/jN0JjqKnddWdaX1c8NRp8U1bAdyWNGpRECMpfVEDK8kguqFKrDGitplbe
	0O8Uoo9xB23UtrnI6hKoR2E44EAsQWaR5ut2ytiZdutN/Qc0Sh5QrY9cb1v3UFLwPNEbsw1ArHC
	kp3sGBdwe0hCjhcYy5gS54qFVtLah1kFQUPRUGs1sBAAntkNCkXk39KGP/WNDqCG+jJxscbkmdE
	esI/jcVz+ITPaiGR+JkcubwUnPpb2e6+qYyl79Vuy6Izu4Wed+oXj1Rln52az225c/8bm46LO8i
	tIYNLj/40iRL9pG12fp3zY6BtxRtXynJuZcKVNX66aVxCV2hfa9PKBuX2/Jf8e3QlU/JbNpdGoN
	GWq+P35ng/Hfq2vNCY7Y/h54rXz8eT+0BWUOO/Ok6oGwekLG2ko+ReRADgY+kLI0QscKzUtnKOH
	CxM1ZB8NxBMjDPTPlWrMdsIm1zQx/hIQWgp+Vb
X-Google-Smtp-Source: AGHT+IHqn2BhHzF5lqBtfDobXTknqzY//sbRwRYp4UNor2Id91FE3wWAPEWWaSzWUXUDQX+NOcTnmA==
X-Received: by 2002:a05:600c:1d1d:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-4792f24418bmr28417785e9.6.1764851844520;
        Thu, 04 Dec 2025 04:37:24 -0800 (PST)
Received: from localhost (h1f65.n1.ips.mtn.co.ug. [41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b140cf4sm47488925e9.5.2025.12.04.04.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:37:24 -0800 (PST)
Date: Thu, 4 Dec 2025 15:37:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.sched/flat 31/31] kernel/sched/fair.c:13541
 unregister_fair_sched_group() warn: variable dereferenced before check 'se'
 (see line 13538)
Message-ID: <202512042010.Kvt9IxPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/flat
head:   d8048abc1303ce09d2ed220c03377f633bd106e4
commit: d8048abc1303ce09d2ed220c03377f633bd106e4 [31/31] sched/eevdf: Move to a single runqueue
config: mips-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512042010.Kvt9IxPC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512042010.Kvt9IxPC-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:13541 unregister_fair_sched_group() warn: variable dereferenced before check 'se' (see line 13538)

vim +/se +13541 kernel/sched/fair.c

6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13528  void unregister_fair_sched_group(struct task_group *tg)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13529  {
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13530  	int cpu;
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13531  
b027789e5e5049 kernel/sched/fair.c Mathias Krause         2021-11-03  13532  	destroy_cfs_bandwidth(tg_cfs_bandwidth(tg));
b027789e5e5049 kernel/sched/fair.c Mathias Krause         2021-11-03  13533  
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13534  	for_each_possible_cpu(cpu) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13535  		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13536  		struct sched_entity *se = tg->se[cpu];
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13537  		struct rq *rq = cpu_rq(cpu);
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24 @13538  		struct cfs_rq *parent_cfs_rq = cfs_rq_of(se);
                                                                                                                                 ^^
Dereferenced here

f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24  13539  
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24  13540  
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03 @13541) 		if (se)
                                                                                            ^^
But this code assumed it can be NULL.

d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13542) 			remove_entity_load_avg(se);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13543  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13544  		/*
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13545  		 * Only empty task groups can be destroyed; so we can speculatively
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13546  		 * check on_list without danger of it being re-added.
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13547  		 */
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13548  		if (cfs_rq->on_list) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13549  			guard(rq_lock_irqsave)(rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13550  			list_del_leaf_cfs_rq(cfs_rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13551  		}
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13552) 
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13553) 		/*
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13554) 		 * Clear parent's h_load_next if it points to the
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13555) 		 * sched_entity being freed, to avoid stale pointer.
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13556) 		 */
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13557) 		if (READ_ONCE(parent_cfs_rq->h_load_next) == se)
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13558) 			WRITE_ONCE(parent_cfs_rq->h_load_next, NULL);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13559  	}
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13560  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

