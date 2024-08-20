Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6F1C3F3C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 21:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188053; cv=none; b=reYoilQxfQ8F5aMwQ31mSsF+4HoqVBi5u9pQxfbf/Xzy0HVn9zGBg5gFOJXubGH9j6COVW20rcx+TmpBXv0QUGUSHN96kvmARHCW9UJ9BwXhnbh5DOioWCvs5GmUkP9vfRGEfUzb2n5rbq5yA0vuG4KEuAYXxoqA4CTLbLWla3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188053; c=relaxed/simple;
	bh=XNFvctVhIwp6wrUS5NtnVVcSlfcNFqnWQa6xosRIEHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldtVsaF177CywIrc3OOhcnRf2aD1O9bYQ2UT6v1qiuWVtZJ9CNxltzKl1R5DSL96UojMSraaUUlGRdHounC+T6OCyNmBQoNIiqtwf89RMO9UdM7q7fKffMYdVOmotpXxld0qFVSoPAfnhY3vqKQrHTajV9Swza22bT2Zga8nY5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lWfRm6Zt; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lWfRm6Zt"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-685cc5415e8so59545767b3.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724188049; x=1724792849; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aebfEap/ASBe5Gb+mw0cMwkvvA5FCkHO5rzJr5kiaeg=;
        b=lWfRm6ZtVnS1Mw6S1xowEGWUg1loCNrDIyD6+bF4mEicuNClOJWxBZFOyS3f53kie3
         YwREj7YrCoxRWPVGgu7HiwuaVbx7buTq5++hqY92GeqF0emus+jKdWhwzsrDp61E3gtU
         tbQbsRNwoDiAdfOanHrXC+TxOwZL1o73TthbBdJtgfkX+6OIFt8gmOeedw6USek2PTc0
         AdNBhjIgWVmo5v2UPxhL4ZdlzOg7puzWEh2tOmAqPgUjFXT9DPKY5kD6JZ/yD82DPj5Q
         lnvJCQcbspFhXbRhfVOEfCJiZ+2eJ3Apx2qEX7osHGNQoLGuxRaHVZaIdSx68ZF9wsbv
         N12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724188049; x=1724792849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aebfEap/ASBe5Gb+mw0cMwkvvA5FCkHO5rzJr5kiaeg=;
        b=ucQHMpQi+Y3iLMmNJD43R3dePmcFlUU2DsGXS/Eh61TrnKtrTE9GXGW+wtpRPmSPch
         qarttw4iv/nBJj+uY/7XyLRET31q/juzLwoT5A1fkpYmSv155ll3n4yIKSGC8cmLS/EP
         nLOoIjBu4VjRf/Rkx6V0Bs7CNvp5IEdndTmtj0lGSqdDalzxJJ1YAhcvG4d6gz7/4mik
         GRzTm2vR7OePNJWzr1TRmPzb6mGE4HepVbqlavmlad8MqEjlMA9VUZSO0Re0csBIZZn+
         6vZBUMKAbirJkF5nRtJbUKH3jk5anPveL0rgfM+21CRYutCmEe2eRkc/FvMH/xn2q4GE
         UmZQ==
X-Gm-Message-State: AOJu0YzSddrWI/WWuzN1oVqlcBkJ6iUJIrSGiNuH2qGIJdZGJ4PKuDeo
	ST1EYiI7C4nwnd+aLNNrXxc4/G1m8TGkrfS49nDu0UMLJaeHJkkprmyglYOXCEE=
X-Google-Smtp-Source: AGHT+IEbwKid8lGpSqZEjokGZLtdiVUpmCFV7bwar2w8v4lWx6MWt47SpOfAEtmAV7/wUbEyz60atQ==
X-Received: by 2002:a05:690c:2e8d:b0:6b0:2031:6414 with SMTP id 00721157ae682-6c09d4ff4fcmr6360937b3.24.1724188049085;
        Tue, 20 Aug 2024 14:07:29 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fdd8bfdsm55935356d6.19.2024.08.20.14.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 14:07:28 -0700 (PDT)
