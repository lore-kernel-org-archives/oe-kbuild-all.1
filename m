Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997263F99E3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593817; cv=none; b=LBcGG9zwGDRpNjBSZTVwVWa3DS8B0tF4hBtdMaxCHXt/snNIdJXCASIqbd/rV+0K12caoDpGZO++slh68yxYnVmXDjyNtib3SifqKp6e6Zbg6GnV16jZ6/LR1ogcuHQ6pGYubv1H0Z0GdvbohN2sJvyyu2nYF47r9wajHoDvOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593817; c=relaxed/simple;
	bh=2CceWHjsk841g1ibYYQNEzaqHQK2gQhpGazQWtOK+VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXIwDQm4OLlaZcKW0Z27KKnFa7tc0TfV0UFDqfXo4ERck4Ud2ZOagH7hrtUcF8SKFXQLJMU3rnyyiyMynKfF83HLcdvD9a9FgGGJiVAt5AH5NGB5+ooBLEqq3VdiXgU7VMAR33psKvEeht9CcYxlgK1v6lJgNjZsPkjRsPdiXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYDzZoQx; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYDzZoQx"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9f5637634so1003322a34.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jul 2026 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593814; x=1784198614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pteYtlmBZ+ziJgHaE/q1ZTT8oCJJM0UmmxtNS6yDVPI=;
        b=SYDzZoQx5/kRcdZikJC0l7u8JjWfPQTUskrh5brDu32Y8F9CVRySnkodQpBJvXZnDh
         BUXd5/POnyE7NpkoauTGsmY8YgNVFcV9MkQY4qhNmsLL3NjFKddXf/+vsA22nstDQ5Yn
         QviOrhHmlfe9C8IduRxBvnLGVvjOeMjVO4DyDxwzsLivGTLBqZYdEzSBtF7oRhIV1Tn+
         qhZAV+ck53kYSsdTjRfygzqUqDq6/YjNU2HtVIduPABHf+eMBJdGO/12rjrBdR9F7ajP
         wZgF3dHVUOpyDmF3fo4b/qd3nHN5z9Ixen5GdVg0bTPnRBaBdk1Lmmrjq/PX0lKTCc6H
         /15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593814; x=1784198614;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pteYtlmBZ+ziJgHaE/q1ZTT8oCJJM0UmmxtNS6yDVPI=;
        b=Uqzl3aXEye39ZNXlr/XMB4Q6DkchEmU1n5aIDz674cTxRMz5w7/fXA99tz6lqhFfUK
         gKpyaqsKqTeGPQXZ0K1J+dPx/mfd0cKyxRlglSYTq2C47oKOfsShDagJ3EYzCj2ZiiUN
         qhVeDD64kVE7dvNwqaQ6pNyjbFOubY/iWQDA67f+4PEx4rJRGKXQ5YbY4Wr1Y3g1ksJA
         tRgMOpxkmUQ1yG5mGp62q6UZOBlM9LQy87P5TzuUzN+1/j2dO4m6ijw769CJFDclspJo
         +JKfeNPCs+BbE+fv+/BpMnwJDQsO8eeqyd7iy4bzKprtN8B+3N7HcOT6jvId8J3e7LCh
         jX8g==
X-Forwarded-Encrypted: i=1; AFNElJ+om7cSNiCXPVgj7Z8/mMCFCt9ygHX478JddKdnEK0VjBdN6PB4+iC/2Tm1UJ4wCkS9KLzNbTIzjRRX8Jr3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5YeOWCsCwx9RHtKBqPPYmIDNDJmw425ccLJQ38m8Ta6TuRl4r
	axcbT4T2y62ceu/0b4+fuxYUGfRJc0MIuawgCQgfhdD1NnWaGpHiK2jk
