Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752033195EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206151; cv=none; b=BcE8RQM+53fkAKR8dJ32JYIkBPS+M0cBPt21keymbTfWccs9MZG0/J2OZiZOdYZQ2jnsV00JTQogMcYiqg8P+KEcH9uSH2n6hLiLCRPpCQnERMPDbuGXKl+LLGJmYW5R/arAnRYfzUhHLNR4SgvueT+nulxzrTA4QZlRI70k3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206151; c=relaxed/simple;
	bh=pBS6hT9yEoE3yG9xzZMMjxlaeZq+lr1UAeKsg+tu/D4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+QHuA2NYw7s0HKx9EvVy4mwv9HA7NLapxBMo0ToixSNg1R98782565skYZ9uwsp31CQp1VVKtdkgDVzGIZhE8IaRXY9/HKAJQYLh45FR6t/TjXIUjkSjwjPydhlSYSMUYG0zpCV8zbKQonkRzu0Q82lJ7lpPkCKykSUKxe2iws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jpruEzZy; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jpruEzZy"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5125701f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768206148; x=1768810948; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YDvuWEPZUKEGpqbYjTfK0TBpxS9LAygMi+L9OhiLhF0=;
        b=jpruEzZyXzlB25vA5zHGKx3ErhZvVQis89RPZrAQOfB82Fe1k1EEW0kMsE3JtrFD/k
         DNROZtSQxnylK0uMcylWwfCraA7Rs4DhzxcOPznsFg+OvzRJpREsuXEnmXnt/wI/EIvI
         ffMOqF16t8zfTEhnHXPMI09PFi5jg0rRuH58mFsGTmY69uXovvLsa/UPcSdlgoiC+AZs
         lKaATZKqs9hrXkRU2yd38bPS5KnYW2FjoasjoqrnfVyzzYDvCFTqabdjv5ulkGmKF0r9
         Mo/hkL2xpXMqtdnuL5IwRZdaA4NelJ+WldLOOkPL3Gu1uD6k3Ja7MV7h+FC3Y/gEEMdu
         KhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206148; x=1768810948;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDvuWEPZUKEGpqbYjTfK0TBpxS9LAygMi+L9OhiLhF0=;
        b=WpMxQ6WhvmBor4Vxufg/yOCw0e7h5l1cjFGP+wTMgUCZZFUE5cOU7R4siqR6CX+cWq
         95Ivg0pbmY1zL0SEWz4u5d+sorK7YsILSYqopvV81e8mbm+jqLPq4YZ+HOvwkO7v8RI7
         JrfCBHAGHUWTevfk/OnPKkDSuJlTjxJrk+RT8pOJV7NYmw3fz+dmrCxcOvuCMhdM9g5R
         mcqaXLLN8HH4+YW+LzzkwmmoPzYEy9uLRnagV+IMtqdE4WBZob4hNAd9xizzabFddW80
         9FkUc6HZw1qWSJ3lRRuNtelvHvJC+2F1c7gVACzqdJuipVaE+br7U5h4RMWF+qJ4/ELQ
         4mjg==
X-Forwarded-Encrypted: i=1; AJvYcCUp3UijMAbRByXGdVUN+SYI2bmwS7AyMFyoym+TIrSkS1eBP12REqNd2ORp1/skEqXJxB4L1ZDB5FD1bZq/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywczfa2qf3Bz4SMbhQox97ylAv0EPfPeiQyGPX4QwrNZMhC8ny9
	jp45OPDL9/nYHM9D3WO+QoemEOC9YmfM/xbKk/IhfnFq/ALxV4oyuSEgyLiENs40aDI=
X-Gm-Gg: AY/fxX6iMwGIW8lavw+Fzmh7zmWynkfZddR53NZyadXAURxn9Ce/h3yds4tPCQXOHEq
	veHQDQXgxTNGKxQvyUF4briwCaC3zJ2Iq274bTCPZIUlAS2PL9L27UOiilU1CYeZgbmOfARxIBg
	wB/zOT/nZoBhoseILGLAOm67+XwWPnRkdj1cZZvbr8INq61FH673FtQFUCPhH5O3yYSj1ZvP/sB
	U9mA22IigFzj7kV7P8vqAHkVmy1MNGR5Uam9gIMPj2G7HTOsIc1+zU9EV4dTj0v6ESLWtjU7Clw
	+109mmTGrVfJ5ZLn6lzsTvawkZ7vRZx6IwcpJRbBKzwm35vo5XVqdE0DMSCEILW52AlmPbbvedV
	1G6BWACCZEjK4j1X0WX9U1kj6awC1mqaS874TbiSjW4BAs6OyClCZb9zpvVOsWVH87T4Y7iu9u1
	quVFyRu2vmuoW629HO
