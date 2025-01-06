Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04930159596
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157371; cv=none; b=omsuaAx3x6tTF7EXeL7rhqC/T5q0Dk81Bhjy5IG94xEgfB2H3c3lhZ4A54M7WwJAwc856vD7r4GpwqXPvJ7ZEXC3qg0WdLRB2KpbWw+aBix+15m7kpn3bjB0pixwz03I2eIUsnTtLa1l0F35InVXUjTnTbK8J0LA+mzSEdRJ7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157371; c=relaxed/simple;
	bh=g/OoJEckbiVwHqoVZ/DJIoLLvVB6DKWKjEkArqzX77U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HwFgquYAdR8ZFS7uT6H9ok3FJQQjnVHkzkEzvanYLVBtivHiYlH0/qpQW3TXCuudNv73WhjfrL23L8643CFuVJefV+bhFO+UXsi7X9het22rXrBm7N4o5Lko0CIWSMyNpqTKSbyoel3FLmI/yRpJXOCOtdGZ0AjcgvYjjziSdkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLLzwSl4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLLzwSl4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385dece873cso5198973f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 01:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157366; x=1736762166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPxusyoqlnRrNJq7+ups8OMfqGNcbuHMUJVymBouBjo=;
        b=vLLzwSl4UwsL66tuf/ZcTo2MWaWcwBkyvqF5N+8FfJ31DDX8ZGcASoTctMy5rZX8Vg
         4koCLRumXf3VZMHQqXtpycIgXWHHiS8ZyQphtCyuKi5fnSI+0B9R9CZbrz9251xPacN3
         iy1ft2QBtO3R+XtEKUZFykq22k7yHMWMrlZZxugAl3TMcm666J/kgqx13BlJpn48B4dZ
         to8rezWrbtVLa0ZC8ViMsgP0wnc08D8Gj55rWmANN3ToPJBGLXAwzk5hbzVMZ2WYkeGV
         XrMpRUdjAjjz0PK5zp+TVH6oBxXI+CnZAAjfu7nosFteSgroV7WJQCv7c1+eatI+EEp7
         2hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157366; x=1736762166;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPxusyoqlnRrNJq7+ups8OMfqGNcbuHMUJVymBouBjo=;
        b=XCsFrFVrKHfKbT1VxVu1FPJ7Wbrw4D1Fzp+Q/S71apmInqD02y8cUxL2au5OoI2dn+
         9IOOxWd1EUQ7GExD4L0GUYWprkQElEoSe0R8ewDxxiRzFhzXQH0ebPfcsRXQtnof1pE0
         TjM6YU4LWO8PIAQTcmDQqDml3vkwIloOJhMcZE3KJjdfb9N1iijtW4kAGIPmu9L7jTM1
         9FhjDe0i+/NLIlvaacdmhBoCBQu1yjWY+v9UjtKXAExa1iSrutegTyUtEymjGi1RVBLS
         JPZwZRqwuN8x61OjtFDTYrjm6T7YzhUkXStbdga/5oDRzNu3GWGKZal8OmQM3pXh2uJ7
         dsVA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Al4pn0QMnfqz3Tb0dwIGqUEmxefWNhzHLiqiRmeBHJ3W8PGQ67Kbb5AV7xWJFOWG5wlZQOHAyv1IZDf4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/YW8bKxRPJQdLnpJVxPb+945uRynQ7RHMa0TO/BBwHa5fx+5b
	cmKNTJbc/CLGDB5I4PxR2RFuTDbTVmJrA7JAVHgi1xrUSObYOCEtMtyq0Yfq0RM=
X-Gm-Gg: ASbGnctVgvf5iMsROJhxItiuC97Q08m+w5q57zMsorcabMMTUG0CeP+Y/DZVrN/KaBG
	va4ErG3ODa5hXBsegOqvGyotFXb/ZzWbOddXDgJ+YJojAQrVsoc6HUa30IfgO2tjBedniMzBH7S
	m25uSOhiG6ykaqenjYx03H1TlE13VrfjlIraiP1TB5LULetYnUee3b3EQW5KGpzta+tlNdGx2Db
	FMbOxJ01lejE8QOYBfMFw8laxI0rsQ7FgMicuKkpxAV8qRoPJM+lvQWDtU3Xg==
