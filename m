Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFEA329E6B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192452; cv=none; b=aYAEnCWEk+NHDZ7gdu6AJspK95s/inw4My6jKT6tZg9x/ocpY2bbev6hwKdcCiO+eXTFArE77T4peHOdeBjDka/39UmhKDDCuOlX1l0OoRccJhw0o9mGCejqwgc2bXacbZ1KIUtsSXs/nPsaDoIEm3bazVd9t+q4fVS8A+jJZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192452; c=relaxed/simple;
	bh=Hpd11Qce3K0sAdGPwWx4jlL1XK202/cqdnbo4q1+/lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1bZc6s4Tha+q2k+ji/LsAfgKWJMVte0w8la+M6s7v7XJ9pxqmN2MlFkBzISC4JUfLnLk162bIRaygeQ3qCxxqDQzl374Nqb+SHSoXdBUD9q2nAPDrulEhXVQvkdNr/4FC8kd93CK/bHbgNl+8f6c9gD517gHbojK2wkJpcZ1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9R2UXYT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9R2UXYT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483770e0b25so17008205e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772192449; x=1772797249; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trKEZykxB+kKVxup9W5xNfloninxPoc9C7n5gXHkqcY=;
        b=i9R2UXYT7c+4+SlJkfUZuL2CCeymoBS9iqIks0Rsc/58GA8+9fcU7FpqhrdoLVbJnw
         dzIjU/azxneem4bjdXJsZvsaFSO8omrFlnirL9o4ANqxlLvuoB2QbswfRqhWzmtrGnBs
         K4OuwoGa5lvPscUnqk6z8CxuOMpWU93X5DKYjywHHDwWKM6Eub0dBbcXy/Bovi5uM0/U
         J5sb3LXlpGGNN9blw0OQHExMBokykNL2RlcGEwgfN2iJtmfD6vsaI9PM8VQSYLMLeEpO
         9SRk8rYlrEZggky9nbNF7NlWdG/ye/UPBZQ325sCWuGx06WLFtka2RwWjfgdSlF/6cac
         uZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772192449; x=1772797249;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trKEZykxB+kKVxup9W5xNfloninxPoc9C7n5gXHkqcY=;
        b=F66iGahv73fY/1ZxfgkgLdcYUhO5UfjEbCOR0Ls75YM5ajTirHdq/HhCWc4qxsnu+T
         QDZ7zXCOV6bWpWLjI3fzmuQ/thiN+hzOEGHhtB8Os8dJR5yf6c2AF6UnNUtRTVcRicz2
         +UAQULRwlN9x57yMolGPWzzDCGYly2g7Do1qT0M/Dk9HX2iPCSpu8xTMQtwbV1Efkznl
         ZGQw37cVAx6bDxvP71XZigKk4hCOiE1ZDR+5QSPxxZSzPXZ3/e1yDJW2A0GmppGzZfKa
         6FUu7yEOdeg+0b2hkxYI9kzVCAHvId0bTQe1I5JxEZBBbBni1Rzr4+WL/szMC1956fuG
         ekSw==
X-Forwarded-Encrypted: i=1; AJvYcCWhmz7yfEOzHq/XNVjOQD/obfdWHEPCjWkD0NcrFAzhytsM5y0KyIMbo0Z6/YKMJdnEUs0U50Cpyo7rIT+M@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1TtJvN+OwPbLy8oYuhycDuAuY6dIAopjZ7De3nJKhBasJ/6Hf
	B2i9AQSsw8Trj3FWSCHjjdEnq0EL+lOLsLbUPsZxDmQzzY4Tvw1BZoPu8UXo1fQlYTk=
