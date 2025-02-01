Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED525761
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738404413; cv=none; b=H/vWRdZlDr6xd3fJ7JXnt9lUnusUTgl4fDXtnPfUuKu6HK6yiq2x8vGQM+XaM4FkFJwr2H8p5UKEc3+p1UAicB0MQHVsKLVr2vBdpHGfaV7QfIBsmXr1aJcnRiJBebNyWK18q4nHf8qik4bRjvE8mgqejYosOhr3g/W+p9HQMXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738404413; c=relaxed/simple;
	bh=luDz7nI8Z256mCk8I1VhfshnLLJ2vZ3M4FOHRZSBCY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ev1eiz6oB8gy4JaO9hPB0AGTcLfIL6waZMEYodLsc4hqg+zKJX5phJyP5qsZPwqYCFbCLenGp1Zp0NEn3ZLkUsintkTGM8k0D5+JpbNmfn+PsOhDGFXqsdL3sQ88Oi1dI2ebOjvSnWS8WMQ9A9squbdTGhxky7RUF7q1gXBU8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxnO87HK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxnO87HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738404412; x=1769940412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=luDz7nI8Z256mCk8I1VhfshnLLJ2vZ3M4FOHRZSBCY0=;
  b=VxnO87HKU+wLNBdg0eNBClrXSSdg6ByrCeMM3l01OoGATNL8wx39zbjv
   +AMFVTi6n3LbJpjEfhVaIBLauuUqLFG5TC3Kn9bzrAjQ8zuFnpD3EIPA/
   TArO5AAG0NtIwyBrjmqImqT0/jf3zNVGHhtHXWS7BgLF4g4p1ZmsC0vEA
   epWwFHtvIJEv2HfOQPJARHFpoq3oLtKvDGVvywqOYqXPmJHQ2eyy1HzS7
   JY4G+37z4KnapEAsYHZHBe0WUnmoV4gACDa93Zpjc0xUM/yTZXfLyjZFL
   Y4NR59lrfvVHeFjf54KtqEPvD5G8RoMx7lkDVPJB5h4Vnyh1SJYdX/ELo
   Q==;
X-CSE-ConnectionGUID: plLe1aVjQai18af03R+Bdw==
X-CSE-MsgGUID: 9cQXeS2WQ7yXYFt+BZ8lkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50350368"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="50350368"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 02:06:51 -0800
X-CSE-ConnectionGUID: z3vE1xROSnC5BDhYcDTqew==
X-CSE-MsgGUID: 04/zztnwRc6n0ytaPWhdEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="110415798"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 02:06:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teAOh-000nzT-1T;
	Sat, 01 Feb 2025 10:06:43 +0000
Date: Sat, 1 Feb 2025 18:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, jic23@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	agross@kernel.org, andersson@kernel.org,
	dmitry.baryshkov@linaro.org, konradybcio@kernel.org,
	daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
	thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
	subbaraman.narayanamurthy@oss.qualcomm.com,
	david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
	quic_kamalw@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev, rui.zhang@intel.com, lukasz.luba@arm.com,
	lars@metafoo.de, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	jishnu.prakash@oss.qualcomm.com, quic_skakitap@quicinc.com,
	neil.armstrong@linaro.org
Subject: Re: [PATCH V5 4/5] iio: adc: Add support for QCOM PMIC5 Gen3 ADC
Message-ID: <202502011915.MIBVfCtZ-lkp@intel.com>
References: <20250131183242.3653595-5-jishnu.prakash@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131183242.3653595-5-jishnu.prakash@oss.qualcomm.com>

Hi Jishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Jishnu-Prakash/dt-bindings-iio-adc-Move-QCOM-ADC-bindings-to-iio-adc-folder/20250201-023723
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250131183242.3653595-5-jishnu.prakash%40oss.qualcomm.com
patch subject: [PATCH V5 4/5] iio: adc: Add support for QCOM PMIC5 Gen3 ADC
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250201/202502011915.MIBVfCtZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011915.MIBVfCtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011915.MIBVfCtZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/qcom-adc5-gen3-common.c: In function 'adc5_gen3_update_dig_param':
>> drivers/iio/adc/qcom-adc5-gen3-common.c:72:18: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      72 |         *data |= FIELD_PREP(ADC5_GEN3_DIG_PARAM_CAL_SEL_MASK, prop->cal_method);
         |                  ^~~~~~~~~~


vim +/FIELD_PREP +72 drivers/iio/adc/qcom-adc5-gen3-common.c

    67	
    68	void adc5_gen3_update_dig_param(struct adc5_channel_common_prop *prop, u8 *data)
    69	{
    70		/* Update calibration select and decimation ratio select */
    71		*data &= ~(ADC5_GEN3_DIG_PARAM_CAL_SEL_MASK | ADC5_GEN3_DIG_PARAM_DEC_RATIO_SEL_MASK);
  > 72		*data |= FIELD_PREP(ADC5_GEN3_DIG_PARAM_CAL_SEL_MASK, prop->cal_method);
    73		*data |= FIELD_PREP(ADC5_GEN3_DIG_PARAM_DEC_RATIO_SEL_MASK, prop->decimation);
    74	}
    75	EXPORT_SYMBOL(adc5_gen3_update_dig_param);
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
