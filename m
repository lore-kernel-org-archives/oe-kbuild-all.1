Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECD22370F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993410; cv=none; b=GqShVlqDPb1POPmOCvufmbaMI71eR0RzP/KpKZ4aDfsvrQL4GPAN64z6z02R3NmaicR0KVTZPVUhI6EP8GgNcY2wQb3rt/w6qwJL0j4OfstYu8D7gAgNeSbjrtLVZnKvkAxEeDL6V4fZXCpIUqlltNjc+o58PGqBFYhj0E5tIEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993410; c=relaxed/simple;
	bh=IB0K1uUNYimeg8wJMWrZHPGvEnLotCzFoA4V9I0lTC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXlrvSWLxdtUPDAcVJBagt9+UNZXrRPJ5SJr17f2n0HIrY+AxzM3AKxM+ni2bdy5ZEtLdQhDOkgjUUoNVL6IcPsjwCEywDWRjyqtBJdtj1B8Mf5Fn8Sl45Sc8PSpGfUadY8P08ei149/wj5kklC+Tqn0NHF5cPS9IuIgwf4jA8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aQjAZH7I; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aQjAZH7I"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso69510685e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747993406; x=1748598206; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASW4g2Stbx73gzooi+ihqxW33Cbhs7/VAI8mEaOvq4I=;
        b=aQjAZH7IHrxTTeQw50xURB/Re9BpLWYkRYc+Uu1ArZBK9nzneS05tMnGvqe8dsFBJe
         k9BhYbr/iN9jts2a4DygA1/DcC/U1XZoqb7k2yWQKqWq3ew3cIug0RgbIqvlK3wr+wOt
         zda7sjFCdwX8IolPTa9whVdPXREZdPVzZCivEYR1neud0jWROsEyavk7F9HIDNEOux7U
         3kb/iy5WuBobSfc6VGU2EeVgwLamF/SUJCVjyA3BtgtCiowys+8V73UMsjQuf7erK+3e
         WHdQ51VTZIbfqk9JICQ/4fJotVHvPZ+puk5Yas5J9H21PSH13B9vOhynw9HWr5nn6R28
         Wr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993406; x=1748598206;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASW4g2Stbx73gzooi+ihqxW33Cbhs7/VAI8mEaOvq4I=;
        b=dQ27OBDbEQ+Ij2+qlHBNH7yhKI+ZGtE4JNUP772f7zM3VLvoSvNqgtxY3W5f6yQj0a
         vrAWzzIAcx9/B5xZqzQ+EoiLGZKVMrK6wTiulTxXG9YePgrCB/8IY76tOCrYSan1qD8V
         N8vRulLWYuYTJp/2Nnm8a5t0m7qORXwfR+F+uk98j2fUVBhRZ4qG7DahhKdnGknCAxWq
         O97KmO+dOyhW2L9dupFHRxF4usHLDs5a1IpRn4EyIF8+qwvOBcVjz+XfX0NhebWr9L2k
         305Fz/Rrqt6euV2wQYm8c7vlhcLr9ztmqwj1ZtJPq1YiHepBQaq/QRBqiS1udh9XjS3G
         nfuA==
X-Forwarded-Encrypted: i=1; AJvYcCVdpSJUBoJXy0mIMicZfkCLPKP3YuQKsAMucaMrJF3F+Z8yB/p8Y7DlCc2PLs7SoRMhAe+2kqoODvTpFgEw@lists.linux.dev
X-Gm-Message-State: AOJu0YwkaGsoTd59zfgJBgR99QdAtPnYE//Bo3T3NjKVQWRvKF2mACah
	/zPxhmBzTUOkO0vDoaGeG35TaHyQlqbZBnPE/zLZlf303dtomXjc7e7WL2q/RlvFKIg=
X-Gm-Gg: ASbGnctBht5UlwEqOQc1EVpBh6tvFv0qeVzUEshtYKJfgDoZaFTe+KFJL5GyBTLmFkE
	5uITPbTmrprxKCtfCFtKrsLiMw54qKhSDNTP8f9DeZGNRZOY68uZufS2o+tHpdK8pwGig6IRTIa
	attWkU8Nnvbj3VOqYbWcGeW95dDMtIIRSyDqV+WUp08wEdQd9Ta/xlLM0fKXUpuB4wTe/S1EPQ0
	IClT6zQNbzr+gCyLyeDiN8i/sq/ZzBLhifcCpayxrcmvA/BzIZIYsh8dA5OV1Xk9fzc4L5D1wpl
	rPFNiLd2lM7dYmr8ThBcwzY3TrRUWKRZs7cmRHQoFagvFTaALw2mqtwe
X-Google-Smtp-Source: AGHT+IG1YNLEDe44w/T8lljUWTbHZkAvqGZuDKj2vYHLa+eE3eKX2dF2LxR+S7PWrvYKdiPTMXE6nA==
X-Received: by 2002:a05:6000:2282:b0:3a3:7bbc:d94e with SMTP id ffacd0b85a97d-3a37bbcdc22mr14556163f8f.6.1747993406070;
        Fri, 23 May 2025 02:43:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca62910sm26535095f8f.50.2025.05.23.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:43:25 -0700 (PDT)
Date: Fri, 23 May 2025 12:43:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Benjamin Marzinski <bmarzins@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [linux-next:master 10969/12618] drivers/md/dm-mpath.c:2104
 probe_active_paths() warn: mixing irqsave and irq
