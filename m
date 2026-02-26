Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F023ECBC9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119057; cv=none; b=SYXsvvBLqZOVx8YSG+zIDsRjdX2cxd4sfIm+u4Rg8+RrH8EBoYGU/VJDAv4qTAbVmsj31tUdz5ftpKUPwTahspmOy0sQmzzRQSpasLurovuH5tRo9iqdWt5k54+6CSvV917Wdx0ulQUMAwme/dY/DLwXxt4z9fpkA7D8Eg420+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119057; c=relaxed/simple;
	bh=rU4zfPhCXu/D0DAZaiyutZ8v0rxxQ3X4K2UE4yPRvNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uT+uUx8pWowRoRxRXolx48P82XvsffT4W53DYdk6fcY2mQvaRPZCKtfKzPHZ7/b4LXy2MQAHMTt0C1yC4QYv6/E8kDkGbtXi80kFeJ1J7YdMbZV1feY+fF8Mm7LsixLJxI3wMRXYrVZDfLgNTo36SkQ6Z/irHbt2FTe4PXduJi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=auHpZHWD; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auHpZHWD"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so5959035e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772119053; x=1772723853; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohlf0bMfuezGgcZVUSaBlujFkeGEWCUNEdgGlyeWEjo=;
        b=auHpZHWDHl4QgpTBKu5TRAtT2FdtA85Ix6EGZDVzy5Z3CygMKysjvTSBJz76htfdpZ
         aN7d5kFONRRudMUjnXOq0tPp3RPGB6WT+sYVrbz4q3h9Lmd8pqL9WQuepd/u035XGzVa
         TOtmJ50znbecsDudT4z8PIjIA5DOgEVjTKwfCgZnJew9VjvhZT85y5bTAYAdO35Uogh1
         4iH6APZFF//s3/1LOMSeUo0HVoW2qisM1WJevEFdRwmmXT5UEwTNmiwxSy4G77w7KUXX
         FJQg65sFqPv9r/lUYbIZGbZGqXca5MTW7jYCJunszmA2UAlEZpCXxDQX1bz36Ra7G+28
         IP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119053; x=1772723853;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohlf0bMfuezGgcZVUSaBlujFkeGEWCUNEdgGlyeWEjo=;
        b=vrp+JgG1ZbQW1tCwsTHKPh/0U80ZBJbLsUufaB30IMOKxYBKLCFzU3OJWxHTqO4gI9
         koQ8jW4Se3lRXDvtaLg/qXHJjVPofcVbmdO5YtZ8B2XPNORxfCDytqQzCTEYcRHr3wDl
         HqxFanqSNbHQkM6Uc93L08LelGxsq0KK0U5dgHjz9qt+yWo3RtYyxBawM3Ra8sJhwOOB
         PMVzssVEpydI+D/t/O+H7b9lD5WMf8JNu6rPC6xY3EcuQvtYV/enDf7kYpHk/QSCv15b
         Sk9uzmwAaYCltHyHXftLo5A4d5vdZqNeSjMLlPGAgAY4cCySi8+w/dVtxu6yz2VdpgVD
         R7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX7NCuuxoo6/H5JsswcdOzCjeXDM5ofo5Nm7IyzPQb9spABMXpHMu2G0a99BzRouCzocnjHBG7FigvUc8p9@lists.linux.dev
X-Gm-Message-State: AOJu0YybAWhUXHogtaBV8TERYMY0M+UFR5Yosia87pYcNtofRJn325CU
	AiWU64nVT8o3BjRm6TYA/9Ci663TYG4Bhf5QV9tTqW/RBkZHLB76EHEoyVYtggKTJW8=
