Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBD16E888
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189049; cv=none; b=VDwICJf0s8LlC0hXIm07z4A3H6a0+Yokeqi+8WYk1RxT32oPEy42piyFPHLOfRBrxRFsLcSgzXQBNLon3EzvT5Qp/b/qyXjZ1FKlfJk/4F9ZBS+RB+GPJEUv50fsatzKfuokkRPDDTWq48wubx/ww5VygUCIacwh73GzrlGucqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189049; c=relaxed/simple;
	bh=ihYnzg0Jwy5oKsfaVqwCQlur1yhHXSqhn2i9sV7uLyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg09Ivk6L9BRxtGm16Il8qF3o7q0lCYtAiXoJlHCw0L20QK7W5A6XCyNLs6ZDzfmdoXy5nFoXhiPJT+3E+uY2xGJhW6Oh1wX1mAH0t0y9/ozWhBALGhdN125tqZ1xrBfwtSMaMF+ZnrkdcCY/VnMQNtf9MiZR+axFQJGlbyZi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWABrFFx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWABrFFx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f47f07acd3so61106035ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718189048; x=1718793848; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6T5wUHDK9Ud1tn6iE6A/UW7sJBd/hDQFYaACKKtK/so=;
        b=EWABrFFxgEyPUMUIpf8xcawblv25SxAlOdnUWs/ziHRLLuS9S/Dk3chFhj9dKER7R/
         X1Cc920NL1rjmkpQNxh5CEuCKG+oru2LMGZ9WOri9rBj+CAAAT3wEf+8HWeeB30pvxvx
         ep7sEWk5rQfHdCijBbNQ60Ad5YzHVikeGUwowJlfy8DV0t1nseIzRDWmzLfz9cTRe8oU
         jNujFJMDkrx9FEJerYcAsDmx8764bgdhjgSebgbpz9jxCoInlOreX89wHxO/l+HmFXJN
         PodNBdOHD+38Y0GpnrEpkkKKesBIT7mUHYCZrhuhnqJpvJvzbmimqXH1Pn3qGZFuMGcQ
         X3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189048; x=1718793848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T5wUHDK9Ud1tn6iE6A/UW7sJBd/hDQFYaACKKtK/so=;
        b=mCW6gkTIC9r1/DxJ2uyQaveFBEn5e8plLy2OnqZIp2EHj7pgFWZKH4GsndhMDjo/i2
         aaoW8XNFp1vi2jbC1OxrIjQENUcJcVaA+lZHrTRNhLuL3vtNIj8fVfKtO0badiRLOY2e
         7tOWMHbLV1+ptbJ3BNen37ESWNgUYeXkrps5BsFFT+TeZ3HRRUMkSeDBB+cVqoS8H96b
         IkwjsIE+VPun6T8VzF7dVKMs7SxnjebkxqgPMn8RYOEHemrEgeDyJR2TSmXFMXJMe+w5
         5rfzRN1itJt6x9TPnFvkH78kaqEdAySGzDxw+m1IIswf3QvFrIka4Z7g5qLidKrOM7/F
         Uotg==
X-Forwarded-Encrypted: i=1; AJvYcCVcszbEwIxwIP0piGJU222WQJ7Xd/EFr9/Sam1R7HuY+CPQf1aB7T/WyJ4+XadzJ38JBcxo3OLeTlLmo32KpN5M6TxIfsGLhDDoaJ21rA==
X-Gm-Message-State: AOJu0Yx2q0AcEkptoY57G4uB1ssOtz6XXRTpwoyIjMLU1d8dRN7Lnch5
	rAY/7mGN9Gl/6GwPvIrahHjo4Oz/s9PB+SU1bwfFRkJ/FUh9pTNh
X-Google-Smtp-Source: AGHT+IEuk2yuY72xBZ7txhFszoLKdPFpL4E3w6zMeK9BYeu2yCnMTnCuuYqWZ5cHkHHUsa9EsRj3Kg==
X-Received: by 2002:a17:902:d4cf:b0:1f6:e20f:86b4 with SMTP id d9443c01a7336-1f83b74feefmr15199655ad.61.1718189047756;
        Wed, 12 Jun 2024 03:44:07 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2e60:1ed5:d81b:ef85:e3a0:ec17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7fd943sm119829605ad.286.2024.06.12.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:44:07 -0700 (PDT)
