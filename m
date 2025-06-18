Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1018204F93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269811; cv=none; b=NgnubGVgbc2sDLFJpSZNMyh55MWSkotfCyJLb7SdQdVPeq1XLbfRP3jdCRfbOeyWDn/kOemIhvzN0nNcQi7ywMuL30jec0fZ9giHihrxodU7maSN3o2snJLQAcZoblhVQFVzLOwLHiKpfsxg4U3NrBKTR3Qnv/4vGe87jrNX6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269811; c=relaxed/simple;
	bh=pAbJ7M1877vZfGZ68nK/DKRy3GkSzGzqsW4mkD46Pk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XiPoBSlldRm51x1HFmiX9QJLPPVNWGx6r64O7sOg1UXk4Y1QNfOpQHJzjZfx0H3Vsti7CTYfsaLbIvcm4rvUI6Shh7GcYPsEBAYwvv9M5vGvy5610yafftGQSi/jRVaKQ5ViUpEKy79V2jmLggdLZFs449BcPMgNNFJ24TbmfZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lP6GQV0i; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lP6GQV0i"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40a4bf1eb0dso3752934b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750269808; x=1750874608; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTpTmgLG5/e26K7MBHBfdXBXL9DqRtjXMEgvCtnC8zM=;
        b=lP6GQV0iHoTsH3+hd3DjrukS8w5ZAyLA63R7FE2zlNL4wf6+KqnokBQITDeaUdsfos
         +H9j6W+vZ/NijJk4dfxpiLLE3QTJKdnlIdbaTDfZKkfmX5dFfWiE8ta/fzXv+JRlX91h
         hbeGREidnucCq6Zevc5XcRbRu66vYpGCn3MUTXayNtz5zu4f6c5bB7hvkvS9b4Y0plXe
         7L5pBZNbPVYpw0h1V0GXcfIyzXbSUbdt21DzyjBO/ajyTpYWz2DapLI8uKKU+Z9In50u
         QRi/IsiAK4xDyFhs9yFeC6UaU8ywkAaB5V+wz65X2FQqSUa3tWFY1xMR8zmQughJZwi/
         W7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269808; x=1750874608;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTpTmgLG5/e26K7MBHBfdXBXL9DqRtjXMEgvCtnC8zM=;
        b=JAHGSUNxLh4JVs67Dj96Q1Sjl9BHGRuKp1/5cB3NXXiUYd9sf5cerDa3oEKFG6LRbG
         kXifvbVsckOLo2E0kwq7ol4c8kfvOzU+kk1VHuCv/noYjT9DFUB9Ra3TlzicOfRlLpFZ
         SNADfXSC9s7QtjNXyX1D/8RL2ZjkTfHP9ROSkxsIPViwpR9lTebgkylKAKRSwX2wEhtW
         O7efn7hbo5Lozfi7DB6lY+FC/JEOMCBZ8A1XuzPu8GNkkmcyHjHO0OvxaQ+jwU7DaHUj
         TVHkCFuUGBKRIH0JMUdfh7wjpt/ztI4AGKzivS3UABd3Yq5YyroR6dKD7KmF/2pdODfG
         ZIOg==
X-Forwarded-Encrypted: i=1; AJvYcCXpglSgI4QyfnfK1Zh+vz1j8imiPE1I97t/pvyDHzEoGjUWE4XCI32KZXB+Hl8jxOQWsLXAmhU7D1WMK1JZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5B+uc8P6NaRzueeysVfdMLk3lxcp3c0r1If0mrKupVErWfJ5A
	mOMgjO6XwQM6AHqUwIE2gMflwMQurVPwXQ1Ew6CqUeBh2I1WnRF7WNrDtoZvY0qdGu8y0gft0uB
	sgv1B
X-Gm-Gg: ASbGncv9Uj1uCMl9BZoh1xYWCmHX9pEK0d7LncIcXGGRNafp4IFGNMviUT3fYn4s1/W
	1zpTC9GgJk+CrMy0QsluwTYpQh0LuFD9+cAtYhHWC+KGSjz2vHdY5bLTAdGA9QGu2SqPddIpSkZ
	oTwBB0xa27LkMO81R+yplqxx7Pwy3iBEJ4MTaZbF5TyqSBDCI/fLdLcnMvEtZU1A5CXXximhk2w
	dRLAmBYBvk3YfinxBRWn66uC4ByrLQma3352lL7JgO0qdC3H4qZkdtZpEdyVWDIl1demYBMW9EI
	muVLeq9ozZdFR7Jzrv/a/SiDN5Ws+x/Bv4sukfyV2cDEW1bbvvBwuKZoTu4mf5KU1avP2wWqB4m
	8O5IX
