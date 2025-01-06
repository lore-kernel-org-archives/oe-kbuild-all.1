Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58C1D7E4C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155771; cv=none; b=SwLKNtrYP089EluOgJBr9Rxcpx46Q8/yY6QhQC0r3djF1sVAsL6KfSQu9+MAtbXbpXecIZ9XlZLWt2cxD2VAoP+KtLHvMr3EJPInFarsLolT3J6L+M6rGt8fOclPX5L2+Pv/3owZj73H1L2SbcRzE8UKammTiJKjwy1WU120ttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155771; c=relaxed/simple;
	bh=tyZI4LCtZ3WGAkh2DiMdcJIDnnvlvRWusM2NCGA9vZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQuWpZIWaahdX2LREPDCgdsWZNclR5Nz6mDr0Mr+ckkJrT417KtXlEeaDL9Rh9Zc/bug7InZ96xWemT3tAkb4VWHxBw+JqndsnjQ1/TZPkuvU8tv6yS6m312QY/uQLAyR2pcXhBL44yYZHO1bSvBeVuhuiefqnVVJLkMIge4QEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vr/sQuMB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vr/sQuMB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so8706264f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 01:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155767; x=1736760567; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WyPdssncH73MkXc63PAeqQ0YMlwhoT9z2JekLq5gQiw=;
        b=Vr/sQuMB+cez9FswVFhZ/ig+Lwk5NhI9ZblPSxnLHmxx9SRGZAHquVE0bpqWJk6zeD
         4crGZvehelTleqeChRZvZvb8j9FhyNTDNjRzy7Fu7td4+PHX2Xrd2QOOz9Mp9bodvYhR
         H3ux1TYlnjArLs9FOUT4ot1ZdFwZgfy9mmGzfH4YdomWSFDSvg/D61C6CTtFoarPmnSq
         DMeKhuzpfLztgpu+GucfIss/sUkPhohTXi0URf+KYDCq2L6glg8XHcY17nAq2RHf/t4q
         nOWJGNPPKUVhZVoIAYT53TzbCvJsY7V7puDsfTYVv3rG1mqDJRFvlAKLzJangi7uuRKm
         ngMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155767; x=1736760567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyPdssncH73MkXc63PAeqQ0YMlwhoT9z2JekLq5gQiw=;
        b=aez1/fzJn2hzafkvN7KyDiPzKYjcpZ8XrHfFF0D3p/4rnOIph0TvtjHom/pv8951XY
         TrVVUpQlsERP00e3GPKhenKDdD1HBHeI6H1sVsdSg3QLAvlRvsBoEv9bWX3ECRgHTiDZ
         LGcZ40cWSycxDwJjQgSOhpOLIRbCH+4sT3pdYUFqj/v0oPRAakhuBSzjhXI7bijVbFwZ
         tCO5W4CdJuezgIe+8vIx9BHpTrM+IbFsrZZQSiOQYxVv1nCiGpCZf3L3GImKzo95aGia
         cZp9wjTC9fVX86glAVep3ltK6bLOvdbylpGDT51jtaJvid+PcYp4cBJvOsxhiD/kM1W1
         I4jg==
X-Forwarded-Encrypted: i=1; AJvYcCWU18cdxivknxcyKK+jjGks+IP8KxAoDrfbX0NZDbGJ4NzUo2zCW2cDdPTXRYnFzZ1TgDMTOHtTuC9gGfYO@lists.linux.dev
X-Gm-Message-State: AOJu0YzNAKNoJ8T5sU465+8cUEydGhaj1wKG0djDpU2lB/7ces8D4Gsj
	QtNeVQxmWCFmneVLCKC6LkYheU8TskWBuiiyKAN6knGRmVvg00MqUGPdzYvFK7RH/i4uQ6l/l8I
	W
X-Gm-Gg: ASbGncuV05msMjWtiWxLSoRGPMFNgQPcuJW9eh8c6C4VgF1WCy7e0sTIGZrd2tboh7o
	yXMdM6fyjiDsok8+3NRiL7WliJxt4Qww+wcFeWLBaAtCeM3JuQSkZR0dN03A6iXarD63D9AFthu
	c1auNG5jhRrU3gJ/IqApjwNh6+JwpHf9Ql0nAn6jhWmy2eIaO9UCafKtozPgF8SCRyMSaQ+sU2H
	OH8mpEIp/eIQSo7o9yzYUbvj/nYK0MAXPdsl6jcYgygpc3M4JHGBD3XVQ/2Vg==
X-Google-Smtp-Source: AGHT+IGtNggRmlvPCJR4KoRWyvraOrwCUpbc1uBXC2o9swnf/BgIhNgjoJM1SsYAlI5F66Nd13dQag==
X-Received: by 2002:a05:6000:2af:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-38a229ed1b2mr46352912f8f.2.1736155767389;
        Mon, 06 Jan 2025 01:29:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e150sm47310292f8f.66.2025.01.06.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:29:26 -0800 (PST)
Date: Mon, 6 Jan 2025 12:29:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7230/7786]
 kernel/sched/deadline.c:2548 find_later_rq() error: we previously assumed
 'exec_ctx' could be null (see line 2541)
Message-ID: <e527e316-2b2a-4a8f-ade0-c01966a64427@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0ad60853620e2bd7a2f165162fde4729cba0b46d
commit: a70dd213296b2f2524c2b4440cb60d46f85ab2e4 [7230/7786] ANDROID: sched: Add find_exec_ctx helper
config: i386-randconfig-141-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220603.ZrMZILYo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412220603.ZrMZILYo-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2548 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see line 2541)

vim +/exec_ctx +2548 kernel/sched/deadline.c

eb7630f95f837d Connor O'Brien    2023-11-08  2530  static int find_later_rq(struct task_struct *sched_ctx, struct task_struct *exec_ctx)
1baca4ce16b8cc Juri Lelli        2013-11-07  2531  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2532  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2533  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2534  	int this_cpu = smp_processor_id();
eb7630f95f837d Connor O'Brien    2023-11-08  2535  	int cpu = task_cpu(sched_ctx);
1baca4ce16b8cc Juri Lelli        2013-11-07  2536  
1baca4ce16b8cc Juri Lelli        2013-11-07  2537  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2538  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2539  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2540  
a70dd213296b2f Connor O'Brien    2023-11-08 @2541  	if (exec_ctx && exec_ctx->nr_cpus_allowed == 1)

This line assumes exec_ctx can be NULL.

1baca4ce16b8cc Juri Lelli        2013-11-07  2542  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2543  
91ec6778ec4f96 Juri Lelli        2014-09-19  2544  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2545  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2546  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2547  	 */
eb7630f95f837d Connor O'Brien    2023-11-08 @2548  	if (!cpudl_find(&task_rq(exec_ctx)->rd->cpudl, sched_ctx, exec_ctx, later_mask))

But the next line dereferences it without checking for NULL

1baca4ce16b8cc Juri Lelli        2013-11-07  2549  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2550  
1baca4ce16b8cc Juri Lelli        2013-11-07  2551  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2552  	 * If we are here, some targets have been found, including

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

