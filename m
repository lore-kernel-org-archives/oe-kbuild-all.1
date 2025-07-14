Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F01FECDD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521985; cv=none; b=miNskhNu9S52f5sTnlkAkaJfEFXE0xEqihUp+QbbsOUpDwJgRY+KBjTtpPoMjFMrQtHVJSh9YQoxpKypO+MFNuwMRq4u30o/FDaDZlxK0+Z3IWP7juoKL3JaXP/fVjXCsRzf/9yrpv3TEFtfIDcYgCZUaxLCgAq74iJSc/bu+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521985; c=relaxed/simple;
	bh=5cSCYdKyaKnlsB59d7LA/sqcozRwuYbnW6S02DziChQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=G4jCbnxXix+kczkKXWv+h5RgVpJiNRlRTHXl2PpC9mvOtnKke6S4JvY3dj04dZXnfV+ukKdMPVwGUPVNnAUVHFgX/oS0cEjC2y6j1N85UJXxzaIlJLNn3oz4TIKqziW+tCZ1p3gO2WDqHDUwWJbERqefwQtZ5l+K537KmHhkWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0PTH806; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0PTH806"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ff8d43619cso299293fac.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521983; x=1753126783; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
        b=h0PTH8065YgOXUSeFbRHheB72np9GCT9IWm27DMNAmZYWUQRxx/FsC5WFmKB7Ci/hY
         vWNwkVBmhPC2v6S0XN8624CxkaUaxeKBCW1UKmpglJAXl4Syeu7t/3GnJwq/VqHi5d5k
         eqD89j57XYcAkmAcOLvfE/srJ6vWpwwW89Pmg1ybxUxYxv/ASZjOiNjZIE20WHt/pdKu
         ilOIr6Sm0IgR+0wLFbBcj0HW9erlQaMh8R7007giZJSOM59/0GuaHKoBCm5/0M973s2D
         mCC3/84tlYepUVkIEOEe/GhGpe45HvzJ3SxocwohDzBg7gR4KWEqBVIH4GcmSAPFbtAK
         82IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521983; x=1753126783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
        b=krgP6zT9RV28Vgjc09193GrU9GPfVVqCREQimbTmnKbYYqBu4SMEJIIhKTM1XPtxhb
         EABVTliGeLX4Nqj0fcc60SRxgCNgws9uor3su4AD8QBUoUVliFAfdPVIPNIhGEl8l75S
         BN9xPVDkUzSOmauoVAM3crXQbUC4Y0EV/fNujC6O8wAajMQ5R06IkeEuxwT43o18NQu7
         wuQ0ASAZEkDgUdJRJX5tOQWjkPTEI8yluyxhLLvT/Gw2c8TQtJEW3ANjGOCMZ/nic0ho
         6+tJXcbAfUPpPJ1AjiqFp4zScql7SzlMAJCAeeEdBnaBCdVOpcjeSArye0o4JAXV5YM0
         MWkg==
X-Forwarded-Encrypted: i=1; AJvYcCWcxvsSSDayzuDaoGePldHUJqT2yFt4asSlc2cDnV0Vmh39nH8EC0yk3KQDY2rOBxXKy3SIv/A7jZXP3ynA@lists.linux.dev
X-Gm-Message-State: AOJu0YyMll1v040kTiFYo5gX5HLQ3b/tPi9NFB173ZwreCtzCDzkIU5g
	IlJLvptfe3c54AyNlVZN7LuFSLpJhpdvBtC6bRn30lHWZ2/NLKr1qCxaGTfc4fMqLY5kXuzYJTf
	AAt1Q
X-Gm-Gg: ASbGncu2NYr5I3ZhLGEVRS2l7Ze/5Nc7tpGv/RF5O1E+SlSbu2oDhSg0nKXOLkXj8CP
	pR/ECNxPDPeYAt4hBE3aBYvz4TZIRP/gmTYTKYnz/yUhvJyow30qep5RrUB0AWAzFYPpKpGBHiS
	mlRaXdVEjXHDx3vPt7fFu3QSmcM+sSI1zZ20+tkiogZaBB7d0ZE6+qS9hkTiqD6ww8R7Ef1UT4N
	ZOty5uWZpLUVJlPJmpDShGvJojRu9mukh1jwg+NO7VZaa8Ay2j/dMy+3Ec9E/8Yx6gLwWGB4pa1
	beFHn6TFLTdZBckmbSiTWDrYJQbOfKd+4V3XCaMZSrdFXfMqpqx1CCRHVqotLmGGmbjy/AoRokt
	/r/WMoseL0ovPFNUR/l3IiME2ip36rg==
X-Google-Smtp-Source: AGHT+IG9YCfy/a8BjNGBo1GzQjJuR8GmP8UR9cv+uwP5yDJexmfxPdWGAOu8EtDFH9IyIV9EN6mZeg==
X-Received: by 2002:a05:6870:c03:b0:296:bbc8:4a82 with SMTP id 586e51a60fabf-2ff2706c894mr10579426fac.27.1752521982792;
        Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12b62e8sm1674368a34.60.2025.07.14.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Le Goffic <legoffic.clement@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
Message-ID: <1fd92742-0958-4f64-8e50-4d0595fe74eb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-ddrperfm-upstream-v2-9-cdece720348f@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250712-030518
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-9-cdece720348f%40foss.st.com
patch subject: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
config: sh-randconfig-r071-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122125.eve8lg60-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507122125.eve8lg60-lkp@intel.com/

smatch warnings:
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'pmu' (see line 376)
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'event' (see line 377)

vim +/pmu +380 drivers/perf/stm32_ddr_pmu.c

73af3c4ba702d7 Clément Le Goffic 2025-07-11  374  static int stm32_ddr_pmu_get_counter(struct stm32_ddr_pmu *pmu, struct perf_event *event)
73af3c4ba702d7 Clément Le Goffic 2025-07-11  375  {
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @376  	u32 time_cnt_idx = pmu->cfg->time_cnt_idx;
                                                                           ^^^^^^^^

73af3c4ba702d7 Clément Le Goffic 2025-07-11 @377  	u32 config = event->attr.config;
                                                                     ^^^^^^^

73af3c4ba702d7 Clément Le Goffic 2025-07-11  378  	struct stm32_ddr_cnt *cnt;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  379  
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @380  	if (!pmu || !event)
                                                            ^^^^^^^^^^^^^^
Checks are too late.  The variables have already been dereferenced.

73af3c4ba702d7 Clément Le Goffic 2025-07-11  381  		return -EINVAL;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  382  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  383  	pmu->selected_set = GROUP_VALUE(config);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  384  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  385  	if (config == TIME_CNT) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

