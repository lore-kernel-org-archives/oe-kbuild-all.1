Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF7303C8E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828408; cv=none; b=tdA09m7OI/AYe2kvM2boBRpnvp7uyTu2JuO3Y/DVj/adEP8A4MvPvSMu+uktjL5vR+9FK60yQ8LlPE58hLQ87zqYls9Hj0x8HtYLZoxkQeGbI7AntZISt7Peqk6+eC34j+8B49D5j9Wml5otiA6MRAkBV9U1aTOOGCjRRzH9yG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828408; c=relaxed/simple;
	bh=Y9KEkNBEdaCc1a1sw/0mEPi5JZRP391wQMPRK6mbkYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MTkPOa1trvj+7AC0XzME/9/6llcUr+n+9vYhxPNQ6BTtSotiPSKWc23V4B3S6RI2CE6dmvO4w50lA2OmN0TROA028D9clw6o1TAPnjaLIH2RWTXBc+DomOxuxJz0Ody5QT1BGhIzCWKb4RKdgLdj5MKr/QcMb2R29vXb+QLFjPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kDE1Lyr1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kDE1Lyr1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so24451115e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Sep 2025 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756828405; x=1757433205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJaZxrOsdhyiABPvNpYJfbVgADxdvTvuGMZtJ7RHsGk=;
        b=kDE1Lyr12tzqNMNheB2zgAm4USjWVrkGlK3BtGsuufs520oka07VwcnNCIOoQt3M1+
         BPpfc0Oh4Bu4lbcVDcuZvvXybkFq2PHkMpPLfcKF/iUlAr/QpfvfPKSaT175mBhm+RkO
         yvEow1q/Ui17cj7szxmxhU9nhKA0xkCKsOjw2WD2PS0bvfutwM751HyTkJDi5aBE2M+B
         creNYLh09Sf8PQKNzlYSZZI1BvZatrYoIqj2NOf2qHXqQBXK3RbuhFPAurtUaOUTPMEL
         NVuIw+2w1ZxDRARu9IMoPQpyduu/9MYARrBlQG4aYmrXf7qMiy/MBkKorAj/O1rZBt1V
         sj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828405; x=1757433205;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJaZxrOsdhyiABPvNpYJfbVgADxdvTvuGMZtJ7RHsGk=;
        b=Kg7B69OqCPD4VtIxysNA7MNGZ+DJiJqrudl7cghHyrNLDDyXBboVJM3JyiTVTf2T35
         LNodP99l57rqKMDAXOd6fK1O+Wvq2naCOak0T65NBz4OMhaVQV5Q5EhKWoLIzmBdCagi
         /OXGTZv4tvXdafgsTpTTfc76i0LQlCQSbJfOHTGz/Aabies7r1Ph8k/f7zyPYHRZuQDe
         QBEzEZ/daPNM73EfHcMlA3zJo2nzgWFoBlqTtipQBuwifBAo5oPd3hqHtNS2H56AiHwQ
         TuPBqEPTjuKmnEVPiFQno7rjROhmWxugpbKiu+hDXth6pPMzbwhw+Rveq0t0DxiayuEJ
         s8yg==
X-Forwarded-Encrypted: i=1; AJvYcCXu+moNoeN6vwae1sARU2s/rIyDy01uar3qii9ADqzf7puZEmgCjHlTZdqz3vO5v3Dkf/GgMNvg9Yxn0J7E@lists.linux.dev
X-Gm-Message-State: AOJu0YyHk02tjlFw/tzu/UowQnAhf8Pg4ei0EhePhLCuOh3LGjdT3cLL
	3tKEVebjm4/NZH5s0n9SbKJlLuzfnv0YT1I+T+XQ8xkyvc5Q+Xrhd+UbDQYsk8tZ7f4=
X-Gm-Gg: ASbGncvt0VfgIOP3WddHRuVf8YIhKg7k9DtK7n2IKiSwHk7AzfxcWQqii/qpiCLFCem
	j8W2B1JuNCXq1tRwPTEhO3oIjD2HY6bRGj/IutU6vmF9VGWprSbflkD70hu3wTcP6Kdw7QHZHhP
	lmXLZg+emw63z5xxz+lqMIn3iUlf/UKPqPNJ4j3IwR3GTBwKcJogJlehWCZuFZzwkDZ+rd4ku53
	d/kYpmMx5ncyLaWBlfBdpkpZwsU8zrjpYh1x5OjWmKRQtArdnPxK5yMKdqIOlC6Q4k4Jc9jufUG
	lYWOKb8Wx7kLoBrHZKxQiObPs+yoYMI7yIBJ2xaQRpXnJUdgYiHJFrmfthW5AVj9eliEa3sEA59
	BpFMOV0D3ae4m+u9/Xhl+EPYW+6c=
X-Google-Smtp-Source: AGHT+IHKaTeLcXrc9oz4Am392RK8uRis5Zrd/kbBkzlvAa0EGTnOvu7xZRd/4WX3gyF0+iqaP5ci4g==
X-Received: by 2002:a05:600c:3b01:b0:45b:88c6:709d with SMTP id 5b1f17b1804b1-45b88c67339mr80810175e9.25.1756828404547;
        Tue, 02 Sep 2025 08:53:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b73c52735sm265052305e9.22.2025.09.02.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:53:24 -0700 (PDT)
