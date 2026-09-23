Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB57B38735E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145675; cv=none; b=WFh1dk0c0rbqS/GfqlNlRTdzMV3AGZsEllu0029CSRPMavET/gUb2trR2d+M2ysAN+OTKJPfQgMS9ZjIS9zosEcV1nq9Mq11KdMEuR8Sy28HZ1FyzrhR76dK/6sG5A08GsqBMeQT1tXfqHU1lOlp5PuGn2MYLnWD4v8Ks/IAPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145675; c=relaxed/simple;
	bh=uWchjzgXJ1lFjETmeo55LV8kEsySydfOdcokuoyuk5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUMTjw0Ul6ETx9v7Xixc/lD4QCKiaUQpwJ2WZGsa9MGh42MwRMfZpZpm0k+6mjHke4WaIOiFEqQm6X+Lj3LDmBCSlm3EVUDDcAxx1RbspYB4YYYiFi3Q/9VmDWDeUj96JiNclj35oAKB7ogqs3Z56DXIdh8cwbQsEfOpqFxwLJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIEDTAEi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIEDTAEi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so516311f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Sep 2026 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790145663; x=1790750463; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OWYTqCm36eYoRp4EcMyYpAc07cTE/bg7gu/FbpykgU=;
        b=MIEDTAEi/36dqZJzBDnzdYQlf4pxaOA3+nuKGpObaDmDpU5g3UM5in5vTfWAJUNsni
         ecjz3nPekq2AM+Svs+4kIZHf8v/LcrK7iwgnFzCwN4fk4OAHHMMhTVIZNOApMkBey5jn
         FSZCLiyyCeKqlFz/3EgA7/XFFIefphRLpvOCalXkyRRpn1yNQ1qGHFyaG1sKMRlTJvcS
         q2rOYhZb2or6Sx4gXGisWTzQR43WgKDwL/bX9UHlNFvbegbzBHS1THIzfITdobL4mmjH
         2ze9Ajvn0DbHPQ/pgeUX3rTroa8YYRZu16UYazL6DAwMl2ePAeIzVZsCV3gv7lI2MZgx
         iiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790145663; x=1790750463;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OWYTqCm36eYoRp4EcMyYpAc07cTE/bg7gu/FbpykgU=;
        b=ZauOkFwAdSYXKySCVr4ueNbOCtD2MN6xKmzlE8dGSujHR8VPqviJOWvbb6DN2kON/a
         TWjz3mp2Fk1IOl4jTprOQ2uTyKL9gbAiXF39Thsd5Z4VzbVutpogh/G0Mb3/idJK7zUO
         BvFjmSbDr3xlfxz9zGou/9TIMWgSmlvC/DqWhcfNd4lbFNEs2Q1+PGKgeQIVXsdyyYvh
         4MxDZ92V/bgj505vWBLhJvBYKYmhEDr8EyoHVWIJLNarNddbz24lnbUYXqMqdoT7PNr6
         wWAKSpssW+17KjtpEj6hbuxGSlVCfWs5WG+L4q8fT2D0vtYZbnWFmLuXHSN9Qvnc5Od9
         t4Jg==
X-Forwarded-Encrypted: i=1; AKwUvByUd0Z2jaiIkaXbooYMjzeDHbUh6rBEs8luHJjBjU39XgIBX8d4iI/kHLUY6DshNWUUYBBeRWBCeIcqBEp4@lists.linux.dev
X-Gm-Message-State: AFuF++mLCVJ8gzNJQLkqg0vF3KRkCJyu8z1I+FhvSClRJEyog8qSJWtF
	bxWGNrwYW2HklyMhE9dZxqa9AwbpKoPWF+/aQM7a0KZzfyCEiF/F/YJx