X-Google-Smtp-Source: AGHT+IG19sNlE2L7P11ZZ85VXMiRlXUUO7S5z9NSt7xv7j5yOQnoxSzy6igORzNk5s+MlJd4e6hdOg==
X-Received: by 2002:a05:6000:4024:b0:430:f59d:4dfc with SMTP id ffacd0b85a97d-432c378a153mr17382197f8f.9.1768206147657;
        Mon, 12 Jan 2026 00:22:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm37009619f8f.16.2026.01.12.00.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:22:27 -0800 (PST)
Date: Mon, 12 Jan 2026 11:22:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, ChunTao Tso <chuntao.tso@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Robin Chen <robin.chen@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>
Subject: [agd5f:drm-next-6.20 405/461]
 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:990
 set_replay_frame_skip_number() warn: variable dereferenced before check
 'link' (see line 987)
Message-ID: <202601121355.O4u8C4fh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.20
head:   38a0f4cf8c6147fd10baa206ab349f8ff724e391
commit: 9862d2ac667a0e731aa75c17c1b146da809bc3ae [405/461] drm/amd/display: Add frame skip feature support flag
config: x86_64-randconfig-161-20260108 (https://download.01.org/0day-ci/archive/20260112/202601121355.O4u8C4fh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601121355.O4u8C4fh-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:990 set_replay_frame_skip_number() warn: variable dereferenced before check 'link' (see line 987)

vim +/link +990 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c

f3f48d6ce5089b Chuntao Tso 2025-10-31   978  void set_replay_frame_skip_number(struct dc_link *link,
f3f48d6ce5089b Chuntao Tso 2025-10-31   979  	enum replay_coasting_vtotal_type type,
f3f48d6ce5089b Chuntao Tso 2025-10-31   980  	uint32_t coasting_vtotal_refresh_rate_mhz,
f3f48d6ce5089b Chuntao Tso 2025-10-31   981  	uint32_t flicker_free_refresh_rate_mhz,
f3f48d6ce5089b Chuntao Tso 2025-10-31   982  	bool is_defer)
f3f48d6ce5089b Chuntao Tso 2025-10-31   983  {
f3f48d6ce5089b Chuntao Tso 2025-10-31   984  	uint32_t *frame_skip_number_array = NULL;
f3f48d6ce5089b Chuntao Tso 2025-10-31   985  	uint32_t frame_skip_number = 0;
f3f48d6ce5089b Chuntao Tso 2025-10-31   986  
9862d2ac667a0e ChunTao Tso 2025-12-08  @987  	if (false == link->replay_settings.config.frame_skip_supported)
                                                             ^^^^^^^^^^^^^^^^^^^^^
Dereference.

9862d2ac667a0e ChunTao Tso 2025-12-08   988  		return;
9862d2ac667a0e ChunTao Tso 2025-12-08   989  
f3f48d6ce5089b Chuntao Tso 2025-10-31  @990  	if (link == NULL || flicker_free_refresh_rate_mhz == 0 || coasting_vtotal_refresh_rate_mhz == 0)
                                                    ^^^^^^^^^^^^
Checked too late.

f3f48d6ce5089b Chuntao Tso 2025-10-31   991  		return;
f3f48d6ce5089b Chuntao Tso 2025-10-31   992  
f3f48d6ce5089b Chuntao Tso 2025-10-31   993  	if (is_defer)
f3f48d6ce5089b Chuntao Tso 2025-10-31   994  		frame_skip_number_array = link->replay_settings.defer_frame_skip_number_table;
f3f48d6ce5089b Chuntao Tso 2025-10-31   995  	else
f3f48d6ce5089b Chuntao Tso 2025-10-31   996  		frame_skip_number_array = link->replay_settings.frame_skip_number_table;
f3f48d6ce5089b Chuntao Tso 2025-10-31   997  
f3f48d6ce5089b Chuntao Tso 2025-10-31   998  	if (frame_skip_number_array == NULL)
f3f48d6ce5089b Chuntao Tso 2025-10-31   999  		return;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1000  
f3f48d6ce5089b Chuntao Tso 2025-10-31  1001  	frame_skip_number = coasting_vtotal_refresh_rate_mhz / flicker_free_refresh_rate_mhz;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1002  
f3f48d6ce5089b Chuntao Tso 2025-10-31  1003  	if (frame_skip_number >= 1)
f3f48d6ce5089b Chuntao Tso 2025-10-31  1004  		frame_skip_number_array[type] = frame_skip_number - 1;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1005  	else
f3f48d6ce5089b Chuntao Tso 2025-10-31  1006  		frame_skip_number_array[type] = 0;
f3f48d6ce5089b Chuntao Tso 2025-10-31  1007  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

