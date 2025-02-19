Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0F1BBBC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739949824; cv=none; b=TTDnxKsJaOcRD0uV7f6Z1D9fP/DiGq2zWX3Z1UYjpWnpvOLii0NGGjt6JO+Gho1I0cruYlamQq/I9v+p0p4Tt1JCVgZj7XI6bPlZQnvtx7kUXqqLye9Bj2aWSW3x0/TAM/gOOBzKJisXLP4h3ciourraau/5TNkDBlLTzsZrcbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739949824; c=relaxed/simple;
	bh=3kLZsDMev250iMmOeYc57o6jrc1EykFIZENk0ndPuYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZSDohpOMRTec2JSgsQ2TNmIHcuRNQbcFgU0Dtp7D5ZVuLEYyMXGoCwFVr34yOK3d9zFrFTxzNVBklCC0nv6rhVuPfhXOgGjUqLqK++WLFz/Rfy0HgYjHi8s60claWpqv9Ce9BeMSxcRh4j2wlOUVWyGyCecl0vV4CH6Wu3Ev0+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZc2OO0m; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZc2OO0m"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1301773566b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 23:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739949820; x=1740554620; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrkL1EzynOEYQjnCeAURIHzh4kwI++Df9MFvfdWTjOg=;
        b=sZc2OO0mqQ7pa31dtECb6p2Euh/aFEjO0RfazKcRlxGksDItIfnWZU+zCAqj8ctlZx
         tdLxeJJbp4LbshfZT1iMc6+0SoOoh9L3pKupne+N5xXNDP0VZTu3z26mwhA0g302r8Kg
         oz3lLA+ZAETkb8xFvB8u7HCt15IG9nYZOaRcVoGm4//WoAAvY4BlRqUIB4AnH3TE446f
         GoHi9YBX5P87oKsLEHWUlqw2w4jg8L+jld8QPvZjtTmP5yrdUM9Tg9ooVp3rpHMwZ5qx
         ASTMgcltvfE+GL68dmqkRa+efwmkm3EfOWeRiL9dDPvZdSTX2L+/Q4y8zwu1Zlq/CbHL
         NBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739949820; x=1740554620;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrkL1EzynOEYQjnCeAURIHzh4kwI++Df9MFvfdWTjOg=;
        b=Ae79aV+8/V+Kb4Y4BRu3wMJwjVqRVO1chG77nMTqDIvNpotDfq3uktCnubV9VFOmJf
         wndL53kEDuCUdd8SG2wFtAnev5r1pwQdsosLClGaWt1dfpliy1sIJQNe1gWmI1ze74hb
         nA1dvs7/KpeDJnOVz2MG7OHzF/0A4RKVYCGL/BZsCKe+CCum4RWqjf0LZP8pCjzq5/lG
         x9e+lAQoAt/mfUUSQ8qV92xIbS6nxlMGiCHq1hhqkgZrAx76OYbnWejPWGDXp6szdHch
         8eW5Y9L3dzumRbwSOyHj8O6yaE4OQ2kaTeFJgWJ4xezbo96Bpz1t3qS3dYvfwBj0ih/r
         nNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6JANec4JY7Ql2K16Wj//GpUglgyJlYhUvu8ne9ZIHagi0psqoNlEsEZ7m4Va0lwaAvQsC7S1L0QSfhupX@lists.linux.dev
X-Gm-Message-State: AOJu0YwwZlN9kMhjRR+Pel0hFysbBxydiUmGaO9/R/DWBQb38gudc19o
	9gvxxuI+O23yfQ8/GoaRS7emnNNbHaiQe4sUS4p8xh368mY5cLky/lMADGFfNNY=
X-Gm-Gg: ASbGncu+aOJGz8MSFWcGCgyoG7NqrkvK1RUlzEDDuilijcU5H2+vgI/aoufOxlVQzHx
	s7RyWrO1wQsb8oPiFMrzbGxAmB15n1q3lgwIzlHBPL0ZFm5ttOQrLoWiXOzggR8Ydh5MefTTm99
	0VsrazchIslR24JWAfYz1Jf/WUXbSLooVkQclJgbK6oCjtDKtTxNaEPs2JgTHShYuAtp8IarxnS
	YOTlahNxFROEhGH/gwjrSiUTCggg8XK1Niu/BSFCGcgucTQD1niRcS7AJUad3O7cAYD4qTnogFc
	v3YtDbBErCh4qCxKgIO3
X-Google-Smtp-Source: AGHT+IHZWXCuEpvT3xvdDN/MFE3D6j40MB5FYWQcEZO+pokW/icP1OWkegX28oeygqnpWf0djqcvPg==
X-Received: by 2002:a17:907:3e82:b0:abb:db78:a25c with SMTP id a640c23a62f3a-abbdb78ac9amr70624766b.46.1739949820011;
        Tue, 18 Feb 2025 23:23:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb837378e7sm729086166b.52.2025.02.18.23.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:23:39 -0800 (PST)
Date: Wed, 19 Feb 2025 10:23:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mark Tseng <chun-jen.tseng@mediatek.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	chun-jen.tseng@mediatek.com
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <23e24631-aee4-43cc-8f85-29ec58241c03@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>

Hi Mark,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Tseng/cpufreq-mediatek-using-global-lock-avoid-race-condition/20250214-154521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250214074353.1169864-2-chun-jen.tseng%40mediatek.com
patch subject: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
config: sparc-randconfig-r071-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190807.fz6fs2jz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502190807.fz6fs2jz-lkp@intel.com/

smatch warnings:
drivers/cpufreq/mediatek-cpufreq.c:367 mtk_cpufreq_opp_notifier() warn: inconsistent returns 'global &mtk_policy_lock'.

vim +367 drivers/cpufreq/mediatek-cpufreq.c

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  317  static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  318  				    unsigned long event, void *data)
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  319  {
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  320  	struct dev_pm_opp *opp;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  321  	struct dev_pm_opp *new_opp;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  322  	struct mtk_cpu_dvfs_info *info;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  323  	unsigned long freq, volt;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  324  	struct cpufreq_policy *policy;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  325  	int ret = 0;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  326  
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  327  	mutex_lock(&mtk_policy_lock);
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  328  	opp = data;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  329  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  330  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  331  	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  332  		freq = dev_pm_opp_get_freq(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  333  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  334  		if (info->current_freq == freq) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  335  			volt = dev_pm_opp_get_voltage(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  336  			ret = mtk_cpufreq_set_voltage(info, volt);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  337  			if (ret)
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  338  				dev_err(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  339  					"failed to scale voltage: %d\n", ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  340  		}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  341  	} else if (event == OPP_EVENT_DISABLE) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  342  		freq = dev_pm_opp_get_freq(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  343  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  344  		/* case of current opp item is disabled */
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  345  		if (info->current_freq == freq) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  346  			freq = 1;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  347  			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  348  							    &freq);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  349  			if (IS_ERR(new_opp)) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  350  				dev_err(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  351  					"all opp items are disabled\n");
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  352  				ret = PTR_ERR(new_opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  353  				return notifier_from_errno(ret);

mutex_unlock(&mtk_policy_lock) before returning.

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  354  			}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  355  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  356  			dev_pm_opp_put(new_opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  357  			policy = cpufreq_cpu_get(info->opp_cpu);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  358  			if (policy) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  359  				cpufreq_driver_target(policy, freq / 1000,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  360  						      CPUFREQ_RELATION_L);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  361  				cpufreq_cpu_put(policy);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  362  			}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  363  		}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  364  	}
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  365  	mutex_unlock(&mtk_policy_lock);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  366  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 @367  	return notifier_from_errno(ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  368  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