Message-ID: <7658aca4-a408-480c-98b6-4637bb86b5ad@baylibre.com>
Date: Tue, 20 Aug 2024 17:07:27 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: adc: ad7625: add driver
To: kernel test robot <lkp@intel.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Lechner <dlechner@baylibre.com>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240819-ad7625_r1-v3-2-75d5217c76b5@baylibre.com>
 <202408201520.lFtco3eF-lkp@intel.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <202408201520.lFtco3eF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-08-20 3:19 a.m., kernel test robot wrote:
> Hi Trevor,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on ac6a258892793f0a255fe7084ec2b612131c67fc]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Trevor-Gamblin/dt-bindings-iio-adc-add-AD762x-AD796x-ADCs/20240819-221425
> base:   ac6a258892793f0a255fe7084ec2b612131c67fc
> patch link:    https://lore.kernel.org/r/20240819-ad7625_r1-v3-2-75d5217c76b5%40baylibre.com
> patch subject: [PATCH v3 2/3] iio: adc: ad7625: add driver
> config: alpha-randconfig-r132-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201520.lFtco3eF-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20240820/202408201520.lFtco3eF-lkp@intel.com/reproduce)
Seems to be a problem with missing static inline definitions in pwm.h if 
CONFIG_PWM isn't set. I've replied to the relevant series on the PWM 
mailing list and will add "select PWM" to Kconfig for this driver.
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408201520.lFtco3eF-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     drivers/iio/adc/ad7625.c: In function 'ad7625_set_sampling_freq':
>>> drivers/iio/adc/ad7625.c:191:15: error: implicit declaration of function 'pwm_round_waveform_might_sleep' [-Werror=implicit-function-declaration]
>       191 |         ret = pwm_round_waveform_might_sleep(st->cnv_pwm, &cnv_wf);
>           |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/iio/adc/ad7625.c: In function 'ad7625_buffer_preenable':
>>> drivers/iio/adc/ad7625.c:420:15: error: implicit declaration of function 'pwm_set_waveform_might_sleep' [-Werror=implicit-function-declaration]
>       420 |         ret = pwm_set_waveform_might_sleep(st->cnv_pwm, &st->cnv_wf, false);
>           |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
>
>
> vim +/pwm_round_waveform_might_sleep +191 drivers/iio/adc/ad7625.c
>
>     175	
>     176	static int ad7625_set_sampling_freq(struct ad7625_state *st, int freq)
>     177	{
>     178		u64 target;
>     179		struct pwm_waveform clk_gate_wf = { }, cnv_wf = { };
>     180		int ret;
>     181	
>     182		target = DIV_ROUND_UP_ULL(NSEC_PER_SEC, freq);
>     183		cnv_wf.period_length_ns = clamp(target, 100, 10 * KILO);
>     184	
>     185		/*
>     186		 * Use the maximum conversion time t_CNVH from the datasheet as
>     187		 * the duty_cycle for ref_clk, cnv, and clk_gate
>     188		 */
>     189		cnv_wf.duty_length_ns = st->info->timing_spec->conv_high_ns;
>     190	
>   > 191		ret = pwm_round_waveform_might_sleep(st->cnv_pwm, &cnv_wf);
>     192		if (ret)
>     193			return ret;
>     194	
>     195		/*
>     196		 * Set up the burst signal for transferring data. period and
>     197		 * offset should mirror the CNV signal
>     198		 */
>     199		clk_gate_wf.period_length_ns = cnv_wf.period_length_ns;
>     200	
>     201		clk_gate_wf.duty_length_ns = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
>     202			st->info->chan_spec.scan_type.realbits,
>     203			st->ref_clk_rate_hz);
>     204	
>     205		/* max t_MSB from datasheet */
>     206		clk_gate_wf.duty_offset_ns = st->info->timing_spec->conv_msb_ns;
>     207	
>     208		ret = pwm_round_waveform_might_sleep(st->clk_gate_pwm, &clk_gate_wf);
>     209		if (ret)
>     210			return ret;
>     211	
>     212		st->cnv_wf = cnv_wf;
>     213		st->clk_gate_wf = clk_gate_wf;
>     214	
>     215		/* TODO: Add a rounding API for PWMs that can simplify this */
>     216		target = DIV_ROUND_CLOSEST_ULL(st->ref_clk_rate_hz, freq);
>     217		st->sampling_freq_hz = DIV_ROUND_CLOSEST_ULL(st->ref_clk_rate_hz,
>     218							     target);
>     219	
>     220		return 0;
>     221	}
>     222	
>
