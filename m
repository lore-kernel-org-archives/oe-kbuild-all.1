Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A821A02
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727514930; cv=none; b=jaO3bxI9IxNmjCipK26BXN/h9IzLOwQIzjA7RfOq2jISf0hkBf3n5pddu+924bEJaWUKrGv1SGeKIIuG5jhpQKKj31kFsUxLItMVkMeKVgvI/wmVjKaAzejfFTiYsf9ToDltKIqITXjXgJGZT8bgRkFphbxynhVOXaEyMFPaWww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727514930; c=relaxed/simple;
	bh=25xxP8GiRAacIeCjnjSOnDAqxACO3IUZpVCbyqdqNFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNT95HfpAsaDGvAnQWUz6tQIlNDfbSGv+b7ds6w/U/JIzyffnVtLIhlbrwa5KM5MOpRdySB6lPu8v1ROx0HK5HM4UVvf17JZQHzcDq9pen5JJupfwZQOpbO9+nnngwzDuPKUTL04G7RiS/1b13tgNPeALMkwCu3eArPFH1wnxTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZAgkRIU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZAgkRIU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so35094745e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727514927; x=1728119727; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnqkzQlQ9dPCUF5buIZa+BORLiViPROK4iGeDYTgQAw=;
        b=tZAgkRIU7PIMZAn3/VevTev3TncJskDAGZTefXkNAFvaaXXaTyNPgyGmpOSm9kuM3j
         INSzkbw+RtgBQGa/80HMdqU1g/aKj9k62x6Cu/ZkbYbw+/HV1sN+rb6MhryC7HVKz5bi
         5XXaRml8PfY5vx54IxCUU5gRecrz13/NPiBECyCoXXxU1ILNLE4YFdTOroI1pvhVQP2V
         kDS2lAf9Mxd3l1x/Co55q0BxPrVwSRUoN15mfyPb4CkM3QgoXQV757EyZayeZ/YUpn0c
         AY7pWltl+d0Fjwyymw077Dnk/xqPQduAcZqnLph4OVN1bnlvuGUQYOSIR04nENXqtGpx
         op3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727514927; x=1728119727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnqkzQlQ9dPCUF5buIZa+BORLiViPROK4iGeDYTgQAw=;
        b=m8vKIUu5AQotGnL1WhmljANwf56lP6TCQ1egxFXAcCPFfpYkdq1dNnUW4/o6x03CGk
         89NRm8A39pswOe/3wP8A39Q6t4ZEjhYYBv4vvpWwkLGmCf4XvWlq/2Yiy4v6fIFM2h1N
         QfCZyQbFzWnrTkQ7aO+0+zeayHdlxT1YzdyvW2Fr2+BtaQ+8en0nhOtKbD6+zHSAQgLO
         /R2IzYDJ9rCfNj3w2TAQ/yfu+AqjN6KiAOXcqB3KQbCzn5HK8Jdzu74pQ9peEzYhH64J
         6T1NcM45L/JK8IO3En1uUAZJm+Sdu8Hg+dz5Y8PoWyYlNTq65aY8Jxya3Y+gN9qlEAMu
         ilbg==
X-Forwarded-Encrypted: i=1; AJvYcCWaV+vAU/wRKCd/YVfKOsDQj5THWmCZwqwD0QGamAZAWtgxl4Oy++Ma0/3xdKvBPYqhYni/JX6RBc3TgFns@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz72P28/xQTxeFS8y9n3alobVRGGSq7CVv8jmPm7FreB4mAqFa
	kPJWXY04PeeTqCiOX6rqCqlt4jasQZrKtNAA4PB+Qgvq4CItJ4u8pca1aJYA4rI=
X-Google-Smtp-Source: AGHT+IEICg6pFRbohtY2uKPza1SXYn8XNhKt5fHNYhRbW7ot9c/nWnOuJnkT0LacGKoM/hTmMhsSyQ==
X-Received: by 2002:a05:600c:5117:b0:42c:a8cb:6a5a with SMTP id 5b1f17b1804b1-42f5844b9dcmr63791835e9.15.1727514926552;
        Sat, 28 Sep 2024 02:15:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575e322sm4328757f8f.110.2024.09.28.02.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 02:15:25 -0700 (PDT)
Date: Sat, 28 Sep 2024 12:15:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 96/9999] kernel/softirq.c:973
 __tasklet_schedule_common() warn: inconsistent returns 'flags'.
Message-ID: <c4396b12-261e-4c38-a290-8d23fd7e1c1f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 62d0a2a30cd01fabc7f6555df2cfae7dd3d9fad8 [96/9999] tasklet: Address a race resulting in double-enqueue
config: i386-randconfig-141-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280623.vGQgQ1pn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409280623.vGQgQ1pn-lkp@intel.com/