X-Google-Smtp-Source: AGHT+IHZNM4m8yoBhstlHet5pYstAujG+A8ZI1+4b+gBMe+0NKvrwf6Cv7U9t/jYRBuEV3lJ/L9wPw==
X-Received: by 2002:a05:6808:d4c:b0:40a:561a:9e8c with SMTP id 5614622812f47-40a7c0f751dmr11031616b6e.3.1750269807614;
        Wed, 18 Jun 2025 11:03:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740b2808sm2425519b6e.6.2025.06.18.11.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:03:27 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:03:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Stanner <phasta@kernel.org>
Subject: [linux-next:master 2699/3311]
 drivers/gpu/drm/etnaviv/etnaviv_sched.c:80 etnaviv_sched_timedout_job()
 warn: variable dereferenced before check 'sched_job' (see line 38)
Message-ID: <2997b152-291a-4c18-ad29-a820fb50acee@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e5ab6fee68df8c40b338baeae6e269fa25a7e25
commit: 61ee19dedb8d753249e20308782bf4e9e2fb7344 [2699/3311] drm/etnaviv: Protect the scheduler's pending list with its lock
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182125.Qa0wM9xy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506182125.Qa0wM9xy-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_sched.c:80 etnaviv_sched_timedout_job() warn: variable dereferenced before check 'sched_job' (see line 38)

vim +/sched_job +80 drivers/gpu/drm/etnaviv/etnaviv_sched.c

