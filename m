Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF151514F1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190653; cv=none; b=dTvqqufShPWbGvq5vpHaNlT0tZwgPTBfOrhQfLT+zhNFKK1aBZWi+iRnZ6qSXbyJ9m8eivq427tkeNvy/KRwPIrmkFyxoPJ1IZvljowwChiXCEbC9l1AbAdHtmin5PqUrOAL6cCkYfMrGmtbzblqmSYtrC6j80rfQBJtUOzZ7w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190653; c=relaxed/simple;
	bh=vnx/n166sYPO6lB/RaRfPnzGC6Xrv2iyNstcyz4412A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnvvz5HHJkQ9s8cA2m0JE+azIYniQVWrCU1P988pTX9Acb8+rp06/so/Oa3BAXatqxfA945Jeo4NrmUQQCI0naf4ZCWmwFneq06vOKoJPU+b4sioTPmCI4lP9FgFbKYQL1F5KIMmxcWHgacLlixYAw77H541BqStnq7pMX6Ncnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkjTAOtI; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkjTAOtI"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-700cc388839so1135124a34.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Jul 2024 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720190651; x=1720795451; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go8MaNmDmlSh8ngHkjtJjHiFwtKNDcZDTh37FXUcoTw=;
        b=QkjTAOtIDRIm55vKRTQ1a9fbQvzTIbbGJboCVgVFFHfHJ+iMDKWRYCIL9rWHt4mYKg
         hA4vPhbyd3Wrr/8EqM+pFCTKsehPZZ1WaCWwP9xLNhciQs4jbqkptPc4DVLE3kN+MaX1
         6fZZsi05RgCvVaXBSihzzdt+fwlpbDQKXOSrsxA4Y1q/Xc/dqvbGBZqakgihSR1vOfjv
         T8ucgpnCHh2ztwWUM7zhp6sFs3E3yR9edQt3cSe2NKO6/h45afFkLaS9OzOsDu40Zt5S
         wMYtaKyMJfmWiu2dRl7Q6O5Pgfg9yZTXkBEvOJekwJxwp1xqSxrRnbXrPwfDSEn9leVb
         d2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720190651; x=1720795451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=go8MaNmDmlSh8ngHkjtJjHiFwtKNDcZDTh37FXUcoTw=;
        b=Eb7ZgwzAQBVqo9WYoYDPGQSt+9+ck/lo+Khlig+AyAds8zMPBNwkufHgvS8z0b/N2Z
         jD/STPmjQgzaPMcGvTztEpRV1vH5lcHe2j8+68T1dLtVcWAEDhMaCBLpKi9rZkwcJwe+
         +ilEWMwEBJ4Zaj3k6ebqh2V4YSc82reRJicvc7lGti4VZAgRfdPJr1uJtNOLQ4KZIU2V
         xsTFxNDHQ81Isq2/pPMFV3GI4vLb5i6zxJmCXIRsl//MKre50nKVt9AU901sZxHgsJlm
         mAu+sqzuwjytrWr2mF9vZ/tA28L6a0kS8/6NLRaFIB5MGpdZJI01Ly2BybNwwUiFURyE
         x43w==
X-Forwarded-Encrypted: i=1; AJvYcCUCsFCQZKarX9XC3dECcmJ8QJB1b2bQ2K35oKDl0cQnXizq8xGd3TDYfIuOYI28cEe6aOhvJ3k28vAe1R0aiSeOu8GaFal/bGszxFZ9vg==
X-Gm-Message-State: AOJu0YyrrbOhW9uKZCsJ3XFSSZhxn/FIPcGtAgaf0P5lAOQrq5NC3O/w
	nr6tragLFb0b8ZpT5iRd7IGun7BGfPvpH8yMFJ0yNWBz94NoX6pax1M4vuJvAbA=
X-Google-Smtp-Source: AGHT+IFAGp9LtTfpu9z8EhYL6BqoJlBfzZas+23cCIzgJHWI7W70YBxqoZwtsNQo1lCjfJDGbKdx3w==
X-Received: by 2002:a05:6830:3b0e:b0:702:1de9:1434 with SMTP id 46e09a7af769-7034a552d3bmr5646005a34.0.1720190651355;
        Fri, 05 Jul 2024 07:44:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:45d:774f:47f7:bb6a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7a99a58sm2627991a34.12.2024.07.05.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:44:10 -0700 (PDT)
Date: Fri, 5 Jul 2024 16:44:08 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yu Liao <liaoyu15@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22235/23252]
 arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable
 dereferenced before check 'hv_vp_index' (see line 195)
Message-ID: <ba42dba4-4efa-45cf-9179-d8eef2f8a266@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1b4ca2a2c1253c9e2d2428cc4fae541fdf3b326d
commit: 1f51ce689904768e1e45fc37c687784abb6eb3ed [22235/23252] x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
config: x86_64-randconfig-161-20240704 (https://download.01.org/0day-ci/archive/20240705/202407051108.WAaMOZbt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407051108.WAaMOZbt-lkp@intel.com/

smatch warnings:
arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable dereferenced before check 'hv_vp_index' (see line 195)

vim +/hv_vp_index +204 arch/x86/hyperv/hv_init.c

93286261de1b46 Vitaly Kuznetsov    2018-01-24  190  void set_hv_tscchange_cb(void (*cb)(void))
93286261de1b46 Vitaly Kuznetsov    2018-01-24  191  {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  192  	struct hv_reenlightenment_control re_ctrl = {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  193  		.vector = HYPERV_REENLIGHTENMENT_VECTOR,
93286261de1b46 Vitaly Kuznetsov    2018-01-24  194  		.enabled = 1,
93286261de1b46 Vitaly Kuznetsov    2018-01-24 @195  		.target_vp = hv_vp_index[smp_processor_id()]
                                                                             ^^^^^^^^^^^
hv_vp_index dereferenced here

93286261de1b46 Vitaly Kuznetsov    2018-01-24  196  	};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  197  	struct hv_tsc_emulation_control emu_ctrl = {.enabled = 1};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  198  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  199  	if (!hv_reenlightenment_available()) {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  200  		pr_warn("Hyper-V: reenlightenment support is unavailable\n");
93286261de1b46 Vitaly Kuznetsov    2018-01-24  201  		return;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  202  	}
93286261de1b46 Vitaly Kuznetsov    2018-01-24  203  
1f51ce68990476 Sean Christopherson 2024-04-26 @204  	if (!hv_vp_index)
                                                             ^^^^^^^^^^^
Checked too late

1f51ce68990476 Sean Christopherson 2024-04-26  205  		return;
1f51ce68990476 Sean Christopherson 2024-04-26  206  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  207  	hv_reenlightenment_cb = cb;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  208  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  209  	/* Make sure callback is registered before we write to MSRs */
93286261de1b46 Vitaly Kuznetsov    2018-01-24  210  	wmb();
93286261de1b46 Vitaly Kuznetsov    2018-01-24  211  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  212  	wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  213  	wrmsrl(HV_X64_MSR_TSC_EMULATION_CONTROL, *((u64 *)&emu_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  214  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