smatch warnings:
kernel/softirq.c:973 __tasklet_schedule_common() warn: inconsistent returns 'flags'.

vim +/flags +973 kernel/softirq.c

6498ddad301c7a Ingo Molnar    2018-02-27  929  static void __tasklet_schedule_common(struct tasklet_struct *t,
6498ddad301c7a Ingo Molnar    2018-02-27  930  				      struct tasklet_head __percpu *headp,
6498ddad301c7a Ingo Molnar    2018-02-27  931  				      unsigned int softirq_nr)
^1da177e4c3f41 Linus Torvalds 2005-04-16  932  {
6498ddad301c7a Ingo Molnar    2018-02-27  933  	struct tasklet_head *head;
^1da177e4c3f41 Linus Torvalds 2005-04-16  934  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  935  
^1da177e4c3f41 Linus Torvalds 2005-04-16  936  	local_irq_save(flags);
4a8c8d729198e3 Ingo Molnar    2011-11-29  937  	if (!tasklet_trylock(t)) {
4a8c8d729198e3 Ingo Molnar    2011-11-29  938  		local_irq_restore(flags);
4a8c8d729198e3 Ingo Molnar    2011-11-29  939  		return;
4a8c8d729198e3 Ingo Molnar    2011-11-29  940  	}
4a8c8d729198e3 Ingo Molnar    2011-11-29  941  
6498ddad301c7a Ingo Molnar    2018-02-27  942  	head = this_cpu_ptr(headp);
4a8c8d729198e3 Ingo Molnar    2011-11-29  943  again:
4a8c8d729198e3 Ingo Molnar    2011-11-29  944  	/* We may have been preempted before tasklet_trylock
4a8c8d729198e3 Ingo Molnar    2011-11-29  945  	 * and __tasklet_action may have already run.
4a8c8d729198e3 Ingo Molnar    2011-11-29  946  	 * So double check the sched bit while the takslet
4a8c8d729198e3 Ingo Molnar    2011-11-29  947  	 * is locked before adding it to the list.
4a8c8d729198e3 Ingo Molnar    2011-11-29  948  	 */
4a8c8d729198e3 Ingo Molnar    2011-11-29  949  	if (test_bit(TASKLET_STATE_SCHED, &t->state)) {
62d0a2a30cd01f Zhang Xiao     2020-03-17  950  		if (test_and_set_bit(TASKLET_STATE_CHAINED, &t->state)) {
62d0a2a30cd01f Zhang Xiao     2020-03-17  951  			tasklet_unlock(t);
62d0a2a30cd01f Zhang Xiao     2020-03-17  952  			return;

local_irq_restore(flags) before returning.

62d0a2a30cd01f Zhang Xiao     2020-03-17  953  		}
48f20a9a9488c4 Olof Johansson 2008-03-04  954  		t->next = NULL;
6498ddad301c7a Ingo Molnar    2018-02-27  955  		*head->tail = t;
6498ddad301c7a Ingo Molnar    2018-02-27  956  		head->tail = &(t->next);
6498ddad301c7a Ingo Molnar    2018-02-27  957  		raise_softirq_irqoff(softirq_nr);
4a8c8d729198e3 Ingo Molnar    2011-11-29  958  		tasklet_unlock(t);
4a8c8d729198e3 Ingo Molnar    2011-11-29  959  	} else {
4a8c8d729198e3 Ingo Molnar    2011-11-29  960  		/* This is subtle. If we hit the corner case above
4a8c8d729198e3 Ingo Molnar    2011-11-29  961  		 * It is possible that we get preempted right here,
4a8c8d729198e3 Ingo Molnar    2011-11-29  962  		 * and another task has successfully called
4a8c8d729198e3 Ingo Molnar    2011-11-29  963  		 * tasklet_schedule(), then this function, and
4a8c8d729198e3 Ingo Molnar    2011-11-29  964  		 * failed on the trylock. Thus we must be sure
4a8c8d729198e3 Ingo Molnar    2011-11-29  965  		 * before releasing the tasklet lock, that the
4a8c8d729198e3 Ingo Molnar    2011-11-29  966  		 * SCHED_BIT is clear. Otherwise the tasklet
4a8c8d729198e3 Ingo Molnar    2011-11-29  967  		 * may get its SCHED_BIT set, but not added to the
4a8c8d729198e3 Ingo Molnar    2011-11-29  968  		 * list
4a8c8d729198e3 Ingo Molnar    2011-11-29  969  		 */
4a8c8d729198e3 Ingo Molnar    2011-11-29  970  		if (!tasklet_tryunlock(t))
4a8c8d729198e3 Ingo Molnar    2011-11-29  971  			goto again;
4a8c8d729198e3 Ingo Molnar    2011-11-29  972  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16 @973  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  974  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

