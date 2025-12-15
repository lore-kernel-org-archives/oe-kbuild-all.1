Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E732AABB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788969; cv=none; b=PelKe0/i8aYEZpeJRaQ6GVhRiTo4/dA7+udI/7rNlx3EHFUYkLSTFsya6koc9StTAxE3Iw8mc6ysvFLLlYMYBet3U26fF7IocHyF0aQNjpTajMNULB9M4zbtxIzlJVpAqhVr4djMbukHhDoTivZCdiMS8KeMgFIzQdWLx9w9u2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788969; c=relaxed/simple;
	bh=g/2Wxfy4EvsBb8UMJq1GZ6pC8hScpvDATZW2h+f56hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5kX/IhIBwSIE7bqci9DWtBtdzroXUpbT6a5Ov6aM0TcL4v+TWYqeo6l832j+K4WQ5o9TXaRGwqrdBo5qu1tYGYlfyTvqjnXpVQzeVn+jtX+tvDiFhL1vw2BybBtFMkqxRCXqVHO2VGQDf+9RU2MVKus11VCML8wcHtwWGTA7PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8MjsMN7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8MjsMN7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso13771525e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765788962; x=1766393762; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpxYPL0HdtCrqLqGF5zUwqpO5ote7rY6HHFj6ESSu4k=;
        b=p8MjsMN7pIBgdzBW5LvZ2S8TYjdzw3Ccc6mAC+GZveRPMo3j29z+s3IfyMU0fSu610
         ForFskBFOvgmZ5xpR5p4dZXLaksoIV0KMhThpQfXlNYvf7EIN9dPC3ogcbwO5DEMCtox
         uDeoSIpM7vgl9QggpnaoCoPm5A2Ug6DFq4itwzZ6VAwjRoW+skpD8OYKooFhAjTOOfsD
         yXigmStNANeXgqdjBOPanemIEA9YKlmMkNkmwuM0cWlud63vVXA8WamJ2j3dUSdKXcVT
         EfW408/SbdB9CkgSXw13R7POvnsvzQRAkHwHPMvtt06JHhinhaJhz0DV52cV9GExuv/P
         w0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788962; x=1766393762;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpxYPL0HdtCrqLqGF5zUwqpO5ote7rY6HHFj6ESSu4k=;
        b=RwjGG2JqTfVFuqPzZam066Uv2iNeyFOH4dLEQflW2Kex8snSNTXy2lLQ9y35Uw3WkH
         RqN6TdLE0nCw09MCZEqflISBv+b7M8iwNsxNxpDwFquw81zT/UirRidoG1+1NsWybe1u
         tUJLsI5G3rBc5Eu+1K4D2tx7Rv6Dxae51Hfz1BtpkzC3Mu9QeGvOjX36D7KWaAYMD537
         MRMp8opg6j6KHrG/bHH3mnn1B6k8+DuMS0JK1NUPMtfHks7D7FrdpK0HlazXLF6omZWU
         lfn5MnHzIneBCuRjaQ/bIssHVWsGD5lqRnA3XqmQa+AdX5TXBQ2fwCqdfgZ7hi98Tr0D
         Yr1w==
X-Forwarded-Encrypted: i=1; AJvYcCUh44YTpUqjMO1eCke2tyuyDWet/KOFMc5UuL1dMDUVwe5tLXgpfE9t4wKF9uWbhl+pRdXuFL+P+4CGrO1S@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg63Nr6yZnZPutY53Cz4S+URDQWVAKRZorhaR3ermKhCCGZmhF
	C7HlmMGM96yquBenI0fdFUM4GPkb0bEP6gwZfatVZjeazIGCXcTGOeHOVbPPyhP7Ykc=
X-Gm-Gg: AY/fxX6c6ZhoguFjxF1iaAPJoe4rfgNJRmFw0kBRMndKICra2uevKxsBqIYQjjuqEWU
	TXgkV4Y+Z8puC6H06AP6ZTDdhUo6matYHr04IEs1Zk4kqGmqZcQqfpUXvi106XJ4a4b35ByXnnP
	hhuVhuliQDDqw7jJR3P2WuvBwKyYnB2WJlEaIWhRH2lO06gv9E/Qgm4y5sCQsq7Q7WrnTNRR8mI
	hoOtba1ZEj3XzMQ3TfRIur4almha+bd0A9BoqGh71LoFa55k42rc7TZGCBdQNTp6k10S7PrICS7
	d2n83p0Za5xEOSfQd5iXBrd8rUq+bg1Y9cnYrKGJ3nUohBOIy6cwlammdwGSOkMXIzc196UnZqs
	JsMAAXjyylpcF2JxeAAo5F78r5Y3Xczx56kWgGY+puTol+jvL8M0Yf8TNasMDrzvqJpK+Xcxu2c
	ZcbNRmSimwUbjblHMEfRNbNi7vxuw=
