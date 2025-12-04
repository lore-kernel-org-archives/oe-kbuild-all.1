Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D7B32572B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836754; cv=none; b=RmRLfXWVUSAwkT3HADpCyCg9Hn5O7Q072o7qfT0kO/t9ISCY6FMhyw2HBzFNiwxJbG5nEUmPTBWsgleW1U6nkMmy7M0wtPawxOFZCJEJiaIi9uE+bL+RGFtECl7LUw+7BsqBowXQX7cewMguqhMcAqEEjKHR0dv66UXCO8JIBKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836754; c=relaxed/simple;
	bh=OtdK3gQ1XN6eX93J0iKVYJw5PHEEjT6iMc8Dc0XV9Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LzDEniGNEpGJ41C2TCaQvgLXOmJODGvxnHwzy2mzOs//eFDJSscoBj5mQCVPW9uEmnzNQJF1oqXS/SIFTtp2moNDEONs6oXKqoGJ9fQ9VVbDYZQmqV66XXTcyAADERNjk7xaWmnVWYsEbYm2hFDRnb2aORUZImU4bowEhwMRG0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tP6UQImN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tP6UQImN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e08b27eso284587f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Dec 2025 00:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764836751; x=1765441551; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LQ4deDu2Meder/E3u1q2UwJGtT40AuQX8y3SfWXWIf4=;
        b=tP6UQImN2cfHKbex3fk1IDVrVi1naS/kAdjDjgwFattxGxqjONU3u7qRI43kFV7JDH
         bPWmhgRmYQMCAFZdk1ASsi4YNnjytq9E8ct0BWBHdGO1eWbi3gvkizjYBSkjw+FBG7fW
         EJq4JMiUYg0g+OR7nmS/CzFNOn0IJsuE2oXmhgDtFoyha+swLhy4geZG4Vw1wClgR6Fi
         +eCLSG4B9v+DkOYeSjQiI8U7ccH9mV8LEYnDbcukTqxCvdbMfwfOlbOlAFucurTuutzp
         t7vA2qrH2FgmXhOJt1U41m/AZ3IagTGcTDUfLNBH21HCA67/Lx/pHxn6EOf22gEFCLP9
         vYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836751; x=1765441551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ4deDu2Meder/E3u1q2UwJGtT40AuQX8y3SfWXWIf4=;
        b=H2r8NI7UOKrUvL8Q84oAc8WbDoImrRfZaJRfGrGXVYALbc7guPwN+Nr/y7uywlIpF0
         TzLGc6QsQJC8zyqieFtbCV8yPWGWBsch+fBbKfzoupaDpEIBpU3ped6ovssNd3UP7a9W
         EaF3xfanJ19ortamGzsdKUOeB5wAq0L+zUMzB2a2gM7Z1N7duiglcSDA2BI9JCzZYQ9B
         w3tbPy14FPtqC+GhjmhdQj/xCwrvoKeJCV2PkdDXeg1F8yCc8BLkUZY6BdDAlT1ZdCu4
         0YBetxpdSfAlkpU40z2aFY8MkDiQvJtY1MyKhlgUb55FG6r8WtM3ZAKgS8djRXuyPRpa
         CKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWXl5HfbTj4OPrDk1SGg8yDkce/aLQrrwYFfY0xtXddYXNrnSWd5P0IQ7mIOn+FjPbvF9m+JzhJVfxStd5u@lists.linux.dev
X-Gm-Message-State: AOJu0YySEzkh6nxbvLuG3arMAaTxK0/x4qmmws2hXg+kHbOLc/Zlcbjl
	03PLGxuStOK9Wj3+M6XbCXm2c24sjxxN6Bq8AMPATiaDJeAqB6VKfZByw8cji6C55PU=
X-Gm-Gg: ASbGncvowIMLIR3r6huSfjK/1B3t946T7bezykxCE8Q34lc5TbsHzSVrqfXvDuhoeUi
	NY6WAtnb/MZA1z5TnMQpD+IhnMzCRxFB7TVNPrZ9Sg3aj5vz0LjP+L4Od6/2ctOp1iFniMT+PDT
	6anMWH340N8LnoAf/yqhVr1Z/CRZgTuwuqkoOgMS7uZJpXUo9ZLAVSyBq7Bwocen7D8v+05FC0e
	q92UK6N8YVPgs/Ru6CYsZlgtIcjaxW7mlzFJw6WlyvUBCcXhKEJsewFbcf+8YuVaHXCyS+A8QEB
	kbclDePksAyZNMptwk3llZ1/ybv5l75m0/0Yqmnrt718g+cbG8kbkJqd0cwvDEDyDQK+0ySCtiZ
	lJuTUzITflTjYSh/Uwl8V77HT7P/YJm70v6vbeUGRcRGtnZnFceGiMCoE02qyOnOliTrcwquDOT
	guzi/ZdBxe/Yk/0MYd