Date: Tue, 2 Sep 2025 18:53:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zihuan Zhang <zhangzihuan@kylinos.cn>,
	"Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
Message-ID: <202509022308.CeaKUqJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901085748.36795-13-zhangzihuan@kylinos.cn>

Hi Zihuan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm64-topology-Use-scope-based-cleanup-helper/20250901-170106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250901085748.36795-13-zhangzihuan%40kylinos.cn
patch subject: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
config: powerpc64-randconfig-r071-20250902 (https://download.01.org/0day-ci/archive/20250902/202509022308.CeaKUqJM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509022308.CeaKUqJM-lkp@intel.com/

smatch warnings:
kernel/power/energy_model.c:454 em_cpufreq_update_efficiencies() error: uninitialized symbol 'policy'.

vim +/policy +454 kernel/power/energy_model.c

e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  450  static void
e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  451  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state *table)
e458716a92b57f Vincent Donnefort 2021-09-08  452  {
e458716a92b57f Vincent Donnefort 2021-09-08  453  	struct em_perf_domain *pd = dev->em_pd;
3a096464b04b72 Zihuan Zhang      2025-09-01 @454  	struct cpufreq_policy *policy __free(put_cpufreq_policy);

policy needs to be set to NULL here.

e458716a92b57f Vincent Donnefort 2021-09-08  455  	int found = 0;
99907d6054f2d3 Lukasz Luba       2024-02-08  456  	int i, cpu;
e458716a92b57f Vincent Donnefort 2021-09-08  457  
e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  458  	if (!_is_cpu_device(dev))
e458716a92b57f Vincent Donnefort 2021-09-08  459  		return;
                                                                ^^^^^^
returning before an initialization is an uninitialized variable bug.

e458716a92b57f Vincent Donnefort 2021-09-08  460  
99907d6054f2d3 Lukasz Luba       2024-02-08  461  	/* Try to get a CPU which is active and in this PD */
99907d6054f2d3 Lukasz Luba       2024-02-08  462  	cpu = cpumask_first_and(em_span_cpus(pd), cpu_active_mask);
99907d6054f2d3 Lukasz Luba       2024-02-08  463  	if (cpu >= nr_cpu_ids) {
99907d6054f2d3 Lukasz Luba       2024-02-08  464  		dev_warn(dev, "EM: No online CPU for CPUFreq policy\n");
99907d6054f2d3 Lukasz Luba       2024-02-08  465  		return;
99907d6054f2d3 Lukasz Luba       2024-02-08  466  	}
99907d6054f2d3 Lukasz Luba       2024-02-08  467  
99907d6054f2d3 Lukasz Luba       2024-02-08  468  	policy = cpufreq_cpu_get(cpu);

Or we could declare it here:

	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpu);

e458716a92b57f Vincent Donnefort 2021-09-08  469  	if (!policy) {
4274521fabee05 Lukasz Luba       2024-02-08  470  		dev_warn(dev, "EM: Access to CPUFreq policy failed\n");
e458716a92b57f Vincent Donnefort 2021-09-08  471  		return;
e458716a92b57f Vincent Donnefort 2021-09-08  472  	}
e458716a92b57f Vincent Donnefort 2021-09-08  473  
e458716a92b57f Vincent Donnefort 2021-09-08  474  	for (i = 0; i < pd->nr_perf_states; i++) {
e458716a92b57f Vincent Donnefort 2021-09-08  475  		if (!(table[i].flags & EM_PERF_STATE_INEFFICIENT))
e458716a92b57f Vincent Donnefort 2021-09-08  476  			continue;
e458716a92b57f Vincent Donnefort 2021-09-08  477  
e458716a92b57f Vincent Donnefort 2021-09-08  478  		if (!cpufreq_table_set_inefficient(policy, table[i].frequency))
e458716a92b57f Vincent Donnefort 2021-09-08  479  			found++;
e458716a92b57f Vincent Donnefort 2021-09-08  480  	}
e458716a92b57f Vincent Donnefort 2021-09-08  481  
e458716a92b57f Vincent Donnefort 2021-09-08  482  	if (!found)
e458716a92b57f Vincent Donnefort 2021-09-08  483  		return;
e458716a92b57f Vincent Donnefort 2021-09-08  484  
e458716a92b57f Vincent Donnefort 2021-09-08  485  	/*
e458716a92b57f Vincent Donnefort 2021-09-08  486  	 * Efficiencies have been installed in CPUFreq, inefficient frequencies
e458716a92b57f Vincent Donnefort 2021-09-08  487  	 * will be skipped. The EM can do the same.
e458716a92b57f Vincent Donnefort 2021-09-08  488  	 */
e458716a92b57f Vincent Donnefort 2021-09-08  489  	pd->flags |= EM_PERF_DOMAIN_SKIP_INEFFICIENCIES;
e458716a92b57f Vincent Donnefort 2021-09-08  490  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

