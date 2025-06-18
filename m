Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB82F2C62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268278; cv=none; b=pzgW8OcL6rfKIvGmgoAa2MYUtHWQ+zGAT6wwzhGgY71QoI1MSqF0TRVxvN55+mdsFhzZaN6DHszL4yzEsrLr3a12sOApbKBQDt5vcJd2HqzbzrLDvtvD3NLqBocYQ6MUsamxK2KiATkbvAa3h6kQFV4AOxFbu3waV0sGjNnLsi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268278; c=relaxed/simple;
	bh=dSwvZmhnUv9vUtgb4j2wEBivI04TNySsv154Cfug3uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QRPGhLLg2PPGNiupIq3Agt6T1ctY7XULuu9bDYun+TZoNeMmWO12c93j+r10z7iUrgDRDUEaQ1jh6BJJVR060NA5cXi6z1D/85Va3op8+XVa2ap6tzB8JSFNwmr0Iw+omgjVHhlvKgnSpdB09vwPQ91nC1+ylKK5Ml4a/hZydLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8yVSHiO; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8yVSHiO"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-408d14c7ebeso4255845b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268276; x=1750873076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5aw8HhvYF7rtQGj4otJAqopWyd24EowRxeQggi5V7c=;
        b=k8yVSHiOB0PQznNIBi3xJidbqMbt6KdemHz6krtv/wlRCUc7jHGONQFQY5e6zdub4F
         BSzgYUhjYuhnkc7rafoWmtF7WgsncUDSk0mS4pgQe64vsZNVVEOvvFR5KX1zWWdOo1WV
         5zytrCM3oTZI+Brt0VjAIiPiWssSSTjIQ0RMQSO3fIJDXuEgucL8g+WEu7TMXTLUBAct
         oiTYK7tOFlh0A1FrcWDwMuoyCHmwtm/5to4+vqJ9K5AM9F6DzNexnfAIaTgax6jcOdrR
         dZHWFEBv5M1FLsLsLWbyWS1YfK1iyzcdcW3UA4rSwvOGu+wkkN7YQa4/Jj+fvhYAOg/I
         QCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268276; x=1750873076;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5aw8HhvYF7rtQGj4otJAqopWyd24EowRxeQggi5V7c=;
        b=lCSWobqrkxpU6gQDKgBRQ6yT9mjuev4+BBFncX2v20zRh27DxKlbCN0jiS3id4w4Px
         RZYR+vDznMkqI/0uG86O9REvZH//QFjpLFiNHijN1tyrSbqpLUSM+VaJK9XPbS9ghcqX
         raVAT1HAU0IQJa7fQC2c0oerWfnvJvh4kzKD6QCvCQULFqgXQGB9TNWMeYajIaCJq6Zl
         izTpEuHx/yAtZWy6x7tFCnTzB0tF1bjs0g7eRxwlwCLsjyrW2VSgZZEnyC9FO5UOB1Ye
         q/7aj30p/oszKSMC4pDT8f7kw0N1I0MqLB0ASFRYltXoBPEbpM+tb5UyFb9jBN5qVqEx
         R9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVsWbsoKdVoQjZ4KIp6/ruyj0CwYcXS+BwhmNR23J8RmgDtPdgTdDgdYajO86RzUgSW3QbR828xSQmA8E1F@lists.linux.dev
X-Gm-Message-State: AOJu0YxjjWyYsspFz1BfUD4bKoPdgF+YpiXwQHM+s9yJyHzb47NBNJnI
	0PTL0Zi+VDRTZMQ5hS7UrDKPsDOV43ilPbQL5CDTdJEEcD+vwB7l0lX2xXgCtdIgGzo=
X-Gm-Gg: ASbGncvZPxurTygTItn2vVomornzeUtYSrarIPRfyzQ+sZvWmSqNWnlqu9JSra4b+um
	bHq3b0Bd9on5LShHV+gfGgF4YAQ3QkCMiyDLfF2dm3gLLcY1moluEDv0hAwP1MR37fdNpgHouDl
	GIkm5tpmiZ08OtR1cbpJ6rQbs/GBZ7zJYztw9e3ZvLlCsw4SptWLQTU8iaoutAo7A617aXjNHYQ
	Lwc650eaawmxL7gA/3vzjxDphg37Si69PbTmAexOlEohbT/wgRuLjUWDzsbJAlwM5Ww/x1ADuyr
	nZvz3A/xn/S9kjdQ9i6U3elnxhExDvR8ZG0BNlYFlPKN8IDp/WfurfS2WLPN6RCsEpnCxA==
X-Google-Smtp-Source: AGHT+IHJf4DIqbuT4kMFEWquKQMMdw0WGjrkTOtMGLhJHqymSh9M3ASnzaQnXSIrz/mcQrHGd0u47w==
X-Received: by 2002:a05:6808:3024:b0:3f7:e860:b5f3 with SMTP id 5614622812f47-40a7c17047bmr12151301b6e.22.1750268275537;
        Wed, 18 Jun 2025 10:37:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a7418b932sm2358659b6e.40.2025.06.18.10.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:37:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:37:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ana-Maria Cusco <ana-maria.cusco@analog.com>, jic23@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
Message-ID: <d6ae8122-ff38-4fca-8e02-f27c7ac2ccd8@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt@analog.com>

Hi Marcelo,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/dt-bindings-iio-adc-Add-AD4170/20250611-101842
base:   4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
patch link:    https://lore.kernel.org/r/48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140009.GdV0BtKr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506140009.GdV0BtKr-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4170.c:1181 ad4170_parse_adc_channel_type() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1181 drivers/iio/adc/ad4170.c

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1170  static int ad4170_parse_adc_channel_type(struct device *dev,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1171  					 struct fwnode_handle *child,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1172  					 struct iio_chan_spec *chan)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1173  {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1174  	int ret, ret2;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1175  	u32 pins[2];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1176  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1177  	/* Parse pseudo-differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1178  	ret = fwnode_property_read_u32(child, "single-channel", &pins[0]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1179  	ret2 = fwnode_property_read_u32(child, "common-mode-channel", &pins[1]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1180  	if (!ret && ret2)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10 @1181  		return dev_err_probe(dev, ret,
                                                                                          ^^^
ret is zero, so this returns success.  s/ret/ret2/.

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1182  			"single-ended channels must define common-mode-channel\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1183  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1184  	if (!ret && !ret2) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1185  		chan->differential = false;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1186  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1187  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1188  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1189  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1190  	/* Failed to parse pseudo-diff chan props so try diff chan */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1191  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1192  	/* Parse differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1193  	ret = fwnode_property_read_u32_array(child, "diff-channels", pins,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1194  					     ARRAY_SIZE(pins));
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1195  	if (!ret) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1196  		chan->differential = true;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1197  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1198  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1199  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1200  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1201  	return dev_err_probe(dev, ret,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1202  		"Channel must define one of diff-channels or single-channel.\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1203  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

