Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B032BF26
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768889081; cv=none; b=dbFXc3/fHhWNrPXT/f4ALasmg3bZrJhXVTrPPmekJkif0/YUwK4CHW5dfWgERteRyvp2wDz//3Mo8iLy5M2PZwAPgIIikXh//B09DupWtylQF9AakM/Wuj3S0rOtMfAUDO2o1bXJeXlFyFJEBd+Ep5TKIvv7y3/ScpQM6xCnNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768889081; c=relaxed/simple;
	bh=JvIc1vp2cbVKYAON6c26G/CIQwjvzL1bBrFCuhJimbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdrdvVEwSPg0xe5d2Fz0OP+C9NuQj8dWOQasXgDhuy0qLZVZ+RJZXqEcjwZFyf8odkgcVvD4BSM068KuuoNIHdFnfgQMZ0stBS52UgyLPFlXBCIDkXCBzKJvDquUdzHBxZ3SpaExHIv6EzMZOm2jQ/Qku7rr0DyqvQIj6be5k8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wglEMxLq; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wglEMxLq"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso41181835e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 22:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768889074; x=1769493874; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/NSRTTou2LJ2Pk1D26bEXyySHN0eQh8Qu/U2I9BOl0=;
        b=wglEMxLqJWIVzPRhsU0IebMPwkoK/h8BjnIsV7s5zJPWpD9515dnTY17vSBqx2Zpb3
         hptWlvjp289gqywYNnaJJ4ijJNeoeQC1Gg3cT2uCWjegzCxCdijEDjiT0tQFauc47Cpq
         UC0Oolaqdc2jRdH5uxhYGBfeyLS5IpJL5K9IZtaRYe2BAsHZnJwKR6fJVVGTKFN6jDQR
         z1MA/OvlMmzZ0aRjae+rTBjYiEMvjER7Qwr1C1pvhqxAIpGDoHMTUmCsTa2RkhTjSxxj
         EwjCw2C1rZZsqrzmADG6BMUAzJ0hmRSzX7f1VUmiKyZx25hpmj8tEZMuXV7VxKKilSn0
         lA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768889074; x=1769493874;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/NSRTTou2LJ2Pk1D26bEXyySHN0eQh8Qu/U2I9BOl0=;
        b=kZZwxP/F3LK6iBRDCh9eU9ESzZ8CAS9ZbePEvVYqPsEL5xIdW7dKTz2IigBAS99YXn
         qqPqqFH2EO3Pv450tUnO287MEoj9uqAkprlTITgajud4CBPrOfx6l7qa4XY/kkP6SWhr
         ztIaGiDBMu68mGxYG8RQgRNku/SsyzVRqqY9VY4E8AIf3ZrGh7nHbGzcKDeOAHxdKiAT
         JP1r4R4GP7UPKXt37iJiuVYUE6OtoIC7ilIQuMMucxqiwnUFVBmDEuZtTIERh3sJJXR/
         w4itkM+XhafXrXb3RTgcScgutViDRnskURnI625vwmHZ7FgivnytV/EQrPPrAVIm8iOw
         o7QA==
X-Forwarded-Encrypted: i=1; AJvYcCXPo03wplpwx+pZBkjajS/Ti0zso+9rmHWvsz72/lmDZbh0VRSS4JcxXuQpQhO9k8m/DOMNY7qkogYmU+Uw@lists.linux.dev
X-Gm-Message-State: AOJu0YzpUzzdk4OzjmRTsRIBaY6YXjFcuhWVLQV1aZnMveOLLM7nBBKy
	BE1EfAd9VNzXupBbINEDlguqRQpPptip9gPD3eL1fkxgDAkEdpgIvGwK7W30x4HgAhs=
X-Gm-Gg: AY/fxX5hGgMVvQROJF9WnXDYcJCeNG2zkxiWGYkV0U1LCH5gnO66iI4YQNhLlWGRT4O
	XZIwMJJ11FQ8IMFbrx5dokW8L7BkWanVFJqM8fzGdGuK8ERV6bTNq71sZGy1qeKTTZVrtcEqbIJ
	puIb/bS/hsLNnOaGoh3/sSMS+GmPtGT/hazcgR/E1q4s4bFVS6iPE48GoeWjzvzO112+/cKdfZ+
	bBD/HhMDe7U0pLbc2AKUa4b4NIH16ez9qqicG0qru9+35N+gAMNyltaqsWfAs9DglQV+2Jn0BCB
	Q7rfCYwwm2i3K/A0QJijfCTChZ7tie9lN32VaLE9dj688ZQTzN5HvMz/VPeNEw8jPJjghfNUfpZ
	f6DXY1Nmo0DabsWJ3jJMEDRBD3JFjvtCSi+mZ78SogQgWOgU9a7NgUEQ3yrD3vZtarhaBws1Rqg
	nmI1mqQBMbCvzGMdG+
