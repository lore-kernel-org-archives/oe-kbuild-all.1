Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295633030F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788357; cv=none; b=jJ4ESO1KDycGm57Rg4oSsOqer5aIeZn42HAhRcB4ZzrBexf+nveoG+0NBPW6wKX9DbgC/Y39wu3COgroVNTsRFNUZ3sQ+j6eeX1ktpDqc2aaSOM2ux8UTa1RRIFRT8zW5F3o5UT7I2uNiJCfsumckkgGsaHuka3LUYGRuRDIB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788357; c=relaxed/simple;
	bh=E1eZej9qfqz1c8JHTxuxcHkpZnGTTjwdKQkyMHMVqkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxguFMVr7ExmKC6SSPvIXL+z8PQAucgvBsMEbmutO+8risjYiIp/YJdMM79BJe9vE1NbAOAAb9WU3moZKS5miIFy7lVx0ccuTPLh6DpO1nOdDdAfdvqhkQigGtcKd7cc7/c8xUwMmYD0TqvwQTlJOzHEF1kUmvvc+E1Jw9dkOl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uj6IpnOs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uj6IpnOs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-430f1cd0026so1063006f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765788354; x=1766393154; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1mPLZAI9ZWQopf1RG3516xfUaY7xCiWoA5Ln5IKDpY=;
        b=uj6IpnOs25YawruJ0QhqQEFS6l5AiXxBGxUG+p3/KeqJTGF/1Ujs/fIo7pe/81KX6P
         Seos0ijyxYtOf2TMJz/S48lRyr7X0LMI9G1DjD9XPS8d6Q/PMsrUvPauxLL2BQ9esmnD
         DZvIStRowbkQIlH7WNLBZOj+SmyiLnhMBLO6wTxrCHyKdu5Fv+3ARHFVF88KEBGd6UTv
         6m8VtO1Rf5lVDn6yJ5dwr0rM6ZGSDqxvWFfVghgRgsfIVwskCEco8rqdmPnHWwLIFc1V
         p/+1e+3rutzKlmU+mWVUY0O3URy5EtHbwMz7xMOValHNONsoplzIbs60AVbR0y6/WrO3
         84gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788354; x=1766393154;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1mPLZAI9ZWQopf1RG3516xfUaY7xCiWoA5Ln5IKDpY=;
        b=vDzhCuaF/tdc82puebFa3tmf5CNCoPdxIzqOi7VEbRumLJEo6uwcGMy9fi4QeL4n/M
         eT1RMCOHPqOoSCcVy6ulkUQHW+uokb4kktycdbrrUDrX/M/kP28z4VCbFOG6GGVo59mj
         9N7nOufHDWBBvn5DXPsa8IpgySPEUr5s4N1ZOtwwKHeRy5nzDhUGtOv5QT4ZgGggaCLp
         qd/sF7DaejjpXS9I+vtcHRMApCWXx9k6X9xpjFHiIXcwFkYFuufqGqmWlll53DPR2ml7
         FQirdHDv4q+WnHDuQWGL9VfJUCzeEhiV1M1zQTwBYviBYcdVmHMjFnlcwqOPrPMblKWi
         exqw==
X-Forwarded-Encrypted: i=1; AJvYcCUOJM/xlpSkphphZWravoJwHte3ARmbk4PnBvU/JldYAb0s5Ui3nEfJDK/ZptcEPtYAccj5ODv1oAm03uze@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ5rhZo7HxTOcUB6QbwrCjdQbhnW6GetKrxXHZ239xy/MnblSd
	d2gTuGIRZ0/fLPuA5WxTH9uE2/0F1Dij0jtctDMF3YQhV8qOVwl/NzKdLRAdWn08x+wmHpIp5iQ
	m5Pcl
