Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE261E87B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810491; cv=none; b=k6hFNtg+mT9cX4TLRCCaMu7fUmHT1zT6K4asm/tPO03Hcoi0EqV8cLT23oRzjTl8ah2zyLpfZqLT5/Ak7OO2+rWRyKxGSL3SW63eXmTdImZGkfbyT7G5JTOR5dhr+Ewd9CMVdsVHU1bUGoPb+YMbuSVD9npVCiYXp1HTUJhb/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810491; c=relaxed/simple;
	bh=6sY5cyJc0jnNRiM4MzMSW3soHKIy9kpUlZWYU96xtCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h51Nm2yBsuX6vJBWJW5TlbgFVfsj7Vzpyo9HqUXKpgOx1akmCwJR3UEMX9p0Vmj7az9XbovRJoEN0Ivx5RzJhE9opi3bklABhnXyDZ2DMz8/CvXWBwnAgixzpRztbSiRQJLXhiMoK61LxNsIMT9CGu3AFIUU32cmGNicHIpx0G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYYFlF7h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYYFlF7h"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so31090055e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 05:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737810487; x=1738415287; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAGvgsOljIxqqUnQeHNI81x7TBIIT9NusLAHj9xrSY8=;
        b=QYYFlF7hapet1qsVL39NxLDh2Rh/l7Czzq0ecPvtCTaqr7sGseYnA24pyVGlNOjeKg
         S/MtJjty8vKHfuwULUIhFVbR6tr7P+ek5t23ls0MD2LgvDoc/gv2mXjAAmogm0otqKZK
         6GcfHKcbdplqnoIeAQok7NEJKvZieB++O15StZbUtgxd7Ocm3QVRhGVsoDfChtVXZfd7
         6Jj4To8ViCUeXwC/M2jf95QTdaFaBcOU0seQKI1NINhJSaUIL3WRE/qBhwgDX4PeamS8
         I1Q3XlG1Tg5bqOwziL+Nmu4a1rHX8QjKbAeeMUL+VTedniyTbl6TWvqFqZHw3E/hx6Sq
         Ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810487; x=1738415287;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAGvgsOljIxqqUnQeHNI81x7TBIIT9NusLAHj9xrSY8=;
        b=fcGdaigpSXMDY7UVK8031xOnbFojjXh8shJVjhFV1rSGrWX7+8aG+SuQRWYbT+1Fik
         eB/3NuEXM+rq+50HPAyrHmF0SQfEcgkqdLP4A8l2YP6V4qW919GtPJRuhbFCBV5rkngo
         FLrPxRAiUrSzoekVoU3GLCdbECr1RCxwgfP4vj+ck8p3a9ouAOqR0sLIoWER2nD5NSsd
         AfwKDLC5Cva/j5tAOOlMUxvp8u21Co800CElXmwdkOKOC/ifBUc1b0lAu8h/X0DeGqdW
         K5G6AkgSMjjEDqNUvKoY3tcp2TXmxdnnMtRUv3Q1ffOb5tjIT2gBXRfauNp7+qy/RGBs
         LbnA==
X-Forwarded-Encrypted: i=1; AJvYcCWRosTU86Rg7UVB+A3T8NWhS1YLgDLUbKIBd2kRMeF/YyOeMwCUWLbWCxF8YxfgLIjxC4e0EETvF2tVu9jR@lists.linux.dev
X-Gm-Message-State: AOJu0YysYdY7qcA4zEkswM2B5ZWZ4M36i/wrXXB2EBA0NBp69VybrjvZ
	sruuov7I2nWRdlnYOb0MttnNRKoh7VRQpROI+2JXTA4NDVk9lOel4WxqiMwBIU8=
X-Gm-Gg: ASbGncvX77ULJ7Gr3rV6vboP7GAPSYKc2l5I0oUo6NDLD40rtDlPzFIE2ozm96tZaXN
	4ihirg0SjnC6i+8eYNTvhS52e6QJaYLERFY6M5BIpzAiVEEe9bEgHlE3161gcrEboE50vwQIkf6
	/tr/ZaqciA7p6Z32j0XcUoOZ500+jTZODe4FukvKdYcaVbWm0LqIlCz6bF4KA/6JhJRSn/UAazK
	KxnHdPC7/GVpG+MFyKxdpl2gKuZ3JElvmX1XzzxFU5RhPZXyqBkKAYiPcyiBtS3YvdJcibsVJQV
	vpQh/qy0EsWPZXvWKqm+
X-Google-Smtp-Source: AGHT+IFTbsOp9MXX2tvYNoeS6Ugr0YQflFcdLIe/WGLt6GMkazpITSyAtQNNs6vdpz37fDwN6p7W9w==
X-Received: by 2002:a05:600c:3544:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-438913cabedmr287954845e9.8.1737810487227;
        Sat, 25 Jan 2025 05:08:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f0fdsm61254465e9.5.2025.01.25.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 05:08:06 -0800 (PST)
Date: Sat, 25 Jan 2025 16:08:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jsarha:capture-hw-mute-indicator 7/9]
 sound/soc/sof/ipc4-control.c:868 sof_scomp_get_card() warn: variable
 dereferenced before check 'scomp' (see line 866)
Message-ID: <1f3e7076-28e3-49c4-a552-42d674bfaa21@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux capture-hw-mute-indicator
head:   34df55e2634f610fc34f29047badf07ddf41ba2e
commit: 1569062204a940115428cee1c098cc286c23f43a [7/9] ASoC: sof: global-capture-hw-mute-indicattor; Mixer created
config: csky-randconfig-r072-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251110.vdLQOt9D-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501251110.vdLQOt9D-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-control.c:868 sof_scomp_get_card() warn: variable dereferenced before check 'scomp' (see line 866)

Old smatch warnings:
sound/soc/sof/ipc4-control.c:519 sof_ipc4_bytes_ext_put() warn: potential user controlled sizeof overflow 'header.length + 8' '0-u32max + 8'

vim +/scomp +868 sound/soc/sof/ipc4-control.c

1569062204a940 Jyri Sarha 2025-01-20  864  static struct snd_card *sof_scomp_get_card( struct snd_soc_component *scomp)
23f60efe259d22 Jyri Sarha 2025-01-20  865  {
1569062204a940 Jyri Sarha 2025-01-20 @866  	struct device *dev = scomp->dev;
                                                                     ^^^^^^^^^^
Dereference

23f60efe259d22 Jyri Sarha 2025-01-20  867  
1569062204a940 Jyri Sarha 2025-01-20 @868  	if (!scomp) {
                                                     ^^^^^
Checked too late

1569062204a940 Jyri Sarha 2025-01-20  869  		dev_err(dev, "%s: scomp == NULL", __func__);
23f60efe259d22 Jyri Sarha 2025-01-20  870  		return NULL;
1569062204a940 Jyri Sarha 2025-01-20  871  	}
23f60efe259d22 Jyri Sarha 2025-01-20  872  
1569062204a940 Jyri Sarha 2025-01-20  873  	if (!scomp->card) {
1569062204a940 Jyri Sarha 2025-01-20  874  		dev_err(dev, "%s: No snd_soc_card", __func__);
23f60efe259d22 Jyri Sarha 2025-01-20  875  		return NULL;
1569062204a940 Jyri Sarha 2025-01-20  876  	}
23f60efe259d22 Jyri Sarha 2025-01-20  877  
1569062204a940 Jyri Sarha 2025-01-20  878  	return scomp->card->snd_card;
23f60efe259d22 Jyri Sarha 2025-01-20  879  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

