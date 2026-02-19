Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27717325705
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771485132; cv=none; b=LEb5yAi+AvOEyRgM9wCLBAg1vQkVDdntWEU/hhc4pYBC8b0AfHAJjZy+Dq3BPM2kE3S+S/aczKCqWuNjgiVuKtGSFVatXvaLi87Leuk2lFK94OzhJ7f3IizsIELM5O7u1pokkr0KjySakjetKZfbqHyIRu0H06X1QMwryJYuPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771485132; c=relaxed/simple;
	bh=s3pcYxTN6pNiFdwhSuxUgJESB7S9WAt9L1M4abRykII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WDPhknBavHhZzJ0utLmiY2RQUJ+aFdXQ/FeBqVl6GA3Z+V9VL9oNrONUTNTu6eGunise6ZEX2lodWWstVK1jiJBj+JjCR6+WBrkJn1eVr29Hb5cUUi4NV+6p3rL98WNpVplpKD9tCTDQyCzXnm8bJvHi81VwXgGDPK6C3UCmYFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cuFwA6iS; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuFwA6iS"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43767807cf3so431744f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 23:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771485128; x=1772089928; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mNljJmo8xYMg1FSiw5iNlLCoBCy730ouXhyirQsq0Y=;
        b=cuFwA6iStOrUu7Y/gbiAPkz6sAZlgr3YF2nuqSFmLtApkNuHQkrUw27lnlSKhHMx3N
         DKNbw7bRjyCOg0JU2WwU+AE8Xta0jeic9QbEWHvCsLH8Dk4UzR8l6Mu0jWaj7MgyhuS4
         3GckkABXAkAAe0mUkSiXcXTuc5VenC9tAh0L5iYSCwOlrv05UDMqs+FpX4GlQNa5n9TH
         0REr4Dc5qlNIc1trwXruyefdRz9Zpj+KS8bOmwl+gIEW0NnKGXj7vRbxgToncyj3tBD+
         Q5lUrBfvDRPCgOmNxaUdOgCPPSgDBYUjaY+ByluKLeGVd5CgProYP/5TuocKl19pg2AL
         smgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771485128; x=1772089928;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mNljJmo8xYMg1FSiw5iNlLCoBCy730ouXhyirQsq0Y=;
        b=EJLQrlZGxcdRBQ7n6FzDojAgmc9rEMO9PDkI1rts7OIqq9M1AMXJA38ZsYbU1jPmDi
         YhBoUHaWM3RnTWtlXVEOZ8ql2iVB2vneEX3Jx+Dwp0S+GlenQ18p1b0QxnI1rzxqIqw1
         NbPa8TlN7lVRobZfo5x+BVnbUZ7+U6Oe8bpyQIWvayF2s5/yEvDw3ICxu1JUy/8DTBWW
         eyz2z75V8yBekab17HsTYrl3w8xv0scTkBD8ouq2O9QYuO1J6jtKzCsWCa1SQGwwR6kZ
         u2a4TJJ43jl3x7JOrbh22dfWQ8RfPGKQ+RkV8rsUjyHDwmyZ4/zowtoRWD5DBiGO5oIT
         jMyw==
X-Forwarded-Encrypted: i=1; AJvYcCWiHi4CieT86xmMEMiqV4bCauyPZM3U8n75GdH8kF5ZInCPjbR/ZZm6urgkgMRa0UmIJgbbqa4I2rDl7oji@lists.linux.dev
X-Gm-Message-State: AOJu0YyeQ6qDSZQQ93fSW0pAiQJgoPM4aGwEPDDswPyF/7diwB1u3gVf
	JCt7U+iTIs1GONTTVOP6dC7xK+ajXtFAYVNuAkvyaZ9PNwtGtiKVDT6ED2KSmHgyuNI=
