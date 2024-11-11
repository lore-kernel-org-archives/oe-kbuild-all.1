Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E1143C72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318238; cv=none; b=n0mPaCPFqDaMzSlppOQsYqPKQAk2NdROy9dPJcUr5cDFb7VAnoKyFmm/EucMyVU8Dkj410viPPgDTiqDM4dkcNJw/WxrdBJVeclsvS10JMBRmdfR2oLM6pcZBxh7VLdAKOU3ZNR5OptdRn1OXLvq2GEbuGVe25lPahwujtnHGuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318238; c=relaxed/simple;
	bh=LG2oRZ80i01qs7NGC4LV+2RagFX7Y68AMcAgdb+Ah4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrGhC0S03hm8Qi1EkNSi8bVp0Fji1w57nZQThJKre9eCMYPbRif3etlKJy+LJt1hbMTUkSSKhbaJeRme2nDH9pWSs1fZWvxtkz/WOLiCemgQF5SJWSur4Cm/BWku+CF1AbNYysxbBD50Mg13inEjsBjmRN4J12Ni/rlzg6WTQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poOtKBqe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poOtKBqe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99ebb390a5so989327266b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 01:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731318235; x=1731923035; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zN5u/k/hQf/EODB0Rgy/g9MqUY8TUESZQQ3pm+8evkw=;
        b=poOtKBqe14o/tKe7iT5wvY/VPSzrm22NLkQozuEmiKTpSDWr6m1YZInSU7Wn5U/Phf
         VpusBSlbnenSUVZirROsQaY4csAuFI8F8HvC//UebEPZs0BqnmlVwAEVO2rutXb4mGNj
         43iKg0ZjsVtEruEJVWHtzFJRvrJJ6Ow6qCikd8QvN2kPQJmzPpp2SXVClfMxfhwlCvLt
         V+SZmclo+Wg7VHrsQ8o+I3YEZxJVgHCE+CvquOIsMM/pYuHZP+NvOwM1LGJ5OIfq6/yp
         sozwgGV+z8PF0sWSZ//FXxOvLqOxhAv0vwmdAGY+S9t4++CERuXqrXR49GBwPkfrRvSp
         hrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318235; x=1731923035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN5u/k/hQf/EODB0Rgy/g9MqUY8TUESZQQ3pm+8evkw=;
        b=lwtdLfN3eOOFsID/Ag/VwFxF4sB+txRmT7HRSLBTcnYq1txPVMszth02p5zDgVRTTO
         A30XzxFQH2W1ATQXNR89cNl7VYOzov5HGvAikldFMqTx/xSSflYILNUo+1eaDHbiRKlN
         9iJyYUSqIaJ727om8vP4PDaiJmKzqf/JzjUGr33oH69Ztjk6WiJ+XAOud5kvmEkoud6P
         NtWTniojzdAVKPtPermwC31UBGrrM+ZT5YwnFz0+bfblQMW28rLxwiO0452dQh1ba3LG
         ncWWA8uTioO8RxZ7pEgnLTH7GWqgJUEzhqxCuMsYuFBXuxdGignjDSPGTOABoT3IH34S
         b2oA==
X-Forwarded-Encrypted: i=1; AJvYcCWbBVIzHYIW+2AAR2gv6lYkj/t6sTe03bu/CV+utwBTEw1AMJn6M79ndeMkf7EoxCvjV4AYHkWxi7dTZA4N@lists.linux.dev
X-Gm-Message-State: AOJu0YwMDkJzzaxXPQ+nWn8Im1jMYUlf18/OWka/LgyHG9BoNVOaXpfi
	VDj3qahO4qvbhhkqJFVIsMYZFhWDKKkfrr2n7L48nIanf10gYdHGuPrs0ACWRLA=
X-Google-Smtp-Source: AGHT+IGFaIPnZqqDAJMhMwyxIn6+GOqns9j3XX//DVN0QDrgJeJvrt3tgEqi2wiJm4jBk9jWGeE3Ug==
X-Received: by 2002:a17:907:2da5:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-a9eeff97fe5mr1165490066b.25.1731318235345;
        Mon, 11 Nov 2024 01:43:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defbdcsm573018066b.159.2024.11.11.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:43:54 -0800 (PST)
Date: Mon, 11 Nov 2024 12:43:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/soc/apple/mailbox.c:292 apple_mbox_get() warn: passing zero
 to 'ERR_PTR'
Message-ID: <8291bb96-afb7-4703-8a72-ba764534efc9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906bd684e4b1e517dd424a354744c5b0aebef8af
commit: c84292d9d253706267889cf2614400712f15d689 soc: apple: mailbox: Rename config symbol to APPLE_MAILBOX
config: sparc-randconfig-r072-20241107 (https://download.01.org/0day-ci/archive/20241108/202411081103.7IiOcvUp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411081103.7IiOcvUp-lkp@intel.com/

smatch warnings:
drivers/soc/apple/mailbox.c:292 apple_mbox_get() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +292 drivers/soc/apple/mailbox.c

6e1457fcad3ff6 Hector Martin 2023-03-14  282  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
6e1457fcad3ff6 Hector Martin 2023-03-14  283  {
6e1457fcad3ff6 Hector Martin 2023-03-14  284  	struct of_phandle_args args;
6e1457fcad3ff6 Hector Martin 2023-03-14  285  	struct platform_device *pdev;
6e1457fcad3ff6 Hector Martin 2023-03-14  286  	struct apple_mbox *mbox;
6e1457fcad3ff6 Hector Martin 2023-03-14  287  	int ret;
6e1457fcad3ff6 Hector Martin 2023-03-14  288  
6e1457fcad3ff6 Hector Martin 2023-03-14  289  	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
6e1457fcad3ff6 Hector Martin 2023-03-14  290  					 index, &args);
6e1457fcad3ff6 Hector Martin 2023-03-14  291  	if (ret || !args.np)
6e1457fcad3ff6 Hector Martin 2023-03-14 @292  		return ERR_PTR(ret);

This should be something like: return ERR_PTR(ret ?: -EINVAL);

6e1457fcad3ff6 Hector Martin 2023-03-14  293  
6e1457fcad3ff6 Hector Martin 2023-03-14  294  	pdev = of_find_device_by_node(args.np);
6e1457fcad3ff6 Hector Martin 2023-03-14  295  	of_node_put(args.np);
6e1457fcad3ff6 Hector Martin 2023-03-14  296  
6e1457fcad3ff6 Hector Martin 2023-03-14  297  	if (!pdev)
6e1457fcad3ff6 Hector Martin 2023-03-14  298  		return ERR_PTR(EPROBE_DEFER);
6e1457fcad3ff6 Hector Martin 2023-03-14  299  
6e1457fcad3ff6 Hector Martin 2023-03-14  300  	mbox = platform_get_drvdata(pdev);
6e1457fcad3ff6 Hector Martin 2023-03-14  301  	if (!mbox)
6e1457fcad3ff6 Hector Martin 2023-03-14  302  		return ERR_PTR(EPROBE_DEFER);
6e1457fcad3ff6 Hector Martin 2023-03-14  303  
6e1457fcad3ff6 Hector Martin 2023-03-14  304  	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
6e1457fcad3ff6 Hector Martin 2023-03-14  305  		return ERR_PTR(ENODEV);
6e1457fcad3ff6 Hector Martin 2023-03-14  306  
6e1457fcad3ff6 Hector Martin 2023-03-14  307  	return mbox;
6e1457fcad3ff6 Hector Martin 2023-03-14  308  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