X-Gm-Gg: ATEYQzzI38SI0avGeF9ox2CLvt5snIlEmFeYdvyWZyr3sczqbrHHxgs9eONTrayIKMI
	708Y8yZiq6WKpK8bwNM31qaBOLissI32/ZOmQGY3NPKVlPb/Kbc71QtF8kWL/2TpOUCkc3eF4/p
	qSKyG2mhpPgFTnxoz7Vj3D8Bp7j5pb6vIZ/Xnbvc68qpLA50Tcpq4xC5ePuiD5VNiQyrvo8HmNT
	e/4VNsRUJTJnKBHngn9JBEAx3pDQ+gx6J4O/Ev7CJ87p6MLHc/6hKrZjTaXGn/9yaJ6bmnUDzvH
	cAwCJ0PqzwEMzpC0tqpYI5kUxhtXKqsTIX1AiZXNdmeLgp5bzRdl/YrvDB/3FXAFkOQqYjhi3yt
	wpAWZEws/NGsUtFTv9fA29lffm3PL6g36HHvLBMaDWGaAg5gwMVUbFzKlPAVH71VcgOyuLLsmQx
	ies2l+d92QAMmleMcaSywjppIqyjCl
X-Received: by 2002:a05:600c:3b22:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483c9c2d29amr35477115e9.30.1772192449143;
        Fri, 27 Feb 2026 03:40:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm232406355e9.9.2026.02.27.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 03:40:48 -0800 (PST)
Date: Fri, 27 Feb 2026 14:40:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [linusw-pinctrl:devel 16/22] drivers/pinctrl/pinctrl-cy8c95x0.c:1325
 cy8c95x0_irq_setup() warn: passing positive error code '1' to
 'dev_err_probe'
Message-ID: <202602271847.vVWkqLBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
config: x86_64-randconfig-161-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271847.vVWkqLBD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing positive error code '1' to 'dev_err_probe'

vim +1325 drivers/pinctrl/pinctrl-cy8c95x0.c

e6cbbe42944de9 Patrick Rudolph 2022-08-16  1309  static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1310  {
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1311  	struct gpio_irq_chip *girq = &chip->gpio_chip.irq;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1312  	DECLARE_BITMAP(pending_irqs, MAX_LINE);
970dacb3b9f0fe Andy Shevchenko 2026-02-23  1313  	struct device *dev = chip->dev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1314  	int ret;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1315  
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1316  	ret = devm_mutex_init(chip->dev, &chip->irq_lock);
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1317  	if (ret)
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1318  		return ret;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1319  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1320  	bitmap_zero(pending_irqs, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1321  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1322  	/* Read IRQ status register to clear all pending interrupts */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1323  	ret = cy8c95x0_irq_pending(chip, pending_irqs);
014884732095b9 Andy Shevchenko 2026-02-23  1324  	if (ret)
014884732095b9 Andy Shevchenko 2026-02-23 @1325  		return dev_err_probe(dev, ret, "failed to clear irq status register\n");

cy8c95x0_irq_pending() returns true/false not error codes.  This was a
bug in the original code as well, but it only was detected because of
the conversion to dev_err_probe().

e6cbbe42944de9 Patrick Rudolph 2022-08-16  1326  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1327  	/* Mask all interrupts */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1328  	bitmap_fill(chip->irq_mask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1329  
f5d620254c9787 Andy Shevchenko 2022-09-02  1330  	gpio_irq_chip_set_chip(girq, &cy8c95x0_irqchip);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1331  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1332  	/* This will let us handle the parent IRQ in the driver */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1333  	girq->parent_handler = NULL;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1334  	girq->num_parents = 0;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1335  	girq->parents = NULL;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1336  	girq->default_type = IRQ_TYPE_NONE;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1337  	girq->handler = handle_simple_irq;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1338  	girq->threaded = true;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1339  
970dacb3b9f0fe Andy Shevchenko 2026-02-23  1340  	return devm_request_threaded_irq(dev, irq, NULL, cy8c95x0_irq_handler,
1ddee69108d305 Andy Shevchenko 2025-01-17  1341  					 IRQF_ONESHOT | IRQF_SHARED,
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1342  					 dev_name(chip->dev), chip);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1343  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

