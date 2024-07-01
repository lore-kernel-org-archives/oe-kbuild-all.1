Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BDE16D327
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jul 2024 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848618; cv=none; b=BrQoTcn707GvM6MIyzKI98Z1pEHoi5g1kSFWUW2J6UHJnHlsUEA5t7vpq7Lm/yy266yc7ppfJ0fs8zoW4zO/JyyTxLQworDry0IrLQyvgT1Nfc2zgZun+umldfjbrgE6kyNnaJGZ6E4zaiTc4OBgV5KqTSvuMc6cuuSu2Y+5rkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848618; c=relaxed/simple;
	bh=zDEkERNJE/MSnzMdn8TBJ7WRg9m6LCkM9RUeIIHLeFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Dqo1S9sEnmOnaTZdpmNklO+4AbgsZ1ydECLqmdC/DZjM3KwbVNCafH/1qA5SnE4RqWfYoGJ2t4MbBG4ng4aUzBqBGXDGGhDZ5qlDP9VZvDtQj10oWqIBpwUXHCPV0sZUOMqWdSiJ2k1xk7IvwJAVCw3D+wxRMiBAO4LLMi//5J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRUxMNa7; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRUxMNa7"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c410776a80so1677745eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Jul 2024 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719848616; x=1720453416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9jzIOafebewEo1ZZHJ4C0Fr72HpACHosWsaCca63y70=;
        b=CRUxMNa7VbMu+hNjoffFboY8A5JIACh76Og04ADNW92u8fbh0/PZ4TAfW+I2OjVoCJ
         t3GEFWo9Q0zrH9ErObJ1MVdMmZha+GLSrWgRit4Aw11uP/hyxsgN0I8/liBGINqOwcpm
         Xidyxd9s6PfimCTKT5Z7nwM4qicxPMHiq6ntwOq3GZB2XxbXxMPe+e/2GIcyZdBndkK5
         VEGW191T+THzLrMheZpASH/kagZyn2tZF8hDrqlsUNXm4AGsq1FBFZH9EZcshbnQBC00
         x1cS84faroKO+AW50nmmwTPwih1BfGvXjl8yWOc+pVV4qnD66oOk08t79UV7swOdxrKF
         nLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848616; x=1720453416;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jzIOafebewEo1ZZHJ4C0Fr72HpACHosWsaCca63y70=;
        b=flrqHAWZ9TdjSQG7JqN2SjtWcG3g3lmmr9HlxQ+cAfxA+YFNiQBrihHQERMcFS6hqW
         YqCOYe+qhuXBeVrxwnm20leAMQjOB6VzTq1qJXZyWa1JHnSaFNzWGQmWZFjzJT7I4dAW
         c+OyikcB8rRQ1uSrG98ck1GQt5tP+d9J7kclUh10uUOKL8m+F5O3R+hQCv37PziFvV5k
         gDWBqTUq5JOP1zDO61zio+RPYINVxDtL2WfWwbKRy+GUJlxwvUNKTgvV8k8Obhiqcvwv
         YRV0+lPruL6QnrJNsT1/+UZ/GL85yrYvRe9lpMGrrJ7VVCDMwTn6Grr2NiBlPkRF93XU
         NBPA==
X-Forwarded-Encrypted: i=1; AJvYcCX00P90oMiJD9fUXWkf5PjazsfREa+gIo2z6w+BSGxZwiijvPINddtON1X6C4Cb0gZPOllOy9OHQ0gBMOtoOwhOw6MNJ/IVCvOPso6WCg==
X-Gm-Message-State: AOJu0YxCTFmonbAwPWNy+BY8xZAaFDyfD2IrL4wE/wbjHiHqAgFsyDKG
	M6mhMGCpf/OWve1MARdLwkg+r2AlIkg1CoTuhlP5/5UcoOSvHY+yl+u+oXtYZEo=
X-Google-Smtp-Source: AGHT+IHDxWKHqbKggeW5m/UHELJJsSAkUbSHIz5mdvPHuItb+51Qna7y7RwAeJL+Khg+Wsc2oO72Kw==
X-Received: by 2002:a4a:5842:0:b0:5c4:2eef:d39 with SMTP id 006d021491bc7-5c439257c35mr5388343eaf.8.1719848616260;
        Mon, 01 Jul 2024 08:43:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c41480bfa1sm1016306eaf.4.2024.07.01.08.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:43:35 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:43:34 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pavitrakumar M <pavitrakumarm@vayavyalabs.com>,
	herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Ruud.Derwig@synopsys.com,
	manjunath.hadli@vayavyalabs.com, bhoomikak@vayavyalabs.com,
	Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
Subject: Re: [PATCH v5 7/7] Enable Driver compilation in crypto Kconfig and
 Makefile
Message-ID: <dcca1eff-48eb-411d-aef8-e206e241f3e1@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621082053.638952-8-pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-Skcipher-support/20240625-184208
base:   1dcf865d3bf5bff45e93cb2410911b3428dacb78
patch link:    https://lore.kernel.org/r/20240621082053.638952-8-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v5 7/7] Enable Driver compilation in crypto Kconfig and Makefile
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260926.bfyJ84yf-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406260926.bfyJ84yf-lkp@intel.com/

New smatch warnings:
drivers/crypto/dwc-spacc/spacc_core.c:1029 fixup_sg() error: we previously assumed 'sg' could be null (see line 1008)

Old smatch warnings:
drivers/crypto/dwc-spacc/spacc_core.c:1417 spacc_isenabled() error: buffer overflow 'spacc->config.modes' 81 <= 81
drivers/crypto/dwc-spacc/spacc_core.c:1422 spacc_isenabled() error: buffer overflow 'spacc->config.modes' 81 <= 81
drivers/crypto/dwc-spacc/spacc_core.c:2018 spacc_open() warn: inconsistent indenting

vim +/sg +1029 drivers/crypto/dwc-spacc/spacc_core.c

8e3d92f71646e6 Pavitrakumar M 2024-06-21  1003  static int fixup_sg(struct scatterlist *sg, int nbytes)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1004  {
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1005  	int sg_nents = 0;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1006  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1007  	while (nbytes > 0) {
8e3d92f71646e6 Pavitrakumar M 2024-06-21 @1008  		if (sg && sg->length) {

Can we really pass a NULL sg?

8e3d92f71646e6 Pavitrakumar M 2024-06-21  1009  			++sg_nents;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1010  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1011  			if (sg->length > nbytes)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1012  				return sg_nents;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1013  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1014  			nbytes -= sg->length;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1015  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1016  			sg = sg_next(sg);
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1017  			if (!sg)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1018  				break;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1019  			/* WARNING: sg->length may be > nbytes */
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1020  		} else {
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1021  			/*
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1022  			 * The Linux crypto system uses its own SG chaining
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1023  			 * method which is slightly incompatible with the
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1024  			 * generic SG chaining. In particular, dma_map_sg does
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1025  			 * not support this method. Turn them into proper
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1026  			 * chained SGs here (which dma_map_sg does
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1027  			 * support) as a workaround.
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1028  			 */
8e3d92f71646e6 Pavitrakumar M 2024-06-21 @1029  			spacc_sg_chain(sg, 1, sg_chain_ptr(sg));
                                                                                       ^^^                 ^^
Because if so, we're toast.

8e3d92f71646e6 Pavitrakumar M 2024-06-21  1030  			sg = sg_chain_ptr(sg);
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1031  			if (!sg)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1032  				break;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1033  		}
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1034  	}
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1035  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1036  	return sg_nents;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1037  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

