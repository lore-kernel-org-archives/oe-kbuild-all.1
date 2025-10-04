Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD4267B01
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Oct 2025 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759577208; cv=none; b=oCwjrZtuIh9cXYta9KrD6uc4u85VHEtMGh2AUvLKxg89g6fDe1qWB/SM4bSdgsXaQoHkxNlC1cOwqjRTc1AAlPqMDAfU1EroHWCH4Nw0sTDKZPqGokA4z7OBQUpT6s53hs3pKE8He0lEB120VHW7klf8i64JytMKGNbn07rIsd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759577208; c=relaxed/simple;
	bh=EwdxHnfhKvEZ7NIeysHGXpupI7BqORS8CfSma73coo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4KAyVvDGPT7+hTwghterz0BDnuFosbgNSGrJTOwyNTTVPBxILNO8M1CHBGpNAc5zegRVUoGfysTzkeKEVakhA3CXSLh+fnl9AYMRccHopBuwFxUZOtM/kZP15Gpw2h1RtIy6iep/xDaskYBXejE9Mj/53gVGUSGkkhbkpxh0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xxf75A2I; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xxf75A2I"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so29461085e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Oct 2025 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759577205; x=1760182005; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DzFK8rYziPUGpkl2sqEnCqePPRcI+6U2kgUcBhHTzw=;
        b=Xxf75A2IK++KIFRHzB4Qvj9QVbRZwfE6r/+S5q5rO/ujrvPj4p/dHSI4Htxpipkqia
         Ex1MLx2B4eFUGILi7appiKe9IGCjTX2ZlNqR5g35xhO5CNuRmrtqQOLBAivPf6B1hiXZ
         DcjSJW1gVspi/xZz2T9klAM5NLZb+BfkXqjED3bqcUdo5RkysgqBpZOeZz1BG23ZTbPM
         VciIdk4idYds0w5ej6T+H0UmELTnD+y/KPbuBM8MoLEGyN+iDMdm87eByW6DFTM+WTpD
         Ff7yf+Ydn72IuNTN56mtN8sm/TfKu0bQ1pUEfGsd/07Tha4FmIgps3QIyRPkbS+3ti8X
         2TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759577205; x=1760182005;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DzFK8rYziPUGpkl2sqEnCqePPRcI+6U2kgUcBhHTzw=;
        b=jETy0umAFEmuRhsCUVe/sIbyF2O5RLfQVw/4GCWr3Nw5GxGXJCtY7w8A82nniav2S2
         c1qPVR/tzytr2b4XvT4H4XgyJTxntAz//lDbYOFYdiyMY4CgDgHwOaayyq14hVTqOznl
         zLeR3ThGv/eKWwSCveGuGkB54F+A1qVM5h7ATFru5IjK5MyCqtT2WlGev/RvIKv9zSyh
         oj9dAzJ0cYn5lxz8HhrF/keB21sIsD7xkBQcpkRVVJ0VbsoTD40AqANdnsDNK/46PuLy
         nfSRO7gar+aU24JYXPtnHGR3xthrul3n+/pcamnfWLTSM0lSk8RSkzVYOwi5Y/dylsWV
         9OgA==
X-Forwarded-Encrypted: i=1; AJvYcCUpx6UXkcKNfyuBJDbK6qlNj/WXySehpmOYJPkaelt3Oi9I6RyJPNN964IGrhGFfqY15Y98Jk/D4Mg3Unm3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy759kl0/QXi9I/5teB4vIr2KZMN6VClF4fc6SLuOFQ/4E+EGub
	KO5RRQO2zjm17sTQIRLvxwvmIoVRpQMwwi9+lD5no4u2GeDyFxPAElp3x62Wg8FT6Jg=
X-Gm-Gg: ASbGnctXmlANnQpbb9FmWdy5K1h1cAnIAy0aMOIVdRq+ci3GzIob0Js955jHB9EB8o4
	woWix0mTA5/nlA4YW+2n9ztyVEz9o4jQqJ7gx2KIYO/mEarLh8kxKARJqIFXArm7ukQT17MwCiB
	D2jrUL+fgqpDRInko/cJ0PlSV1QCl/hqBAt/miG82SlLl3bRSJVPgrEWtgg6F5yMZqih3gSq9P/
	YKqzlrEZU58Ox6sAwwplGETL9azYaSM38RW7YuX4DjteQ239nJ8GzlvjL1GiF0LZmN5jhXkajm6
	sXNABL7+ii/6o81+nZyOGBjA2J6iUuVG5Pw1ddklvo+11x1sc/kgU/4t+PsyvnbTWSPPHxGVM+q
	iF0hLpF+7rz/mi0fWKJw+mEqvnb3OqdlJw1ObIzlRXCs3LqjBdiThtsCZ
X-Google-Smtp-Source: AGHT+IFacHTO+wNvyUaeloL1KpMs5qoUG4HNzAfByt4v809NdPdXJT/60CWPcoxKWKlPtIpF5bc3GQ==
X-Received: by 2002:a05:6000:43d6:20b0:425:6866:6a9e with SMTP id ffacd0b85a97d-425686679fbmr3061385f8f.0.1759577204664;
        Sat, 04 Oct 2025 04:26:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8a6b5csm11924920f8f.5.2025.10.04.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 04:26:44 -0700 (PDT)
Date: Sat, 4 Oct 2025 14:26:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <202510041841.pRlunIfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbf33b8e0b360f667b17106c15d9e2aac77a76a1
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
config: s390-randconfig-r071-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041841.pRlunIfl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/

smatch warnings:
drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +709 drivers/mmc/host/pxamci.c

^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  690  	/*
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  691  	 * Ensure that the host controller is shut down, and setup
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  692  	 * with our defaults.
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  693  	 */
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  694  	pxamci_stop_clock(host);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  695  	writel(0, host->base + MMC_SPI);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  696  	writel(64, host->base + MMC_RESTO);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  697  	writel(host->imask, host->base + MMC_I_MASK);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  698  
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  699  	ret = devm_request_irq(dev, irq, pxamci_irq, 0,
07e7716c746dd4 drivers/mmc/host/pxamci.c Robert Jarzmik     2016-02-08  700  			       DRIVER_NAME, host);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  701  	if (ret)
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  702  		return ret;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  703  
3ae5eaec1d2d9c drivers/mmc/pxamci.c      Russell King       2005-11-09  704  	platform_set_drvdata(pdev, mmc);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  705  
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  706  	host->dma_chan_rx = dma_request_chan(dev, "rx");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  707  	if (IS_ERR(host->dma_chan_rx)) {
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  708  		host->dma_chan_rx = NULL;
                                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^

58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03 @709  		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),

PTR_ERR(NULL) is success.

58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  710  				     "unable to request rx dma channel\n");
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  711  	}
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  712  
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  713  	host->dma_chan_tx = dma_request_chan(dev, "tx");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  714  	if (IS_ERR(host->dma_chan_tx)) {
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  715  		dev_err(dev, "unable to request tx dma channel\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