X-Google-Smtp-Source: AGHT+IH9Vx9lRYuyM4i2CiUhArv9FtRXYRfsNl/RiYjV6a4nRnO+2fem7eDPYCjb74HIPXI2vc9U0Q==
X-Received: by 2002:a05:600c:4f90:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-47a8f9055bfmr92419345e9.19.1765788961213;
        Mon, 15 Dec 2025 00:56:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f721a61sm62296135e9.20.2025.12.15.00.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:56:00 -0800 (PST)
Date: Mon, 15 Dec 2025 11:55:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: drivers/soundwire/bus_type.c:108 sdw_drv_probe() error: Calling
 ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
Message-ID: <202512131339.LMMvaF5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: aab12022b076f0b385b7a9a78e1161bd2df5d1e3 soundwire: bus: Add internal slave ID and use for IRQs
date:   7 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131339.LMMvaF5G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512131339.LMMvaF5G-lkp@intel.com/

smatch warnings:
drivers/soundwire/bus_type.c:108 sdw_drv_probe() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +108 drivers/soundwire/bus_type.c

9251345dca24b6 Vinod Koul           2017-12-14   81  static int sdw_drv_probe(struct device *dev)
9251345dca24b6 Vinod Koul           2017-12-14   82  {
9251345dca24b6 Vinod Koul           2017-12-14   83  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
9251345dca24b6 Vinod Koul           2017-12-14   84  	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
9251345dca24b6 Vinod Koul           2017-12-14   85  	const struct sdw_device_id *id;
9251345dca24b6 Vinod Koul           2017-12-14   86  	int ret;
9251345dca24b6 Vinod Koul           2017-12-14   87  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   88  	/*
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   89  	 * fw description is mandatory to bind
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   90  	 */
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   91  	if (!dev->fwnode)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   92  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   93  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   94  	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   95  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   96  
9251345dca24b6 Vinod Koul           2017-12-14   97  	id = sdw_get_device_id(slave, drv);
9251345dca24b6 Vinod Koul           2017-12-14   98  	if (!id)
9251345dca24b6 Vinod Koul           2017-12-14   99  		return -ENODEV;
9251345dca24b6 Vinod Koul           2017-12-14  100  
9251345dca24b6 Vinod Koul           2017-12-14  101  	/*
9251345dca24b6 Vinod Koul           2017-12-14  102  	 * attach to power domain but don't turn on (last arg)
9251345dca24b6 Vinod Koul           2017-12-14  103  	 */
9251345dca24b6 Vinod Koul           2017-12-14  104  	ret = dev_pm_domain_attach(dev, false);
29ffcc88f2065f Ulf Hansson          2018-04-26  105  	if (ret)
29ffcc88f2065f Ulf Hansson          2018-04-26  106  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  107  
aab12022b076f0 Charles Keepax       2025-04-29 @108  	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);

The SDW_FW_MAX_DEVICES macro is used here and also in sdw_irq_create().

	bus->domain = irq_domain_create_linear(fwnode, SDW_FW_MAX_DEVICES, ...

The ida_alloc_max() function an inclusive max so probably this should be
"SDW_FW_MAX_DEVICES - 1".

aab12022b076f0 Charles Keepax       2025-04-29  109  	if (ret < 0) {
aab12022b076f0 Charles Keepax       2025-04-29  110  		dev_err(dev, "Failed to allocated ID: %d\n", ret);
aab12022b076f0 Charles Keepax       2025-04-29  111  		return ret;
aab12022b076f0 Charles Keepax       2025-04-29  112  	}
aab12022b076f0 Charles Keepax       2025-04-29  113  	slave->index = ret;
aab12022b076f0 Charles Keepax       2025-04-29  114  
9251345dca24b6 Vinod Koul           2017-12-14  115  	ret = drv->probe(slave, id);
9251345dca24b6 Vinod Koul           2017-12-14  116  	if (ret) {
9251345dca24b6 Vinod Koul           2017-12-14  117  		dev_pm_domain_detach(dev, false);
aab12022b076f0 Charles Keepax       2025-04-29  118  		ida_free(&slave->bus->slave_ida, slave->index);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

