Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C5DDD2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="j0d2TeM7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5b8c39a2dceso4000111a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Nov 2023 01:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699434703; x=1700039503; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMuS9VUtQy5KrnT43a4MzYfrBVM4VPy604WkHbOeouQ=;
        b=j0d2TeM7fEBeomSrNh4AYmvOuHZfwpMHHVzMPvIkw7Aq7QRIt4iV/ylulcbvnLmtMX
         fBTHzAxbeR6c/Cqkam0r4X345pu0dc5NsAcEChnFB7SFTRxl/znwLhT+ZXTEfdD0LDzd
         w+MyCVvowroJmvkdQFKf2SCTAGX5ZdPfCCLEyn41GF9DSazUu7bSDGFX1gDs9HbpOyo8
         E4tykHR3XLbcftQjL37qtulVMUP+jsjRtI7XTMp2cwMF4vVhq8dLYIUjFLcg/YCm+sgp
         vh5v/ESTChnPbrONC2l7x3nFMSnv3+Ppmx598F7aYvFaBRl9GTJywCCEdi00zo1P9qf0
         PMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699434703; x=1700039503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMuS9VUtQy5KrnT43a4MzYfrBVM4VPy604WkHbOeouQ=;
        b=oQZi0NCgBTuN2dkwGvM+zRPeZnMeGRFRrAQRlGQMs6+5vQv90c1vt3PL3qUI5Vha1T
         UQGhshn5KNF52Gla2IHDqEweasg2kDAfCpXcnfIWZqkhbJ7K2DFqNSNIHii2WqmVKyco
         59pFtda9yMiSmQ3k1ryLv43e0+8BM9cZlCDYt6Jj/HkaxS8S4ZhD4zB4eHjdGsTA6bHm
         sHgLiHi+s/J+euHMTo+64iL+/okNF/Slv4t1gqsdoXa1eW/+zkECRe1/BsOuaznWRpor
         T3Dg5lvtcyiSiFtnfCGZAJkZfRiE25eOzonnsN2yL/qydOb+/963cg+rgOyplysYMcn+
         Ssbg==
X-Gm-Message-State: AOJu0YzVEZSXOIijLCvCub5DFTN+BPl10mPCmGelOOMvqErF8vsErFT/
	Djp0wtSAz4beS3lai9vDgOsjWw==
X-Google-Smtp-Source: AGHT+IGu6RKfXoQbzEtmYb/nOiVZ0PDn9zjKGSsXNReNjOWKcaKl2kHkZbININ5hHpBcvYbQpZPUcg==
X-Received: by 2002:a05:6a20:4413:b0:181:7d6d:c0fa with SMTP id ce19-20020a056a20441300b001817d6dc0famr1717234pzb.49.1699434703540;
        Wed, 08 Nov 2023 01:11:43 -0800 (PST)
Received: from [10.84.153.152] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001c73f3a9b88sm1250872plb.110.2023.11.08.01.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 01:11:43 -0800 (PST)
Message-ID: <84b3e403-56a7-4378-8421-d0c4d6da6096@bytedance.com>
Date: Wed, 8 Nov 2023 17:11:39 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [peterz-queue:sched/core 18/19] kernel/sched/fair.c:3696:25:
 error: implicit declaration of function 'min_deadline_cb_propagate'; did you
 mean 'min_vruntime_cb_propagate'?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
References: <202311081629.NTRLxpiC-lkp@intel.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <202311081629.NTRLxpiC-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/23 5:02 PM, kernel test robot Wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
> commit: c9647eb51bfc7ada985c2798ce87067c557e2a07 [18/19] sched/eevdf: Sort the rbtree by virtual deadline
> config: um-defconfig (https://download.01.org/0day-ci/archive/20231108/202311081629.NTRLxpiC-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081629.NTRLxpiC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311081629.NTRLxpiC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     kernel/sched/fair.c: In function 'reweight_entity':
>>> kernel/sched/fair.c:3696:25: error: implicit declaration of function 'min_deadline_cb_propagate'; did you mean 'min_vruntime_cb_propagate'? [-Werror=implicit-function-declaration]
>      3696 |                         min_deadline_cb_propagate(&se->run_node, NULL);
>           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>           |                         min_vruntime_cb_propagate
>     cc1: some warnings being treated as errors

This is deleted in the previous patch, so please apply that one first.

https://lore.kernel.org/lkml/20231107090510.71322-2-wuyun.abel@bytedance.com/

> 
> 
> vim +3696 kernel/sched/fair.c
> 
> 8d5b9025f9b450 Peter Zijlstra  2017-08-24  3663
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3664  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
> 0dacee1bfa70e1 Vincent Guittot 2020-02-24  3665  			    unsigned long weight)
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3666  {
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3667  	unsigned long old_weight = se->load.weight;
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3668
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3669  	if (se->on_rq) {
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3670  		/* commit outstanding execution time */
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3671  		if (cfs_rq->curr == se)
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3672  			update_curr(cfs_rq);
> af4cf40470c22e Peter Zijlstra  2023-05-31  3673  		else
> af4cf40470c22e Peter Zijlstra  2023-05-31  3674  			avg_vruntime_sub(cfs_rq, se);
> 1724b95b92979a Jiang Biao      2020-08-11  3675  		update_load_sub(&cfs_rq->load, se->load.weight);
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3676  	}
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3677  	dequeue_load_avg(cfs_rq, se);
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3678
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3679  	update_load_set(&se->load, weight);
> 9059393e4ec1c8 Vincent Guittot 2017-05-17  3680
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3681  	if (!se->on_rq) {
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3682  		/*
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3683  		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3684  		 * we need to scale se->vlag when w_i changes.
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3685  		 */
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3686  		se->vlag = div_s64(se->vlag * old_weight, weight);
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3687  	} else {
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3688  		s64 deadline = se->deadline - se->vruntime;
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3689  		/*
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3690  		 * When the weight changes, the virtual time slope changes and
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3691  		 * we should adjust the relative virtual deadline accordingly.
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3692  		 */
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3693  		deadline = div_s64(deadline * old_weight, weight);
> 147f3efaa24182 Peter Zijlstra  2023-05-31  3694  		se->deadline = se->vruntime + deadline;
> d2929762cc3f85 Peter Zijlstra  2023-10-17  3695  		if (se != cfs_rq->curr)
> 8dafa9d0eb1a15 Peter Zijlstra  2023-10-06 @3696  			min_deadline_cb_propagate(&se->run_node, NULL);
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3697  	}
> 86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3698
> 
> :::::: The code at line 3696 was first introduced by commit
> :::::: 8dafa9d0eb1a1550a0f4d462db9354161bc51e0c sched/eevdf: Fix min_deadline heap integrity
> 
> :::::: TO: Peter Zijlstra <peterz@infradead.org>
> :::::: CC: Peter Zijlstra <peterz@infradead.org>
> 