Message-ID: <202505221209.UJOI2rXT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
commit: 5c977f1023156938915c57d362fddde8fad2b052 [10969/12618] dm-mpath: Don't grab work_mutex while probing paths
config: i386-randconfig-141-20250521 (https://download.01.org/0day-ci/archive/20250522/202505221209.UJOI2rXT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505221209.UJOI2rXT-lkp@intel.com/

smatch warnings:
drivers/md/dm-mpath.c:2104 probe_active_paths() warn: mixing irqsave and irq

vim +2104 drivers/md/dm-mpath.c

7734fb4ad98c3f Kevin Wolf         2025-04-29  2095  static int probe_active_paths(struct multipath *m)
7734fb4ad98c3f Kevin Wolf         2025-04-29  2096  {
7734fb4ad98c3f Kevin Wolf         2025-04-29  2097  	struct pgpath *pgpath;
5c977f10231569 Benjamin Marzinski 2025-05-15  2098  	struct priority_group *pg = NULL;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2099  	unsigned long flags;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2100  	int r = 0;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2101  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2102  	spin_lock_irqsave(&m->lock, flags);

_irqsave() is for if we don't know if the caller has disabled IRQs or
not.

5c977f10231569 Benjamin Marzinski 2025-05-15  2103  	if (test_bit(MPATHF_DELAY_PG_SWITCH, &m->flags)) {
5c977f10231569 Benjamin Marzinski 2025-05-15 @2104  		wait_event_lock_irq(m->probe_wait,
5c977f10231569 Benjamin Marzinski 2025-05-15  2105  				    !test_bit(MPATHF_DELAY_PG_SWITCH, &m->flags),
5c977f10231569 Benjamin Marzinski 2025-05-15  2106  				    m->lock);

The wait_event_lock_irq() macro calls spin_unlock_irq(), so hopefully
none of the callers of probe_active_paths() actually relied on having
IRQs disabled.

5c977f10231569 Benjamin Marzinski 2025-05-15  2107  		/*
5c977f10231569 Benjamin Marzinski 2025-05-15  2108  		 * if we waited because a probe was already in progress,
5c977f10231569 Benjamin Marzinski 2025-05-15  2109  		 * and it probed the current active pathgroup, don't
5c977f10231569 Benjamin Marzinski 2025-05-15  2110  		 * reprobe. Just return the number of valid paths
5c977f10231569 Benjamin Marzinski 2025-05-15  2111  		 */
5c977f10231569 Benjamin Marzinski 2025-05-15  2112  		if (m->current_pg == m->last_probed_pg)
5c977f10231569 Benjamin Marzinski 2025-05-15  2113  			goto skip_probe;
5c977f10231569 Benjamin Marzinski 2025-05-15  2114  	}
5c977f10231569 Benjamin Marzinski 2025-05-15  2115  	if (!m->current_pg || m->is_suspending ||
5c977f10231569 Benjamin Marzinski 2025-05-15  2116  	    test_bit(MPATHF_QUEUE_IO, &m->flags))
5c977f10231569 Benjamin Marzinski 2025-05-15  2117  		goto skip_probe;
5c977f10231569 Benjamin Marzinski 2025-05-15  2118  	set_bit(MPATHF_DELAY_PG_SWITCH, &m->flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2119  	pg = m->last_probed_pg = m->current_pg;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2120  	spin_unlock_irqrestore(&m->lock, flags);
7734fb4ad98c3f Kevin Wolf         2025-04-29  2121  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2122  	list_for_each_entry(pgpath, &pg->pgpaths, list) {
5c977f10231569 Benjamin Marzinski 2025-05-15  2123  		if (pg != READ_ONCE(m->current_pg) ||
5c977f10231569 Benjamin Marzinski 2025-05-15  2124  		    READ_ONCE(m->is_suspending))
5c977f10231569 Benjamin Marzinski 2025-05-15  2125  			goto out;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2126  		if (!pgpath->is_active)
7734fb4ad98c3f Kevin Wolf         2025-04-29  2127  			continue;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2128  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2129  		r = probe_path(pgpath);
7734fb4ad98c3f Kevin Wolf         2025-04-29  2130  		if (r < 0)
7734fb4ad98c3f Kevin Wolf         2025-04-29  2131  			goto out;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2132  	}
7734fb4ad98c3f Kevin Wolf         2025-04-29  2133  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2134  out:
5c977f10231569 Benjamin Marzinski 2025-05-15  2135  	spin_lock_irqsave(&m->lock, flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2136  	clear_bit(MPATHF_DELAY_PG_SWITCH, &m->flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2137  	if (test_and_clear_bit(MPATHF_NEED_PG_SWITCH, &m->flags)) {
5c977f10231569 Benjamin Marzinski 2025-05-15  2138  		m->current_pgpath = NULL;
5c977f10231569 Benjamin Marzinski 2025-05-15  2139  		m->current_pg = NULL;
5c977f10231569 Benjamin Marzinski 2025-05-15  2140  	}
5c977f10231569 Benjamin Marzinski 2025-05-15  2141  skip_probe:
5c977f10231569 Benjamin Marzinski 2025-05-15  2142  	if (r == 0 && !atomic_read(&m->nr_valid_paths))
5c977f10231569 Benjamin Marzinski 2025-05-15  2143  		r = -ENOTCONN;
5c977f10231569 Benjamin Marzinski 2025-05-15  2144  	spin_unlock_irqrestore(&m->lock, flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2145  	if (pg)
5c977f10231569 Benjamin Marzinski 2025-05-15  2146  		wake_up(&m->probe_wait);
7734fb4ad98c3f Kevin Wolf         2025-04-29  2147  	return r;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2148  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

