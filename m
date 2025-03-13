Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12E13B280
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741890686; cv=none; b=ddVPufDcVeiJAWHYjZoIt1E6+Md/l7Gl6+b+vb4P0UGdrnEjwzjJ31kQxRSaYBop+kbNZmoqsrXSzN1HyOiXU4V95mhiGEjeJNCFWlXexWzqABt7vdfLkdVSbkRM+1Kq2vqauA5fEioQ28wVHo3C8NvlvHtFGoakaN8BF+KKqYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741890686; c=relaxed/simple;
	bh=gcHZob6HNebed2Cm6BRlntKCieNCU9GdUHJ19WCNgP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mwVjipHQQX05jc69/YzHGelBrOc/vTYiOhIo4XNFc98doX2LWeKcpXVl3tVTQjMvph9bWFNxE9cKpByILENOw9izLGjoY+3SMOogpwJPE8Y+h1CJR/pWc+/R1YRFWx7Khhyr/uhgLqYYd4RD66VTCcGYQO0LJdRy+HZCwqmNc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=px64f74+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="px64f74+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3911748893aso874361f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741890683; x=1742495483; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vXnRxpxYe49SDy+ll8iRRrwvRZ2bdnRzd1C07n7AGFQ=;
        b=px64f74+/8b2DonbydocGPdIFmhH4kwbfdnnqmfHO2wUzNNHk4cLGMgv6D5bxaDZ82
         41lF3AJUgDOOvu1InzaHI+K9uJt+EDWhzSfBRGlnsJsln5tO6kMbysNByjEqUHQmyFsI
         e4DScEWPRVUu+aMvmDXTBh1Ml74LsRNU5h5BPnzS4mae6x4v5GaeM68IlRX5ONzEGjDZ
         tpznAWFzSN3xisivlI/m4fotL6k0ZRpLf11UrrwKjzvAHwt31DMfc5+SpyjKgX3T2wkD
         JigjbZp1kGqzzFITnWqRx2tdOgrm5aUTY8m59KyBWfgcqkXSkGIG7LnCFrXSeHwwP2Cu
         6vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741890683; x=1742495483;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXnRxpxYe49SDy+ll8iRRrwvRZ2bdnRzd1C07n7AGFQ=;
        b=ni2DI1xKnZB9rwjQgt5WeAmobiwXVnk/CCoS0+H+DRsY3hCGparc26Lkm/lMiU+rzs
         2fTkjZxO0vE4LkxXdqZoXQ8lRKJ0Mm75dlbx1GTE0fXvXOqphM4wybSyGkCx2a2GYAs8
         j4HP4qpkWQBT6IHyXIeHMCQFIpRrziMeXJpiVZRLM72sqAl/WJSVajJwC5TlwKBeRtps
         M/tHeN1FmE5fDNjIy/OYgKz0ZDxSJdrHVIwPvj86/pqkn6/cOGMagRr81JY7D6k56w8Z
         tXCgnjVlK/MAzdc2oyyBGDeQkOzdFtsXhVJXUGSbvsKqIsIdGeAyrdUHhs5TFMb2DguL
         dvlA==
X-Forwarded-Encrypted: i=1; AJvYcCXYHnSofQFfEZMCQF3xi3ysqJZK3lJgBy9UQvOmRaV1hxw3FNh11bOJ/VinwC4R39qsyvCg+caog/66lAg4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk6a938Cloxeyp0nokGrnteRMlHDNIhJ5ILH9xmuph843oqwEN
	6wt35QxCoDmBQqujTnmhBs6Lpxg3zGzvK+BbwroYNrZULa98Jy3EfeKek/hGd7c=
X-Gm-Gg: ASbGnctCXwYI72gJhM40wMsh2kx3YuHEndVIxrh1cP2DCfSHkHcmzUEYvwcxsWto2NF
	UGotFF6SY+NzE8RUJnC9HwOseJpdBgGJGPAbgImgOoxjV2HDM/SivZ9ma9cSn68rFpNXZ7hG9+2
	4AS27zPlGrsLjZ5Aiw0FvT0B6APEEgPt2Oby4rDdCT3Fw5BOLtiYmlTbwLI34ENWxVGfiWlb2FE
	yZW1IoFomIR3/t7dXJocRgYBARgopUg2plhw2VlPOsL3zDURNF7Mbru+s1jboqfAikyeZpiyC/j
	dPDndnu8l/WS8m96GSRJ8srP1XPWHMXDCpd6rAPL/no5TqCScg==
X-Google-Smtp-Source: AGHT+IEqhmMGPVvyYQ4YUNWWFgupgua68itRs76XFocxn1hRn/6jgNyhkZmatQ0VV7ymwyyFQmWQeQ==
X-Received: by 2002:a05:6000:2b09:b0:391:4b8e:a200 with SMTP id ffacd0b85a97d-396c21fbd06mr392167f8f.32.1741890683140;
        Thu, 13 Mar 2025 11:31:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d188bb577sm28973315e9.19.2025.03.13.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:31:22 -0700 (PDT)
Date: Thu, 13 Mar 2025 21:31:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Kisel <romank@linux.microsoft.com>,
	arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
	devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
Message-ID: <1283ab3a-a66b-4fe2-9ba4-8d5972daa89b@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307220304.247725-9-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detectting-hypervisor-presence/20250308-060639
base:   3a7f7785eae7cf012af128ca9e383c91e4955354
patch link:    https://lore.kernel.org/r/20250307220304.247725-9-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ number from DeviceTree
config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250313/202503132345.uKNehsnm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503132345.uKNehsnm-lkp@intel.com/

smatch warnings:
drivers/hv/vmbus_drv.c:2355 vmbus_set_irq() warn: platform_get_irq() does not return zero

vim +2355 drivers/hv/vmbus_drv.c

2e494cbd89c51d1 Roman Kisel    2025-03-07  2348  static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
2e494cbd89c51d1 Roman Kisel    2025-03-07  2349  {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2350  	struct irq_data *data;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2351  	int irq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2352  	irq_hw_number_t hwirq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2353  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2354  	irq = platform_get_irq(pdev, 0);
2e494cbd89c51d1 Roman Kisel    2025-03-07 @2355  	if (irq == 0) {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2356  		pr_err("VMBus interrupt mapping failure\n");
2e494cbd89c51d1 Roman Kisel    2025-03-07  2357  		return -EINVAL;

You can delete this if statement.  It's dead code.  See the comment
next to platform_get_irq().  I wrote a blog about the history of
this:
https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

2e494cbd89c51d1 Roman Kisel    2025-03-07  2358  	}
2e494cbd89c51d1 Roman Kisel    2025-03-07  2359  	if (irq < 0) {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2360  		pr_err("VMBus interrupt data can't be read from DeviceTree, error %d\n", irq);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2361  		return irq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2362  	}
2e494cbd89c51d1 Roman Kisel    2025-03-07  2363  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2364  	data = irq_get_irq_data(irq);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2365  	if (!data) {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2366  		pr_err("No interrupt data for VMBus virq %d\n", irq);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2367  		return -ENODEV;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2368  	}
2e494cbd89c51d1 Roman Kisel    2025-03-07  2369  	hwirq = irqd_to_hwirq(data);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2370  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2371  	vmbus_irq = irq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2372  	vmbus_interrupt = hwirq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2373  	pr_debug("VMBus virq %d, hwirq %d\n", vmbus_irq, vmbus_interrupt);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2374  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2375  	return 0;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2376  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

