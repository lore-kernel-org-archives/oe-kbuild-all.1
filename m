Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C01B983F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758605587; cv=none; b=uLvnvQHDdP2+7SZguBvxVQgcjNToygNqsNwBiI7QLOzNYKuEpHN4OtCowmqh2IhuWnwcIzGsPu1PTknosAhWWZzdLakDOWEp4tAdN/Ok4w9eAx3QX5y9TW2BhkOFrUNdShd1Gec/eWmRnCEsuNB4LWAu/weR0WDYKV1Iq4nVmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758605587; c=relaxed/simple;
	bh=vGEJ5XUGRSnMA66oCXUJKdhQ/pGg3iEiuzNderuyTc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbNkMvxM/IoGPJA0QPepmeDIubJE0IMYspJ8sGiMfz4hrjrQ5nZVM2bUHuiMUG4EHzgkOEKsxmcNJcvJnUxrhyRe//PS2sT+7OzksiAoAtauDz49jsmabkzxzB7y03XMliTz0HIKrpLvDRZAfxbMzqPIJdZYfhYFFJ1OcbKMDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd5t92hQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd5t92hQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46b303f7469so18187135e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 22:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758605584; x=1759210384; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=;
        b=Sd5t92hQaRLmDEUW1NJTThO40r6kUoaL53vMzUAUfBmirKHoMrqcVUXC1i63ST+xFe
         bfVDmyrEV/b70EWgsr8nfeUZ9YwxIZKxXoo8pZvguH29DF215+sCP14SF5jkKYZQdnVp
         NQjV+63EAMR+VA54Tq44Krn/nHaAtVSPCiyXymZV40HODYx6dY/jHzsVjKqQWkgDaGlP
         59vsr+wO9WBoBnK3mfjC4j3ZC5XPDb3QECC8DK/iVqhlxzAtVZx69BBifbrYaWaqnS/Q
         9WmALQJpGh6Y48JAsiJy3dN50oXr4UvHac+wgeAYUqu3nRcj8vvboViSU/zvR6DQjikQ
         4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758605584; x=1759210384;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=;
        b=qtbUrdE3XUhmBKA1KNG16jWUBzizaJ4+2NFXR6Bod/Eq3fIqjXgqm206q1fCPtcuW7
         AOFa1f9hnZ0Ve70jGRw4qtMXsCaQ/Ebn1O1hFudJ8rhQr71NVSI2PLaWnLTnvfT18iji
         KsUp5NmoBnLxNkHqRefykF1PjXKzW/mVqnBF65+dD2yFYg14Kjhs95Nm5NAnKBv1YPtY
         u16MjuiFcJW8bPJ/hn4Y3onJIfoLatfm9Ti7B9n0JYUeDzJsr4b1jO3zv4tWgiPbaLI4
         kg+ppAE5XUtjiBb/Vbtg2GlkEhhfqk1JX94/kFHa/h2XtE/hyta7dS+mBI/AKDGb+1aG
         ysaA==
X-Forwarded-Encrypted: i=1; AJvYcCVGN0xcg3xxKHcV9p3V43YFLTGE1Hak1O/NSlyy2AlNoZ0EPo23n703bH1KbNCTQTGtiRWdTUwrAPckmduw@lists.linux.dev
X-Gm-Message-State: AOJu0YzDjWYq7tPI2jn3AY/T4nRsziZ2bpcXQysavuXmHaL6bzhfaUXl
	YAkcN2KBwiqM4vBmVm+IbsqSfe4kCxFISnmDb7e0tyijn8wwwXDCWPVX1oyB35a+iHE=
X-Gm-Gg: ASbGnctm+iTJWYhbkpNDv273HYn3z4+E0HPBo4uHXzTC1X8APLujrboImPARpJdPW2u
	JOQd6ayA2BJSBuB/AJUv/N/eB7+/CY9oB+CNmLdBDs7zQy5JvltOPAhWkMPvh7R5SeLNFP8AkFl
	FIaTlnnQyEHJYNSEidViCBBOJuqKSeqZryid1YMLZyBGI05JUFTkaT3+MLrbEYPp5/J5JkyCWgf
	Xt/F0wtbfmvUQBRf79qWgN1S13sPAIIH7xckZjVIdPsZ4ifR0SaTIP5BOtnV4l1IX7sYwwUszYy
	vHohINgSbPTQ7LnazetQGYQqJA8zkgQ9gAU2VFXjBE7R5lpkCtU2fJcxYFzwuj1qqM42L+rJVgk
	6+YZPsP9SSadTU187tNiLDnib+0Wk
