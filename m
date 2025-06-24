Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409982BEC24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772265; cv=none; b=Y+Uh6oU9DZJ+7s8EPMXbDXyG9Yns+LpH0vvecWSIctVPbxGhPzcmx36f0Dy0CH0ilGcnXkqdrLAr7lPu9NJEaoFKE+SIIqGIsp1TdT3+DOpt6pGEQ1w5r7FYNl0SZzCEvgI4hSm9UGXGG8JX1w9vqcJiB0UayeFUdXEPCfdW7Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772265; c=relaxed/simple;
	bh=zOB5AlMqj9KmwU0E0756V4dbbBGTNkAVB/Tcxft+kGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DtUnYacF07bpC1jxZTSv8QYl3rY3Gouv5yhZqLeqQiWmCVKhKF81verlmAeCY3Z6A5uALWSschcPsdvnjcaFJMoVoxWkZi+ymjtZ9FSB14KTlhN15yvkpZwlXmQBdhU9Q8SOeccLsS+82bnxom9nxRZmcHm+VL69bUGGD5fAfUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKZESJPk; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKZESJPk"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c14138668so109210a34.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750772261; x=1751377061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wpNGwNorSJRHHGcPXLQ8fs2LYNu4R8xKyEQ7qynXL3M=;
        b=mKZESJPkd+imfI9PY1tn/4NlEjMolNLbD4xavPnUCkuq752JZDfVUMi4EbX5aJUpNO
         qGRBtGFFR87dU0wZHVsVqYgGwd8YHUATtvjEuXkdvbYlaNxlQmX+J+AMmRG1ujkiSVur
         251r48E7wJfJ/eIDq6lC/6eb7TmUDb2ti3N8LrdgchnjD93CqDZ0OFEHKUEtn0fuWMrW
         3PMNaeYLVVLP34eD24+aU8Shl+v9B2ZrUaCb2huJkGboRtaxRUWfUU3X3xlHJFgan2Z5
         hp3MRNL9uRwQUg8f1CC0+rVbkD0WgWnTK2/lsHw9HCt8Wbm+7WiuVVE5x33DCmGMOFAx
         YFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772261; x=1751377061;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpNGwNorSJRHHGcPXLQ8fs2LYNu4R8xKyEQ7qynXL3M=;
        b=e/boE/JpQB0SG2bNJ6ggYhr3AnPwzdTqj4XokY/nt9sSiV2en8KJASS4WRzW95WpPX
         cqbFRDH3l2+YiILuOuLe9ruw/Kiwf9yJWlGm+ANc68QXaUrdMmBbXfEz1xXGZL3Tp/Ua
         l5MQIF3PNmGsQplftaV2Ut4DVwiXpN+sOzhrt51thaXk/fJdHbA2bfbGbOZGiXHpiYrt
         uWLgTrRYszTtN97myunAQeQ26W/fztRGb7D59O4DD077rw+V/n9p4YEsvLcslEwQpj9d
         l1gdSgqOzOjvWyvMxA7DiJAsQ7i9kBKTttrTQ/vSmGNYAYhZom9TaklWWBUvgD+cDH+F
         FT7A==
X-Forwarded-Encrypted: i=1; AJvYcCWEjSIw5O9SNz8++JHanMb+NRyr/XLY7ifXQc7fFpm4Oa7apu0ZhjWh4ZyTQJFeFCGNChx6kxd8HGYmNkVG@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4pLYIV3E6/WW08fCFlgz/SrEGQx5bZwBc69FuuXDbK8jIMfXr
	9MNmT8seLVjirbkBNUlJv+lZ7kGV3BtwJCUD4gDvurdUBa6BLfgZ9i+QEIVDeT5+nZ8=
