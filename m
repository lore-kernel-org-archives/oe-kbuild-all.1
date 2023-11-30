Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B311FB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fU8AUuxo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40859dee28cso4767415e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 23:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701328222; x=1701933022; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eCVB0ZCMTbdTd4dZbphWro2FuLO12tVDUAo4CJ1KyPY=;
        b=fU8AUuxo2Xvx4PUdfmgYEhD4D/AoFnv5crs/oNti8Jcz0Tg9cosmzyDCd/oFLbGHGb
         PuFgyaWpK0heEs3bgRYMJmJtb8zhtKxOJXQvHXwjWR2vM6tF077tNdEGfkCB19azMoOm
         LPZbsASKN35DIgNDdKli5siSVkPHsKZihHBHdvRhKHG7XeF9GP+dXiylCsf9j7/JTa2S
         Hq3sOY5B7EGmM6kOEXlLOdCFTgKit5HNDNXaEEiH+4MJmr29c8U1Zu49PNCcUDHa1Rk0
         q+mzqUnh5N5YoPnFY8p5YApHUdgMuDJmihBfLzdl7qgtaJMiyfNIgTAJ4OsVEVsnkj2w
         r9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701328222; x=1701933022;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCVB0ZCMTbdTd4dZbphWro2FuLO12tVDUAo4CJ1KyPY=;
        b=PeDGzGE0X/IVoazH4oI1VsicPn2atlcJQkNeNEIpeW5k9I4pGPJWUygSPzb3ECYGD7
         /q9R/5//YwE+SMxb7FniCp1PTqP8MAhnvKNfmjjT0rpzLzZ76IVC4OH8m5/JYVhG6IAi
         1Co3CFe1fZDeECpMZ1Aoh+JIcJT4/cUSRA8IMY7MzQzIyuVT/UBdru52dLkvALGK6YbC
         SofcYv52YePXPO9tKNCIqWgyFO/w42F3X7KpWS8jy3Oj7ES/LAsEOn3OE9JZelYmJFQc
         ltDPXxcOhvnOW7vDyMDV8N6C2fyFdtITcUnay8pQ9cyU39t58tqin8cqfFdKbRf0wxFu
         gABA==
X-Gm-Message-State: AOJu0Yy/MfK5W05JeAv++uX5WqqkiWmAuh7QlINlw4eS2EMK7kprCGXV
	nAChSgGbhCgsLVrPr86l7jAWog==
X-Google-Smtp-Source: AGHT+IHGL0/bH4sbTml76Eu2SuYWsRZyv/8KtzfNulIsl1ejEP8lzd8d/mCWIqx7OtmCnJpDPKOZDw==
X-Received: by 2002:a5d:5690:0:b0:332:e65a:4a07 with SMTP id f16-20020a5d5690000000b00332e65a4a07mr14481933wrv.32.1701328222032;
        Wed, 29 Nov 2023 23:10:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id dl17-20020a0560000b9100b003316debbde4sm654550wrb.48.2023.11.29.23.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:10:21 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Nov 2023 10:09:19 +0300
To: oe-kbuild@lists.linux.dev, Sven Peter <sven@svenpeter.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/11] drivers/phy/apple/atc.c:1609
 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
Message-ID: <85feb9ba-f949-4ced-b67f-46ce13516df9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   4931e8edc0670b6acf66c1b83702c7521722ff1c
commit: 3b2571b8e8064a73eca2cec23cf86cfe7f7050f5 [3/11] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231130/202311300600.AQaWLIms-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300600.AQaWLIms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311300600.AQaWLIms-lkp@intel.com/

smatch warnings:
drivers/phy/apple/atc.c:1609 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(mask > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2157 atcphy_parse_new_tunable() warn: impossible condition '(value > (~0)) => (0-u32max > u32max)'

vim +1609 drivers/phy/apple/atc.c

3b2571b8e8064a Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
3b2571b8e8064a Sven Peter 2022-11-30  1568  {
3b2571b8e8064a Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
3b2571b8e8064a Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
3b2571b8e8064a Sven Peter 2022-11-30  1571  	int ret = 0;
3b2571b8e8064a Sven Peter 2022-11-30  1572  
3b2571b8e8064a Sven Peter 2022-11-30  1573  	/*
3b2571b8e8064a Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
3b2571b8e8064a Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
3b2571b8e8064a Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
3b2571b8e8064a Sven Peter 2022-11-30  1577  	 */
3b2571b8e8064a Sven Peter 2022-11-30  1578  	mutex_lock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
3b2571b8e8064a Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
3b2571b8e8064a Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
3b2571b8e8064a Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
3b2571b8e8064a Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1585  	}
3b2571b8e8064a Sven Peter 2022-11-30  1586  
3b2571b8e8064a Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
3b2571b8e8064a Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
3b2571b8e8064a Sven Peter 2022-11-30  1589  		return -EINVAL;

Need to unlock before returning.

3b2571b8e8064a Sven Peter 2022-11-30  1590  	}
3b2571b8e8064a Sven Peter 2022-11-30  1591  
3b2571b8e8064a Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
3b2571b8e8064a Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
3b2571b8e8064a Sven Peter 2022-11-30  1594  	switch (state) {
3b2571b8e8064a Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
3b2571b8e8064a Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
3b2571b8e8064a Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
3b2571b8e8064a Sven Peter 2022-11-30  1598  		break;
3b2571b8e8064a Sven Peter 2022-11-30  1599  
3b2571b8e8064a Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
3b2571b8e8064a Sven Peter 2022-11-30  1601  	default:
3b2571b8e8064a Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
3b2571b8e8064a Sven Peter 2022-11-30  1603  			 state);
3b2571b8e8064a Sven Peter 2022-11-30  1604  		ret = -EINVAL;
3b2571b8e8064a Sven Peter 2022-11-30  1605  	}
3b2571b8e8064a Sven Peter 2022-11-30  1606  
3b2571b8e8064a Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1608  
3b2571b8e8064a Sven Peter 2022-11-30 @1609  	return 0;
3b2571b8e8064a Sven Peter 2022-11-30  1610  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

