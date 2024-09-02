Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567419E97C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287378; cv=none; b=YgKP72TZgZQEdXaNdtbmsjlMjJS8PsAmsyyp+xmSYJwwd3C7+ZtiywWmQen30tUEwfMOsC1w9Mp95Bk7gcSwQM7Z4i+9pAEcg5EDra6p5+5qUPVZYGl6Rsn7tMMl+4PGoms50damSZn6juA3i6CibgLWTXTNTfYfcMrsVAV4cqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287378; c=relaxed/simple;
	bh=VTcW7mvtuUekxI4xje/K+1Lpkm2t9TmwbvkaP2/wqBE=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eoR/rc2382SMvIsjOKJwcG91QNOeiy+02ZljeMAHmoJ87Wi73aoFl0HFe/mjy5CwgfGa3ae05R8VBBUUNX6cjbqgTFLTCpPUvRdG1dwetLj+SCM3I5Td/ejgmMeulA5lqwhIQ6tj/M5+u5tpFp1gDmNhufl8apMnVrjPGsXhzjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xspvi098; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xspvi098"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f4f2868710so46107141fa.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Sep 2024 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725287374; x=1725892174; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viUHGTpog8UaVRzx+Wzp3kQVyidPoKzv0eH0OK+v9uc=;
        b=xspvi098JGMTgc2+p01XV9fm0J2zFzRotulUz3Orl2UMJgH7PXWX86eBF2CsLm9AD1
         1rp3UGqpkbmFHqVpHE37dDpVMjTt1XKe1tf9OmYZsCoyPgMZiv9/aukpczqyL3WHWxJa
         y8oFBkPifar2GG/euSRs3iEizc9qFC+SFG5rqFQKDscA6/7UJ/proT/m+Osf7CJZdBnB
         WDrUlm9mYgvQBkAXuCSxNG0LrFhV9PbU6XMI4FEKQVrPvcbQaeVyrObQOW0NAO2tXF72
         xIcMpXrH8TK8bC6RUPcGoqDJIm1c4vEqMEXi+IYklvNC1ccifhua9Qq7ZrmX6hjLSAe9
         iWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725287374; x=1725892174;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viUHGTpog8UaVRzx+Wzp3kQVyidPoKzv0eH0OK+v9uc=;
        b=qszgVF+AWbgYcE7Fl5rs1wOP+JHqIczNXmZbAK9a5oJAFUccHDPLe4rwZ3QFPwBE+O
         cTKdcF5gzQ1YRM5snBkfhuNADcibdxAvq9Vi5GOKRK3+z6N8AAchgMU0cxobi8wAdreh
         zhtuYfp2nw1KXSe+BeWY8ggQeFl8RTC51lHXifZup05ckfb945pT9Dbz0TkWChAb5UR2
         yha8ZrV0ZFS0G2QvS6D10ULjgXUWVuLlZ6nUHtuWMjbKOgevGk5ccHpMA3nXbMeGBA8R
         ls9ULkgwrHpWbb2eJsuintrz3SczWxMge33CjKUKrAKpLFj40VJ2s9FG+7Caj5VC2Y2/
         9uUg==
X-Forwarded-Encrypted: i=1; AJvYcCVfq8xtaihN62GHI1ANfQ5PycL9bPuZZzVHlglDNTtz0TcdYKa66epX90392QYwr7sZl+PNNv6H5fN9RLhz@lists.linux.dev
X-Gm-Message-State: AOJu0YwRr6AXf4EP0teH39kFBmokJKP1us91fjvppTK4fHGXNV+RX8q9
	Waa32ZTyIFMHomU3XyTvYIR89EMpy0pgNZK94wS46gKmM4zHTIJYBHFsVyN134s=