X-Gm-Gg: AfdE7cldUvkpCOKv8i/Yd/zsF2hITqbi+guW7ZA6jFqZhst09VDlqp93HLHgXhqZCxb
	S0Z3rEkSOQCuH5iY5SyB/0tqtgjEpMzh/Djm5Osmrkv4xV5Fz5o1bGCC3bhJ+1nmgRnnjJ2AsXU
	0ZFBPhWTy9x13TcPgkbK26aTIndNSQkuILVIqSNU7s9CWVJChmXAnX7yT59Ag+xpxLZBFOnFpIB
	Q42yvXduSGiBAzLkPkB5ZZsIDZ62moaP11k2WDAQ/rU0YNr97w6+pbm2J/zXmL/NyrOcI1Up2/f
	fS9Ux886WZxLeasR00XGy+0PEtth3KarJkJ1EaMfx5paCid5nsdWQvQQeA6poEVHZaSTfuQyigr
	jZ/NTzEcxCRwiAWk7f8x2VvOwxCVUBJy8PzS/J4nQXcIfXDxrSyFwcbg1W0oKCqdGB7zc7yVOxb
	EZNDXx+0vpTsevNTg=
X-Received: by 2002:a05:6830:81ed:b0:7e6:f2ef:e231 with SMTP id 46e09a7af769-7ebcfe542c8mr5970046a34.2.1783593814306;
        Thu, 09 Jul 2026 03:43:34 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcafdf8f2sm3834902a34.11.2026.07.09.03.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:43:32 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:43:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexander Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 3205/3402]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c:537 amdgpu_device_ip_soft_reset()
 error: we previously assumed 'ip_block' could be null (see line 536)
Message-ID: <202607031711.yLwFhGfp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e3cc8c108f9a91728f9ff6e24cbf3b41c58b8f8b
commit: a6319ac34a1322cc70c8aa7a3b06a558dc4f68a5 [3205/3402] drm/amdgpu: Add IP block soft reset as a GPU recovery method
config: i386-randconfig-r073-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031711.yLwFhGfp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031711.yLwFhGfp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c:537 amdgpu_device_ip_soft_reset() error: we previously assumed 'ip_block' could be null (see line 536)

vim +/ip_block +537 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c

a6319ac34a1322 Timur Kristóf 2026-06-17  523  int amdgpu_device_ip_soft_reset(struct amdgpu_ring *guilty_ring,
a6319ac34a1322 Timur Kristóf 2026-06-17  524  				struct amdgpu_fence *guilty_fence)
a6319ac34a1322 Timur Kristóf 2026-06-17  525  {
a6319ac34a1322 Timur Kristóf 2026-06-17  526  	struct amdgpu_device *adev = guilty_ring->adev;
a6319ac34a1322 Timur Kristóf 2026-06-17  527  	struct amdgpu_ring *rings[AMDGPU_MAX_RINGS];
a6319ac34a1322 Timur Kristóf 2026-06-17  528  	struct amdgpu_ip_block *ip_block;
a6319ac34a1322 Timur Kristóf 2026-06-17  529  	enum amd_ip_block_type ip_type;
a6319ac34a1322 Timur Kristóf 2026-06-17  530  	u32 num_rings, ring_type_mask;
a6319ac34a1322 Timur Kristóf 2026-06-17  531  	int r;
a6319ac34a1322 Timur Kristóf 2026-06-17  532  
a6319ac34a1322 Timur Kristóf 2026-06-17  533  	ip_type = amdgpu_ip_from_ring(guilty_ring->funcs->type);
a6319ac34a1322 Timur Kristóf 2026-06-17  534  	ip_block = amdgpu_device_ip_get_ip_block(adev, ip_type);
a6319ac34a1322 Timur Kristóf 2026-06-17  535  
a6319ac34a1322 Timur Kristóf 2026-06-17 @536  	if (!ip_block || !ip_block->version->funcs->soft_reset) {
                                                    ^^^^^^^^^
a6319ac34a1322 Timur Kristóf 2026-06-17 @537  		dev_warn(adev->dev, "IP block soft reset not supported on %s\n",

The zero day bot chopped off the dereference of ip_block but presumably
the warning is correct.


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

