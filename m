Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF3145350
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858350; cv=none; b=Yv2uWgQtNW7uvMWvxG6cnhSY5VbHH+oHUbXPbKRG7f1tXIPfUdXR/FnNgEa+1Fp5wGAfenFVoR7jF7mj+Xpp8I4mSWHSh5RVXIuwYAY+1PnUlgHzWEk+vBNIEhfPSwfoe8Rjn+wGLMi/ahi362q+8DR65cdLlRTn31z6WZW6DaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858350; c=relaxed/simple;
	bh=0ASKLkaFoKi1aOyJwy9SPechH8uiz4Lfp4yOv+szVCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2C7xaB6rAFRFjRWS8vg7U0L3nk+ofU3EaYXnp5GO8KFMS27RlpPaq4pfAamKyGDWgmTbSjRGIZnU5Y4s98Aww1lUzZxCLBfFFc8izHsJ17FgUiKKqFLVWtlgpTPBIM+RUk7QjNcUxZ08YSxA2BR+Jmk2E04/C5dX2iW/fL9MsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CF4UHXVf; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CF4UHXVf"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2db17e8767cso8636941fa.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 04:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715858347; x=1716463147; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uufBESXlx6DtA4akO+dZMW0gvI2KQ0NTMmkmgNUH7xc=;
        b=CF4UHXVfkWfhvX+UD+XSq7QZSHo6vfwMHSuwdUhvGErlWnbFjieFhqF6jJC5iZF9zv
         3diBsVhCTE1/fOhFlkFJLIzzrdXn6yf6AAZcfLUBy17VfgKAysIegLJbqgkt57ls6UNn
         hsEJYdAyF+xFyczpUY+HmVO/MZDAFLqeoYdc96d60QfWGSKrFUsoft6V6NA1PFQm9Hzx
         ct58odlk3BAzblEmRCW/21vZAC7da5Bt7U4HWLXUDiSU4ydiJWHrkzc108hsfZk+tGwb
         c5wg+FAES+SHovf+vkiIsBiKxWR/37SgxTwchwzULrwG7kif77BESUTJp1crj1puF3nd
         pjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858347; x=1716463147;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uufBESXlx6DtA4akO+dZMW0gvI2KQ0NTMmkmgNUH7xc=;
        b=AxqvTxl7sKOAWxdeH7ziag/+0TQH5CyjgXuUtvgiigBZeL6bsDG2+uD+VYKTGp3cTE
         kc4/l7XYOusO+KV8s6pi8qFfM+o1oVACNHJEo/M62oolXG3vbFCKHFYucLE15cc4W1o4
         uiqkcLRmd7eu7PnGqKFiJMyArydxMYKEEe2nFw7p4mrPbgDIXJNWi9KoDqmjzLRoTTpj
         jxb98t2haITW3F6W7eBBgRQgywHVocYvvc0ixKW2x6a3vsUTDg2olVTqo8rDVwnAc3j6
         7t43ZBtvK/fCHxcSPClLRfPDkBtdEmzicC3BwvVDlFHJxC9lx8V81CYDIRvdNQEmn2eg
         j9sg==
X-Forwarded-Encrypted: i=1; AJvYcCU3RVcWC36r7kNFfZl7Fq+a8/H4WW/gxNSB3bzKhDKrgJph0azhyn08nUy2/yRaSZYhE2vj+MNN4P+fEkqR1yI4fFXT/Td5SBJ0ZLlbwA==
X-Gm-Message-State: AOJu0YzyZLp70rJqYvkI8OcuNxiEJELs+WHrQAKA6gIGPklBCcS4xYmg
	+o56wMmcEKLLef09NUM/wh0jkHNkpKAJpibIcitO7gWsHrjOC0aeyOaPqoig9j0=
X-Google-Smtp-Source: AGHT+IE+GIn+igsFQUbSMNElSOYFfeB9d8xUbOmOuHGfqDxT84i7abZ88/z4JEKD845TVkF9qj7NIw==
X-Received: by 2002:a2e:b0f3:0:b0:2e2:b716:e674 with SMTP id 38308e7fff4ca-2e51fd2dec3mr133719151fa.3.1715858346473;
        Thu, 16 May 2024 04:19:06 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce73f5sm268407115e9.21.2024.05.16.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:19:05 -0700 (PDT)
Date: Thu, 16 May 2024 13:19:03 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ben Hutchings <bwh@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 2126/22961] kernel/sched/swork.c:63
 swork_kthread() warn: test_and_clear_bit() takes a bit number
Message-ID: <7a9c96f7-2a1f-48da-87f2-3910b83085bc@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   9addf64126a0035adf546b88a6519e544b3c0f16
commit: 6e24e49bf39d3d991503abafd28ac01d50c17994 [2126/22961] work-simple: Rename work-simple.[ch] to swork.[ch] for consistency
config: i386-randconfig-141-20240513 (https://download.01.org/0day-ci/archive/20240516/202405160909.1U7ADcVS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405160909.1U7ADcVS-lkp@intel.com/

smatch warnings:
kernel/sched/swork.c:63 swork_kthread() warn: test_and_clear_bit() takes a bit number
kernel/sched/swork.c:113 swork_queue() warn: test_and_set_bit() takes a bit number

vim +63 kernel/sched/swork.c

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   44  static int swork_kthread(void *arg)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   45  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   46  	struct sworker *worker = arg;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   47  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   48  	for (;;) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   49  		swait_event_interruptible(worker->wq,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   50  					swork_readable(worker));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   51  		if (kthread_should_stop())
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   52  			break;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   53  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   54  		raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   55  		while (!list_empty(&worker->events)) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   56  			struct swork_event *sev;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   57  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   58  			sev = list_first_entry(&worker->events,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   59  					struct swork_event, item);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   60  			list_del(&sev->item);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   61  			raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   62  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  @63  			WARN_ON_ONCE(!test_and_clear_bit(SWORK_EVENT_PENDING,

This warning means that SWORK_EVENT_PENDING() is probably a BIT(x)
define, but test_and_clear_bit() just takes x.  It's a double shift
bug, BIT(BIT(x)).  Which is won't cause an issue if it's done
consistently and x is small.

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   64  							 &sev->flags));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   65  			sev->func(sev);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   66  			raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   67  		}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   68  		raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   69  	}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   70  	return 0;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   71  }

[ snip ]

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  109  bool swork_queue(struct swork_event *sev)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  110  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  111  	unsigned long flags;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  112  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11 @113  	if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
                                                                                                             ^^^^^^^^^^^^^^^^^^^
Same.

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  114  		return false;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  115  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  116  	raw_spin_lock_irqsave(&glob_worker->lock, flags);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  117  	list_add_tail(&sev->item, &glob_worker->events);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  118  	raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  119  
ad64c64a8f7ac0 kernel/sched/work-simple.c Sebastian Andrzej Siewior 2016-03-09  120  	swake_up(&glob_worker->wq);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  121  	return true;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  122  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