X-Google-Smtp-Source: AGHT+IETKd6dva/yhJN6nqr5FhIDGDTrlIBESejHLhfAr3F52FcNPA0YlIIt21PfiyOw4JYZlHmtmw==
X-Received: by 2002:a2e:be93:0:b0:2f2:9dc1:af33 with SMTP id 38308e7fff4ca-2f64440e709mr1679201fa.19.1725287374018;
        Mon, 02 Sep 2024 07:29:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c2502f86ebsm2322731a12.77.2024.09.02.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:29:33 -0700 (PDT)
From: kernel test robot <dan.carpenter@linaro.org>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date: Mon, 2 Sep 2024 17:29:29 +0300
To: oe-kbuild@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [linux-next:master 6570/8400] drivers/gpu/drm/tegra/output.c:42
 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.
Message-ID: <ZtXLyXxew7z6H2bD@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: 98365ca74cbfae16b793b62a7ecabb5be8d77785 [6570/8400] drm/tegra: convert to struct drm_edid
config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409022236.7pEcEksT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409022236.7pEcEksT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/output.c:42 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.

vim +/drm_edid +42 drivers/gpu/drm/tegra/output.c

132085d84fca65 Thierry Reding 2014-11-28  21  int tegra_output_connector_get_modes(struct drm_connector *connector)
d8f4a9eda00678 Thierry Reding 2012-11-15  22  {
d8f4a9eda00678 Thierry Reding 2012-11-15  23  	struct tegra_output *output = connector_to_output(connector);
98365ca74cbfae Jani Nikula    2024-08-22  24  	const struct drm_edid *drm_edid;

There used to be an = NULL here.

d8f4a9eda00678 Thierry Reding 2012-11-15  25  	int err = 0;
d8f4a9eda00678 Thierry Reding 2012-11-15  26  
acde541324dcfe Thierry Reding 2014-01-13  27  	/*
acde541324dcfe Thierry Reding 2014-01-13  28  	 * If the panel provides one or more modes, use them exclusively and
acde541324dcfe Thierry Reding 2014-01-13  29  	 * ignore any other means of obtaining a mode.
acde541324dcfe Thierry Reding 2014-01-13  30  	 */
9be7d864cf0763 Thierry Reding 2013-08-30  31  	if (output->panel) {
06c4a9c2ae606a Sam Ravnborg   2019-12-07  32  		err = drm_panel_get_modes(output->panel, connector);
9be7d864cf0763 Thierry Reding 2013-08-30  33  		if (err > 0)
9be7d864cf0763 Thierry Reding 2013-08-30  34  			return err;
9be7d864cf0763 Thierry Reding 2013-08-30  35  	}
9be7d864cf0763 Thierry Reding 2013-08-30  36  
98365ca74cbfae Jani Nikula    2024-08-22  37  	if (output->drm_edid)
98365ca74cbfae Jani Nikula    2024-08-22  38  		drm_edid = drm_edid_dup(output->drm_edid);
d8f4a9eda00678 Thierry Reding 2012-11-15  39  	else if (output->ddc)
98365ca74cbfae Jani Nikula    2024-08-22  40  		drm_edid = drm_edid_read_ddc(connector, output->ddc);

I mean presumably either ->drm_edid or ->ddc is true, but you can see why the
checker complains.

d8f4a9eda00678 Thierry Reding 2012-11-15  41  
98365ca74cbfae Jani Nikula    2024-08-22 @42  	drm_edid_connector_update(connector, drm_edid);
98365ca74cbfae Jani Nikula    2024-08-22  43  	cec_notifier_set_phys_addr(output->cec,
98365ca74cbfae Jani Nikula    2024-08-22  44  				   connector->display_info.source_physical_address);
d8f4a9eda00678 Thierry Reding 2012-11-15  45  
98365ca74cbfae Jani Nikula    2024-08-22  46  	err = drm_edid_connector_add_modes(connector);
98365ca74cbfae Jani Nikula    2024-08-22  47  	drm_edid_free(drm_edid);
d8f4a9eda00678 Thierry Reding 2012-11-15  48  
d8f4a9eda00678 Thierry Reding 2012-11-15  49  	return err;
d8f4a9eda00678 Thierry Reding 2012-11-15  50  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