X-Gm-Gg: AYBFou3Nm1/bC9rbxkZJHKmSFzIgqO3mC7JuzsAOv8mAgRKkSxHO6KxOKhWK8ZoUDLL
	li6x+ed0DApQplZ475nG7bzVQtM4jPs+xAWtWBYOEZ0e2E7k7IyjIqDNqFpd1RMAdnNfDvJ70Gm
	x7tF5g6SPmdCEqEGayEL4ik2+Ohje0FQEMzknOZDwLqoOjH34fvCGaeSyRcTW4OPAwbJITB2KqA
	y2jnu5SbxoAVzQvnPNIL1vCWYor+3ora2smqRl8iWXogvX5toRxaLhPn11iQDJ5sVzuWQKLqpq4
	+YQ2cb8I28VkpWFY/vSQMF2nPeVEa16BT2CFT0JVJUnLi/7tzRqqpZJ3Kb2a6JHOxZkO3rELyy0
	StWZ9znj1D5qALM2F5N+FRaHd34P9ww+G9SgHyEtdwCyDw7WlIvglQBt8FB+UftFtpmM3AXypr7
	ocjxSPDhaeVpgY21vSUB8nsfhv+kX50jnFPti5qOKs0O+lHJyfvNpGckq9jETGDWYAOMfNLHTTs
	sivzw==
X-Received: by 2002:a05:6000:22ca:b0:487:c99:9020 with SMTP id ffacd0b85a97d-4886704a2a5mr3050302f8f.2.1790145663009;
        Tue, 22 Sep 2026 23:41:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm4552545f8f.16.2026.09.22.23.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:41:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:40:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, bui duc phuc <phucduc.bui@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: [linux-next:master 4776/8910]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn:
 platform_get_irq() does not return zero
Message-ID: <202609230734.R1jtbjb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: bb2b71024976a39ed57d66bad8f9ca7e93bc3f33 [4776/8910] net: xilinx: axienet: Fix IRQ error handling
config: i386-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230734.R1jtbjb4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230734.R1jtbjb4-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn: platform_get_irq() does not return zero

vim +2974 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2942  
5fe164fb0e6e31d Rob Herring (Arm         2024-07-31  2943) 	if (!of_property_present(pdev->dev.of_node, "dmas")) {
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2944  		/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
95219aa538e11d5 Srikanth Thokala         2015-05-05  2945  		np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
6b1b40f704fc39d Sarath Babu Naidu Gaddam 2023-11-16  2946  
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2947  		if (np) {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2948  			struct resource dmares;
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2949  
46aa27df8853214 Srikanth Thokala         2015-05-05  2950  			ret = of_address_to_resource(np, 0, &dmares);
46aa27df8853214 Srikanth Thokala         2015-05-05  2951  			if (ret) {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2952  				dev_err(&pdev->dev,
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2953  					"unable to get DMA resource\n");
fa3a419d2f674b4 Wen Yang                 2019-03-22  2954  				of_node_put(np);
808d077f5b53806 Sean Anderson            2026-01-17  2955  				return ret;
46aa27df8853214 Srikanth Thokala         2015-05-05  2956  			}
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2957  			lp->dma_regs = devm_ioremap_resource(&pdev->dev,
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2958  							     &dmares);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2959  			lp->rx_irq = irq_of_parse_and_map(np, 1);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2960  			lp->tx_irq = irq_of_parse_and_map(np, 0);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2961  			of_node_put(np);
d6349e3e14c7f7b Andre Przywara           2020-03-24  2962  			lp->eth_irq = platform_get_irq_optional(pdev, 0);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2963  		} else {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2964  			/* Check for these resources directly on the Ethernet node. */
47651c51c02fc49 Yang Yingliang           2021-06-10  2965  			lp->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2966  			lp->rx_irq = platform_get_irq(pdev, 1);
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2967  			lp->tx_irq = platform_get_irq(pdev, 0);
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

d6349e3e14c7f7b Andre Przywara           2020-03-24  2968  			lp->eth_irq = platform_get_irq_optional(pdev, 2);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2969  		}
fcc028c106e5750 Krzysztof Kozlowski      2015-07-09  2970  		if (IS_ERR(lp->dma_regs)) {
46aa27df8853214 Srikanth Thokala         2015-05-05  2971  			dev_err(&pdev->dev, "could not map DMA regs\n");
808d077f5b53806 Sean Anderson            2026-01-17  2972  			return PTR_ERR(lp->dma_regs);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2973  		}
bb2b71024976a39 bui duc phuc             2026-09-09 @2974  		if (!lp->rx_irq || !lp->tx_irq) {

These should be checks for negative instead of zero.

95219aa538e11d5 Srikanth Thokala         2015-05-05  2975  			dev_err(&pdev->dev, "could not determine irqs\n");
bb2b71024976a39 bui duc phuc             2026-09-09  2976  			return -EINVAL;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2977  		}
bb2b71024976a39 bui duc phuc             2026-09-09  2978  		if (lp->rx_irq < 0)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