X-Google-Smtp-Source: AGHT+IGaW/wTjlF3vX/5ngxVawIqkqRfb+lQmNOxNFOw9CCk7KAF4WbfcNbfXVLS3PoI4R9q3MCZWQ==
X-Received: by 2002:a05:600c:1c05:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-46e1dae0d4bmr9065765e9.37.1758605583740;
        Mon, 22 Sep 2025 22:33:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461391232e7sm264631205e9.6.2025.09.22.22.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 22:33:03 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:32:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
Subject: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <202509231223.gZsX6Eio-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
head:   6d2f913fda5683fbd4c3580262e10386c1263dfb
commit: 71396cfac97d0249fa7d8dcc8e649b6ba4c090e4 [5/28] perf/dwc_pcie: Support counting multiple lane events in parallel
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231223.gZsX6Eio-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509231223.gZsX6Eio-lkp@intel.com/

smatch warnings:
drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.

vim +/time_event +418 drivers/perf/dwc_pcie_pmu.c

71396cfac97d02 Ilkka Koskinen 2025-08-28  401  static int dwc_pcie_pmu_validate_group(struct perf_event *event)
71396cfac97d02 Ilkka Koskinen 2025-08-28  402  {
71396cfac97d02 Ilkka Koskinen 2025-08-28  403  	struct perf_event *sibling, *leader = event->group_leader;
71396cfac97d02 Ilkka Koskinen 2025-08-28  404  	DECLARE_BITMAP(val_lane_events, 2 * DWC_PCIE_LANE_MAX_EVENTS_PER_GROUP);
71396cfac97d02 Ilkka Koskinen 2025-08-28  405  	bool time_event;
71396cfac97d02 Ilkka Koskinen 2025-08-28  406  	int type;
71396cfac97d02 Ilkka Koskinen 2025-08-28  407  
71396cfac97d02 Ilkka Koskinen 2025-08-28  408  	type = DWC_PCIE_EVENT_TYPE(leader);
71396cfac97d02 Ilkka Koskinen 2025-08-28  409  	if (type == DWC_PCIE_TIME_BASE_EVENT)
71396cfac97d02 Ilkka Koskinen 2025-08-28  410  		time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  411  	else
71396cfac97d02 Ilkka Koskinen 2025-08-28  412  		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  413  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  414  
71396cfac97d02 Ilkka Koskinen 2025-08-28  415  	for_each_sibling_event(sibling, leader) {
71396cfac97d02 Ilkka Koskinen 2025-08-28  416  		type = DWC_PCIE_EVENT_TYPE(sibling);
71396cfac97d02 Ilkka Koskinen 2025-08-28  417  		if (type == DWC_PCIE_TIME_BASE_EVENT) {
71396cfac97d02 Ilkka Koskinen 2025-08-28 @418  			if (time_event)

time_event is never set to false.  I really encourage developers to
use CONFIG_INIT_STACK_ALL_PATTERN=y for testing.  (Use
CONFIG_INIT_STACK_ALL_ZERO for production obviously).

71396cfac97d02 Ilkka Koskinen 2025-08-28  419  				return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  420  
71396cfac97d02 Ilkka Koskinen 2025-08-28  421  			time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  422  			continue;
71396cfac97d02 Ilkka Koskinen 2025-08-28  423  		}
71396cfac97d02 Ilkka Koskinen 2025-08-28  424  
71396cfac97d02 Ilkka Koskinen 2025-08-28  425  		if (dwc_pcie_pmu_validate_add_lane_event(sibling, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  426  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  427  	}
71396cfac97d02 Ilkka Koskinen 2025-08-28  428  
71396cfac97d02 Ilkka Koskinen 2025-08-28  429  	return 0;
71396cfac97d02 Ilkka Koskinen 2025-08-28  430  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

