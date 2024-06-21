Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B07136E21
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952331; cv=none; b=b8VHHxGC4wgk1N3Q6Ul86BW6bkPVEwmOespZzrdxF5d0A/MrRWOozc4mWdmguxl4FMcgopTHrER/kFEM3gWbZceDU8k/CoSYIcKT91/Iyu7G9su7iBlOkwAtbeWlnvV2nZ3iNHFOQI/gdWs7LwZn8eTKlyx/NIVrMD8KK3CtawA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952331; c=relaxed/simple;
	bh=CpakMGBjVArJKEohlvyKPx8MWVCmNQuSsutsRiluHbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bwCt97xupfbJ5eJUUTaUkwfxieDgjH1vawCp4YYv5qgjvjVEbEDAOzMO0DHtSyxrs1+X9HvFfSONGvmUatvehTdjKkpT5d9Dj8cwDlyPRowrZ3iaUCW9Xl909S+3Ic2whhTWjFV4FIC8+WJDI8ULHKiinBHY46vjbOGEiL87Qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPOvWivc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPOvWivc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f7720e6e8so190688766b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718952328; x=1719557128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LOYpscBQcVLtcb6ya8dy1caHHgeSBmzhIDNmZBhcMlI=;
        b=TPOvWivc9d8BTvUEdrKpfreU46ulsEsUuidGGhtuD+MO/ITmcz2o1IQ1WkmJnS17Sf
         ipyj8cdblPLWBhRwrZzB7dkHZlHvJ3VciFNzX4zonmgd/wwrhYReX5602p2AdbrO3sw6
         7KQd58wEYqf60QKcpzPUl072uZsDg1nZL2qr9CLe78JWLD4eljdKVuTlfond4XreNcUU
         yYmQl5DFYDEtTgq0M8B1+ps6HvWBEwIvkbbbOAQJ71bijTVRvBDaok9E3JQBweaEir3+
         9mFdlo6SQ3KDpqtN+cEF/Y1uawmSaroh1ezr1SIc2iqygvmIG4+Uh3MpHd7dv2GAQz1v
         o6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718952328; x=1719557128;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOYpscBQcVLtcb6ya8dy1caHHgeSBmzhIDNmZBhcMlI=;
        b=ehB45qJZRavwrSPk4RzjXaAoWFYKVrWuy+nQWod+6aTjKX7kxNoN4n02F+miYtq8XO
         Uyu+gb4evOWC8XTJ9h5v7LE6hLO3f4Ao9mvzd/GDLxlEJZ0Sv578YeERgXuPAWs+AcxC
         9uC/AX5U1Y71j4B5Kynd6LlqJ3E8A2nGfbj8Ro5NG/TYpc8fmRD56yN8oNBQETSAVqY2
         bLt8PNQEiCCMPXqvF7dV39FkVHgbYtCg9mEnh15lIX8Vg8u2ZgC4RwWFq+qDEXtK7fpP
         TsWgnXyXWn+27ryTXfYAxO6YtO6OsotlTpcURMj4K0Bdadoumhc8rMRZNmtUG7EaFIu/
         EzTw==
X-Forwarded-Encrypted: i=1; AJvYcCVb3zYABzXDffzeu4evPJPRfKLNh11cifmHlfkT9WcX90a7HwxunlUiES9n95RZDTgUPH6L7wrXgK+UsX9RoEYqs14E+bHyPUxbBo0T7Q==
X-Gm-Message-State: AOJu0YwuZjuUQ03NNW0IU/MRbZryXHo90kJQjj8ogG7L5/x7UkhbmTDr
	hDcaKAzFxKl3vtN8fq7NfLausSNimBfSuQknNQIM6g4G/0SnPep43r3KU4eFN60=
X-Google-Smtp-Source: AGHT+IE/RW1qpDBHJvcW0UivXwa6iqk3KIN1A0ymm7K1Pe8/Mtu6FQAOmwoZl7dSUg6M4QXhNlB/5A==
X-Received: by 2002:a17:907:874e:b0:a6f:ab9c:7779 with SMTP id a640c23a62f3a-a6fab9c7942mr627533266b.9.1718952328231;
        Thu, 20 Jun 2024 23:45:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560908sm48090766b.184.2024.06.20.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:45:27 -0700 (PDT)
Date: Fri, 21 Jun 2024 09:45:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hironori KIKUCHI <kikuchan98@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for
 configuration
Message-ID: <dceac1a6-25bf-4d04-a049-4c67846027f2@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618081515.1215552-3-kikuchan98@gmail.com>

Hi Hironori,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hironori-KIKUCHI/dt-bindings-display-st7701-Add-Anbernic-RG28XX-panel/20240618-161849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240618081515.1215552-3-kikuchan98%40gmail.com
patch subject: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for configuration
config: i386-randconfig-141-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210841.Q17G5ISz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406210841.Q17G5ISz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-sitronix-st7701.c:1076 st7701_dsi_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1076 drivers/gpu/drm/panel/panel-sitronix-st7701.c

433b7d46874577 Hironori KIKUCHI 2024-06-18  1062  static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
433b7d46874577 Hironori KIKUCHI 2024-06-18  1063  {
433b7d46874577 Hironori KIKUCHI 2024-06-18  1064  	struct st7701 *st7701;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1065  	int err;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1066  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1067  	err = st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
433b7d46874577 Hironori KIKUCHI 2024-06-18  1068  	if (err)
433b7d46874577 Hironori KIKUCHI 2024-06-18  1069  		return err;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1070  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1071  	st7701 = dev_get_drvdata(&dsi->dev);
849b2e3ff96982 Jagan Teki       2019-01-25  1072  	st7701->dsi = dsi;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1073  	st7701->write_command = st7701_dsi_write;
849b2e3ff96982 Jagan Teki       2019-01-25  1074  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1075  	if (!st7701->desc->lanes)
433b7d46874577 Hironori KIKUCHI 2024-06-18 @1076  		return dev_err_probe(&dsi->dev, err, "This panel is not for MIPI DSI\n");
                                                                                                ^^^
-EINVAL?

433b7d46874577 Hironori KIKUCHI 2024-06-18  1077  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1078  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
433b7d46874577 Hironori KIKUCHI 2024-06-18  1079  			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1080  	dsi->format = st7701->desc->format;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1081  	dsi->lanes = st7701->desc->lanes;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1082  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1083  	mipi_dsi_set_drvdata(dsi, st7701);
433b7d46874577 Hironori KIKUCHI 2024-06-18  1084  
433b7d46874577 Hironori KIKUCHI 2024-06-18  1085  	err = mipi_dsi_attach(dsi);
433b7d46874577 Hironori KIKUCHI 2024-06-18  1086  	if (err)
433b7d46874577 Hironori KIKUCHI 2024-06-18  1087  		return dev_err_probe(&dsi->dev, err, "Failed to init MIPI DSI\n");
c62102165dd792 Marek Vasut      2022-10-15  1088  
c62102165dd792 Marek Vasut      2022-10-15  1089  	return 0;
433b7d46874577 Hironori KIKUCHI 2024-06-18  1090  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

