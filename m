Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA338947D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095629; cv=none; b=IeNmqDQa9TjGrqY92aWvF5iuOpV4IzSAZmLaDEo78B2PVsoD9c5DeePRxbcH4n5UPI746iMLm8n711ChtwbjU3z4IYXSumxpyV+6KyasN8kTecg6Rs+6jC5DPJ+B4HDGcbDka9MzZz2K5vt4EV+LoPVNbEzdIjxrUvYvtkwi9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095629; c=relaxed/simple;
	bh=5BUoIn++d40d/VMhmIOatTyxHL8Dj3CAb0SkPHlDZDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PySmHIVo4mqDpE/5UPPjqxwafmpTyqrhbCqkp/u3oPMFc73h1vPapDzGvKADXkP2a+F6QT/FoeB1GXTWOc7u4+ARcMlh1vwM55fOgrzL8E9rs4h9d7VVqxCBCCJm7Oabg9ESSEol/CCsRZAq7korSKurS4KyPbM87Qgt/5poz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaCQ5MbT; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaCQ5MbT"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8845cb5862so69647466b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 07:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769095626; x=1769700426; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQoMHifdLhoU8TXrVd7FsHxslofIXsWh2uVp2bESq5I=;
        b=CaCQ5MbT+Z6F1A8yzwpilzrNT1gGC3TZNqO61JdVlRcpJUJ0jwGEsXn4U5PgXkOlWa
         0OKIFas+vhRfBvNegHIl5UQFSc7fC/yoJzyE/xXfCDmt6OfY+3v2DwHFI+HKvOsw7+6w
         cqUEpVJxiBomEAEvmX9fM9ETl85JXlTjNFz4fJmyKzSK+YAsqa0cExrWIKW+SBQlhUlD
         5He3TkdXHxQWoVqCYIYuhZ+xlNtMGFjyehfdq5BKKNmrBl3xOPKMQSki3F3xdmDw2QCI
         IP4DX/wkNVUwHFILoJeg7SRG6eRJZFZpDwkJM2CZCw21Te0X5zwne6bbBwRYXSWEWdG+
         IgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095626; x=1769700426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQoMHifdLhoU8TXrVd7FsHxslofIXsWh2uVp2bESq5I=;
        b=KR63X/SWByRKdZF6ei34VAvPas8UZ01+eoRpqRYYt2DU4k4Vn4sljLp1K/ugfV0pge
         UXbWU5c9kYW6pfmt7kR8WRdNC7RtMujxldYbWJUFqedw4OM4RCdkxN6ZVld7el7CxCb8
         BXS1ztNazXj8wumF7Q/0w0Iuug8SiRHvcnQkN8anhazj9ayp89LYRLUTFyUP0Z5+u2KA
         QIIJ71QT5x3kVGuhitqo9IW7/+iX/tY4mBdBBifhzfgCbzTvRNRaujAYZPZf4XGpPasi
         APy9WM8Hbq/ALZt2LLLMwRaY8BGFIKAe9Ng+TnGR6m8m+6MstcoAx+aYhO0MyOkk48lU
         gPcg==
X-Forwarded-Encrypted: i=1; AJvYcCXeASz30yu2lBuOsqN0ZYQRAHUlxhktLFPnfi/AgPHcw55uO9/98PzcHYsu0LH9nl6Falm8xIcKJtW46Ex6@lists.linux.dev
X-Gm-Message-State: AOJu0YwSNcJg+iXW1Tph5sXRZABslnB6Oy8rQoX8n+pMLFqVodpAFLx/
	xPyNN+it4hjuC0dRvOykiNsE0Y/Ic0YumIaGhWnER0SCXbk1LQtF1GKi1utOJiB+raA=
X-Gm-Gg: AZuq6aI6jzdKVVV9ZNJVh/y/MGKG3ejyrgcaVJ3ot8aeWtBg3D7h/O4AtOzb6uM4ry5
	LwiAhLFviXjF4d1ctzKETfazfFieMTAG0sqkYlqrGGswaCA6eJY9xgpS3waVPard12mLP87zlqv
	m6s+5vj0iWFKjcMiJsbJirGQF5rHt6N+GXqDsEWuCOE3aotfO/5Tv9ylcIQTW7ofsBQKXeG7P8L
	hP4fDnQz1R7hjQamUfZoAbVeYI7hiXwQnQPi//0k1XBKQEEM3exPIW59DITuv7eQ5wyFQ6mpSwO
	T6Q/gH20Dhq+ck1OIO1N3nM9AlSAglCFnYhc3ubUhS78O11zPq7+oxVGw6bdyRfQrTmTcyxIBaV
	ryCB0u3gcKv3StQS4xew4WJg3nOFIpC1ESrXaMQbThNANw5v9n1Yd8u9BWuywby1gTJRfzmyAfM
	fcgVpAEs2wIoyfXR32
X-Received: by 2002:a17:907:e158:b0:b88:31f9:1d9a with SMTP id a640c23a62f3a-b8831f91de8mr187964066b.62.1769095626127;
        Thu, 22 Jan 2026 07:27:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8825616964sm193054366b.46.2026.01.22.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:27:05 -0800 (PST)
Date: Thu, 22 Jan 2026 18:27:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 45/75] lib/dynamic_debug.c:1844
 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)
Message-ID: <202601222139.VGTZ3L94-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   354f9423ffa1fb2a31f8410ddeea96a7a8471ec1
commit: 37e1c3e5c714f09a36daac2b5c3c55b3b7f9fae4 [45/75] dyndbg: cache the dynamic prefixes per callsite.
config: arc-randconfig-r072-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222139.VGTZ3L94-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601222139.VGTZ3L94-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:1844 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)

vim +/prefix +1844 lib/dynamic_debug.c

37e1c3e5c714f0 Jim Cromie 2023-10-02  1833  static void ddebug_drop_cached_prefix(const struct _ddebug *dp)
37e1c3e5c714f0 Jim Cromie 2023-10-02  1834  {
37e1c3e5c714f0 Jim Cromie 2023-10-02  1835  	char *prefix;
37e1c3e5c714f0 Jim Cromie 2023-10-02  1836  	unsigned long key = ddebug_prefix_key(dp);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1837  	unsigned long lock_flags;
37e1c3e5c714f0 Jim Cromie 2023-10-02  1838  
37e1c3e5c714f0 Jim Cromie 2023-10-02  1839  	spin_lock_irqsave(&pr_prefixes_lock, lock_flags);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1840  	prefix = mtree_erase(&pr_prefixes, key);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1841  	spin_unlock_irqrestore(&pr_prefixes_lock, lock_flags);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1842  	if (prefix) {
37e1c3e5c714f0 Jim Cromie 2023-10-02 @1843  		kfree(prefix);
37e1c3e5c714f0 Jim Cromie 2023-10-02 @1844  		v3pr_info("drop cached prefix: %s\n", prefix);

print the string first, then free it.

37e1c3e5c714f0 Jim Cromie 2023-10-02  1845  	}
37e1c3e5c714f0 Jim Cromie 2023-10-02  1846  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