Date: Wed, 12 Jun 2024 18:43:58 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, hbarnor@chromium.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <Zml77pa-rUJtZebV@ux-UP-WHL01>
References: <20240607133709.3518-1-charles.goodix@gmail.com>
 <030b639e-f5d1-40a2-8980-f436ca686e6e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <030b639e-f5d1-40a2-8980-f436ca686e6e@moroto.mountain>

Hi Dan,

Thank you. Dmitry has pointed this out.

Charles.

On Mon, Jun 10, 2024 at 12:39:54PM +0300, Dan Carpenter wrote:
> Hi Charles,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240607-214042
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> patch link:    https://lore.kernel.org/r/20240607133709.3518-1-charles.goodix%40gmail.com
> patch subject: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
> config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101633.1RJnij1Y-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406101633.1RJnij1Y-lkp@intel.com/
> 
> smatch warnings:
> drivers/hid/hid-goodix-spi.c:217 goodix_hid_parse() error: uninitialized symbol 'rdesc'.
> 
> vim +/rdesc +217 drivers/hid/hid-goodix-spi.c
> 
> bb11c3a1740813 Charles Wang 2024-06-07  214  static int goodix_hid_parse(struct hid_device *hid)
> bb11c3a1740813 Charles Wang 2024-06-07  215  {
> bb11c3a1740813 Charles Wang 2024-06-07  216  	struct goodix_ts_data *ts = hid->driver_data;
> bb11c3a1740813 Charles Wang 2024-06-07 @217  	u8 *rdesc __free(kfree);
> bb11c3a1740813 Charles Wang 2024-06-07  218  	u16 rsize;
> bb11c3a1740813 Charles Wang 2024-06-07  219  	int error;
> bb11c3a1740813 Charles Wang 2024-06-07  220  
> bb11c3a1740813 Charles Wang 2024-06-07  221  	rsize = le16_to_cpu(ts->hid_desc.report_desc_lenght);
> bb11c3a1740813 Charles Wang 2024-06-07  222  	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
> bb11c3a1740813 Charles Wang 2024-06-07  223  		dev_err(ts->dev, "invalid report desc size %d", rsize);
> bb11c3a1740813 Charles Wang 2024-06-07  224  		return -EINVAL;
>                                                         ^^^^^^^^^^^^^^^
> rdesc isn't initialized here.  It should be declared as:
> 
> 	u8 *rdesc __free(kfree) = NULL;
> 
> bb11c3a1740813 Charles Wang 2024-06-07  225  	}
> bb11c3a1740813 Charles Wang 2024-06-07  226  
> bb11c3a1740813 Charles Wang 2024-06-07  227  	rdesc = kzalloc(rsize, GFP_KERNEL);
> 
> Or it could be declared here instead.
> 
> 	u8 *rdesc __free(kfree) = kzalloc(rsize, GFP_KERNEL);
> 
> bb11c3a1740813 Charles Wang 2024-06-07  228  	if (!rdesc)
> bb11c3a1740813 Charles Wang 2024-06-07  229  		return -ENOMEM;
> bb11c3a1740813 Charles Wang 2024-06-07  230  
> bb11c3a1740813 Charles Wang 2024-06-07  231  	error = goodix_spi_read(ts, GOODIX_HID_REPORT_DESC_ADDR, rdesc, rsize);
> bb11c3a1740813 Charles Wang 2024-06-07  232  	if (error) {
> bb11c3a1740813 Charles Wang 2024-06-07  233  		dev_err(ts->dev, "failed get report desc, %d", error);
> bb11c3a1740813 Charles Wang 2024-06-07  234  		return error;
> bb11c3a1740813 Charles Wang 2024-06-07  235  	}
> bb11c3a1740813 Charles Wang 2024-06-07  236  
> bb11c3a1740813 Charles Wang 2024-06-07  237  	error = hid_parse_report(hid, rdesc, rsize);
> bb11c3a1740813 Charles Wang 2024-06-07  238  	if (error)
> bb11c3a1740813 Charles Wang 2024-06-07  239  		dev_err(ts->dev, "failed parse report, %d", error);
> bb11c3a1740813 Charles Wang 2024-06-07  240  
> bb11c3a1740813 Charles Wang 2024-06-07  241  	return error;
> bb11c3a1740813 Charles Wang 2024-06-07  242  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