X-Gm-Gg: AZuq6aIfd+vjTHzBnr2C1pN+pirtHiD/JEVqAqVId+s51f2ZBkf6JBerAsklzDSC//4
	iOJKYhMETSNZ4wfutY7IOoRmc3mI1JOG0arwo4pdZwECsS3HfN4VCG8yzrlyg2LrLZTtxIQt45U
	coyq3u/1bnv6/Hr93xUNNcoyc81EBLKeBcyeqWeCczTVSCHWyiF65BD1PUcsRXUdwmNQf1+ny9g
	sBy1vopLYP74PxjGFnAnZJyzvh0CZDT1TAwK4DMlfyrnMofJwFIF0nF9J9bj6N46HPKJk6lDw4X
	oh0CxWYvXXq4j37sCtSXmU4M29/6wZKjZxzzETTccbnJZ6Dlk+kWhVwTuvAarKsUQQzCxVVg5Vs
	X0JC4+/oMHBaX/S1zYRirG5e/2zMMctDFziwmuzuYfUUxPGBtNhWmIX3m4+IpA0+VQTI6GPYFuV
	D1NQVeLfM+YvuULQCOdj2jajd9Wfts
X-Received: by 2002:a05:600c:4e93:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-48379bbcbd0mr277963325e9.12.1771485128222;
        Wed, 18 Feb 2026 23:12:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm675803505e9.0.2026.02.18.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:12:07 -0800 (PST)
Date: Thu, 19 Feb 2026 10:12:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wei Wang <wei.w.wang@hotmail.com>,
	bhelgaas@google.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
	akpm@linux-foundation.org, bp@alien8.de, rdunlap@infradead.org,
	alex@shazbot.org, kevin.tian@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	wei.w.wang@hotmail.com
Subject: Re: [PATCH v5 3/6] PCI: Consolidate delimiter handling into
 pci_dev_str_match()
Message-ID: <202602161621.2nyGIEhM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR01MB439352E0D54243099CAAA118DC6CA@SI2PR01MB4393.apcprd01.prod.exchangelabs.com>

Hi Wei,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Wang/PCI-Validate-ACS-enable-flags-against-device-specific-ACS-capabilities/20260216-103055
base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
patch link:    https://lore.kernel.org/r/SI2PR01MB439352E0D54243099CAAA118DC6CA%40SI2PR01MB4393.apcprd01.prod.exchangelabs.com
patch subject: [PATCH v5 3/6] PCI: Consolidate delimiter handling into pci_dev_str_match()
config: x86_64-randconfig-r072-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161621.2nyGIEhM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602161621.2nyGIEhM-lkp@intel.com/

smatch warnings:
drivers/pci/pci.c:430 pci_dev_str_match() warn: sscanf doesn't return error codes