X-Gm-Gg: ASbGncsupY1xPZov07UmozEXyOr3rHrAIRSyU71ZfH9nVJ7cPsTD6Y0X2YCs7JZPn99
	yop+exokr1/5V3LpNdQN4fmYG0I3g6p0mfNTI3PR8UyB1poLFQO+eWCsiAMM2f8g6MF3iGJhRSw
	J0nCgQmW7B+gcfn+J54pKR/Wi75hWVzOO+RIygev1IASW24UezXcGFTVQItbNbkvm8m9r7VtOFT
	CQXd86wrXg+G65l/W/tDp4HlG1TVIoPybWkWJL0B7jhgqBfZfdR5GiCnMTU4KB2xFxt214QZvhD
	XcCwPS94llAueSJxHGcSB4D/FFeo7SsMStLF6MRm5oGNKxzNZLBengBI+CGxXpCXnv1gyA==
X-Google-Smtp-Source: AGHT+IGP56xPtHiCZXhQKN8Uu2rZMFi/qagY8sczFmEtrJpJ17nQfRRSLKweF5R/GISgkaBHUgpwwg==
X-Received: by 2002:a05:6830:840d:b0:734:f5e2:8cbc with SMTP id 46e09a7af769-73a91d24190mr7043470a34.18.1750772261285;
        Tue, 24 Jun 2025 06:37:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm1849930a34.0.2025.06.24.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:37:40 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:37:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Badal Nilawar <badal.nilawar@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <b92f6d9d-974f-4309-8d83-e6d737e1c41b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618190007.2932322-3-badal.nilawar@intel.com>

Hi Badal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-3-badal.nilawar%40intel.com
patch subject: [PATCH v3 02/10] mei: late_bind: add late binding component driver
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241103.XiG3WA7g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241103.XiG3WA7g-lkp@intel.com/

smatch warnings:
drivers/misc/mei/late_bind/mei_late_bind.c:203 mei_late_bind_component_match() warn: was && intended here instead of ||?

vim +203 drivers/misc/mei/late_bind/mei_late_bind.c

b4fe758cb831cd Alexander Usyskin 2025-06-19  186  static int mei_late_bind_component_match(struct device *dev, int subcomponent,
b4fe758cb831cd Alexander Usyskin 2025-06-19  187  					 void *data)
b4fe758cb831cd Alexander Usyskin 2025-06-19  188  {
b4fe758cb831cd Alexander Usyskin 2025-06-19  189  	struct device *base = data;
b4fe758cb831cd Alexander Usyskin 2025-06-19  190  	struct pci_dev *pdev;
b4fe758cb831cd Alexander Usyskin 2025-06-19  191  
b4fe758cb831cd Alexander Usyskin 2025-06-19  192  	if (!dev)
b4fe758cb831cd Alexander Usyskin 2025-06-19  193  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  194  
b4fe758cb831cd Alexander Usyskin 2025-06-19  195  	if (!dev_is_pci(dev))
b4fe758cb831cd Alexander Usyskin 2025-06-19  196  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  197  
b4fe758cb831cd Alexander Usyskin 2025-06-19  198  	pdev = to_pci_dev(dev);
b4fe758cb831cd Alexander Usyskin 2025-06-19  199  
b4fe758cb831cd Alexander Usyskin 2025-06-19  200  	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
b4fe758cb831cd Alexander Usyskin 2025-06-19  201  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  202  
b4fe758cb831cd Alexander Usyskin 2025-06-19 @203  	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||

This || should be &&.  Currently the function will always return 0.

b4fe758cb831cd Alexander Usyskin 2025-06-19  204  	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
b4fe758cb831cd Alexander Usyskin 2025-06-19  205  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  206  
b4fe758cb831cd Alexander Usyskin 2025-06-19  207  	if (subcomponent != I915_COMPONENT_LATE_BIND)
b4fe758cb831cd Alexander Usyskin 2025-06-19  208  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  209  
b4fe758cb831cd Alexander Usyskin 2025-06-19  210  	base = base->parent;
b4fe758cb831cd Alexander Usyskin 2025-06-19  211  	if (!base) /* mei device */
b4fe758cb831cd Alexander Usyskin 2025-06-19  212  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  213  
b4fe758cb831cd Alexander Usyskin 2025-06-19  214  	base = base->parent; /* pci device */
b4fe758cb831cd Alexander Usyskin 2025-06-19  215  
b4fe758cb831cd Alexander Usyskin 2025-06-19  216  	return !!base && dev == base;
b4fe758cb831cd Alexander Usyskin 2025-06-19  217  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

