Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F877440B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718012402; cv=none; b=SO/ISU/TvwkkY51J9gUBI92NN7IsaF1fG4WTL2Ew3jhOaCrxCbfmgI4f+VKdjjpA0Yy7oHWT3Pd5bWqEfoRpb0XLn6HNZc0RlxjaI3+xIBRFXqV3pa5IHJNolgEwXI4gigNnZfbjV8eS/TZUqD3pkWaRwbdg37b0t2AOIFqi8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718012402; c=relaxed/simple;
	bh=Td/N4E9UURCdvg10DSgcFTNUdT3qZG8vl6zhjaJaZbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IfAf5//y9CDmPYigQj8dvjxjnB/3ou0Ux1BS955V3loLGPNDTNl9EG7rPxNJszPOuvAs/R/vSoiNmk5gJFCbp2MMZvT16EyA3xbpThmdc4n3CGQcNcOgWRUcl/yqYJeFuaKx34DMnymBUcJebTZ6rcf0cDmFrHGdW3yc4cJov/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQE1p6G4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQE1p6G4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f1c490c13so1543076f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718012399; x=1718617199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ocMM4wK0KoJUr2SNgjlZ+bFq4hxDtEwVWf5fWyCNQzA=;
        b=EQE1p6G4p4rEi/mZbCvVr+e+ZA6Qr2864xeZ3xiYrQTF9Vf25vcyRIgyAfrcF3wY0h
         AQrkUQcKrLhlyJ5ipo1uWSrbd4p9m+71U6iiI6FDz5kmH7xJdFGdZCX8xiJDI/7zxqYn
         9pN85Rui5SLqrYghE42DxE6Wre19JkWv+kD0sZVmPdRDBmrhfHxwjryZpWsewdFAjWrU
         qKgSLyEN7KLrW96MOMTOJBpQhIktI+eMz6lh7mMPna167uaF6EgrT4wc0lsMILetn3gY
         GMgeEbKkNCwyLHAOlQj9D96YSUw9uPtuuQpMnoJqAO2j9StzmfobZn+DvQl8NhJSbQot
         v2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718012399; x=1718617199;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocMM4wK0KoJUr2SNgjlZ+bFq4hxDtEwVWf5fWyCNQzA=;
        b=QL4Fu2sP02lV4JBGQrwlIZiSvxNx3Wyio0SwPWZS8RyDFPxi2EQH3eEsLdrDUz/s+6
         TkCuUmAM7VqFD+s5uzrmn3NC6qeZmFbSZOEEb9JS581nKVmuefv1jXrDUQLwb04/m0y3
         ToFZmiv39jlrAwp+71zYa5VrE0QcnRKMPpDFibyljrcczeqH7fZT+Kh3eajKPe88eGbb
         ARDZabgjIq5hltBuVDvUbLSN2By2em9g0Fl7ZV6+DpCPx5dhtVpohGrZ3jBATmbbm0H2
         mJ6rAw3E1YFSaYJpPHXuujfgv83ULDj7o20479TLeTz22Zj3llAJhTyd7ly7+b8tYd52
         HGTg==
X-Forwarded-Encrypted: i=1; AJvYcCXe503Bg5h9eR7rIVTDa1V9Y9Y0kLJb6qGEtZOs0uzyCUEllti+zonG6Ue9q0lyduykIj93eSP1ZF+P0ilyOy1m/6V+eSEHB+yeYenMjg==
X-Gm-Message-State: AOJu0YzkwWCAdVm+nFocgUvF7HsezFmIsmDrzYus2J9oXWMp5ri6tfYU
	Uv2LlKhPSzieAAHbkc2glxVgMtpERlbFlXLV9vvv1RRl76S4SHvale2kEaJmt1k=
X-Google-Smtp-Source: AGHT+IG9mD8/x+WVTXsrh8hQTA7ERg9+SENT0a0IkJ0cM7ILrlB0FyR88e3665ehddKLwYaoQrystQ==
X-Received: by 2002:a5d:5987:0:b0:355:4cb:5048 with SMTP id ffacd0b85a97d-35efedd95f9mr7952708f8f.43.1718012398839;
        Mon, 10 Jun 2024 02:39:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e567sm136806365e9.1.2024.06.10.02.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:39:58 -0700 (PDT)
