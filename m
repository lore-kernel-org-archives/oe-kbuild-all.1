Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235471519B0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740410183; cv=none; b=PwQ7/BCjob1XREfvdhxZd/xGqH386MPJf50ZY4c1g8eK3VKviVLCW8jL7gKvS3ec44UACRejz75+srfBkSAF5+KFSKXx2Y8zQF50nljDvYkUms7iIzrKed5/94bXa8Ppf132FfZEDAs71qgX3cYZyHdwSeVlmw+kgo/G76QDxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740410183; c=relaxed/simple;
	bh=j1amh3GLQwBv+BmYGEPSqQplCa3rIZrtSko1QfgKVV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLpvm2yqJMiWxGhmPNmaODctmHAmornrDqinGVZbyrtMKXP4LB8kFsWWD+yT2XvYIcbxCXpowITXiD/CexeHmuonejvZkWxSNgFsa1SI6sUgdwCwl4b32Anw/Z9mqH5kuq6uPsmIvOXFNCllsgKDizyxl5DgybmeXV2HS2GqhT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=FydJNcRm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="FydJNcRm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4399d14334aso39810435e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740410178; x=1741014978; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfS+Z06Kv6L0rZqsEuMfHLU9T6TZKUI64/SNe3QOt3g=;
        b=FydJNcRmGI8DgGDUnF+aBR4MzUwg6wqUcjVt+PavawQyN1j8UCzC6sgDIyYzthr6FG
         eejOrNYXYEOiNXe4pnjQljx7SVsd0XeCT2hRq7bnHAAw92Tdz/OIirL/vrGPyBKVKAyJ
         3P0MBWfK35fNaWBzg13fq7l0p/V1GRSFFNcUc8tQhl5TyUn03LgDVonS3pZbQDxsMq9A
         7HhPnWN40ovvvf7lPQpHXkh+UzC9u5dylcdaLSj82US0zIV1koqdgQdDn2jda8AijlSO
         Ub5/iy2qWgqZMHHkNVgwcdfN41Qf9ld6CZLjOLwg7rEyJ9TOy/uKRHsxJoxhA/kLJJEL
         LUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740410178; x=1741014978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfS+Z06Kv6L0rZqsEuMfHLU9T6TZKUI64/SNe3QOt3g=;
        b=NwdFs8nukVBt45vaoxVVjd1HtnxlvNVTbI3Mddp7MtSf4iVavt2zUiMLiCY+a3OPyD
         i+sIWZzrEtNZLZxcsyYV3Tn1M5o1tTmZyDxMQN4ZHcdzNmfqitJ+z/wSwlaMGlMZ/Lb2
         /8lyJi6wN3cr/ml1cCoTdsIuzcUdGXH4OrQ59oXfNaaA99ylA+vpcuNi1Sfocr0KyM8s
         tqbegnsOimaf0astw9Hhm02+GKkesOQ9Pl60T6w4AqOe0wuBrWaJG4JvnkNaR5wMk01A
         tApBtdTkRCBEDhq1RVxtuWmkgd2XJ1M2Drp7UlnPRWlp9XHWiN9neE/vbzChpBsC1j0k
         CoXg==
X-Gm-Message-State: AOJu0YxID2mBL2gGSpER59+4/36IW7jq6a06rUqa7TF2YTGgfrI0tHYP
	UbRLWdGil0tZelYtBdDaAQVB3c7sotD+B5mBOgPDCWGAArAsIGBt84mutUSFhEID3pr/NqKtjFh
	i
X-Gm-Gg: ASbGncvTdday/RTCq2n93gRci5cIxhaIARdPFsuMgSLpx1sIjaUE2VkcUKUprsqL6jc
	Ro0jpJQu5u/4AuPV3EHsvNyPjfUshMNInTfPTSD5daK2TQ2aYDUxAXnvKiKliJl+w6xojHRp/M7
	Ywklr3bLLpd3leY4EAlLSkn5mL647WHbSfip0Rf5gthZKu5yIrkGMrnUHmmGBE//TD1HB5YE0ly
	/uZHa7JoYUuhASrpgXpFYPx1ecqRVBPmrdkMLOOyB2/ABVAT5SRYfFuayr/SfK2UVOFsrw4ejMZ
	4EXlvLw4gXIWbkeGK6lTQ5l5A0C+NirJmQd7PljN/YDj18XxqdSQcn8=
