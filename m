Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD435CB97
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891280; cv=none; b=pBG2q8/Dvu9a/4VRVU+mMfT+uwxujcj9u9zvXNIq65bIVrCH5G4EsyQRRNxd8yKPKMOnuOOSSGTdv4EY82RvqGqXyyVb/EqSxKuT+cPyI3UImU2kGvRbFBHiuQXpQ5uK8uls9CM+RLdR8N+dErrC3vAV6ZV+peH4m9sqs1Xn1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891280; c=relaxed/simple;
	bh=FbeYi8abbKKDQN5ErrQhoV4Xo3NLRa/2WQwcV2r2I/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgW7anekXMMph3jjOg01qm4szX8f7CFMskVMoLNaJk+B2B9Dw4ldsTe8aN+TxSZ2peYAEfBkHtNQmUW7eo3DdSBtFdaHLXJbHzZXPuJGTz+YHMLyfirS5O9CA4CDaKwboENDC62arOmXKVto+uwUx9AyUtwJciJJ3Xlzu7pJDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tFXYQDw7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tFXYQDw7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so29649275e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765891275; x=1766496075; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wmHNZH7NrH1Cn87hSg81r6ayZGoy2xZZEr6d5MxEDc=;
        b=tFXYQDw7DQ45tGs8YrqeYBzNQnrRaVj2UbbamBgXxTHYmxEgz3qEeNqJl2KmG4PzgH
         2QbWXdyAMyGXCoVF4i8NKqFVzOqQu7cjD4MkNZBEspmFWuJeYX+J1s9pHQ/GR0Xrjsdm
         poW+zKST33eIb4ecCMBUydK/xBH4+3FEFwMbVpiFKR4gue1v4LVwG+yChyKj+YdvKxVp
         8krSM9Pwu5XdjUCOPA0/7+MYukJBKDf69Kx+mAUzjVpJNfIcpUmZJ1RtUDqmgI0mRkOd
         stxpI8CwhZw/k0SaMyIgMYaWaCPlBndS5m55udReBOK6LuFJDAqJRrUoRNVqfP3g1Jtk
         8G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891275; x=1766496075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wmHNZH7NrH1Cn87hSg81r6ayZGoy2xZZEr6d5MxEDc=;
        b=tftc4grhv1OkXGZGpzZOG+jG3L9ys/Dn3VSjn7mP5bwHgBCxcCqRmh8nJ+s64UmWSX
         WUYleX3xb7wZZv7BMtZhVsWKLxxhsc0CMfUU6ZAxR6iBCCXlk7qelLflwcDgB7BK/q6g
         77WE05+5gMkoZRxwZ7RdL/qBJiNR8xpoqehSfZaospjZ+ikkVPQFBQ/oe9W8et3SZDxu
         eT+PLc9aSlHhzOPIFUpN427ow1Up+H2b4J3I8Zc90wx2fjNPTgJlaJ8CrLTiNHT3fIRB
         sTUuxsZ034eeN68XH/rBFeoAQYDC8ar8RB0WLHrK88JAPP6SboB3u2BXyN+iuYLcWBnk
         ks7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7I9+hxNoaZ2Ig/fGSVMH25qsMEZCnaksSnvYYM/Bab1ky/Srd5wMx59UR9t6YnVS/VcjadAIkT73Ovzt@lists.linux.dev
X-Gm-Message-State: AOJu0YwwHqwxrOn7lr06chIsFyux3EI3pF5P9E9scvjTZCfYyrZFPE7j
	Uvf1xN66YPCZxE/AlJAJ69E4P+M9R4LV33scqnPze1ky4fSdsHtap4sjEPM18pF+CPg=
X-Gm-Gg: AY/fxX4IHdFcLY9cFRAki9QywrjCkUGuk+0buE+EPOWQC5vIJ7psu+SDhGBYWJxVZlk
	My8tlIyoTh8kR/xTSAz3MC0RrWBstfVxKldXyjWhNlFOmt0HbH8/saOVcufQaiGAEAgVp/bHeUC
	rJfCCdwGS7uupsKaGhnlM2RzXulgUhlk/rgD2214fxHbGXexQtZQIT+/N/LVsetDmS1WkCUkjX2
	FNqCaCFnb7m5Vlrq/ACEgYMoErAZDufuQaYSrBxuDv5Oalh45fbDNV3lbb0RWJwhPr3Bz8jqZLz
	X/xduWXW+nUEM3/gYpidQLdOsvDzDNL/+w9iLQdNNlOc2wGEIz5CqnopzkBnCKjyg5BokSukvL9
	Fb9vt+efrMMOoMbK7iQHSuJ5im46h7yxj9XSGIAndGMIWD/HFlD85Of0l8PCaGNU5xY7Alp5qup
	VcCW3RQeV87vm7vUqs
X-Google-Smtp-Source: AGHT+IGfFKCHm6qQ5HvvPNH5WnmUcSnA8Trk6y8PPDniJYRofsEI3htHdqlRoko+7RtUJWrsVXM8MQ==
X-Received: by 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47a8f89cb47mr158078375e9.4.1765891275096;
        Tue, 16 Dec 2025 05:21:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4ef38bsm255963575e9.0.2025.12.16.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:21:14 -0800 (PST)
Date: Tue, 16 Dec 2025 16:21:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhu Lingshan <lingshan.zhu@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:amd-staging-drm-next 2547/2632]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3165
 kfd_ioctl_create_process() warn: variable dereferenced before check 'p' (see
 line 3162)
Message-ID: <202512162104.8deuIhSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e4a7a6e594f81347a95c965ce5e5d07ddea16913
commit: eb39a457ba5456fbc31d9bc0765af3fc00901cfc [2547/2632] amdkfd: introduce new ioctl AMDKFD_IOC_CREATE_PROCESS
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251216/202512162104.8deuIhSW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512162104.8deuIhSW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3165 kfd_ioctl_create_process() warn: variable dereferenced before check 'p' (see line 3162)

vim +/p +3165 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c

eb39a457ba5456 Zhu Lingshan 2025-08-21  3156  static int kfd_ioctl_create_process(struct file *filep, struct kfd_process *p, void *data)
eb39a457ba5456 Zhu Lingshan 2025-08-21  3157  {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3158  	struct kfd_process *process;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3159  	int ret;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3160  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3161  	/* Each FD owns only one kfd_process */
eb39a457ba5456 Zhu Lingshan 2025-08-21 @3162  	if (p->context_id != KFD_CONTEXT_ID_PRIMARY)
                                                    ^^^^^^^^^^^^^
This dereferences p

eb39a457ba5456 Zhu Lingshan 2025-08-21  3163  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3164  
eb39a457ba5456 Zhu Lingshan 2025-08-21 @3165  	if (!filep->private_data || !p)
                                                                             ^
So this NULL check is too late.

eb39a457ba5456 Zhu Lingshan 2025-08-21  3166  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3167  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3168  	mutex_lock(&kfd_processes_mutex);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3169  	if (p != filep->private_data) {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3170  		mutex_unlock(&kfd_processes_mutex);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

