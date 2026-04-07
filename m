Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0A2FE58C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553483; cv=none; b=U00+cKZr9UopDhoRvXWDj+KO3f57UsaRzSyeoiDo6qKTEpb3n7BNKMQUlWVd4127lOxRuFmcj9/FUqO8cZivYgH6rohg9kS/irDTRLr1mdwZmCWyBpb8OShVmIfgak0fFrlyDGYBM19ejvk606rzTrq+PfL3BsJNAyKwZ0Yd46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553483; c=relaxed/simple;
	bh=ua6NBcpMsmGxkxsRFCt9qqLfoN5fo54vzR5LLZbWBnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVTu3bBFDZ/6DA+rW6QucoOkg7hdxlHRGFuWyiX1jDTNhks4z1RDlVKN99J8Vqd8kO9PLyaXISp9qde7TnMxuHb5Ca8JYZVRkvDx94UCAcBP9XAYb0zZCuDrWS0f6vpKLF7vWWlM7v4IQeiT2ejxfvTzUKhtkGh/zxBbjwh1ZNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW4xU8EC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW4xU8EC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so2286573f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Apr 2026 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775553480; x=1776158280; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QAXViyT/yNLbimjFZQ0oxVgoLoR8JjMuycPU0pt+qI=;
        b=fW4xU8ECQ9g/O3fDee+2BQBxvhAxayljz6FdLL3E0zESJkV9CuNGcnQ81e3Z18aN8o
         8DmgWxZxIvA1174k2T3xsoMnXpfT5HXPCkUg9ywFJvGclZRCGBQsxQQ6Hcoka482SNKX
         ir3AnJvu7bP+C+2xhSgmtjddlV7z6VRikzPGc+6RbVysfYEB2VI7HtsMhmYA2uqfHTWs
         Y/0Xx8S45kzCqRFkYvSqNLtBhitUkv8IuXqazFTuCchPdeatNaB88ss7QH2MVSDvBMCw
         cPBZlDHGZThDPrUFHl2wgnNfDXfSx2QD7cEK36hroPT7So+6OmCcDmqR7SEJb/ubIoFG
         9dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553480; x=1776158280;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QAXViyT/yNLbimjFZQ0oxVgoLoR8JjMuycPU0pt+qI=;
        b=aBsGeU+K56lGLdNAwH5Fofl5xXerKU/GBR1990mmpc8P/0pQGU2vZ5x9rF7o85JKoE
         /nk8PE+ZARkmVjFixSt8KTsUhrMD7Hpy+cuBIBS9y1J2LnM0zZkZL9k5qlFhr5M4JEFE
         SFYgx47BdR3CHjWTvEBnTnIRJEWEqDXVXrz9sRdHDKb+IGrJbcGSE3ntPLGGa7XqwmP7
         3zMNV+WocB0WvvNCxw+GaacpTTMNuaOvmGM0y5RlTgq17h3rchcwWUr9d85YKynyC3tj
         dz9cyIw1l7BKKkIKiGf2yZ6+klRXjlGgzV3a2uVkjMe32yb8kU8KfpyT/xlwJ9/fiqfk
         krqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGHNtblfkDGHA0kKkjt6ON8p4ywJAPdQporkzI+HF7oDwbLMzlG6NeqfYGnznuEV3mbxECvq1dovFiZNEY@lists.linux.dev
X-Gm-Message-State: AOJu0YxQlsrslqm4B7wOjfPBQVdZmmFNB/BzosOaTq1iefHTV09qMZfY
	P/GLhaI5rVeZwh4Tp5MxyJWDwqXwgBhVibPfsZ/TpA8PjxFgD993xg53
X-Gm-Gg: AeBDieuErmk274eiEl9TTaSnhIZGrQekD2TbL6jULoS28oSwjxmVwY0xQN6nEW5ZSuv
	pxaJagD72b+WpnKXxpJaKe2puGJgADF0S9FJ/dFmCOBocZyrZ1HHiNV1KHLp34rB/PMDHGCo/A3
	TddCZuuUGF+z2KzKaZRyii0/Lm2GLxwmg0a/DwmNkL9i8kgcRUSsxkmaTy0sW7kGHZo+ZXiZke4
	886Axb6YfDnnU1SEUy1Que7D380JnfeyuxU7pV11SQiqRr0RubdZJva9qhVpipSW72kqLoZNSRu
	5LwCu14v5R/clyeO/QTJ367ExHHrHeVtEwQng8NYDolJRefem4RR+MAvyVe4y0q18q0kIIdJ2WY
	Ivtrb3QDmlOf1434Q5P0qGs2suwCYVd8OIqRDJOX0kSmx5ctKoIziyeuX1mKrUM7SFYOoNeOD41
	Z6Cows+TZYeGhWa5PYc9k=