X-Google-Smtp-Source: AGHT+IGhWRISLmROsfexY/7S1VN3olm0rXAnp4XlnaP5acP2aBFiZteVn7JIK9wCL3+4yp5Vobvaww==
X-Received: by 2002:a5d:6484:0:b0:388:da10:ea7e with SMTP id ffacd0b85a97d-38a221faea2mr45331915f8f.24.1736157366234;
        Mon, 06 Jan 2025 01:56:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a08sm568953115e9.25.2025.01.06.01.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:56:05 -0800 (PST)
Date: Mon, 6 Jan 2025 12:56:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peter Geis <pgwipeout@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Peter Geis <pgwipeout@gmail.com>, Caesar Wang <wxt@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kevin Hilman <khilman@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error
 handling
Message-ID: <e3a5c27e-cab1-409d-b118-7dc96962db36@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210013010.81257-2-pgwipeout@gmail.com>

Hi Peter,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Geis/pmdomain-rockchip-fix-rockchip_pd_power-error-handling/20241210-093424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241210013010.81257-2-pgwipeout%40gmail.com
patch subject: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error handling
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240015.MfjYhpNz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412240015.MfjYhpNz-lkp@intel.com/

smatch warnings:
drivers/pmdomain/rockchip/pm-domains.c:614 rockchip_pd_power() warn: inconsistent returns '&pmu->mutex'.

vim +614 drivers/pmdomain/rockchip/pm-domains.c

7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  572  static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  573  {
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  574  	struct rockchip_pmu *pmu = pd->pmu;
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  575  	int ret;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  576  
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  577  	mutex_lock(&pmu->mutex);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  578  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  579  	if (rockchip_pmu_domain_is_on(pd) != power_on) {
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  580  		ret = clk_bulk_enable(pd->num_clks, pd->clks);
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  581  		if (ret < 0) {
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  582  			dev_err(pmu->dev, "failed to enable clocks\n");
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  583  			mutex_unlock(&pmu->mutex);
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  584  			return ret;
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  585  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  586  
8b579881de295d drivers/pmdomain/rockchip/pm-domains.c Detlev Casanova 2024-08-29  587  		rockchip_pmu_ungate_clk(pd, true);
8b579881de295d drivers/pmdomain/rockchip/pm-domains.c Detlev Casanova 2024-08-29  588  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  589  		if (!power_on) {
074c6a422d86ff drivers/soc/rockchip/pm_domains.c      Elaine Zhang    2016-04-14  590  			rockchip_pmu_save_qos(pd);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  591  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  592  			/* if powering down, idle request to NIU first */
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  593  			ret = rockchip_pmu_set_idle_request(pd, true);
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  594  			if (ret < 0)
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  595  				return ret;

mutex_unlock(&pmu->mutex);

7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  596  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  597  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  598  		rockchip_do_pmu_set_power_domain(pd, power_on);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  599  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  600  		if (power_on) {
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  601  			/* if powering up, leave idle mode */
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  602  			ret = rockchip_pmu_set_idle_request(pd, false);
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  603  			if (ret < 0)
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  604  				return ret;

mutex_unlock(&pmu->mutex);

7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  605  
074c6a422d86ff drivers/soc/rockchip/pm_domains.c      Elaine Zhang    2016-04-14  606  			rockchip_pmu_restore_qos(pd);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  607  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  608  
8b579881de295d drivers/pmdomain/rockchip/pm-domains.c Detlev Casanova 2024-08-29  609  		rockchip_pmu_ungate_clk(pd, false);
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  610  		clk_bulk_disable(pd->num_clks, pd->clks);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  611  	}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  612  
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  613  	mutex_unlock(&pmu->mutex);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08 @614  	return 0;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  615  }
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

