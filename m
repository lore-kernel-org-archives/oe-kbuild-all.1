Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DABB288C25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752649047; cv=none; b=AqfzaMuCPxPrYNjxBKMc+SFrEoBGquuA4DFOPwVYCWb5TbqP0FhHbBd65OUSSByrbNWHq3OR52emwTeM+oauBhZuAo2nhP7uTM1DMKtiTiGXevWLFjzhDrV38/dq/HwKbeDpxj1HlizsSrk4sRtT/mRC9D/JG54Dn7Nf3vojVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752649047; c=relaxed/simple;
	bh=TD0ab6RBX+aJCk6XqnHSMUyK4zPatG+3Dk/SNSvok+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5PLwM6OJflyITPeXANuu9UIFhxelUmoElCVPjlLLbSarpdX7wZNPs7RfOmDW0QK7gXoRCKvM3EcqlG3mRzk5YEP3Oxwdi207ERMfybtuEfVep7IR08Ew/msQuMzx8vKFk7B7zYOARp+YuHzAJj4nc319YK0mnrljKXY/ve9NjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=liDX45MR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="liDX45MR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e1d710d8so78780715ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752649045; x=1753253845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V/rdVFfglErJuT3RW1dM62UVhSgtAT4/g/1LUeyUznw=;
        b=liDX45MR43aSEBQDKPYGsJyb/dfF/Kr+7xAugMgSDIJqcGJRSKsdHoBRn81woDIplm
         rQS37U7TgG+Vl/tqdQ6JXtVwE91D7SvATp86K/LE74iki4NZEb5iCdHRVhRyWm8IhdKO
         2bTdFn4WK87KXG4psYjXHB76tGkmDrfaJT0QqxcCZR3+aKzjleDQhQGAVv9NMomQQDlj
         YzORwrZ0ixFWOGyVdZaYsUbVWMTfvF1xLzWpDOJ1ZfbPidaYSip6rgKjKG1X0wqI5DDU
         yXzlQw95nsjTcN1w+FIqrR0a/qfCoNFm+Erwdyc7I08W4s2QUf/nusvp1cZG8CDGaytR
         LVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752649045; x=1753253845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/rdVFfglErJuT3RW1dM62UVhSgtAT4/g/1LUeyUznw=;
        b=TH4xD3FmOSHQzELGWZO4YNt29MgIK6YeVIMQ5k1Ujxu6PhbDK8uWLv0LpVCWLwSFVT
         TdC88CcIB1z5lT/0nrBm3J01asgOf22yvcqKRLg2AfGGykKENFrkE6TxJtlknE9Aibcq
         xwvtQPGr81P8tFC+Rkb6T/8K9QFgO1xsXYTXIMUd9T3wqEKMMFH1QfiSbAEr2atZc278
         n36HaUA/ZxqojSC1LnxlqW/KjknCY0Dltv5aaOiqLdFyP+SRAXlEqi4BkltjH7Fcp34e
         U6KRBLLw7iC1ISdpWwoVb8E6S4qa7pMm7vELph09ivlKu62QOXtpCXS5ZLZP9UxC+Voy
         8LDw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Wjg42vV+V482gBBDnGoWE3T7PlXO1DVW2wB/gR1vDTzlW0uX1/e0SssLOZK+auYl65iZYf3VwLJFOHCf@lists.linux.dev
X-Gm-Message-State: AOJu0YwMjktBNTu25qT8lraghOM3mIw+xd2/9iqBCrSBkmVsi8ewMF3h
	lLrWGppKGzxYnKeAifGanNnjsdYN5epT9P73MwPjKByguioBq2FP+aPRN8Usv7D6ww==
