Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E926B2CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774812771; cv=none; b=bJTBobaGOE2HLT3bHhICe6RVmVep7XfF9X1SpeJACnLCTL1nhgsO4PW6NJSCcmuFRGjKuWt5u2RuzOjjzVqVUI0F4sm9E9RhBM1p3gXImwTe4SugskgRl5LPGdZlledslL/yDZm1yC1FfUoNHhReVJV8qJ7NY5/RUAee3Pd6ovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774812771; c=relaxed/simple;
	bh=rNOtyqE88EoocoFnJ6NlEKgjiMn4d7nnMXQvCbvkJXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4LJY79Wyc6tt4HYl+GrhAf5DrdCs3ezA3OABimYDEVc6stCu06EQE4yTxiU+Kc+A7/vLyiC1/2wYXdxzVknWbaBvllTwI4sxcg6edg+Dvpgtl3y6i4e3TEyguyqBY2I+5tNzQEqsf0S5o+7k/pgychw7nhEuOb2Vaz7Z/j2IZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uskf1CWn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uskf1CWn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so33583515e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774812769; x=1775417569; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6VvwY2um+1G+zyhgax4hPE5TziXAcWpnu+VdKulIUc=;
        b=Uskf1CWns/v5/n6BN6j7m/9DrD2nAAKDlolC/gYz7Dyvj63ujggUED9kFzbBFfsSTe
         twt3SSxI2jmgkKkr7QNhacNOZEKImFbotrEa4tlCV/6lv58O3h0aCF5Iv1P2VDARKrvn
         kHxoK9mSnGIKQnZjgZwtt/tqmJbQ4NpZQrwd6q74rZ6GRLUFTU9wJVdH6BjtnHgZwG9L
         c0fDxy1zWL5PQbEQMVdIv8UHilGy4ZSwlNkGqRC24Z0rIT+U5i5ZzYigSdneHUH5KR8U
         wfISBrkDM0IpHClW2N3bBAJq/zUc16/ozQ6x0/YbN2PjNFoI5DPdJaz1Ivej1SLjgPT7
         fXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774812769; x=1775417569;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6VvwY2um+1G+zyhgax4hPE5TziXAcWpnu+VdKulIUc=;
        b=nC/goXJytKPna6qXT7JpxWwJZNfVg8K712s8VjbG8hgJpMvH7J6p2hhB23Ikd0R399
         sEXkP+2i+qgWXAQ/z96E0H2pzT6vSPvoO5gNhApWyxK17iLC77vkV6rt415MMOKQU+2Z
         tQvTmesFk/rttigKPviMQzO4NVYj96oT791A2kuRXJJ9P1xYHIrOt70MRABG8sQqJunO
         ThXtiJ1fljhe/gBzLUviJxbQ78ydmPHdsZNzvLGbKut5PgFx1HVs1kEIeVE3frQxNfKO
         RAVab4gRR3y5rJulgS6e3oU/34bOJhOXqSQp3pKtJb0C6+ekpdtq7OjURgYG40A/jvny
         QXDA==
X-Forwarded-Encrypted: i=1; AJvYcCWy91VlFNltcICZIUbduqKZIiT7H9PXcR9KUN3YsCxpNiI1cBMA2hz+CS/EFb1XboQQpGOJsI/I+A8S/0tT@lists.linux.dev
X-Gm-Message-State: AOJu0YxGOqTWatLFCMO+q2FhNIBRlTcw9OzHdd87LVD6TYnMS/t0OKy5
	F1rFRSX+cbnEvyAnhUnNQtQk8U6GhODz09JOfvKRf5nPZyjrFTZAifNh
X-Gm-Gg: ATEYQzypdg2/jBxnQDXo7px9TSj3xbOXOcDrwnak3NaKF/vONw/P0Xmlove65htPCev
	QvvY4EYR7mj1M/RyQnyilmlBaS3rn9i70tTotjAjEOn3G7pNdt9L8lofJrT8nHY5a8WlwgR1+vv
	0Ypek8VGXE5eGEew0V/7ieGWUi4hlcCZ9/ZC3jaz0nkGntRCl1sG/d71NtOuDlZnbpj0Ev40zVU
	SudE8nT2WCpRO3bd40lb8ff4Jw5Ag76+nWa/BlkfY8tny2BzMAbrIZ/FsoA0H0lbUICpwVdJnOL
	LpTMmpkryfqmqo538XjhLmy7lAMofHzBvc3K6vNYr76HVciBCVGOfaurDnj0FNluC+9AMhXKr05
	hRPoocGBzp+44hbUBDjhV9p04d6MbHLf+8xHABWB0nHDsgqnqg/WQbcusPmOqrkOtVzZQS5xPjO
	gHxDCBwDM4Ou6imaDjDFQ=
X-Received: by 2002:a05:600d:8:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48727f7b951mr140290415e9.20.1774812768409;
        Sun, 29 Mar 2026 12:32:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4b9sm12127140f8f.20.2026.03.29.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 12:32:47 -0700 (PDT)
Date: Sun, 29 Mar 2026 22:32:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7] kernel/sched/deadline.c:2501
 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see
 line 2494)
Message-ID: <202603282157.m7MFAEFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: 57d50e9d7fc2f224ab09145b7ba2aae530ec798e [7/7] ANDROID: sched: Add find_exec_ctx helper
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260328/202603282157.m7MFAEFC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603282157.m7MFAEFC-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2501 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see line 2494)

vim +/exec_ctx +2501 kernel/sched/deadline.c

c621dead3a640a Connor O'Brien    2023-11-08  2483  static int find_later_rq(struct task_struct *sched_ctx, struct task_struct *exec_ctx)
1baca4ce16b8cc Juri Lelli        2013-11-07  2484  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2485  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2486  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2487  	int this_cpu = smp_processor_id();
c621dead3a640a Connor O'Brien    2023-11-08  2488  	int cpu = task_cpu(sched_ctx);
1baca4ce16b8cc Juri Lelli        2013-11-07  2489  
1baca4ce16b8cc Juri Lelli        2013-11-07  2490  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2491  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2492  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2493  
57d50e9d7fc2f2 Connor O'Brien    2023-11-08 @2494  	if (exec_ctx && exec_ctx->nr_cpus_allowed == 1)
                                                            ^^^^^^^^
Check for NULL.

1baca4ce16b8cc Juri Lelli        2013-11-07  2495  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2496  
91ec6778ec4f96 Juri Lelli        2014-09-19  2497  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2498  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2499  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2500  	 */
c621dead3a640a Connor O'Brien    2023-11-08 @2501  	if (!cpudl_find(&task_rq(exec_ctx)->rd->cpudl, sched_ctx, exec_ctx, later_mask))
                                                                                 ^^^^^^^^
If exec_ctx were really NULL on line 2494 then the kernel would crash
here.

1baca4ce16b8cc Juri Lelli        2013-11-07  2502  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2503  
1baca4ce16b8cc Juri Lelli        2013-11-07  2504  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2505  	 * If we are here, some targets have been found, including
b18c3ca11c20ca Byungchul Park    2017-05-23  2506  	 * the most suitable which is, among the runqueues where the
b18c3ca11c20ca Byungchul Park    2017-05-23  2507  	 * current tasks have later deadlines than the task's one, the
b18c3ca11c20ca Byungchul Park    2017-05-23  2508  	 * rq with the latest possible one.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