X-Gm-Gg: AY/fxX6/2ZVHQBlIoQ9IoKLthTcj8o3aiHTU6yPB/ehCAvyHu4w8VIF8YpLXZsC4yxa
	jmpHZxkwbtiR7keQg2hWrBwbXM9AeOc7X6bh4+xHQolLbgFrzxaRmR4VaaW8JYT2MM4aqW/sIaI
	8kQ2FGNg8GHHEPkKgTJAc8ZXEUbPZjsKL/2bFnyfu9/7ravBUdQKTtdBWTENyTXVIYIc2SIf6fU
	rcP6kdd2BABA1M5DDU4A978VdUznIuHUi6zknUwk5EuPvoRStoOZHMVzs664qO0JNYceSAluZNi
	jf29eCSpskVB91KD9bdaANhULebA8DubLy7UV8YEAtNWYJsexP3gbCDbOwu8TM66U0gPIfjp1zY
	Icr+oi43Gtzb8YtFKD/xUz2qY11P6Kef5cFcN5NA20gMzHGiJF9aUPDvpQNJWdaifLiDj10d8o6
	jwm2DppUUD66NKe8Vh
X-Google-Smtp-Source: AGHT+IHccZQ15VqvR918P8rixRcRzxJagCgZkFP37uVhJfqdjnE256jvm3O18OAFSnHz9GqKkoCkhg==
X-Received: by 2002:a05:6000:438a:b0:430:fbfc:ec77 with SMTP id ffacd0b85a97d-430fbfcede7mr3825925f8f.12.1765788353876;
        Mon, 15 Dec 2025 00:45:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a09fbesm28054842f8f.0.2025.12.15.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:45:53 -0800 (PST)
Date: Mon, 15 Dec 2025 11:45:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: smatch@vger.kernel.org, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator
 'i' not incremented
Message-ID: <202512130914.rQu8NUGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The kbuild bot generates a ton of these "not incremeneted" false
positives because of something to do with xa_find().  But I can't
reproduce it.  I have:

1) deleted my cross function DB
2) git checkout 187d0801404f415f22c0b31531982c7ea97fa341
3) https://download.01.org/0day-ci/archive/20251213/202512130914.rQu8NUGq-lkp@intel.com/config
   I still had to do a make oldconfig which is surprising.
4) Used the released version of Smatch with no special arguments
5) Tested on x86_64 and i386 (I haven't seen these warnings on Arm out of the
   seven that I checked).

But I can't reproduce these warnings.

Do other people have a way to reproduce these warnings?

regards,
dan carpenter

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 dpll: Add basic Microchip ZL3073x support
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130914.rQu8NUGq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512130914.rQu8NUGq-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1267 dpll_pin_phase_adj_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1414 dpll_pin_find() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1617 dpll_device_find() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:163 dpll_xa_ref_dpll_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:215 dpll_xa_ref_dpll_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:568 dpll_pin_get() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:670 dpll_pin_ref_sync_pair_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:764 dpll_pin_on_pin_register() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:62 dpll_pin_available() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:894 dpll_pin_freq_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1046 dpll_pin_ref_sync_state_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1109 dpll_pin_on_pin_state_set() warn: iterator 'i' not incremented

vim +/i +235 drivers/dpll/dpll_core.c

9431063ad323ac Vadim Fedorenko 2023-09-13  232  struct dpll_pin_ref *dpll_xa_ref_dpll_first(struct xarray *xa_refs)
9431063ad323ac Vadim Fedorenko 2023-09-13  233  {
9431063ad323ac Vadim Fedorenko 2023-09-13  234  	struct dpll_pin_ref *ref;
9431063ad323ac Vadim Fedorenko 2023-09-13 @235  	unsigned long i = 0;
9431063ad323ac Vadim Fedorenko 2023-09-13  236  
9431063ad323ac Vadim Fedorenko 2023-09-13  237  	ref = xa_find(xa_refs, &i, ULONG_MAX, XA_PRESENT);
9431063ad323ac Vadim Fedorenko 2023-09-13  238  	WARN_ON(!ref);
9431063ad323ac Vadim Fedorenko 2023-09-13  239  	return ref;
9431063ad323ac Vadim Fedorenko 2023-09-13  240  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