X-Gm-Gg: ASbGncsDsik4nk+JBgqaE8iWliRCmAXRix5+bsgHuyr20xlBI/3dR2V4FdMU/4atVfB
	pDj9r8pwLTz4MRxCZMw/IeuBhS6wHxUrfNMF5I376IzVPggzoa87bs0PEZjJslC6ygTnN0vZxHb
	H1GzClWKFCVNi09sNVo3w3cLjTZBbvn5alZnjbay2Sqm8Y4BPLd/lNA1m+wzxXiht7LzarZ4I+G
	FS4+rcJ9FogUzfXOSHAwCQO0aO1unHTkd1zMnPydk4r9t+Cp3w2a3xJNg4NNmXgCWY6bRhXqL5o
	wH3omJw9s2SW/QHXuZ1YVn+9gvHYQU/VnLCA2Z/N4H7dpzG1ILIwHj5aqkbbEmlOHjO7LeNZZDl
	eE+eiQYjQEJwtSy5LJTPZugk6Ss91JbyW8ObAqVkochs=
X-Google-Smtp-Source: AGHT+IH9AkRL1S5ovVTdxJDiJDBqDKVqpO2CT21Px6+WwZDjPWtWfdrh5Sv/eFYSidv/uHK58P+1JA==
X-Received: by 2002:a17:902:ea0c:b0:234:c549:da14 with SMTP id d9443c01a7336-23e24f47557mr28595105ad.29.1752649044756;
        Tue, 15 Jul 2025 23:57:24 -0700 (PDT)
Received: from bytedance ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f2b522csm741680a91.47.2025.07.15.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:57:24 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:57:07 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: kernel test robot <lkp@intel.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Songtang Liu <liusongtang@bytedance.com>
Subject: Re: [PATCH v3 3/5] sched/fair: Switch to task based throttle model
Message-ID: <20250716065707.GA32@bytedance>
References: <20250715071658.267-4-ziqianlu@bytedance.com>
 <202507160730.0cXkgs0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507160730.0cXkgs0S-lkp@intel.com>

