Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197D513B5A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715376024; cv=none; b=Pu3l8M4nKg4mtN73XlWQKUt3tUx3UXDFNIKuYXj/HWh5QnlD9pNvhNoCS7STQAcFOhXEJvSMuLUmUzQcgBG0xzqQekyYsi/a8rCgWzfSMZ5xfgDI8/rFLuMDp6KlER7gF+mQF5vJWMLWNKgwTSnqFY2dePQkWTpv2cwtz3105uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715376024; c=relaxed/simple;
	bh=pz3w4cihh1CVJ907kmGe5qcs1/sHwxX9X7McsjgvhU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKfydQAGJNhQhgg5Hr0pa4cPNX5K8R2KMb+8O3Nk4++/GoMGl+KzpY2SsSTDysiWNuQud2egXXnbx3Y7JxfVgx/DM4DrFDfGLaQd27avwgqfP3e9v4jMJZQf/wc/Y8ZiSFI5jorZjqaPffnTwLdxSiguYOU6eHej7Z4+OCAce5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IdqQHxk+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdqQHxk+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51ffff16400so4115617e87.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715376020; x=1715980820; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZtgybpsOk8M3ZUpSNXMnflIY8sEwLdJ3KkGzqFWvdk=;
        b=IdqQHxk+JM5rjsUxHz+xSWYrgzyt2sdfjaUVWC2p5o/mpna/WCBUeRYAiLY91znk+e
         Z6s626RaGIKQ82OgbCMXSFcAA4IcfDhxV9JI3fZzeSyFtW1YvqKaddgxNKkJrXkRAs6X
         eNNYteqS4hKZUFlmnHSuBeeOPO5ZiujK+RJNoOfcGWR15do2k/ixQj4RMn/yajSRMGBf
         KV3OHjYotKixsJ88+c37hBUZ6Zw756zhJXybsmBR6ELCfI3a8a6FEPfjVHD3Pyrjze7r
         V3jNIj2LYBqo2yY2BrkkYBebriL6MKCnEOJjG1h5v5+HblxPXQ0A3vE8B7ADvCp1+mG0
         hblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715376020; x=1715980820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZtgybpsOk8M3ZUpSNXMnflIY8sEwLdJ3KkGzqFWvdk=;
        b=o++2tIBz5Mn2Dv34TM3ZmCh1lSNt8Kym1QtqtNjpKqtvNkeAjpazY03w9Rjkh3z8G/
         o1jXfON9C6baNgymrY5wVWHHY086ZPboJfR3uknPsfPb+QML6e8zBC9Njb2NMD/UNP1Q
         hi+D/FPSem9bJIpCnh4DXuy4HoSbMXe0+JKdheXPX/dIkwKQVIG6QMDF5rLGs9KPSqbr
         PcRrqiIqu+eCqN1qXH9bR0lnA+IaVpRsHlRDMajggR2sBaXwGzIPSZiMSMI1IrIIM9/w
         ok+JyxPIBB3fujGzTTK76wnptj+C/odF3ONARP6rWPR1X5fz6R1AIpf5P4qd6YWSWyxD
         QMUA==
X-Gm-Message-State: AOJu0YxeQZbAIJEhEpLJ8PL+dJB6oCHznEPpj4YsuieIoUC/IUGW4TPL
	kELgmo/nFPQl+NBSoQaNzUBzcXFG4YNzggo6K8QJR103QG3wk950wEzTPXzcLIE=
X-Google-Smtp-Source: AGHT+IFWIeGQ1M67Zxdkna/4RhYmw4X63n/inheDEsHEKFz7MfBkLl1dffeen00Xy3ERykDugrHwuw==
X-Received: by 2002:ac2:504c:0:b0:51a:df97:cc8d with SMTP id 2adb3069b0e04-5220fd7cc70mr2452686e87.26.1715376020191;
        Fri, 10 May 2024 14:20:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d37f7sm830045e87.123.2024.05.10.14.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 14:20:19 -0700 (PDT)
Date: Sat, 11 May 2024 00:20:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [usb:usb-testing 5/12]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: passing
 argument 1 of 'devm_drm_dp_hpd_bridge_add' from incompatible pointer type
Message-ID: <bq3naqyizwy24qg5zxd3mk3nlu56zm6jvothhc3c2uxllva777@k4aztvs6477x>
References: <202405110428.TMCfb1Ut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405110428.TMCfb1Ut-lkp@intel.com>

On Sat, May 11, 2024 at 04:36:30AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   344f74cf531d90245e1296b3ffbaa7df99dd18f6
> commit: 718b36a7b49acbba36546371db2d235271ceb06c [5/12] usb: typec: qcom-pmic-typec: split HPD bridge alloc and registration
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240511/202405110428.TMCfb1Ut-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110428.TMCfb1Ut-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405110428.TMCfb1Ut-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: In function 'qcom_pmic_typec_probe':
> >> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: passing argument 1 of 'devm_drm_dp_hpd_bridge_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
>          |                                          ~~~~^~~~~
>          |                                              |
>          |                                              struct device *
>    In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:21:
>    include/drm/bridge/aux-bridge.h:36:71: note: expected 'struct auxiliary_device *' but argument is of type 'struct device *'
>       36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
>          |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> >> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:15: error: too many arguments to function 'devm_drm_dp_hpd_bridge_add'
>      113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/drm/bridge/aux-bridge.h:36:19: note: declared here
>       36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

There is an error in include/drm/bridge/aux-bridge.h in the definition
of the stub. I'll send a patch.

-- 
With best wishes
Dmitry