vim +430 drivers/pci/pci.c

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  343  /**
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  344   * pci_dev_str_match - test if a string matches a device
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  345   * @dev: the PCI device to test
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  346   * @p: string to match the device against
40549484c434de Wei Wang         2026-02-16  347   * @endptr: pointer to the string after the match, with the delimiter skipped
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  348   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  349   * Test if a string (typically from a kernel parameter) matches a specified
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  350   * PCI device. The string may be of one of the following formats:
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  351   *
45db33709ccc73 Logan Gunthorpe  2018-07-30  352   *   [<domain>:]<bus>:<device>.<func>[/<device>.<func>]*
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  353   *   pci:<vendor>:<device>[:<subvendor>:<subdevice>]
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  354   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  355   * The first format specifies a PCI bus/device/function address which
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  356   * may change if new hardware is inserted, if motherboard firmware changes,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  357   * or due to changes caused in kernel parameters. If the domain is
45db33709ccc73 Logan Gunthorpe  2018-07-30  358   * left unspecified, it is taken to be 0.  In order to be robust against
45db33709ccc73 Logan Gunthorpe  2018-07-30  359   * bus renumbering issues, a path of PCI device/function numbers may be used
45db33709ccc73 Logan Gunthorpe  2018-07-30  360   * to address the specific device.  The path for a device can be determined
45db33709ccc73 Logan Gunthorpe  2018-07-30  361   * through the use of 'lspci -t'.
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  362   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  363   * The second format matches devices using IDs in the configuration
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  364   * space which may match multiple devices in the system. A value of 0
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  365   * for any field will match all devices. (Note: this differs from
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  366   * in-kernel code that uses PCI_ANY_ID which is ~0; this is for
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  367   * legacy reasons and convenience so users don't have to specify
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  368   * FFFFFFFFs on the command line.)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  369   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  370   * Returns 1 if the string matches the device, 0 if it does not and
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  371   * a negative error code if the string cannot be parsed.
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  372   */
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  373  static int pci_dev_str_match(struct pci_dev *dev, const char *p,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  374  			     const char **endptr)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  375  {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  376  	int ret;
45db33709ccc73 Logan Gunthorpe  2018-07-30  377  	int count;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  378  	unsigned short vendor, device, subsystem_vendor, subsystem_device;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  379  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  380  	if (strncmp(p, "pci:", 4) == 0) {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  381  		/* PCI vendor/device (subvendor/subdevice) IDs are specified */
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  382  		p += 4;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  383  		ret = sscanf(p, "%hx:%hx:%hx:%hx%n", &vendor, &device,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  384  			     &subsystem_vendor, &subsystem_device, &count);
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  385  		if (ret != 4) {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  386  			ret = sscanf(p, "%hx:%hx%n", &vendor, &device, &count);
40549484c434de Wei Wang         2026-02-16  387  			if (ret != 2) {
40549484c434de Wei Wang         2026-02-16  388  				ret = -EINVAL;
40549484c434de Wei Wang         2026-02-16  389  				goto not_found;
40549484c434de Wei Wang         2026-02-16  390  			}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  391  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  392  			subsystem_vendor = 0;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  393  			subsystem_device = 0;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  394  		}

At this point ret is either 2 or 4.

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  395  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  396  		p += count;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  397  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  398  		if ((!vendor || vendor == dev->vendor) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  399  		    (!device || device == dev->device) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  400  		    (!subsystem_vendor ||
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  401  			    subsystem_vendor == dev->subsystem_vendor) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  402  		    (!subsystem_device ||
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  403  			    subsystem_device == dev->subsystem_device))
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  404  			goto found;

No imagine that we don't goto found.

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  405  	} else {
45db33709ccc73 Logan Gunthorpe  2018-07-30  406  		/*
45db33709ccc73 Logan Gunthorpe  2018-07-30  407  		 * PCI Bus, Device, Function IDs are specified
45db33709ccc73 Logan Gunthorpe  2018-07-30  408  		 * (optionally, may include a path of devfns following it)
45db33709ccc73 Logan Gunthorpe  2018-07-30  409  		 */
45db33709ccc73 Logan Gunthorpe  2018-07-30  410  		ret = pci_dev_str_match_path(dev, p, &p);
45db33709ccc73 Logan Gunthorpe  2018-07-30  411  		if (ret < 0)
40549484c434de Wei Wang         2026-02-16  412  			goto not_found;
45db33709ccc73 Logan Gunthorpe  2018-07-30  413  		else if (ret)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  414  			goto found;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  415  	}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  416  
40549484c434de Wei Wang         2026-02-16  417  not_found:
40549484c434de Wei Wang         2026-02-16  418  	if (ret < 0)
40549484c434de Wei Wang         2026-02-16  419  		pr_err("PCI: Can't parse parameter: %s\n", p);
40549484c434de Wei Wang         2026-02-16  420  
40549484c434de Wei Wang         2026-02-16  421  	if (*p != ';' && *p != ',') {
40549484c434de Wei Wang         2026-02-16  422  		/*
40549484c434de Wei Wang         2026-02-16  423  		 * End of param or invalid format. Return -ENODEV so the caller
40549484c434de Wei Wang         2026-02-16  424  		 * stops parsing.
40549484c434de Wei Wang         2026-02-16  425  		 */
40549484c434de Wei Wang         2026-02-16  426  		return -ENODEV;
40549484c434de Wei Wang         2026-02-16  427  	}
40549484c434de Wei Wang         2026-02-16  428  
40549484c434de Wei Wang         2026-02-16  429  	*endptr = p + 1;
40549484c434de Wei Wang         2026-02-16 @430  	return ret;

It should return 0 here but instead it returns 2 or 4.

07d8d7e57c28ca Logan Gunthorpe  2018-07-30  431  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  432  found:
40549484c434de Wei Wang         2026-02-16  433  	*endptr = *p == '\0' ? p : p + 1;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  434  	return 1;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  435  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