a6a1f036c74e3d Luben Tuikov      2021-01-20  34  static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
a6a1f036c74e3d Luben Tuikov      2021-01-20  35  							  *sched_job)
e93b6deeb45a78 Lucas Stach       2017-12-04  36  {
6d7a20c0776036 Lucas Stach       2017-12-06  37  	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
61ee19dedb8d75 Maíra Canal       2025-06-02 @38  	struct drm_gpu_scheduler *sched = sched_job->sched;
                                                                                          ^^^^^^^^^^^^^^^^^
Dereference

6d7a20c0776036 Lucas Stach       2017-12-06  39  	struct etnaviv_gpu *gpu = submit->gpu;
e1f3220b957a55 Lucas Stach       2024-07-05  40  	u32 dma_addr, primid = 0;
2c83a726d6fbb5 Lucas Stach       2018-06-27  41  	int change;
2c83a726d6fbb5 Lucas Stach       2018-06-27  42  
2c83a726d6fbb5 Lucas Stach       2018-06-27  43  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  44  	 * If the GPU managed to complete this jobs fence, the timout is
2c83a726d6fbb5 Lucas Stach       2018-06-27  45  	 * spurious. Bail out.
2c83a726d6fbb5 Lucas Stach       2018-06-27  46  	 */
6fce3a406108ee Lucas Stach       2018-10-04  47  	if (dma_fence_is_signaled(submit->out_fence))
50248a3ec0f5e5 Lucas Stach       2020-08-24  48  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  49  
2c83a726d6fbb5 Lucas Stach       2018-06-27  50  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  51  	 * If the GPU is still making forward progress on the front-end (which
2c83a726d6fbb5 Lucas Stach       2018-06-27  52  	 * should never loop) we shift out the timeout to give it a chance to
2c83a726d6fbb5 Lucas Stach       2018-06-27  53  	 * finish the job.
2c83a726d6fbb5 Lucas Stach       2018-06-27  54  	 */
2c83a726d6fbb5 Lucas Stach       2018-06-27  55  	dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
2c83a726d6fbb5 Lucas Stach       2018-06-27  56  	change = dma_addr - gpu->hangcheck_dma_addr;
e1f3220b957a55 Lucas Stach       2024-07-05  57  	if (submit->exec_state == ETNA_PIPE_3D) {
e1f3220b957a55 Lucas Stach       2024-07-05  58  		/* guard against concurrent usage from perfmon_sample */
e1f3220b957a55 Lucas Stach       2024-07-05  59  		mutex_lock(&gpu->lock);
e1f3220b957a55 Lucas Stach       2024-07-05  60  		gpu_write(gpu, VIVS_MC_PROFILE_CONFIG0,
e1f3220b957a55 Lucas Stach       2024-07-05  61  			  VIVS_MC_PROFILE_CONFIG0_FE_CURRENT_PRIM <<
e1f3220b957a55 Lucas Stach       2024-07-05  62  			  VIVS_MC_PROFILE_CONFIG0_FE__SHIFT);
e1f3220b957a55 Lucas Stach       2024-07-05  63  		primid = gpu_read(gpu, VIVS_MC_PROFILE_FE_READ);
e1f3220b957a55 Lucas Stach       2024-07-05  64  		mutex_unlock(&gpu->lock);
e1f3220b957a55 Lucas Stach       2024-07-05  65  	}
9ec2afde83c18e Lucas Stach       2023-06-07  66  	if (gpu->state == ETNA_GPU_STATE_RUNNING &&
9ec2afde83c18e Lucas Stach       2023-06-07  67  	    (gpu->completed_fence != gpu->hangcheck_fence ||
e1f3220b957a55 Lucas Stach       2024-07-05  68  	     change < 0 || change > 16 ||
e1f3220b957a55 Lucas Stach       2024-07-05  69  	     (submit->exec_state == ETNA_PIPE_3D &&
e1f3220b957a55 Lucas Stach       2024-07-05  70  	      gpu->hangcheck_primid != primid))) {
2c83a726d6fbb5 Lucas Stach       2018-06-27  71  		gpu->hangcheck_dma_addr = dma_addr;
e1f3220b957a55 Lucas Stach       2024-07-05  72  		gpu->hangcheck_primid = primid;
cdd156955f946b Lucas Stach       2021-12-22  73  		gpu->hangcheck_fence = gpu->completed_fence;
50248a3ec0f5e5 Lucas Stach       2020-08-24  74  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  75  	}
6d7a20c0776036 Lucas Stach       2017-12-06  76  
704d3d60fec451 Lucas Stach       2024-06-21  77  	/* block scheduler */
704d3d60fec451 Lucas Stach       2024-06-21  78  	drm_sched_stop(&gpu->sched, sched_job);
704d3d60fec451 Lucas Stach       2024-06-21  79  
222b5f04415987 Andrey Grodzovsky 2018-12-04 @80  	if(sched_job)
                                                        ^^^^^^^^^^^^^
Check for NULL

222b5f04415987 Andrey Grodzovsky 2018-12-04  81  		drm_sched_increase_karma(sched_job);
6d7a20c0776036 Lucas Stach       2017-12-06  82  
6d7a20c0776036 Lucas Stach       2017-12-06  83  	/* get the GPU back into the init state */
9a1fdae5876016 Lucas Stach       2019-08-09  84  	etnaviv_core_dump(submit);
f51d753f81c086 Christian Gmeiner 2022-06-03  85  	etnaviv_gpu_recover_hang(submit);
6d7a20c0776036 Lucas Stach       2017-12-06  86  
222b5f04415987 Andrey Grodzovsky 2018-12-04  87  	drm_sched_resubmit_jobs(&gpu->sched);
222b5f04415987 Andrey Grodzovsky 2018-12-04  88  
b2ef808786d93d Christian König   2024-08-26  89  	drm_sched_start(&gpu->sched, 0);
a6a1f036c74e3d Luben Tuikov      2021-01-20  90  	return DRM_GPU_SCHED_STAT_NOMINAL;
a6a1f036c74e3d Luben Tuikov      2021-01-20  91  
50248a3ec0f5e5 Lucas Stach       2020-08-24  92  out_no_timeout:
61ee19dedb8d75 Maíra Canal       2025-06-02  93  	spin_lock(&sched->job_list_lock);
61ee19dedb8d75 Maíra Canal       2025-06-02  94  	list_add(&sched_job->list, &sched->pending_list);
61ee19dedb8d75 Maíra Canal       2025-06-02  95  	spin_unlock(&sched->job_list_lock);
a6a1f036c74e3d Luben Tuikov      2021-01-20  96  	return DRM_GPU_SCHED_STAT_NOMINAL;
e93b6deeb45a78 Lucas Stach       2017-12-04  97  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