X-Received: by 2002:a5d:5847:0:b0:43d:25a6:624 with SMTP id ffacd0b85a97d-43d28fb74abmr24068950f8f.11.1775553479509;
        Tue, 07 Apr 2026 02:17:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm51421864f8f.6.2026.04.07.02.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:17:58 -0700 (PDT)
Date: Tue, 7 Apr 2026 12:17:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next-7.1 55/56]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:423 amdgpu_coredump()
 error: we previously assumed 'job' could be null (see line 414)
Message-ID: <202604071441.vAPwv1su-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.1
head:   7b15fc2d1f1a00fb99f0146e404ff2600999ec74
commit: 32ab301b89b30d71a2e68d86f564eca66f7c52c5 [55/56] drm/amdgpu: store ib info for devcoredump
config: x86_64-randconfig-161-20260405 (https://download.01.org/0day-ci/archive/20260407/202604071441.vAPwv1su-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604071441.vAPwv1su-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:423 amdgpu_coredump() error: we previously assumed 'job' could be null (see line 414)
drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:425 amdgpu_coredump() warn: variable dereferenced before check 'job' (see line 423)

vim +/job +423 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

6122f5c72e38a88 Trigger Huang              2024-08-19  399  void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
6122f5c72e38a88 Trigger Huang              2024-08-19  400  		     bool vram_lost, struct amdgpu_job *job)
9022f01b9709331 Sunil Khatri               2024-03-21  401  {
9022f01b9709331 Sunil Khatri               2024-03-21  402  	struct drm_device *dev = adev_to_drm(adev);
6122f5c72e38a88 Trigger Huang              2024-08-19  403  	struct amdgpu_coredump_info *coredump;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  404  	size_t size = sizeof(*coredump);
9022f01b9709331 Sunil Khatri               2024-03-21  405  	struct drm_sched_job *s_job;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  406  	u64 total_ring_size, ring_count;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  407  	struct amdgpu_ring *ring;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  408  	int i, off, idx;
9022f01b9709331 Sunil Khatri               2024-03-21  409  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  410  	/* No need to generate a new coredump if there's one in progress already. */
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  411  	if (work_pending(&adev->coredump_work))
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  412  		return;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  413  
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04 @414  	if (job && job->pasid)
                                                                    ^^^
Can job be NULL?

32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  415  		size += sizeof(struct amdgpu_coredump_ib_info) * job->num_ibs;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  416  
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  417  	coredump = kzalloc(size, GFP_NOWAIT);
e29172987309526 Mario Limonciello (AMD     2025-12-14  418) 	if (!coredump)
9022f01b9709331 Sunil Khatri               2024-03-21  419  		return;
9022f01b9709331 Sunil Khatri               2024-03-21  420  
6122f5c72e38a88 Trigger Huang              2024-08-19  421  	coredump->skip_vram_check = skip_vram_check;
9022f01b9709331 Sunil Khatri               2024-03-21  422  	coredump->reset_vram_lost = vram_lost;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04 @423  	coredump->pasid = job->pasid;
                                                                                  ^^^^^^^^^^
Unchecked dereference

9022f01b9709331 Sunil Khatri               2024-03-21  424  
8d1a13816e59254 Christian König            2024-12-12 @425  	if (job && job->pasid) {
                                                                    ^^^
The next line assumes it can be NULL again.

9022f01b9709331 Sunil Khatri               2024-03-21  426  		struct amdgpu_task_info *ti;
9022f01b9709331 Sunil Khatri               2024-03-21  427  
8d1a13816e59254 Christian König            2024-12-12  428  		ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
9022f01b9709331 Sunil Khatri               2024-03-21  429  		if (ti) {
9022f01b9709331 Sunil Khatri               2024-03-21  430  			coredump->reset_task_info = *ti;
9022f01b9709331 Sunil Khatri               2024-03-21  431  			amdgpu_vm_put_task_info(ti);
9022f01b9709331 Sunil Khatri               2024-03-21  432  		}
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  433  		coredump->num_ibs = job->num_ibs;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  434  		for (i = 0; i < job->num_ibs; ++i) {
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  435  			coredump->ibs[i].gpu_addr = job->ibs[i].gpu_addr;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  436  			coredump->ibs[i].ib_size_dw = job->ibs[i].length_dw;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  437  		}
9022f01b9709331 Sunil Khatri               2024-03-21  438  	}
9022f01b9709331 Sunil Khatri               2024-03-21  439  
9022f01b9709331 Sunil Khatri               2024-03-21  440  	if (job) {
9022f01b9709331 Sunil Khatri               2024-03-21  441  		s_job = &job->base;
9022f01b9709331 Sunil Khatri               2024-03-21  442  		coredump->ring = to_amdgpu_ring(s_job->sched);
9022f01b9709331 Sunil Khatri               2024-03-21  443  	}
9022f01b9709331 Sunil Khatri               2024-03-21  444  
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  445  	/* Dump ring content if memory allocation succeeds. */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

