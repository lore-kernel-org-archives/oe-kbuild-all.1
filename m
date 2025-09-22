Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED62F37
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520072; cv=none; b=mgnvj3n/QwfXcuU9Crq7gZ/mNDjkbmkiFKlTgUXHJmAPAo/gTeCqKIDupfx6meIa0Dz/pirRtqCN4/9PJTmu2C5qnu9hxTXInBxeIg9F3RgyCric/ZL3w7erV5vgU0PYhoMsfPCOiAf2/C8MlWFRvDQFPV6a+b5CjKJd1om3jQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520072; c=relaxed/simple;
	bh=66NXpnJdGMWhtkztKfRacnh5qc3BolZxDdP0TvJRir8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PMn23sZ22kcgACRbujejOSnsosqjbMnHcPKL1vO8Bs6alvRC7PRLUwRhsWDczGkPNR2ulh2jQDDn/k6OzhG07m5R6LjJj33z8OTLqkTeG8oT8B4mvdVHUi1Rry8PXfG92xWnS6PqMYGnBGHq9IDvJW9Sajp+RRV5JLv4xyY6nvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAVj1GU4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAVj1GU4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46d40c338b8so3158415e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 22:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758520067; x=1759124867; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PgF8X/QknqlL8yTU3Gny95ANJR22ql/Nmd198jD0198=;
        b=YAVj1GU4k10sBN7A1UZzoL5MMj/mIJBNXdbuOpZW2jw/TCl0EQ9ljyViR7N9zLSawA
         KsHgVTR9t2nHQYLBM5h/FMIbHihOBGeBeCwQaEDA0B6auFcfObeh3d854ZMWQQ+kOuYZ
         NRGE4F7OFhA5oS0Yek8/JvIoLhy0BIa6e1r0eN7UMZMeKguHHQ1sRdjlQQ4VJ81TVjNb
         DA4nxHfCmHkjrErmj1uaxZhXHx1fDdw/Vp7Nf1JqiTO7CRwIbwzWu/jnpFg0SaInK15E
         DDjftv/IOht8bKw6dNvSjp6++caWoT3oFoa945C41A/w8Rp3KSnU+7g+yrlnO9Ypb4Gv
         Tlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758520067; x=1759124867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PgF8X/QknqlL8yTU3Gny95ANJR22ql/Nmd198jD0198=;
        b=saGh67nh+KhuafqXcT4qlTH9bsS0EWOVXTVeBiepW3WqeIKAw0/qT1cdtKqaAqyQ78
         UQ6h+IU7g/XERmIQLWHs0siKJ7p0r1oed7+l52TUJ/pCa7BfqB5uEwXIixbGhMoEhE7s
         xHPZHNf24gPITlgFnJ/cA04f39U6W4gjp/UHhs9fZFLaIBEexXq4l4D+xoSLimjENoEL
         7xW98XizVqgIXIAM1KrVEZX0HmfI9XYsCqYeDtx64c1KkcFOW2eOoDfWZ2hmYRgZS7nC
         +U2u/KKePR6XDsdEdlQ/PJ2MNCz2/5/bG1K2b7QWduqcah4FwDIEyMUqPvEZ6uu19ZAT
         WODQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE3rOupUY60JOWF3BTOP6EkkeUspqe9eHbpDMWStSmw/OpXhyvGGNYk/nxSiQUI67rjuWmhXeVqeQCqM9U@lists.linux.dev
X-Gm-Message-State: AOJu0YwVCVRXytDBkEjuMF8Lrtw77vqG1Nc+pS4zl/byRshb7+LgsIjc
	iXNIHHm5vGzRu5bbInKS4t6spYtniwPQTHj6g6ScVl3akv6iXK/7GD2XlsgoAoVGi7Y=
X-Gm-Gg: ASbGnctscoAP6u6AW/f90m3EbjJNZI3fGvMvqfaXwOrarAS8abBUZ6JB6pIsYdhe+UH
	LpfCn+fOg1apSdnYsrHHiVb0Yy2mYD3SEKFT3fMtHsilUpajNw1Pyru8cqXJVd3Soo0tfh9Z2tZ
	eOEOfkLJxyzAtNuoRe/EBiB2BdmdSatYEaVxAJj89J36Vp9nQ8vg+0sYs/kju2GRIqkCQTnIIL4
	/trzi9PK+n5BNKeNt53qRU2iAxQyU65XbaYMI4uwGrAz2f678mFwDaetJ6AgyaEZX30hY0SQXRz
	Z2V9U+VOLuPLRWs1X+G6+5arXROP+Vf6P6MFI3jwgE7JwukIiEc8ziByI5JzojgllCEZBnHMpov
	iw/vcFNJha3+GZTev85m1/7O88IyVmJ3saeNJImE=
X-Google-Smtp-Source: AGHT+IGLJaZqA8B6N5lCxrnKQqccvunxcRo/0Al2H98KlFFEySPCueUYtQV4CEaHF676873fabSWPQ==
X-Received: by 2002:a05:600c:1f85:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-467ec45ff4amr92308585e9.36.1758520067060;
        Sun, 21 Sep 2025 22:47:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46d1f3e1b03sm32067045e9.23.2025.09.21.22.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 22:47:46 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:47:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ruben Wauters <rubenru09@aol.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
Message-ID: <202509212215.c8v3RKmL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250914155308.2144-1-rubenru09@aol.com>

Hi Ruben,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruben-Wauters/drm-gud-replace-WARN_ON-WARN_ON_ONCE-with-drm-versions/20250914-235627
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250914155308.2144-1-rubenru09%40aol.com
patch subject: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
config: x86_64-randconfig-161-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212215.c8v3RKmL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509212215.c8v3RKmL-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/gud/gud_connector.c:597 gud_connector_fill_properties() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +597 drivers/gpu/drm/gud/gud_connector.c

40e1a70b4aedf2 Noralf Trønnes 2021-03-13  580  int gud_connector_fill_properties(struct drm_connector_state *connector_state,
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  581  				  struct gud_property_req *properties)
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  582  {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  583  	struct gud_connector *gconn = to_gud_connector(connector_state->connector);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  584  	unsigned int i;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  585  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  586  	for (i = 0; i < gconn->num_properties; i++) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  587  		u16 prop = gconn->properties[i];
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  588  		u64 val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  589  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  590  		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  591  			val = connector_state->tv.brightness;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  592  		} else {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  593  			unsigned int *state_val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  594  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  595  			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
d00e57106c0d0c Ruben Wauters  2025-09-14  596  			if (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))

You accidentally deleted the IS_ERR() check so now this function is
badly broken.

	if (drm_WARN_ON_ONCE(connector_state->connector->dev, IS_ERR(state_val)))

40e1a70b4aedf2 Noralf Trønnes 2021-03-13 @597  				return PTR_ERR(state_val);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  598  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  599  			val = *state_val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  600  		}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  601  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  602  		properties[i].prop = cpu_to_le16(prop);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  603  		properties[i].val = cpu_to_le64(val);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  604  	}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  605  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  606  	return gconn->num_properties;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  607  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