X-Gm-Gg: ATEYQzznPtAzbajwDhIrQO9pmvQJc6aMosNWSrVBMliR9vt+1JUsHIglmwAIeJX9a2t
	6eaXiSJDMb6EEPKeFBIAbk6SdkDQMf0x2IHGTcX4k+HuBYeLY7k6m8UQCaR1D6LF1/tdigbVhPM
	cIcSVA6/7IyyldoCJ2J8uYpd3/BuP/MmPOH7hjDYxr7foDOwiLx6tX8u5z2XydLf4E49m7/9kqY
	ZRbA4VqpFajJdVpxaf2iQfqfOdowckk55hEU0zWLm5Lk422Rj2qkX2fdAhDQk1sx8ceTfn1yfLj
	AahumnBM77lAcvqYrDOyZNZzCnFxvzQ81R0qX0OMs4bwIOIOT2AhVlBVkBxc+ZlrTCpgP3ahF+C
	3VFCmnyM9xOUAKo1LUS+wJ8aEzDJFSTqhCkNDAYcAKM5sI38zOonY4V6Fn1smUJvowT2AKq6/O1
	zrvIIrBQg8XMvtOEKMK3dF9+nqXw7/
X-Received: by 2002:a05:600c:8b54:b0:483:7f4e:fef6 with SMTP id 5b1f17b1804b1-483c21a01f9mr78399475e9.26.1772119053162;
        Thu, 26 Feb 2026 07:17:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf673sm47898775e9.19.2026.02.26.07.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:17:32 -0800 (PST)
Date: Thu, 26 Feb 2026 18:17:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Sunil Khatri <sunil.khatrti@amd.com>
Subject: [agd5f:drm-next 81/95]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:593
 amdgpu_userq_signal_ioctl() error: we previously assumed 'gobj_write' could
 be null (see line 575)