X-Google-Smtp-Source: AGHT+IFqPjsWxMKuAwr/tYTZtrbROcoydreYmSrR+FokvUIODLoD32s0/Ejyc9FIKKndz+AO6vzyDQ==
X-Received: by 2002:a05:6000:1889:b0:42b:41dc:1b5d with SMTP id ffacd0b85a97d-42f73187286mr5177890f8f.25.1764836750665;
        Thu, 04 Dec 2025 00:25:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d2231dfsm1807493f8f.26.2025.12.04.00.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 00:25:49 -0800 (PST)
Date: Thu, 4 Dec 2025 11:25:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, sunpeng.li@amd.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com,
	Nicholas.Kazlauskas@amd.com, simona@ffwll.ch, airlied@gmail.com,
	Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
Message-ID: <202512041153.nYks4oYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201231807.287414-1-sunpeng.li@amd.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20251202-072501
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20251201231807.287414-1-sunpeng.li%40amd.com
patch subject: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
config: nios2-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041153.nYks4oYu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512041153.nYks4oYu-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_vblank.c:1527 drm_crtc_vblank_on_config() warn: variable dereferenced before check 'crtc' (see line 1519)

vim +/crtc +1527 drivers/gpu/drm/drm_vblank.c

0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1516  void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1517  			       const struct drm_vblank_crtc_config *config)
3ed4351a83ca05d Simona Vetter 2017-05-31  1518  {
3ed4351a83ca05d Simona Vetter 2017-05-31 @1519  	struct drm_device *dev = crtc->dev;
3ed4351a83ca05d Simona Vetter 2017-05-31  1520  	unsigned int pipe = drm_crtc_index(crtc);
                                                                                           ^^^^
Unchecked dereference.  I'm pretty certain crtc can't be NULL.

d12e36494dc2bf2 Ville Syrjälä 2024-04-08  1521  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
38bd1e412d0aa4b Leo Li        2025-12-01  1522  	int ret;
3ed4351a83ca05d Simona Vetter 2017-05-31  1523  
5a4784f49b2dcff Sam Ravnborg  2020-05-23  1524  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
3ed4351a83ca05d Simona Vetter 2017-05-31  1525  		return;
3ed4351a83ca05d Simona Vetter 2017-05-31  1526  
38bd1e412d0aa4b Leo Li        2025-12-01 @1527  	if (crtc) {
                                                        ^^^^^^^^^^^
So this NULL check is too late, and can be removed.

38bd1e412d0aa4b Leo Li        2025-12-01  1528  		ret = drm_crtc_vblank_prepare(crtc);
38bd1e412d0aa4b Leo Li        2025-12-01  1529  		drm_WARN_ON(dev, ret);
38bd1e412d0aa4b Leo Li        2025-12-01  1530  		if (ret)
38bd1e412d0aa4b Leo Li        2025-12-01  1531  			return;
38bd1e412d0aa4b Leo Li        2025-12-01  1532  	}
38bd1e412d0aa4b Leo Li        2025-12-01  1533  
92cc68e35863c1c Lyude Paul    2020-07-20  1534  	spin_lock_irq(&dev->vbl_lock);
02149a76d32bd8f Sam Ravnborg  2020-05-23  1535  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
3ed4351a83ca05d Simona Vetter 2017-05-31  1536  		    pipe, vblank->enabled, vblank->inmodeset);
3ed4351a83ca05d Simona Vetter 2017-05-31  1537  
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1538  	vblank->config = *config;
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1539  
3ed4351a83ca05d Simona Vetter 2017-05-31  1540  	/* Drop our private "prevent drm_vblank_get" refcount */
3ed4351a83ca05d Simona Vetter 2017-05-31  1541  	if (vblank->inmodeset) {
3ed4351a83ca05d Simona Vetter 2017-05-31  1542  		atomic_dec(&vblank->refcount);
3ed4351a83ca05d Simona Vetter 2017-05-31  1543  		vblank->inmodeset = 0;
3ed4351a83ca05d Simona Vetter 2017-05-31  1544  	}
3ed4351a83ca05d Simona Vetter 2017-05-31  1545  
3ed4351a83ca05d Simona Vetter 2017-05-31  1546  	drm_reset_vblank_timestamp(dev, pipe);
3ed4351a83ca05d Simona Vetter 2017-05-31  1547  
3ed4351a83ca05d Simona Vetter 2017-05-31  1548  	/*
3ed4351a83ca05d Simona Vetter 2017-05-31  1549  	 * re-enable interrupts if there are users left, or the
3ed4351a83ca05d Simona Vetter 2017-05-31  1550  	 * user wishes vblank interrupts to be enabled all the time.
3ed4351a83ca05d Simona Vetter 2017-05-31  1551  	 */
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1552  	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
5a4784f49b2dcff Sam Ravnborg  2020-05-23  1553  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
92cc68e35863c1c Lyude Paul    2020-07-20  1554  	spin_unlock_irq(&dev->vbl_lock);
3ed4351a83ca05d Simona Vetter 2017-05-31  1555  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