On Wed, Jul 16, 2025 at 07:29:37AM +0800, kernel test robot wrote:
> Hi Aaron,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/sched/core]
> [also build test WARNING on next-20250715]
> [cannot apply to linus/master v6.16-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Lu/sched-fair-Add-related-data-structure-for-task-based-throttle/20250715-152307
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20250715071658.267-4-ziqianlu%40bytedance.com
> patch subject: [PATCH v3 3/5] sched/fair: Switch to task based throttle model
> config: i386-buildonly-randconfig-006-20250716 (https://download.01.org/0day-ci/archive/20250716/202507160730.0cXkgs0S-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160730.0cXkgs0S-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507160730.0cXkgs0S-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/sched/fair.c:5456:33: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
>     5456 |                         cfs_rq->pelt_clock_throttled = 1;
>          |                                                      ^ ~

Thanks for the report.

I don't think this will affect correctness since both cfs_rq's throttled
and pelt_clock_throttled fields are used as true(not 0) or false(0). I
used bitfield for them to save some space.

Change their types to either unsigned int or bool should cure this
warning, I suppose bool looks more clear?

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index dbe52e18b93a0..434f816a56701 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -737,8 +737,8 @@ struct cfs_rq {
 	u64			throttled_clock_pelt_time;
 	u64			throttled_clock_self;
 	u64			throttled_clock_self_time;
-	int			throttled:1;
-	int			pelt_clock_throttled:1;
+	bool			throttled:1;
+	bool			pelt_clock_throttled:1;
 	int			throttle_count;
 	struct list_head	throttled_list;
 	struct list_head	throttled_csd_list;

Hi LKP,

I tried using clang-19 but couldn't reproduce this warning and I don't
have clang-20 at hand. Can you please apply the above hunk on top of
this series and see if that warning is gone? Thanks.

Best regards,
Aaron

>    kernel/sched/fair.c:5971:32: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
>     5971 |                 cfs_rq->pelt_clock_throttled = 1;
>          |                                              ^ ~
>    kernel/sched/fair.c:6014:20: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
>     6014 |         cfs_rq->throttled = 1;
>          |                           ^ ~
>    3 warnings generated.
> 
> 
> vim +/int +5456 kernel/sched/fair.c
> 
>   5372	
>   5373	static bool
>   5374	dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>   5375	{
>   5376		bool sleep = flags & DEQUEUE_SLEEP;
>   5377		int action = UPDATE_TG;
>   5378	
>   5379		update_curr(cfs_rq);
>   5380		clear_buddies(cfs_rq, se);
>   5381	
>   5382		if (flags & DEQUEUE_DELAYED) {
>   5383			WARN_ON_ONCE(!se->sched_delayed);
>   5384		} else {
>   5385			bool delay = sleep;
>   5386			/*
>   5387			 * DELAY_DEQUEUE relies on spurious wakeups, special task
>   5388			 * states must not suffer spurious wakeups, excempt them.
>   5389			 */
>   5390			if (flags & DEQUEUE_SPECIAL)
>   5391				delay = false;
>   5392	
>   5393			WARN_ON_ONCE(delay && se->sched_delayed);
>   5394	
>   5395			if (sched_feat(DELAY_DEQUEUE) && delay &&
>   5396			    !entity_eligible(cfs_rq, se)) {
>   5397				update_load_avg(cfs_rq, se, 0);
>   5398				set_delayed(se);
>   5399				return false;
>   5400			}
>   5401		}
>   5402	
>   5403		if (entity_is_task(se) && task_on_rq_migrating(task_of(se)))
>   5404			action |= DO_DETACH;
>   5405	
>   5406		/*
>   5407		 * When dequeuing a sched_entity, we must:
>   5408		 *   - Update loads to have both entity and cfs_rq synced with now.
>   5409		 *   - For group_entity, update its runnable_weight to reflect the new
>   5410		 *     h_nr_runnable of its group cfs_rq.
>   5411		 *   - Subtract its previous weight from cfs_rq->load.weight.
>   5412		 *   - For group entity, update its weight to reflect the new share
>   5413		 *     of its group cfs_rq.
>   5414		 */
>   5415		update_load_avg(cfs_rq, se, action);
>   5416		se_update_runnable(se);
>   5417	
>   5418		update_stats_dequeue_fair(cfs_rq, se, flags);
>   5419	
>   5420		update_entity_lag(cfs_rq, se);
>   5421		if (sched_feat(PLACE_REL_DEADLINE) && !sleep) {
>   5422			se->deadline -= se->vruntime;
>   5423			se->rel_deadline = 1;
>   5424		}
>   5425	
>   5426		if (se != cfs_rq->curr)
>   5427			__dequeue_entity(cfs_rq, se);
>   5428		se->on_rq = 0;
>   5429		account_entity_dequeue(cfs_rq, se);
>   5430	
>   5431		/* return excess runtime on last dequeue */
>   5432		return_cfs_rq_runtime(cfs_rq);
>   5433	
>   5434		update_cfs_group(se);
>   5435	
>   5436		/*
>   5437		 * Now advance min_vruntime if @se was the entity holding it back,
>   5438		 * except when: DEQUEUE_SAVE && !DEQUEUE_MOVE, in this case we'll be
>   5439		 * put back on, and if we advance min_vruntime, we'll be placed back
>   5440		 * further than we started -- i.e. we'll be penalized.
>   5441		 */
>   5442		if ((flags & (DEQUEUE_SAVE | DEQUEUE_MOVE)) != DEQUEUE_SAVE)
>   5443			update_min_vruntime(cfs_rq);
>   5444	
>   5445		if (flags & DEQUEUE_DELAYED)
>   5446			finish_delayed_dequeue_entity(se);
>   5447	
>   5448		if (cfs_rq->nr_queued == 0) {
>   5449			update_idle_cfs_rq_clock_pelt(cfs_rq);
>   5450	#ifdef CONFIG_CFS_BANDWIDTH
>   5451			if (throttled_hierarchy(cfs_rq)) {
>   5452				struct rq *rq = rq_of(cfs_rq);
>   5453	
>   5454				list_del_leaf_cfs_rq(cfs_rq);
>   5455				cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> > 5456				cfs_rq->pelt_clock_throttled = 1;
>   5457			}
>   5458	#endif
>   5459		}
>   5460	
>   5461		return true;
>   5462	}
>   5463	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