X-Received: by 2002:a05:600c:524e:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4803e7f1860mr8952495e9.32.1768889073701;
        Mon, 19 Jan 2026 22:04:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm234846305e9.14.2026.01.19.22.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:04:33 -0800 (PST)
Date: Tue, 20 Jan 2026 09:04:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 216/223]
 fs/bcachefs/data/ec/trigger.c:378 bch2_trigger_stripe() error: we previously
 assumed 'new_s' could be null (see line 356)
Message-ID: <202601192049.4ACBGS97-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   1c240e59948ecca320c96b94db4ffae87581d477
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/223] bcachefs: Split up data/ec.c
config: arm64-randconfig-r073-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192049.4ACBGS97-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601192049.4ACBGS97-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/ec/trigger.c:378 bch2_trigger_stripe() error: we previously assumed 'new_s' could be null (see line 356)

vim +/new_s +378 fs/bcachefs/data/ec/trigger.c

bde39b90107558 Kent Overstreet 2026-01-17  315  int bch2_trigger_stripe(struct btree_trans *trans,
bde39b90107558 Kent Overstreet 2026-01-17  316  			enum btree_id btree, unsigned level,
bde39b90107558 Kent Overstreet 2026-01-17  317  			struct bkey_s_c old, struct bkey_s _new,
bde39b90107558 Kent Overstreet 2026-01-17  318  			enum btree_iter_update_trigger_flags flags)
bde39b90107558 Kent Overstreet 2026-01-17  319  {
bde39b90107558 Kent Overstreet 2026-01-17  320  	struct bkey_s_c new = _new.s_c;
bde39b90107558 Kent Overstreet 2026-01-17  321  	struct bch_fs *c = trans->c;
bde39b90107558 Kent Overstreet 2026-01-17  322  	u64 idx = new.k->p.offset;
bde39b90107558 Kent Overstreet 2026-01-17  323  	const struct bch_stripe *old_s = old.k->type == KEY_TYPE_stripe
bde39b90107558 Kent Overstreet 2026-01-17  324  		? bkey_s_c_to_stripe(old).v : NULL;
bde39b90107558 Kent Overstreet 2026-01-17  325  	const struct bch_stripe *new_s = new.k->type == KEY_TYPE_stripe
bde39b90107558 Kent Overstreet 2026-01-17  326  		? bkey_s_c_to_stripe(new).v : NULL;
bde39b90107558 Kent Overstreet 2026-01-17  327  
bde39b90107558 Kent Overstreet 2026-01-17  328  	if (unlikely(flags & BTREE_TRIGGER_check_repair))
bde39b90107558 Kent Overstreet 2026-01-17  329  		return bch2_check_fix_ptrs(trans, btree, level, _new.s_c, flags);
bde39b90107558 Kent Overstreet 2026-01-17  330  
bde39b90107558 Kent Overstreet 2026-01-17  331  	BUG_ON(new_s && old_s &&
bde39b90107558 Kent Overstreet 2026-01-17  332  	       (new_s->nr_blocks	!= old_s->nr_blocks ||
bde39b90107558 Kent Overstreet 2026-01-17  333  		new_s->nr_redundant	!= old_s->nr_redundant));
bde39b90107558 Kent Overstreet 2026-01-17  334  
bde39b90107558 Kent Overstreet 2026-01-17  335  	if (flags & BTREE_TRIGGER_transactional) {
bde39b90107558 Kent Overstreet 2026-01-17  336  		u64 old_lru_pos = stripe_lru_pos(old_s);
bde39b90107558 Kent Overstreet 2026-01-17  337  		u64 new_lru_pos = stripe_lru_pos(new_s);
bde39b90107558 Kent Overstreet 2026-01-17  338  
bde39b90107558 Kent Overstreet 2026-01-17  339  		if (new_lru_pos == STRIPE_LRU_POS_EMPTY	&&
bde39b90107558 Kent Overstreet 2026-01-17  340  		    !bch2_stripe_is_open(c, idx)) {
bde39b90107558 Kent Overstreet 2026-01-17  341  			_new.k->type = KEY_TYPE_deleted;
bde39b90107558 Kent Overstreet 2026-01-17  342  			set_bkey_val_u64s(_new.k, 0);
bde39b90107558 Kent Overstreet 2026-01-17  343  			new_s = NULL;
bde39b90107558 Kent Overstreet 2026-01-17  344  			new_lru_pos = 0;
bde39b90107558 Kent Overstreet 2026-01-17  345  		}
bde39b90107558 Kent Overstreet 2026-01-17  346  
bde39b90107558 Kent Overstreet 2026-01-17  347  		try(bch2_lru_change(trans,
bde39b90107558 Kent Overstreet 2026-01-17  348  				    BCH_LRU_STRIPE_FRAGMENTATION, idx,
bde39b90107558 Kent Overstreet 2026-01-17  349  				    old_lru_pos, new_lru_pos));
bde39b90107558 Kent Overstreet 2026-01-17  350  	}
bde39b90107558 Kent Overstreet 2026-01-17  351  
bde39b90107558 Kent Overstreet 2026-01-17  352  	if (flags & (BTREE_TRIGGER_transactional|BTREE_TRIGGER_gc)) {
bde39b90107558 Kent Overstreet 2026-01-17  353  		/*
bde39b90107558 Kent Overstreet 2026-01-17  354  		 * If the pointers aren't changing, we don't need to do anything:
bde39b90107558 Kent Overstreet 2026-01-17  355  		 */
bde39b90107558 Kent Overstreet 2026-01-17 @356  		if (new_s && old_s &&

NULL check

bde39b90107558 Kent Overstreet 2026-01-17  357  		    new_s->nr_blocks	== old_s->nr_blocks &&
bde39b90107558 Kent Overstreet 2026-01-17  358  		    new_s->nr_redundant	== old_s->nr_redundant &&
bde39b90107558 Kent Overstreet 2026-01-17  359  		    !memcmp(old_s->ptrs, new_s->ptrs,
bde39b90107558 Kent Overstreet 2026-01-17  360  			    new_s->nr_blocks * sizeof(struct bch_extent_ptr)))
bde39b90107558 Kent Overstreet 2026-01-17  361  			return 0;
bde39b90107558 Kent Overstreet 2026-01-17  362  
bde39b90107558 Kent Overstreet 2026-01-17  363  		struct gc_stripe *gc = NULL;
bde39b90107558 Kent Overstreet 2026-01-17  364  		if (flags & BTREE_TRIGGER_gc) {
bde39b90107558 Kent Overstreet 2026-01-17  365  			gc = genradix_ptr_alloc(&c->ec.gc_stripes, idx, GFP_KERNEL);
bde39b90107558 Kent Overstreet 2026-01-17  366  			if (!gc) {
bde39b90107558 Kent Overstreet 2026-01-17  367  				bch_err(c, "error allocating memory for gc_stripes, idx %llu", idx);
bde39b90107558 Kent Overstreet 2026-01-17  368  				return bch_err_throw(c, ENOMEM_mark_stripe);
bde39b90107558 Kent Overstreet 2026-01-17  369  			}
bde39b90107558 Kent Overstreet 2026-01-17  370  
bde39b90107558 Kent Overstreet 2026-01-17  371  			/*
bde39b90107558 Kent Overstreet 2026-01-17  372  			 * This will be wrong when we bring back runtime gc: we should
bde39b90107558 Kent Overstreet 2026-01-17  373  			 * be unmarking the old key and then marking the new key
bde39b90107558 Kent Overstreet 2026-01-17  374  			 *
bde39b90107558 Kent Overstreet 2026-01-17  375  			 * Also: when we bring back runtime gc, locking
bde39b90107558 Kent Overstreet 2026-01-17  376  			 */
bde39b90107558 Kent Overstreet 2026-01-17  377  			gc->alive	= true;
bde39b90107558 Kent Overstreet 2026-01-17 @378  			gc->sectors	= le16_to_cpu(new_s->sectors);

Unchecked dereferences

bde39b90107558 Kent Overstreet 2026-01-17  379  			gc->nr_blocks	= new_s->nr_blocks;
bde39b90107558 Kent Overstreet 2026-01-17  380  			gc->nr_redundant	= new_s->nr_redundant;
bde39b90107558 Kent Overstreet 2026-01-17  381  
bde39b90107558 Kent Overstreet 2026-01-17  382  			for (unsigned i = 0; i < new_s->nr_blocks; i++)
bde39b90107558 Kent Overstreet 2026-01-17  383  				gc->ptrs[i] = new_s->ptrs[i];
bde39b90107558 Kent Overstreet 2026-01-17  384  
bde39b90107558 Kent Overstreet 2026-01-17  385  			/*
bde39b90107558 Kent Overstreet 2026-01-17  386  			 * gc recalculates this field from stripe ptr
bde39b90107558 Kent Overstreet 2026-01-17  387  			 * references:
bde39b90107558 Kent Overstreet 2026-01-17  388  			 */
bde39b90107558 Kent Overstreet 2026-01-17  389  			memset(gc->block_sectors, 0, sizeof(gc->block_sectors));
bde39b90107558 Kent Overstreet 2026-01-17  390  		}
bde39b90107558 Kent Overstreet 2026-01-17  391  
bde39b90107558 Kent Overstreet 2026-01-17  392  		if (new_s) {
bde39b90107558 Kent Overstreet 2026-01-17  393  			s64 sectors = (u64) le16_to_cpu(new_s->sectors) * new_s->nr_redundant;
bde39b90107558 Kent Overstreet 2026-01-17  394  
bde39b90107558 Kent Overstreet 2026-01-17  395  			struct disk_accounting_pos acc;
bde39b90107558 Kent Overstreet 2026-01-17  396  			memset(&acc, 0, sizeof(acc));
bde39b90107558 Kent Overstreet 2026-01-17  397  			acc.type = BCH_DISK_ACCOUNTING_replicas;
bde39b90107558 Kent Overstreet 2026-01-17  398  			bch2_bkey_to_replicas(c, &acc.replicas, new);
bde39b90107558 Kent Overstreet 2026-01-17  399  			try(bch2_disk_accounting_mod(trans, &acc, &sectors, 1, gc));
bde39b90107558 Kent Overstreet 2026-01-17  400  
bde39b90107558 Kent Overstreet 2026-01-17  401  			if (gc)
bde39b90107558 Kent Overstreet 2026-01-17  402  				unsafe_memcpy(&gc->r.e, &acc.replicas,
bde39b90107558 Kent Overstreet 2026-01-17  403  					      replicas_entry_bytes(&acc.replicas), "VLA");
bde39b90107558 Kent Overstreet 2026-01-17  404  		}
bde39b90107558 Kent Overstreet 2026-01-17  405  
bde39b90107558 Kent Overstreet 2026-01-17  406  		if (old_s) {
bde39b90107558 Kent Overstreet 2026-01-17  407  			s64 sectors = -((s64) le16_to_cpu(old_s->sectors)) * old_s->nr_redundant;
bde39b90107558 Kent Overstreet 2026-01-17  408  
bde39b90107558 Kent Overstreet 2026-01-17  409  			struct disk_accounting_pos acc;
bde39b90107558 Kent Overstreet 2026-01-17  410  			memset(&acc, 0, sizeof(acc));
bde39b90107558 Kent Overstreet 2026-01-17  411  			acc.type = BCH_DISK_ACCOUNTING_replicas;
bde39b90107558 Kent Overstreet 2026-01-17  412  			bch2_bkey_to_replicas(c, &acc.replicas, old);
bde39b90107558 Kent Overstreet 2026-01-17  413  			try(bch2_disk_accounting_mod(trans, &acc, &sectors, 1, gc));
bde39b90107558 Kent Overstreet 2026-01-17  414  		}
bde39b90107558 Kent Overstreet 2026-01-17  415  
bde39b90107558 Kent Overstreet 2026-01-17  416  		try(mark_stripe_buckets(trans, old, new, flags));
bde39b90107558 Kent Overstreet 2026-01-17  417  	}
bde39b90107558 Kent Overstreet 2026-01-17  418  
bde39b90107558 Kent Overstreet 2026-01-17  419  	if ((flags & (BTREE_TRIGGER_atomic|BTREE_TRIGGER_gc)) == BTREE_TRIGGER_atomic) {
bde39b90107558 Kent Overstreet 2026-01-17  420  		if (new_s && stripe_lru_pos(new_s) == 1)
bde39b90107558 Kent Overstreet 2026-01-17  421  			bch2_do_stripe_deletes(c);
bde39b90107558 Kent Overstreet 2026-01-17  422  	}
bde39b90107558 Kent Overstreet 2026-01-17  423  
bde39b90107558 Kent Overstreet 2026-01-17  424  	return 0;
bde39b90107558 Kent Overstreet 2026-01-17  425  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

