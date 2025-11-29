Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F08208AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 16:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435248; cv=none; b=oUlkI/IoZvWU+4Q4Azzx5FgEDfi1f+Y1wQPkyi7xD6pfRflgVjpDUtgjwa/pHW8pQ47d2GI5yYk0uXasw1bhvauWtgKPTIvC4KMzb8pSY0rk3KY23n5pF1PL4VIXxI+urmUmbm4+iVfc7ImtEibBI3uYEI5dSMt9e+oP9ROxgGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435248; c=relaxed/simple;
	bh=yCnraAl4+YRYxXbfttFFzTDa9wIKsD7rXWu6EE+W+aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FGdYr+gyfc93231imYleRDFJ6u1u6OjPALARguml7y7fRjqLFZCElx7BJ20758Bz1RtVUYkuLpdfgvB3kqkHKVtw5phN5gZoVl/hvVzhxSRNRC3RafAQWnt6sm1Vpq3IPCtulHjWRG7H2fX3bF4WJd1xjGSmmRSk5Igvh16qEIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QHksiTow; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QHksiTow"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b26461e78so778012e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 08:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435246; x=1765040046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
        b=QHksiTowne2zke1uR6NkoaqHchFBbMsDNpCmuvjAc0HtCfSbFSgIi+ZexRj/dyCCpw
         9ckDKLPf3kOflICWpCU4PBF3N9wrlk7fWc9f+aSNKUDYlMg1zR60Svtti3kZp5GwvuT4
         mPCAn1oPuu2825j0+4PVhioTDhUdMBNrldWDtb6aiqunLNMTKGUvcTxUD4pLucgk5Za5
         J63XThLM5imAdo0c3I+8MnwRS73XZbw6maYBXnjg4JoAQVE8Hx+5qdQqBgj6lHoPmNOX
         awcdHX2i3+d2YrR9o2xDjYTqOxweEabUKZLnabePxTZAOqe91bF0YUmGZSxnXs+UbEUA
         p+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435246; x=1765040046;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
        b=rl3CalNuR08BjeA1QhGTtkNnUKoY4gCSrKi/0YcFcMXY8wOWrOitJ0D7FL/otuirqS
         Azmm1jtldoM5j9RTr/1oIBK+2DTqAr4VxduY+JDtCshK5Nzbppc/F7UMIL+1pLPwfCFp
         HP1kdGjHmSs8HJEsrwG66pTdC1JL5mRi4Og3cnuQuv/TMMiPwrk8Fx/4zCoP3os29KiE
         zydkMOlnb0BdCDavMpNmmF2WtadwWW4ui9okdGxuCsImAHgnHdGjE6ejSXRgo70CQcZO
         QwiAhPPWFL0nwxjcBnOAD2EvQDhMqah1ETfsTh4vBYiNRXFiRWU3NcEm1gQs3RpKeUcM
         oNHg==
X-Forwarded-Encrypted: i=1; AJvYcCUO9p62etILILWa0e63/kI842kPOoGi94ry+rnFzh+cm0MTvSCHtEflDgnhDl5Ai6DzdeRsa+T+Gw1mpWeM@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2NWNEhufAZ5tS0LOTr7O+rjhCvtiOFCzLm0FgUt2MMySTTXnd
	/2JyP8KE/z4BMn+a+7UtnRLLgmMNyy9XJ4oSPs3zrmEOQ4l3zK4WAMA9FcjsuEFY7/o=
X-Gm-Gg: ASbGnctoTJfaaY26BPzcrrTmyySMF8YlRzsNdypZTTgfP3ZigJHvictwNzEhZG6kC7z
	q/fbkur9hAZtQgg3YuE1qyQUCItvv4+820kO255gIHT5TJfEMrI/K3rTGvrMY9veYOMKI8Kpf3R
	J80YxD2K6kfuPWNPM4vOQgh8pRUBwADQIPpSSnC1WB77NquRGJTnZaiRBpY0l1gp2ahc0/LDopi
	gd6M+aYeUykccldwSjt6qa6cteJFr33MgviFeNAxvzCnlxMnsGhbO6BTsohjeRauT004qLnIlMS
	B66V57bmkk4tqQw+rP6Q3U5VuUjrf7PZCbNnyf8fWtPvm3dTgD+oIyiwjXlZtqsJhAbkSqmClkR
	oR5th6uYOg+fWvh/gzGvKQJkB86k0giNMX3V+gJkhx6Ulu1FCdqMcrNXIrONpWMKCmPXiyTuK/L
	2gtkKo9jg5U/NHJBG3
X-Google-Smtp-Source: AGHT+IG5tajmTfYoc3lFMiwar57/U6inDiuyMwTKKDkv9l56SNQgQ4HUSlYelexgYFZ7UMzNqqfw7Q==
X-Received: by 2002:a05:6122:202a:b0:55b:305b:4e3c with SMTP id 71dfb90a1353d-55b8f00fd2cmr10936851e0c.18.1764435245594;
        Sat, 29 Nov 2025 08:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 71dfb90a1353d-55cf516c50dsm3256156e0c.19.2025.11.29.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:54:04 -0800 (PST)
Date: Sat, 29 Nov 2025 19:53:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <202511291102.jnnKP6IB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126214748.650107-9-matthew.brost@intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-several-job-helpers-to-avoid-drivers-touching-scheduler-state/20251127-054955
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126214748.650107-9-matthew.brost%40intel.com
patch subject: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291102.jnnKP6IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511291102.jnnKP6IB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_lrc.c:2392 xe_lrc_timestamp() error: uninitialized symbol 'new_ts'.

vim +/new_ts +2392 drivers/gpu/drm/xe/xe_lrc.c

94c0c481e1bd20 Matthew Brost         2025-11-26  2363  u64 xe_lrc_timestamp(struct xe_lrc *lrc)
9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2364  {
94c0c481e1bd20 Matthew Brost         2025-11-26  2365  	u64 lrc_ts, reg_ts, new_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2366  	u32 engine_id;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2367  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2368  	lrc_ts = xe_lrc_ctx_timestamp(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2369  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2370  	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
94c0c481e1bd20 Matthew Brost         2025-11-26  2371  		new_ts = lrc_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2372  		goto done;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2373  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2374  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2375  	if (lrc_ts == CONTEXT_ACTIVE) {
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2376  		engine_id = xe_lrc_engine_id(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2377  		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
94c0c481e1bd20 Matthew Brost         2025-11-26  2378  			new_ts = reg_ts;

uninitialized on else path.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2379  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2380  		/* read lrc again to ensure context is still active */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2381  		lrc_ts = xe_lrc_ctx_timestamp(lrc);

lrc_ts is re-assigned here.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2382  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2383  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2384  	/*
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2385  	 * If context switched out, just use the lrc_ts. Note that this needs to
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2386  	 * be a separate if condition.
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2387  	 */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2388  	if (lrc_ts != CONTEXT_ACTIVE)
94c0c481e1bd20 Matthew Brost         2025-11-26  2389  		new_ts = lrc_ts;

uninitialized on else path.

9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2390  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2391  done:
94c0c481e1bd20 Matthew Brost         2025-11-26 @2392  	return new_ts;
94c0c481e1bd20 Matthew Brost         2025-11-26  2393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

