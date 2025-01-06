Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F158A932
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 09:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155997; cv=none; b=LyYJyGbrOlxRl6W2hHqz1xCnbwZKMiE0G3lQAAcoufisacvypgloVENrFu4KmQaadKlF9y+IwjB/OWzlFlixicAym9IhHxW3foYjNJZLQnQqKxeCv7qBWhVxjxTTGRFQ//d4gzAnSLh09gCYTVOBzyrnuuJuWUeyZT1I71l9XEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155997; c=relaxed/simple;
	bh=A1omJ8tCKkOxpb5+PC49pq7ZK4EGHFx3B570o5MYu/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Drj8Y7TR0bE7cmPQh3WbHunHtiNyyhJdTTXmdS0Y2vjQC/QKtTBA3HnkFjJH+mZ7XN3zr5rNA0GNWTfkePKjXUqyEKMD7igstclH0Fk6/6BzUTfo8ffS8taVXDbMmVTU1HABra2zw7DXLNbijO0i7qKo5ADXRiAPY8QRS7StHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=auW8JEgN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auW8JEgN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e87b25f0so9358560f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155994; x=1736760794; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgjTh6n7i/GhGSaSX9tpjcExQu8AFOjGo7TIfNZtkh0=;
        b=auW8JEgNz6eKsdGTLwiUTT3RGcd2caqQOSmfAiKtqu07scJ5SHGA5Yhu2N5ZLbk658
         7TexuPS4TwoOLOodlKuQ+UtmVa5+/yheRS2cmdRYQ10icWbgPY3Vi/27q2LEZN23ToSI
         tC38jEF0Jh1v28QUK+jBxwb/mH+fqpZlTb1fLZ7pDLSWQIC9N9q0facTEhJrgtLCWG9Q
         qXXQkaU9SBJnXx6lIocZN8JR0lCOqGJYj34jQbwJp4aoOgl9igJe0agWOEAPZQwAqxUP
         sy9fFDM6E1R6Qqg3iaqMtBqB+/h5H3M6tVs6KvDfuGxmft//Lhb3iJgXRavkVVfNH4R7
         6Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155994; x=1736760794;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgjTh6n7i/GhGSaSX9tpjcExQu8AFOjGo7TIfNZtkh0=;
        b=khq8qZdVOBinMgluyeXuBopsjJZZWTKpXDXLjboKCLL19BPdBYXEXmjmXsnc9oPgG1
         LOZZ7A5dVavfokJ9UnETw6883OCEx+yUJ3Y4iOxu9R4V82xe4IOXD0h42IUAnc4fNigf
         3Os0EBNWzWdW6KPaG+lOkp4uqaj8Ss80yMeCxmQvAI1GMs9vohLNSvtvL0ka+aVp6glH
         UJ4wImwSCzJ79QC+MsXtKgt2bHgEAHQY6/GzuKHwofhRCUy3pJd2jxcBRyP2nxo5Myaw
         zGP19+T0LN/32wlREU0CluszP7WOQ8TburM+vAVHKX4QjcVtSS1BFXHS5SVxnk9sNY9s
         USUw==
X-Forwarded-Encrypted: i=1; AJvYcCXUDPdd9j1jKVmWjsP4HuAl6Y6FySn+4mrtxAHHksxyJliktLtAq5JeUgZlTG1YZtwdKi+etsVL0qbjShj3@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8KHl0cRa2IWcX4z4T5pKM22J3dt6sgA0UnQrQghfnVehoJAwf
	BAcDLLLGItEnQly6i3phgg3PLc6jeUULHl2qICG6zHXFIfDNImSoEmOC+dXWdAI=
X-Gm-Gg: ASbGncvkzw4UqaoQ49FAaqVsiBxk9XRyuZh7Uy6zGDmNB9sqlFHxDaKAH6JIvc0xaeB
	iQDELN0PAo/Qu+eObYnuBfSYpFktr/5QW1lD3dVp9Q7pyAgl2FHVCINpGTnWks1caSGwD3d8lDl
	m7tVEtqJ9P/vHdLWFuEex58NGLWY64/9gW8YlJOFiSgMv3ESPOATLeqzH0YV6NLLcSFe/JpEZik
	x3j9IYONKNG3vBThNQY849Kn7e7+SMuPrASLURetyDg9gn+c/GXp6W/hZV0ZA==
X-Google-Smtp-Source: AGHT+IGdbo/ERQWwmE4K6655HARL+MUOU9s9dixQASXbcNxCLcDCFqZL9JW/lauVhwXTqFAInfu/VA==
X-Received: by 2002:a05:6000:1faa:b0:385:e986:416f with SMTP id ffacd0b85a97d-38a1a1fe0d2mr48796426f8f.10.1736155993775;
        Mon, 06 Jan 2025 01:33:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm46843810f8f.38.2025.01.06.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:33:13 -0800 (PST)
Date: Mon, 6 Jan 2025 12:33:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Wunderlich <frank-w@public-files.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 68/85] drivers/spi/spi.c:1510
 spi_do_calibration() warn: variable dereferenced before check
 'ctlr->cal_rule' (see line 1497)
Message-ID: <9444989e-33b6-4dcc-83e4-1f0cf5cb24b2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   71039e5e1e5f0b4e55c5f6279c659b58e05819c8
commit: 3f003bfdabf11d3f9fc47fecd2fe46b5447deea2 [68/85] drivers: spi: Add support for dynamic calibration
config: x86_64-randconfig-161-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222247.9wXWimMF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412222247.9wXWimMF-lkp@intel.com/

smatch warnings:
drivers/spi/spi.c:1510 spi_do_calibration() warn: variable dereferenced before check 'ctlr->cal_rule' (see line 1497)

vim +1510 drivers/spi/spi.c

3f003bfdabf11d SkyLake.Huang  2022-06-23  1494  int spi_do_calibration(struct spi_controller *ctlr, struct spi_device *spi,
3f003bfdabf11d SkyLake.Huang  2022-06-23  1495  	int (*cal_read)(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen), void *drv_priv)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1496  {
3f003bfdabf11d SkyLake.Huang  2022-06-23 @1497  	int datalen = ctlr->cal_rule->datalen;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1498  	int addrlen = ctlr->cal_rule->addrlen;
                                                                      ^^^^^^^^^^^^^^^^
Dereferences

3f003bfdabf11d SkyLake.Huang  2022-06-23  1499  	u8 *buf;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1500  	int ret;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1501  	int i;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1502  	struct list_head *cal_head, *listptr;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1503  	struct spi_cal_target *target;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1504  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1505  	/* Calculate calibration result */
3f003bfdabf11d SkyLake.Huang  2022-06-23  1506  	int hit_val, total_hit, origin;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1507  	bool hit;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1508  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1509  	/* Make sure we can start calibration */
3f003bfdabf11d SkyLake.Huang  2022-06-23 @1510  	if(!ctlr->cal_target || !ctlr->cal_rule || !ctlr->append_caldata)
                                                                                ^^^^^^^^^^^^^^^
NULL check is too late.

3f003bfdabf11d SkyLake.Huang  2022-06-23  1511  		return 0;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1512  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1513  	buf = kzalloc(datalen * sizeof(u8), GFP_KERNEL);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1514  	if(!buf)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1515  		return -ENOMEM;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

