Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8C313278
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754774; cv=none; b=T1jbZmiJOZkLzcU/0hdqxDuvv9gANOulXZvlwY6MPUWH14rvXI6HkqO+iHNld1Vb5T21bYpFL+YIi8mUft/0LKDicf6njru+/UzkKw/KRa+Pt0xnKH0i3EHitBVPB48jGyNY+a7vqYBd1GF8+YEgmqItX7neTh+8gYnO9UFFG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754774; c=relaxed/simple;
	bh=Zzyrkv+jDg1lPu6LLx7PPcO2dvReUtPC3A4PLs347n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2k5iWdmW2q/+EwAli3f9EqVZwUBVd1iL27ogC7jtgyA3QUktYEMbU+jhslsbRx589liYJk1fbuI+433j+Q+FFnb6ywQoFm46R/eite7nif2msLHsUjAYcxnadcDgvsrxeWClGk4/HdzxKFpTOUfROI5nP8ZPhsbApiHYBhlsWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M++qQwDx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M++qQwDx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso70134035e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 05:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766754771; x=1767359571; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7jnzss7SrgncsYKHhnBFIr8PlxYdzd1neAXYIb5ojw=;
        b=M++qQwDxPrWpXwAvhoYcoQ7I5ghNn8hpbbH2NC185pEFjp3znypQfJkcTcAdvWr5Qy
         gaR3Cpp0XuqmnCbEwhYAB7+CkBExmy6wF40Ik0prWN0eSDKwgXlvvRVkAOS55ivKU39T
         RZvbi+hC6sr9Gv8NEM8ZVTRCdicRqg1CPR0K3TAvPf8oRW8DQ9/6tOA71oIyvF8b9QRg
         0LzJSii5aXI8IlVMWIYgY54K6mxUNTSSqAsgfiE+F3zsLz6XCXaIferhBoOvAkBAiaww
         C5spZs81O8L5fgaqXs8oFzeDQMON2P1DyFnu/i4KIcVnWJv2Byfi+9zq1gKtMmwB2Dig
         bvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766754771; x=1767359571;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7jnzss7SrgncsYKHhnBFIr8PlxYdzd1neAXYIb5ojw=;
        b=rGprW69gWGrDE999pfyRzCYgcGnb2Eo6fPXwIcHBgMp736xcNfLHFxWFWmqYYRBrxe
         CjiPFXoUAyfvP3nOEX7YiqYZ1qRAgr7Jx4r98HCHSGk/F0Kw/BmzEgriiCesaU3EUfRA
         IsFsC+AuRVVjtWC2OykT6UGeEZVElsIpLwLrwG/8VwXRWmGzhcV/6h0DuQj6oSouR8Fp
         Ho5a0fb8DlINjU4kT1tT4fR3eJfS/PiLX8VZfuWZB+Nogy5Emc4gieMucBSM7A3YSPoh
         7G+aPaRwVbt/NKkDLHTc+6v9+jagEh1NXm+0ACwpMUoUJTxAn8Niu++AcvyRHzo2GQAM
         saoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMdA7qQ25tZPrXxzRZ2M4zEN0YkysRUFI1eqz0FriPDj/Q76yYPa0vNJ9zB/D+ReNaswYxhsUCv7Mxap7l@lists.linux.dev
X-Gm-Message-State: AOJu0YzC/sZh+/QZdZ1SOOlIXkf1WtBYlaAKZwvaRAL9fPDOS9Vinei5
	eY0uCshKjSUF2kOvP3EYV5+/9sVK8Lwudmpw7rPCJAa75sio01wZXA82WW6EwdzCZlY=
X-Gm-Gg: AY/fxX7g5hUgKKv6soCmW1clukvPHq7k4Jd8/b+OmPu2xhJ/S9q5aPaQdew60velKcG
	3oqF5EaLG5FTHQZoSHCRr41kKqnLbVIYf6jttshtZvG1lR4jrXR7bnvLEvZD22TasnnF2lSvVmK
	/JyZnLJsRCB1rydfEjyuhsxWnHE9cSZJCAt8Vbnfr+Bmg6Maui9BbllDwnJtUhDj//zzGnwPBgx
	E2hNHYVyS8VzRQIqItxtkiuMB87gDzoErhRF2bJhUDBMXt2pIAsD56eeJcYmKC4rbNt0ubrFe4z
	SxoN8lti91NuoNCWX5AJKyDWNsn5X46uL2ROc6BoIUPUnsBZAezPrDAhv498gLDGcFvFHIB+p1k
	txNjZVwe0m3hKyRoEpxON00qkuuvWzyPm7Fcyg0gs36DiQi9bOIs+6Vf1fBNVbAdIhKAkdgWhTK
	wVk5IkbOt4FKp7Clzk
X-Google-Smtp-Source: AGHT+IGKzcbgQ+tXH1pXY7Tmn2bUwHhALa3rlAg9XLT80pEqkBwfhsO4hiRp/bMzr/tOXSWghlfGDA==
X-Received: by 2002:a05:600c:3b1f:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-47d36c75e0cmr122805055e9.35.1766754770832;
        Fri, 26 Dec 2025 05:12:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm423216845e9.9.2025.12.26.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:12:50 -0800 (PST)
Date: Fri, 26 Dec 2025 16:12:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [rafael-pm:bleeding-edge 69/72] drivers/acpi/bus.c:339
 acpi_osc_handshake() warn: variable dereferenced before check 'cap' (see
 line 332)
Message-ID: <202512242052.W4GhDauV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   e08ef982088f28cd65654693f29ffe430a9d4d66
commit: e5322888e6bf4ec17964a93638c9b14433a2f6f1 [69/72] ACPI: bus: Rework the handling of \_SB._OSC platform features
config: x86_64-randconfig-161-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242052.W4GhDauV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512242052.W4GhDauV-lkp@intel.com/

New smatch warnings:
drivers/acpi/bus.c:339 acpi_osc_handshake() warn: variable dereferenced before check 'cap' (see line 332)
drivers/acpi/bus.c:339 acpi_osc_handshake() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/acpi/bus.c:297 acpi_run_osc() warn: sizeof(NUMBER)?

vim +/cap +339 drivers/acpi/bus.c

e5322888e6bf4e Rafael J. Wysocki 2025-12-22  328  static int acpi_osc_handshake(acpi_handle handle, const char *uuid_str,
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  329  			      int rev, struct acpi_buffer *cap)
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  330  {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  331  	union acpi_object in_params[4], *out_obj;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22 @332  	size_t bufsize = cap->length / sizeof(u32);
                                                                         ^^^^^^^^^^^
The cap pointer is dereferenced here.

e5322888e6bf4e Rafael J. Wysocki 2025-12-22  333  	struct acpi_object_list input;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  334  	struct acpi_buffer output;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  335  	u32 *capbuf, *retbuf, test;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  336  	guid_t guid;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  337  	int ret, i;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  338  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22 @339  	if (!cap || cap->length < 2 * sizeof(32) || guid_parse(uuid_str, &guid))
                                                            ^^^^
Checked too late.
                                                                                      ^^^^^^^^^^
Also this sizeof(32) should be sizeof(u32) although both are the same
so the current code works.

e5322888e6bf4e Rafael J. Wysocki 2025-12-22  340  		return -EINVAL;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  341  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  342  	/* First evaluate _OSC with OSC_QUERY_ENABLE set. */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  343  	capbuf = cap->pointer;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

