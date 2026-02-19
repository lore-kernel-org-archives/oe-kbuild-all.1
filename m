Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D533327210
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483947; cv=none; b=M8d3ZZpqHW2xJ2i8TKiMju5pF3KP2hY2oBZfHie2lFHjeTpNBpO9f8hsgifUfvxs1DUEwWh7Rjg+HsfsWOYO/2Ih+KsJpyjRJfvVV5MLYGS2kVSSQJPOoonslVGv/ESExfgnpIwToFnRjuWebj46nKCAgajD9Zbio28r9qtp56Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483947; c=relaxed/simple;
	bh=a9gIIuUbYtr3xbL1BkLiyFYBOn2YLV4QKHmbdYOIfKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f9bhVqtEfNE1Uc+W8KjE1BZU8CyzSFCqZ6Z119vOiZHX6Gv6+b7uluJeCfzeWTbuwQmXnfsF7/GB0NPSVgacRcQKejWelTjypL6HCQ/qS58f6yrl/ax56in1Qn4roVMrtM8vAQwHf90jFgP6OzTkXBO62tWhM9OFMO3EBZVI+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtUFAxBp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtUFAxBp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43626796202so512801f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771483937; x=1772088737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=FtUFAxBp8UuvlCHECwtpfYKhZz2zqyYtRn+OnjEPbRi3MMf5DN0VcOW9DzadBxHmY+
         hnS8c9f0V26CZMsJPCKhkpunl7ruxrNG/Y2B1VMYh8SCgjK4pQfXVbCywMgXS3zz6A81
         GmykAa1qruxyqBu6kXD211rezRlBLDcY8SPOA716nLswHLBEEERsJgKHNyqKe2tIb3Nv
         hAGbHeZyVSACNod5iFKDrMISBJ9j8s/yXR0jmXDIe9LHUbZROZe6+G0ZR0rYqa/momJQ
         g9U48+Pr887cPLedux8KZ4o1LQ3X6xuVZNoRr/3+7We/hldjD1x/G5kDyCF4T82Wpvbm
         mcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483937; x=1772088737;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=KU7L7+cLI+jR9sJBGsN3oa/BBonAq/T+gHn1qMg7oQiJAbCmv2qG6urKeNz9qGk/KT
         4OX90B9QZVBUuE+pLq8WFomo1smKDEkgdLXvHATr9/WOqntbw0KXG2GJH7F4VkRiYNvk
         0F/Hd8KUe11phM8nmkb9faC72P75GcbmDrb70kO4KEeU1fU7j7qn6zjj4IfQITYGjwI7
         vVRovk2vHe2DLfwXdcJGRjn7FIUI1tsV0CKKCqHwrK4BtuxlGzT77z7QoL0WRcGArd51
         QOoXS3haKSifOVCwsTyi56rynCAXo1NfXjCt9+uK+XCokDmeYnqvl7hG6x9ZLDQCQWIb
         vofw==
X-Forwarded-Encrypted: i=1; AJvYcCVsih398wgLlcmQCGiPT8RV7f//QQfMDJxFGZOXJ0oFzFMvbNJPIMMc7xxf+K5wUzDHdYcc8u0SDvkqvcYc@lists.linux.dev
X-Gm-Message-State: AOJu0YxDaQWhQM37zBBQSONnGCi3D2N34RPm6ST03BiBza3kHvk5nTRS
	3mG0agzSOYpXuiEPGJwBej6M2YaFA5W48Nhm10UED7flac5clerarS8bLIX01XuJmiI=
X-Gm-Gg: AZuq6aJi4D95BlJWcfpEw1B25tO0Z4dNS/oEoqeGYSFSQJUrPLl/hi7hupdcwln2xJE
	kpTqZMmPbQtSujpgT8L7rCDo1XDfNDoJIUecO3/NY+YhAZVAM7uoxujpiLxDmCxdsQ8si2+hA65
	9L0+J7UVlDU9sxQ6Aap8XS7Ku9Pc0thrOgz7b5poPVrFAsQa2yoRt6t9zebEZHeS2G0lb2ieoW2
	aX2vjd9g0glYvJxXNMV96YknSIqXud4miZd1iuW5rW2hHWwbu5wOenPgzvDiEjRIzn4ly2PygEy
	QBUI0MzSeawLdHmFQoA95xLKaXZk2MlDvRLCvdGOuJ9VLaGVEPYno4c5xJX2OIXRmzYaY7YPZWK
	fM78sojS04Bvx7xIC0Ex7tOwOjOOw1/2I5XAXgxJBBfojfiGC7z9MV9DH1xb86WLuohU02O03fY
	yM59aZiDw0rcP/q7Z9TpsDczaXp1f4KECf1ldxflc=
X-Received: by 2002:a05:6000:401f:b0:430:f5dc:d34a with SMTP id ffacd0b85a97d-43958e4a636mr7655865f8f.29.1771483937384;
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm45905510f8f.34.2026.02.18.22.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Date: Thu, 19 Feb 2026 09:52:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Harry Austen <hpausten@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Harry Austen <hpausten@protonmail.com>
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor
 support
Message-ID: <202602151704.qepyfVlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214180933.42143-3-hpausten@protonmail.com>

Hi Harry,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bindings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-021554
base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%40protonmail.com
patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() error: dereferencing freed memory 'dump' (line 1182)

vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_mon_work(struct work_struct *work)
68614f228e6cbe Harry Austen 2026-02-14  1177  {
68614f228e6cbe Harry Austen 2026-02-14  1178  	struct clk_wzrd *clk_wzrd = container_of(work, struct clk_wzrd, work.work);
68614f228e6cbe Harry Austen 2026-02-14  1179  	u32 *dump = vmalloc(WZRD_NUM_DUMP_REGS * sizeof(*dump));
68614f228e6cbe Harry Austen 2026-02-14  1180  
68614f228e6cbe Harry Austen 2026-02-14  1181  	ioread32_rep(clk_wzrd->base, dump, WZRD_NUM_DUMP_REGS);
68614f228e6cbe Harry Austen 2026-02-14 @1182  	dev_coredumpv(&clk_wzrd->pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
68614f228e6cbe Harry Austen 2026-02-14 @1183  	iowrite32(dump[WZRD_INTR_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
                                                          ^^^^
dev_coredumpv() can free dump.

68614f228e6cbe Harry Austen 2026-02-14  1184  }
68614f228e6cbe Harry Austen 2026-02-14  1185  
-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