X-Google-Smtp-Source: AGHT+IHD7IQa2hR2BzePsORrYvXKwBP8zZPbU6UjUepnOBOOx6KkffEVjFVO5JteQJTLCq3CWCnDXQ==
X-Received: by 2002:a05:600c:3b08:b0:439:5da7:8e0 with SMTP id 5b1f17b1804b1-439ae1f30dbmr136958115e9.16.1740410178141;
        Mon, 24 Feb 2025 07:16:18 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02e6701sm108245625e9.20.2025.02.24.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:16:17 -0800 (PST)
Date: Mon, 24 Feb 2025 16:16:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250224-c0b507d4e558bd4995384d55@orel>
References: <20250221145718.115076-17-ajones@ventanamicro.com>
 <202502230100.z4YCnXZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502230100.z4YCnXZg-lkp@intel.com>

On Sun, Feb 23, 2025 at 01:10:11AM +0800, kernel test robot wrote:
> Hi Andrew,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v6.14-rc3 next-20250221]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jones/riscv-Annotate-unaligned-access-init-functions/20250221-230314
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/20250221145718.115076-17-ajones%40ventanamicro.com
> patch subject: [PATCH v2 7/8] riscv: Add parameter for skipping access speed tests
> config: riscv-randconfig-002-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230100.z4YCnXZg-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230100.z4YCnXZg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502230100.z4YCnXZg-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/riscv/kernel/unaligned_access_speed.c: In function 'set_unaligned_access_static_branches_except_cpu':
>    arch/riscv/kernel/unaligned_access_speed.c:201:39: error: 'fast_misaligned_access' undeclared (first use in this function); did you mean 'vector_misaligned_access'?
>      201 |         cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
>          |                                       ^~~~~~~~~~~~~~~~~~~~~~
>          |                                       vector_misaligned_access

Looks like I forgot to move fast_misaligned_access out of the
CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. I'll fix it for v3.

drew

>    arch/riscv/kernel/unaligned_access_speed.c:201:39: note: each undeclared identifier is reported only once for each function it appears in
>    arch/riscv/kernel/unaligned_access_speed.c: In function 'set_unaligned_access_static_branches':
>    arch/riscv/kernel/unaligned_access_speed.c:220:40: error: 'fast_misaligned_access' undeclared (first use in this function); did you mean 'vector_misaligned_access'?
>      220 |         cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
>          |                                        ^~~~~~~~~~~~~~~~~~~~~~
>          |                                        vector_misaligned_access
>    arch/riscv/kernel/unaligned_access_speed.c: In function 'riscv_online_cpu':
> >> arch/riscv/kernel/unaligned_access_speed.c:238:29: warning: unused variable 'buf' [-Wunused-variable]
>      238 |         static struct page *buf;
>          |                             ^~~
> 
> 
> vim +/buf +238 arch/riscv/kernel/unaligned_access_speed.c
> 
> f413aae96cda05 Charlie Jenkins 2024-03-08  235  
> f413aae96cda05 Charlie Jenkins 2024-03-08  236  static int riscv_online_cpu(unsigned int cpu)
> f413aae96cda05 Charlie Jenkins 2024-03-08  237  {
> f413aae96cda05 Charlie Jenkins 2024-03-08 @238  	static struct page *buf;
> f413aae96cda05 Charlie Jenkins 2024-03-08  239  
> f413aae96cda05 Charlie Jenkins 2024-03-08  240  	/* We are already set since the last check */
> cf73109e3f3716 Andrew Jones    2025-02-21  241  	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
> f413aae96cda05 Charlie Jenkins 2024-03-08  242  		goto exit;
> cf73109e3f3716 Andrew Jones    2025-02-21  243  	} else if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
> cf73109e3f3716 Andrew Jones    2025-02-21  244  		per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> cf73109e3f3716 Andrew Jones    2025-02-21  245  		goto exit;
> cf73109e3f3716 Andrew Jones    2025-02-21  246  	}
> f413aae96cda05 Charlie Jenkins 2024-03-08  247  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