Message-ID: <202602262219.UY2pqzl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   9973e64bd6ee7642860a6f3b6958cbf14e89cabd
commit: 4ca06f6fb45da38e19e88b7dcf76b2a7e9d6a9e2 [81/95] drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_userq_signal_ioctl
config: i386-randconfig-141-20260226 (https://download.01.org/0day-ci/archive/20260226/202602262219.UY2pqzl2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602262219.UY2pqzl2-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:593 amdgpu_userq_signal_ioctl() error: we previously assumed 'gobj_write' could be null (see line 575)
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:597 amdgpu_userq_signal_ioctl() error: we previously assumed 'gobj_read' could be null (see line 567)

vim +/gobj_write +593 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  458  int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  459  			      struct drm_file *filp)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  460  {
cf856ca9b999bc Philip Yang              2025-04-22  461  	struct amdgpu_device *adev = drm_to_adev(dev);
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  462  	struct drm_amdgpu_userq_signal *args = data;
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  463  	const unsigned int num_write_bo_handles = args->num_bo_write_handles;
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  464  	const unsigned int num_read_bo_handles = args->num_bo_read_handles;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  465  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  466  	struct amdgpu_userq_mgr *userq_mgr = &fpriv->userq_mgr;
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  467  	struct drm_gem_object **gobj_write, **gobj_read;
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  468  	u32 *syncobj_handles, num_syncobj_handles;
f15d4e92f7d351 Arvind Yadav             2025-01-27  469  	struct amdgpu_userq_fence *userq_fence;
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  470  	struct amdgpu_usermode_queue *queue;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  471  	struct drm_syncobj **syncobj = NULL;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  472  	struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  473  	struct drm_exec exec;
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  474  	int r, i, entry;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  475  	u64 wptr;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  476  
d967509651601c Alex Deucher             2026-01-09  477  	if (!amdgpu_userq_enabled(dev))
d967509651601c Alex Deucher             2026-01-09  478  		return -ENOTSUPP;
d967509651601c Alex Deucher             2026-01-09  479  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  480  	num_syncobj_handles = args->num_syncobj_handles;
5eb2a72bac35e8 Tvrtko Ursulin           2025-12-05  481  	syncobj_handles = memdup_array_user(u64_to_user_ptr(args->syncobj_handles),
5eb2a72bac35e8 Tvrtko Ursulin           2025-12-05  482  					    num_syncobj_handles, sizeof(u32));
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  483  	if (IS_ERR(syncobj_handles))
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  484  		return PTR_ERR(syncobj_handles);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  485  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  486  	/* Array of pointers to the looked up syncobjs */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  487  	syncobj = kmalloc_array(num_syncobj_handles, sizeof(*syncobj), GFP_KERNEL);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  488  	if (!syncobj) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  489  		r = -ENOMEM;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  490  		goto free_syncobj_handles;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  491  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  492  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  493  	for (entry = 0; entry < num_syncobj_handles; entry++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  494  		syncobj[entry] = drm_syncobj_find(filp, syncobj_handles[entry]);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  495  		if (!syncobj[entry]) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  496  			r = -ENOENT;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  497  			goto free_syncobj;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  498  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  499  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  500  
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  501  	r = drm_gem_objects_lookup(filp,
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  502  				   u64_to_user_ptr(args->bo_read_handles),
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  503  				   num_read_bo_handles,
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  504  				   &gobj_read);

gobj_read assigned here

4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  505  	if (r)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  506  		goto free_syncobj;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  507  
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  508  	r = drm_gem_objects_lookup(filp,
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  509  				   u64_to_user_ptr(args->bo_write_handles),
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  510  				   num_write_bo_handles,
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  511  				   &gobj_write);

gobj_write assigned here

4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  512  	if (r)
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  513  		goto put_gobj_read;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  514  
b0328087c179f4 Shashank Sharma          2024-11-20  515  	/* Retrieve the user queue */
7b0813f32a0c23 Lijo Lazar               2025-11-24  516  	queue = xa_load(&userq_mgr->userq_xa, args->queue_id);
b0328087c179f4 Shashank Sharma          2024-11-20  517  	if (!queue) {
b0328087c179f4 Shashank Sharma          2024-11-20  518  		r = -ENOENT;
a242a3e4b5be22 Shashank Sharma          2024-12-11  519  		goto put_gobj_write;
b0328087c179f4 Shashank Sharma          2024-11-20  520  	}
b0328087c179f4 Shashank Sharma          2024-11-20  521  
cf856ca9b999bc Philip Yang              2025-04-22  522  	r = amdgpu_userq_fence_read_wptr(adev, queue, &wptr);
f15d4e92f7d351 Arvind Yadav             2025-01-27  523  	if (r)
f15d4e92f7d351 Arvind Yadav             2025-01-27  524  		goto put_gobj_write;
f15d4e92f7d351 Arvind Yadav             2025-01-27  525  
f15d4e92f7d351 Arvind Yadav             2025-01-27  526  	r = amdgpu_userq_fence_alloc(&userq_fence);
f15d4e92f7d351 Arvind Yadav             2025-01-27  527  	if (r)
f15d4e92f7d351 Arvind Yadav             2025-01-27  528  		goto put_gobj_write;
f15d4e92f7d351 Arvind Yadav             2025-01-27  529  
f15d4e92f7d351 Arvind Yadav             2025-01-27  530  	/* We are here means UQ is active, make sure the eviction fence is valid */
42a66677805d03 Alex Deucher             2025-04-16  531  	amdgpu_userq_ensure_ev_fence(&fpriv->userq_mgr, &fpriv->evf_mgr);
f15d4e92f7d351 Arvind Yadav             2025-01-27  532  
f15d4e92f7d351 Arvind Yadav             2025-01-27  533  	/* Create a new fence */
f15d4e92f7d351 Arvind Yadav             2025-01-27  534  	r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
f15d4e92f7d351 Arvind Yadav             2025-01-27  535  	if (r) {
f15d4e92f7d351 Arvind Yadav             2025-01-27  536  		mutex_unlock(&userq_mgr->userq_mutex);
f15d4e92f7d351 Arvind Yadav             2025-01-27  537  		kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
f15d4e92f7d351 Arvind Yadav             2025-01-27  538  		goto put_gobj_write;
f15d4e92f7d351 Arvind Yadav             2025-01-27  539  	}
f15d4e92f7d351 Arvind Yadav             2025-01-27  540  
f15d4e92f7d351 Arvind Yadav             2025-01-27  541  	dma_fence_put(queue->last_fence);
f15d4e92f7d351 Arvind Yadav             2025-01-27  542  	queue->last_fence = dma_fence_get(fence);
fc3336be9c6297 Jesse.Zhang              2026-01-13  543  	amdgpu_userq_start_hang_detect_work(queue);
f15d4e92f7d351 Arvind Yadav             2025-01-27  544  	mutex_unlock(&userq_mgr->userq_mutex);
f15d4e92f7d351 Arvind Yadav             2025-01-27  545  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  546  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  547  		      (num_read_bo_handles + num_write_bo_handles));
e7cf21fbb2773c Arunpravin Paneer Selvam 2024-10-30  548  
e7cf21fbb2773c Arunpravin Paneer Selvam 2024-10-30  549  	/* Lock all BOs with retry handling */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  550  	drm_exec_until_all_locked(&exec) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  551  		r = drm_exec_prepare_array(&exec, gobj_read, num_read_bo_handles, 1);

These are unchecked dereferences

cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  552  		drm_exec_retry_on_contention(&exec);
f15d4e92f7d351 Arvind Yadav             2025-01-27  553  		if (r) {
f15d4e92f7d351 Arvind Yadav             2025-01-27  554  			amdgpu_userq_fence_cleanup(fence);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  555  			goto exec_fini;
f15d4e92f7d351 Arvind Yadav             2025-01-27  556  		}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  557  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  558  		r = drm_exec_prepare_array(&exec, gobj_write, num_write_bo_handles, 1);

Here too.

a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  559  		drm_exec_retry_on_contention(&exec);
f15d4e92f7d351 Arvind Yadav             2025-01-27  560  		if (r) {
f15d4e92f7d351 Arvind Yadav             2025-01-27  561  			amdgpu_userq_fence_cleanup(fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  562  			goto exec_fini;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  563  		}
f15d4e92f7d351 Arvind Yadav             2025-01-27  564  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  565  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  566  	for (i = 0; i < num_read_bo_handles; i++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30 @567  		if (!gobj_read || !gobj_read[i]->resv)
                                                                             ^^^^^^^^^
So hopefully we can remove the NULL check on gobj_read here

cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  568  			continue;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  569  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  570  		dma_resv_add_fence(gobj_read[i]->resv, fence,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  571  				   DMA_RESV_USAGE_READ);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  572  	}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  573  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  574  	for (i = 0; i < num_write_bo_handles; i++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30 @575  		if (!gobj_write || !gobj_write[i]->resv)

And this NULL check as well

cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  576  			continue;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  577  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  578  		dma_resv_add_fence(gobj_write[i]->resv, fence,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  579  				   DMA_RESV_USAGE_WRITE);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  580  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  581  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  582  	/* Add the created fence to syncobj/BO's */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  583  	for (i = 0; i < num_syncobj_handles; i++)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  584  		drm_syncobj_replace_fence(syncobj[i], fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  585  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  586  	/* drop the reference acquired in fence creation function */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  587  	dma_fence_put(fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  588  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  589  exec_fini:
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  590  	drm_exec_fini(&exec);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  591  put_gobj_write:
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  592  	for (i = 0; i < num_write_bo_handles; i++)
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23 @593  		drm_gem_object_put(gobj_write[i]);

The error handling has no NULL checks

cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  594  	kfree(gobj_write);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  595  put_gobj_read:
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23  596  	for (i = 0; i < num_read_bo_handles; i++)
4ca06f6fb45da3 Tvrtko Ursulin           2026-02-23 @597  		drm_gem_object_put(gobj_read[i]);
                                                                                           ^^^^^^^^^^^^


cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  598  	kfree(gobj_read);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  599  free_syncobj:
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  600  	while (entry-- > 0)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  601  		if (syncobj[entry])
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  602  			drm_syncobj_put(syncobj[entry]);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  603  	kfree(syncobj);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  604  free_syncobj_handles:
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  605  	kfree(syncobj_handles);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  606  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  607  	return r;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  608  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

