Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB99265CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 05:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001591; cv=none; b=MZRc8qPdv0p9znQP6+uczwEI4B3AFNyVvDY4IU6wfAdMRBcx6bheiTIXgP9/dmDLeSTPkN1o1qCmver6uePic9qs+kNPHRaD42XnN0q40GWWYlUi4an0MSbysHImyrJOLEIUwl9N8wlFk/3699DqhEMSaH6e6xh/wiM/4tRfCJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001591; c=relaxed/simple;
	bh=FywVTW+NkJBScWUwmd15Woqfq8DE1jZ960vJHnXScr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FofKGGQ8OgSnSp0B0JOlMj4O1+WGhHGf4ZxKauAq3jDot9MBgLRut7Gy1DTeuI1eRa52dj2qIpnWxm6YYpH7vdBvwegJ13wsDVCHGEW1W4o0zEcLR4cPCTNI+Oy8rvzj592i5LEDYSQNSMADxUPq9efNh/rLF/ZNGxzW7Gn4aHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pmyqb/fs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pmyqb/fs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45f2c4c3853so9095095e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 22:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758001588; x=1758606388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRpDCRaw7BEKyikqEm/KEgdpxjmtpKt/Hv/Bxs3qVwM=;
        b=pmyqb/fsVSg5VivVwGocyvLGkRDFzbLSfK4rz4cc8AM/M3Yw0Vd1Nm0hR4dSCbDRch
         b92M9r6QbWe5hrgjk0YkbOWT7KjKL9tOg8aTb9qNkHGlix85loeWFFIidS5JnHTA06od
         IaHXb6oDX8PB2lfzJj5xNHIHuGJDGCPyTcs2aFJ6AOHtLuCP20Rc7lWYDlyjjZFh0bpq
         4eDShBjJi0LSsSvg0tlH3Lwi8FxT+HQqzOfmizXAoXr9vSZwtQY1zScI738r0jFknWHA
         5rHXFWvi0abPB+DZ3Bi6UgG49ghBYl0dHnnwNDaEdgsIYTvM+Z+uf+NsMyya4PHM4PDe
         OYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001588; x=1758606388;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRpDCRaw7BEKyikqEm/KEgdpxjmtpKt/Hv/Bxs3qVwM=;
        b=jh61pEwyAng6H1urFx0KsPtiaECTuRoXQCD22NYV+rKDpstjAfKxdMW5xQBEUSERp0
         OJNbazCvn7Rxvrp3fY3rkSpiezL/JpCVJgB4++dIS7qNcCw1IDhxwETMUpPOEKwhf3/t
         fRNbGLlbLCxmdeRl9g+UesarLNGLpRrPb9xlQgJXoh4jwMjnVVDxDGYMQ3U5ZJdDcVH9
         EknBAK8zWP1TGNFt1oO4UtzPolhGSpU/YW8oiSGZDuKI8RpzzNv/rwm1Iw/txLn8Me/g
         3UllTqbUDfZwKj1ccOFdGPWnscL5GB/qstLby4Rf1YZP5p4gWR1oHdH/7MaC9CPn91ws
         oFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS9L2Ka2l3Xgh161pENOq8WpsZmcYjrnm/1c2JiONTKFXuULHG4kwSeh6t6o1eE13MfoFlKPNajdDDgGfb@lists.linux.dev
X-Gm-Message-State: AOJu0YzQRUKckek2UFMLLM/VKyDCrmw46qV4WgtQLXv2KnI0t6awWQif
	l9uut6+/dEEEimlObTFI/PVGfQJEP6ZwJaTnHzB7fLE1XJJcXsaTbdl7OYxJVt14DTA=
X-Gm-Gg: ASbGncsI1BMdT9mlFo1uYxcgTK0vogGk/k//mTmcEg8Td3Z727plbUGfc3RtYWEFfqx
	b7UcDkPdiY9sz8L8X+zA+v6/b6mJLfsl36ljObH4UqtRfc4Mu2Ltvp40xBproZaSHnHnYJmlbQ1
	qZRrUTzDS9DU03bEZX9OLJ4Zh+PSrYtDydO11L4fN6hvRncJXtWj1WULtyyTNbwbYC055Cjb7zH
	ifYOMFE2/w9kjCtsNfwI4pZJtBam3gmGRcUHmQRIKZYUr8h/K3pqDthnSOzgcsefqHuuSpQhsqm
	HBrYiHVgG7WpDVyIEwchgj5NIFw4ubom2w7eN6OsvllhJxJ1/+p2JjU8+bBGth4AnyojyGKsLY3
	xAoAvJ3axuYQ52j0Bv9ejX2ks/I4yFLes9BmORg==
