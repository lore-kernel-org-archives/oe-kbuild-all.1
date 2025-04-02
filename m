Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58DF234973
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583412; cv=none; b=cVs+7QKyF+/NykC9L8mdLs1wyMAhGaID09kxUNyRu5RCnGAIQCEtSmcI5l56X7JP2I0kxUeA2eAiVSiYg7AMLX5AAnT+eADZ9rabxgbzGeWuhUObTN/c8olqGWg/YZelu+jNBJtXgj5i6O7JFpRZlagKGDK5l7GhpVrB3siITOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583412; c=relaxed/simple;
	bh=Kveb9atVJLnju8DdyOzVv8KDNpYBCjT9yUm3lhdIbSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khsPhjIVIoOasEqUY5ujNe6fdAaPYIrjRlfm1DjmE0JPKRykX8Ys9C49PVHq6MZ5GdzwC8CdPmNuHj7uiWMWqE7EwAC6nWjKZSCfNr8D07dLXkK6RSC0JADvaanWg3h+2dJS4ngHJ2wITdFotB0XU9t0KzOXLgtFo+4OcJ2aUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=py4vCzSO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="py4vCzSO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913d129c1aso445846f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Apr 2025 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583408; x=1744188208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MywdYD3IK46xGltB4W9LLSjkk8V2I4wOGeWZw0m6r78=;
        b=py4vCzSOHF2U5+ZuZp78lqsXJkc5ycgqx0iBF5sruccT5h0sQ4R0Lq1Pl/jpNsGNti
         uJ31Sp1svH539VcjoXMhdjlBu4ftKG9JPymj22PQan+GC+KwAJiziovmLl0sUTnd4tEX
         wIPY0Fvo5tKBq2PVUdDJYVQA5GqZH7GqAZsPB+WO6abshZJ8BBcVOBzAj8Mh0Gh59QBb
         26oaZg4z2swxp96NRs/ys0oiA5b5LiU0Lh7AGq1ex3/fsSLqznfWeJcDN9dRNlyGXm/0
         CoEMdru1qXpdpar4nORYf4JMXWnD6NhsvKA198EEW50DqdSuzQK3v6q4d0uiP7mxBwHL
         /XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583408; x=1744188208;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MywdYD3IK46xGltB4W9LLSjkk8V2I4wOGeWZw0m6r78=;
        b=QtOMkc4UGIMRb3hNZZDzytkyxJbI3lLxLQbtjn/bMuMCKhUxabn8n9V8pKYx9aMgKe
         ejqOb9+LcUbohQrJ8+HiXXPTK1OXaqMOwepOfRpF7Dz6d2A+q7wVVoDvCC4mCmH9IEdh
         5B7//735ujFU+5BosUZivQ3OSE3G+gDWTepckAcgBXw0QGCmQiQs0pq0V2rEGYadyY7P
         DKG93Hu3VsQzPrhCE7dBjEY0fKGGcazC1cmMSWmK6OpwuIh5e6a5QSpG39BICCqUbHF7
         f+ZTJqh2PALuPF9q8GrPGRqLHHggO3xbZ8COgk7DXlWowXSaeOrxP78/0n5t6iFuU0fd
         MIng==
X-Forwarded-Encrypted: i=1; AJvYcCWz4pkNmX/J8kra7OHOZIU8PV3MmIU3SNCrbvi4vbVtLMvJAfqPSbMitCRxbQwqILKeaETuj2mg8jMPhm+C@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8xuCbxM4W5gHXGryxsl/IlfAvY+NxE8UHU00jT2TetGdyq2eO
	j8OSm8p7Gr88eSItgnxPR8FZaN0V+2lSHHzUKVO5Gxj3T0LYInJL5OYeRnenc40=
X-Gm-Gg: ASbGncuR7yXAtxSc7jhC9xodueWm0j/d1YYX8FIRsZ/K244yNUZkIUolXwmkSH40qT/
	l1oM7Cm/pJowk62eXhHqEVHrtvxr8FW/PxlvPgzplS3pcyKOmQx8XsUy5DR4Jq0ZTU8TN8H3DpW
	v8fJvRK04x4THDa8l7DNc1izxDWkmVHcPe0OYwC5CDsvAywvMhgyLTTn00fklNP50H33d3IVRik
	3O/v81SW4B5HuU+OHrO+sTQbuiOvBEndDm0tYg7kmEKGFlcbAR4fEYwpznunHDndm4tltRD1iRq
	8ex7x8JZvTO26RimX8T5GWUzf2hnIKxN/+w30ITBTp6u8RSIbA==
X-Google-Smtp-Source: AGHT+IE5eJjzFzKgLbEhHe/LWXL3GWvq9N0z7X0b0Tq6//QeucYYtfOz5/gw451nA9yosCEuAa7qpQ==
X-Received: by 2002:a5d:584f:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-39c2a668cb9mr1095356f8f.8.1743583408087;
        Wed, 02 Apr 2025 01:43:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a3d66sm16162069f8f.81.2025.04.02.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:43:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:43:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>
Subject: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error:
 uninitialized symbol 'ret'.
Message-ID: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
date:   2 months ago
config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.

vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c

cdec4d3613230f Eric Anholt 2017-04-12  589  static int
04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
04630796c437a9 Maíra Canal 2024-12-20  591  			 struct drm_exec *exec_ctx)
cdec4d3613230f Eric Anholt 2017-04-12  592  {
04630796c437a9 Maíra Canal 2024-12-20  593  	int ret;
cdec4d3613230f Eric Anholt 2017-04-12  594  
cdec4d3613230f Eric Anholt 2017-04-12  595  	/* Reserve space for our shared (read-only) fence references,
cdec4d3613230f Eric Anholt 2017-04-12  596  	 * before we commit the CL to the hardware.
cdec4d3613230f Eric Anholt 2017-04-12  597  	 */
04630796c437a9 Maíra Canal 2024-12-20  598  	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
04630796c437a9 Maíra Canal 2024-12-20  599  	drm_exec_until_all_locked(exec_ctx) {
04630796c437a9 Maíra Canal 2024-12-20  600  		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
04630796c437a9 Maíra Canal 2024-12-20  601  					     exec->bo_count, 1);

This is a false positive in Smatch.  I can silence the warning on my
end easily enough to say that we always enter the drm_exec_until_all_locked()
loop.  But the question is why do we only test the last "ret" instead of
testing all of them?

04630796c437a9 Maíra Canal 2024-12-20  602  	}
cdec4d3613230f Eric Anholt 2017-04-12  603  
cdec4d3613230f Eric Anholt 2017-04-12 @604  	if (ret) {
04630796c437a9 Maíra Canal 2024-12-20  605  		drm_exec_fini(exec_ctx);
cdec4d3613230f Eric Anholt 2017-04-12  606  		return ret;
7edabee06a5622 Eric Anholt 2016-09-27  607  	}
d5b1a78a772f1e Eric Anholt 2015-11-30  608  
cdec4d3613230f Eric Anholt 2017-04-12  609  	return 0;
cdec4d3613230f Eric Anholt 2017-04-12  610  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

