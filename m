Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09118D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989989; cv=none; b=LSyLo18lV70GqH3+A58GSFguxi/dRAy3bqlUY+NPMia6xNkZXA7RI657pXvV3CVQMccc7KB2RnOM20YaU6agun1Dka1fV2mEUt9lFoCRBfQFrlh0uPHcDo3rdhNdtvKLueO+sjH+i28lYGdv1e5niHi5tzXp3R/eBOq5KmzQGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989989; c=relaxed/simple;
	bh=ijDpkVd9bIudM+80lAMzls0AJOXrudy0VseWNBzEp7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WKaXSP7m6QZ39owWYdp2MM0LXIp1qq1csoZvmfCjtp4DXeXdAbVYI2+rkxeKQthsCJQl9DTUKpSZgEzYoLvBvfnsGV2OLfn/ESraDRJXqolW0Rf1qt6Ipbycf9keTDQNvJ7twSQSGQopuOyZpoVZvIAyx3YzpenHde8GsTKAIxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygS2WRGL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygS2WRGL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so98543175e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989986; x=1748594786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9P7Rk/7XrTl/pDcnuGIJWrvqaFCK/IVU3Vt6Py9KfY=;
        b=ygS2WRGLZGM1YN4WDaOZzLd9qIOKLxN6b0nwdgz5uqA+K00SJNg7OMoTmo1TV+DI0h
         pD7l+vYCeyhYETE5ceLISYg/pnK7TCR3heAuGhKZOoR8KbamycTRgH5+kFak9wrGkcCq
         7W+SulS9XVYSCZF7ZRj/HnDrjeVj/bhOK7dCuPqS+1osDvB/ISNnrke/62XgmY++sKaV
         9KI/FF/R3KaRsV+fXQ6mAjqD6IaDDco1YsmOSogCsXBZg+4A5WByt1YcJn9+Pd/Tr+15
         nRVsZJYAgepAHyN4z/AnUxcA1D6NjMvZEoG1lzLrEDoYpE3VwLQwUWmppay5i79MFwzE
         ZBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989986; x=1748594786;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9P7Rk/7XrTl/pDcnuGIJWrvqaFCK/IVU3Vt6Py9KfY=;
        b=panwnN3DBvVPDJ0EixuNfH2fFzII7mjfCy9TPzNHog70rRC+5V1cw8cwoT9gC+o68O
         zBADu7u6Gqdu5sOVkyEEptSP2r/2ZDb1leu5vumDJjPkurR288b5i+pJcsyNO+FRGJnQ
         +OznLxDeZFfxcq9UDvtEI+kLohNzL7Yyd1G5Ts6N61Mljf/tYbhvosV2RuAr0Yb8J3Oz
         jJheHzLCxCFxUih+NjhYAOwPgTzeQDvAaD8NF7TQBMXXgGD4MlDG/FA2IW7irR/NUL3t
         Q8JBup03uAeBmvPrU7D+UDDBTQWyHLbitFqL8RIcCN2DPj/pvtMPSSeJyg6CLgfrLLzT
         GJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCbPYFN0gJ1pGIK+WkhYbfDICWlNpSum5ugVf1M3suPtatFPgXVSQAnSqJWegcrslPdsWBcoxArRG6UpNL@lists.linux.dev
X-Gm-Message-State: AOJu0YzgF8xP5nWFAwFxJnjsaBwlRb/3ds3Uv22so8NuYi0vvKQ2EBBw
	FLIw/AnT0SRUln6dD8sRgLF2iP48ySNUHrzSy1K5rkuXDNT6AGnQ9KYU23IJDozWsww=
X-Gm-Gg: ASbGncuLQYpwJKDq9OTvH2lTgetvye1hILgjYnBVEB4RrNoolzGHec1hRs36ue3b3Wd
	zcOk2rH3/QQLHBXjlX5NhfTNCWHGEbUB3my6UA8CrbB0sGxmtDleQ9awliEQ5gXY3QBNlkGjULj
	rAoz2votZHOGjBZOqqb+eoQMxqTYVsyebjbNEma7ezFIGS+qnx9i4nB6Oz3Xa32l3ON9+qrf/ak
	PJu/x+0r6unzQd5Ia8Sw+IZjhNG/Mx7xliqBDTxHoPU4mJXQcu6GoQnmr6hbRVa/ovoBWEiSJV/
	WJkbdCsHSDv+y3L3x+g9QEOkAbCfEtaPrReFPSK8V+RXGxpmA0rx61Gy
X-Google-Smtp-Source: AGHT+IHEFaNidkq//G3ga+4pKK+ukGJTHJ6vlDpZIaMqQUQ94hnKE3vGPQwUUoj4CTDfpbQOR/PKlg==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr312276505e9.15.1747989985840;
        Fri, 23 May 2025 01:46:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f6b295e7sm131290155e9.2.2025.05.23.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:46:25 -0700 (PDT)
Date: Fri, 23 May 2025 11:46:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 18/36] mmc: omap_hsmmc: Use devm_mmc_alloc_host()
 helper
Message-ID: <202505230421.P12fqPfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mmc-alcor-Use-devm_mmc_alloc_host-helper/20250522-150218
base:   61bd8e76021e779f7ba3c761919b533fb3f6f584
patch link:    https://lore.kernel.org/r/21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 18/36] mmc: omap_hsmmc: Use devm_mmc_alloc_host() helper
config: arc-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230421.P12fqPfB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505230421.P12fqPfB-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/omap_hsmmc.c:1842 omap_hsmmc_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1842 drivers/mmc/host/omap_hsmmc.c

4dffd7a251172d Adrian Hunter          2009-09-22  1837  	spin_lock_init(&host->irq_lock);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1838  
9618195e5a152d Balaji T K             2014-05-09  1839  	host->fclk = devm_clk_get(&pdev->dev, "fck");
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1840  	if (IS_ERR(host->fclk)) {
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1841  		host->fclk = NULL;
                                                                        ^^^^^^^^^^^^^^^^^
need to preserve "ret = PTR_ERR(host->fclk);" before setting this to
NULL.

229ab512b90f8f Binbin Zhou            2025-05-22 @1842  		return PTR_ERR(host->fclk);
                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^

a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1843  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1844  
9b68256cdef752 Paul Walmsley          2011-10-06  1845  	if (host->pdata->controller_flags & OMAP_HSMMC_BROKEN_MULTIBLOCK_READ) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