Date: Mon, 10 Jun 2024 12:39:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Charles Wang <charles.goodix@gmail.com>,
	dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, hbarnor@chromium.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <030b639e-f5d1-40a2-8980-f436ca686e6e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607133709.3518-1-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240607-214042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240607133709.3518-1-charles.goodix%40gmail.com
patch subject: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101633.1RJnij1Y-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406101633.1RJnij1Y-lkp@intel.com/

smatch warnings:
drivers/hid/hid-goodix-spi.c:217 goodix_hid_parse() error: uninitialized symbol 'rdesc'.

vim +/rdesc +217 drivers/hid/hid-goodix-spi.c

bb11c3a1740813 Charles Wang 2024-06-07  214  static int goodix_hid_parse(struct hid_device *hid)
bb11c3a1740813 Charles Wang 2024-06-07  215  {
bb11c3a1740813 Charles Wang 2024-06-07  216  	struct goodix_ts_data *ts = hid->driver_data;
bb11c3a1740813 Charles Wang 2024-06-07 @217  	u8 *rdesc __free(kfree);
bb11c3a1740813 Charles Wang 2024-06-07  218  	u16 rsize;
bb11c3a1740813 Charles Wang 2024-06-07  219  	int error;
bb11c3a1740813 Charles Wang 2024-06-07  220  
bb11c3a1740813 Charles Wang 2024-06-07  221  	rsize = le16_to_cpu(ts->hid_desc.report_desc_lenght);
bb11c3a1740813 Charles Wang 2024-06-07  222  	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
bb11c3a1740813 Charles Wang 2024-06-07  223  		dev_err(ts->dev, "invalid report desc size %d", rsize);
bb11c3a1740813 Charles Wang 2024-06-07  224  		return -EINVAL;
                                                        ^^^^^^^^^^^^^^^
rdesc isn't initialized here.  It should be declared as:

	u8 *rdesc __free(kfree) = NULL;

bb11c3a1740813 Charles Wang 2024-06-07  225  	}
bb11c3a1740813 Charles Wang 2024-06-07  226  
bb11c3a1740813 Charles Wang 2024-06-07  227  	rdesc = kzalloc(rsize, GFP_KERNEL);

Or it could be declared here instead.

	u8 *rdesc __free(kfree) = kzalloc(rsize, GFP_KERNEL);

bb11c3a1740813 Charles Wang 2024-06-07  228  	if (!rdesc)
bb11c3a1740813 Charles Wang 2024-06-07  229  		return -ENOMEM;
bb11c3a1740813 Charles Wang 2024-06-07  230  
bb11c3a1740813 Charles Wang 2024-06-07  231  	error = goodix_spi_read(ts, GOODIX_HID_REPORT_DESC_ADDR, rdesc, rsize);
bb11c3a1740813 Charles Wang 2024-06-07  232  	if (error) {
bb11c3a1740813 Charles Wang 2024-06-07  233  		dev_err(ts->dev, "failed get report desc, %d", error);
bb11c3a1740813 Charles Wang 2024-06-07  234  		return error;
bb11c3a1740813 Charles Wang 2024-06-07  235  	}
bb11c3a1740813 Charles Wang 2024-06-07  236  
bb11c3a1740813 Charles Wang 2024-06-07  237  	error = hid_parse_report(hid, rdesc, rsize);
bb11c3a1740813 Charles Wang 2024-06-07  238  	if (error)
bb11c3a1740813 Charles Wang 2024-06-07  239  		dev_err(ts->dev, "failed parse report, %d", error);
bb11c3a1740813 Charles Wang 2024-06-07  240  
bb11c3a1740813 Charles Wang 2024-06-07  241  	return error;
bb11c3a1740813 Charles Wang 2024-06-07  242  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