X-Google-Smtp-Source: AGHT+IEJMjy+qyIk5xqFocYpNMUmqI1onZLmshq/sOyCOw+IB161XWLjgacwRGHQYXdmBTmZ8cwD6Q==
X-Received: by 2002:a05:600c:58d8:b0:45b:868e:7f7f with SMTP id 5b1f17b1804b1-45f211f856fmr120265875e9.17.1758001588267;
        Mon, 15 Sep 2025 22:46:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e95b111b68sm10476481f8f.32.2025.09.15.22.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:46:27 -0700 (PDT)
Date: Tue, 16 Sep 2025 08:46:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, John Ripple <john.ripple@keysight.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	andrzej.hajda@intel.com, blake.vermeer@keysight.com,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	jernej.skrabec@gmail.com, jonas@kwiboo.se,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matt_laubhan@keysight.com, mripard@kernel.org,
	neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
Message-ID: <202509161344.FPfsjq01-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910183353.2045339-1-john.ripple@keysight.com>

Hi John,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250911-023707/John-Ripple/drm-bridge-ti-sn65dsi86-break-probe-dependency-loop/20250820-235209
base:   linus/master
patch link:    https://lore.kernel.org/r/20250910183353.2045339-1-john.ripple%40keysight.com
patch subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161344.FPfsjq01-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509161344.FPfsjq01-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ti-sn65dsi86.c:1385 ti_sn_bridge_interrupt() error: uninitialized symbol 'status'.

vim +/status +1385 drivers/gpu/drm/bridge/ti-sn65dsi86.c

b8670cf7e6a41b John Ripple  2025-09-10  1365  static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
b8670cf7e6a41b John Ripple  2025-09-10  1366  {
b8670cf7e6a41b John Ripple  2025-09-10  1367  	struct ti_sn65dsi86 *pdata = private;
b8670cf7e6a41b John Ripple  2025-09-10  1368  	struct drm_device *dev = pdata->bridge.dev;
b8670cf7e6a41b John Ripple  2025-09-10  1369  	u8 status;
b8670cf7e6a41b John Ripple  2025-09-10  1370  	int ret;
b8670cf7e6a41b John Ripple  2025-09-10  1371  	bool hpd_event = false;
b8670cf7e6a41b John Ripple  2025-09-10  1372  
b8670cf7e6a41b John Ripple  2025-09-10  1373  	mutex_lock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1374  	if (!pdata->hpd_enabled) {
b8670cf7e6a41b John Ripple  2025-09-10  1375  		mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1376  		return IRQ_HANDLED;
b8670cf7e6a41b John Ripple  2025-09-10  1377  	}
b8670cf7e6a41b John Ripple  2025-09-10  1378  
b8670cf7e6a41b John Ripple  2025-09-10  1379  	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
b8670cf7e6a41b John Ripple  2025-09-10  1380  	if (ret)
b8670cf7e6a41b John Ripple  2025-09-10  1381  		pr_err("Failed to read IRQ status: %d\n", ret);

status isn't initialized on error.

b8670cf7e6a41b John Ripple  2025-09-10  1382  	else
b8670cf7e6a41b John Ripple  2025-09-10  1383  		hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
b8670cf7e6a41b John Ripple  2025-09-10  1384  
b8670cf7e6a41b John Ripple  2025-09-10 @1385  	if (status) {
                                                    ^^^^^^
warning

b8670cf7e6a41b John Ripple  2025-09-10  1386  		drm_dbg(dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
b8670cf7e6a41b John Ripple  2025-09-10  1387  		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
b8670cf7e6a41b John Ripple  2025-09-10  1388  		if (ret)
b8670cf7e6a41b John Ripple  2025-09-10  1389  			pr_err("Failed to clear IRQ status: %d\n", ret);
b8670cf7e6a41b John Ripple  2025-09-10  1390  	} else {
b8670cf7e6a41b John Ripple  2025-09-10  1391  		mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1392  		return IRQ_NONE;
b8670cf7e6a41b John Ripple  2025-09-10  1393  	}
b8670cf7e6a41b John Ripple  2025-09-10  1394  
b8670cf7e6a41b John Ripple  2025-09-10  1395  	/* Only send the HPD event if we are bound with a device. */
b8670cf7e6a41b John Ripple  2025-09-10  1396  	if (dev && hpd_event)
b8670cf7e6a41b John Ripple  2025-09-10  1397  		drm_kms_helper_hotplug_event(dev);
b8670cf7e6a41b John Ripple  2025-09-10  1398  	mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1399  
b8670cf7e6a41b John Ripple  2025-09-10  1400  	return IRQ_HANDLED;
b8670cf7e6a41b John Ripple  2025-09-10  1401  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

