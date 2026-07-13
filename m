Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC8396B68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929735; cv=none; b=jX/McU2us3plLGlKUkJqvWFi3z70MJMWIlpZULPVIpwo5Eeie4Jcen+wRlwiJ3dIWphZm09CvPqfn8yvtYO7gL9e1lvhP3f0+U9bDTL2XJE66r/oUQvmZ/UXxjexfIPrCl0XavS9tYeQPX2TP5VMwK/HF/QPFyhq9CAfZcKrH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929735; c=relaxed/simple;
	bh=YBViu0L7Y3M+FAeaoXSNZX/nBA4xH9FB/oynmKFOFLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzWC4+YL4f2hTcUZIgLFZSxV8IcCEaarEE6MVrYlQevUR9HG/EXH3m8JuT2JoamnascnnRdH0FzkD7kr0VnKH7fM80wzalD7+F4PobI5c73Ekil7PA7ZqEUCM18r3rChawf+penOC2G1LeC/8L/XFh/+yFzbE2ZR9MDPMv1kk+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXSjpg3l; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXSjpg3l"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7ec3b429a3aso23708a34.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929733; x=1784534533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LPSAIQSZBXuoWaWQUOeEPOiMUfHrmEtpLurSEx2WFQ=;
        b=NXSjpg3lcBZ+7uT4CuHg/OSGpGfNgpqkK4BcqAe0ImXdb3KvcZ2/y6zZJy1BQxuNuS
         uofdhTfnHktaRGbfYTA5Y8MMDHK7F8mWTHP5pXGdkrB8fu4yhb6f7VHBPVR/kdHO8iMp
         FQO80fTOrqusXLGbnPiiKz5caWaWfCPBjGUBDUZH5oFGYy7MIRKTH8oBihYZjPkoVmvs
         xgn1uC8xxj4bfU4q9MJOcqHoajbgM8yIkCxCPxeqQaFyss+LS7WcSlafS+UxWMOiSlNy
         TqiEo2JAlg9hoUQf9GGiGi8QbB2yqtEgl/qWKRuSvLElDlWgBpKCtbCtSvyqJJHFKshq
         4wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929733; x=1784534533;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LPSAIQSZBXuoWaWQUOeEPOiMUfHrmEtpLurSEx2WFQ=;
        b=PIlrMNVFvhKZ+aFAuhXhe3Q1yC3hDk3sGCItOJWm9bdo8l+qaoMwccUFZlbq/H6iAP
         xRXQzpWVn00XxDeJz7VVnhLljnUg4N0tZzYaJSB4F4qmqHTmG4s98OHkaeO3aioTHfWH
         0kkXnNrBSw8o6sEiAyyTIPlUg6tdbGeblrfQh9npJD4IhWpTwJ7dPx/nlr0U1d3T89yz
         DE/IYV6v94V4OXBGgIGV9lonfy3NeS8XcmvuQMMLDXjoR/6Rxd8Bpnk6DlV2Vw/lXtXS
         tHgGGxmrxfvTulxG3svOA0adLC9DDuP2L2uxI/FKkMIyktwTNRl9TMo8Ca3Af9eZpF7N
         XO9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1ly8T068lDS7HS7ybh+c7Knb4YYkecfBymuolh2t8kke1MxMz2FAqP+39uBHTWfXiivhHgkrSGKh2bqjB@lists.linux.dev
X-Gm-Message-State: AOJu0YwqWWHVOo6dZ56nlEFK9kKi4mwWbZWzKj6mfKoZ07IxIGsP8EzZ
	vS7ZHjaW55FcvYA1yvVp7rSPlxvPKtWwPU2BvfOdzZ8EY//jQcKqCQlL
X-Gm-Gg: AfdE7ckbiqH0sDz4wvMt+HvWLSut88euzGb2iNHb9rT/+JCtX6Mxgzf7R4+EEuzVct+
	FMGfoaaH3f+tS9UJoxgysho1vmRv8ExYuKkMWpl+qgeE0zqBG6wA9bOLnbzDs4k1v2jccYubOil
	/WmrKdBVcIo7VptLd82JQpen3Rz88MTmN5fq6dHG1y2XG/9rbwvnJ00WSh6oyy8ZMGe1k3+XwdP
	aQszM9iVKWO2+YsvJ+SiXjkF3yo7ceqoA6WVPpm4rvEzGDXEdzgh70dkE5TXzOWpyotQGw7nhL8
	QG5nQOuvfae7aMn4Wj3eAKSjck4Op7VggrueHIj+YluO/0XfhG0NnQw5fdtuqROKsNsTd8vIqz/
	qX0vVbUL9vNabIg2H6lJ9QKeaE0DBnFxwAQ8oOteFYvd4OgbTyNCYtsPH7PAcU4JaNxDJPgHIhZ
	wAbLLc
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id 006d021491bc7-6a39a5c80camr2981797eaf.20.1783929732986;
        Mon, 13 Jul 2026 01:02:12 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm11549821fac.7.2026.07.13.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:02:11 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:02:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 5449/5655] drivers/spi/spi-geni-qcom.c:637
 spi_geni_init() warn: missing error code? 'ret'
Message-ID: <202607122241.qzP3QAXF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: d8e9ea989acb54508477e4a8c9d9eaf8217e0081 [5449/5655] spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
config: microblaze-randconfig-r071-20260711 (https://download.01.org/0day-ci/archive/20260712/202607122241.qzP3QAXF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607122241.qzP3QAXF-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-geni-qcom.c:637 spi_geni_init() warn: missing error code? 'ret'

Old smatch warnings:
drivers/spi/spi-geni-qcom.c:648 spi_geni_init() warn: missing error code? 'ret'

vim +/ret +637 drivers/spi/spi-geni-qcom.c

561de45f72bd5f Girish Mahadevan        2018-10-03  617  static int spi_geni_init(struct spi_geni_master *mas)
561de45f72bd5f Girish Mahadevan        2018-10-03  618  {
14cea92338a077 Uwe Kleine-König        2024-02-07  619  	struct spi_controller *spi = dev_get_drvdata(mas->dev);
561de45f72bd5f Girish Mahadevan        2018-10-03  620  	struct geni_se *se = &mas->se;
561de45f72bd5f Girish Mahadevan        2018-10-03  621  	unsigned int proto, major, minor, ver;
b59c122484ecb1 Vinod Koul              2021-10-20  622  	u32 spi_tx_cfg, fifo_disable;
b59c122484ecb1 Vinod Koul              2021-10-20  623  	int ret = -ENXIO;
561de45f72bd5f Girish Mahadevan        2018-10-03  624  
d8e9ea989acb54 Praveen Talari          2026-07-10  625  	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
d8e9ea989acb54 Praveen Talari          2026-07-10  626  	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
d8e9ea989acb54 Praveen Talari          2026-07-10  627  	if (ret < 0) {
d8e9ea989acb54 Praveen Talari          2026-07-10  628  		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
d8e9ea989acb54 Praveen Talari          2026-07-10  629  		return ret;
d8e9ea989acb54 Praveen Talari          2026-07-10  630  	}
561de45f72bd5f Girish Mahadevan        2018-10-03  631  
561de45f72bd5f Girish Mahadevan        2018-10-03  632  	proto = geni_se_read_proto(se);
d7f74cc31a89a4 Praveen Talari          2023-07-14  633  
8726bdcef62eac Yang Yingliang          2023-11-28  634  	if (spi->target) {
d7f74cc31a89a4 Praveen Talari          2023-07-14  635  		if (proto != GENI_SE_SPI_SLAVE) {
d7f74cc31a89a4 Praveen Talari          2023-07-14  636  			dev_err(mas->dev, "Invalid proto %d\n", proto);
d8e9ea989acb54 Praveen Talari          2026-07-10 @637  			return ret;

s/ret/-EINVAL/

d7f74cc31a89a4 Praveen Talari          2023-07-14  638  		}
d7f74cc31a89a4 Praveen Talari          2023-07-14  639  		spi_slv_setup(mas);
99cf351ee1c46b Viken Dadhaniya         2025-09-11  640  	} else if (proto == GENI_SE_INVALID_PROTO) {
99cf351ee1c46b Viken Dadhaniya         2025-09-11  641  		ret = geni_load_se_firmware(se, GENI_SE_SPI);
99cf351ee1c46b Viken Dadhaniya         2025-09-11  642  		if (ret) {
99cf351ee1c46b Viken Dadhaniya         2025-09-11  643  			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
d8e9ea989acb54 Praveen Talari          2026-07-10  644  			return ret;
99cf351ee1c46b Viken Dadhaniya         2025-09-11  645  		}
d7f74cc31a89a4 Praveen Talari          2023-07-14  646  	} else if (proto != GENI_SE_SPI) {
561de45f72bd5f Girish Mahadevan        2018-10-03  647  		dev_err(mas->dev, "Invalid proto %d\n", proto);
d8e9ea989acb54 Praveen Talari          2026-07-10  648  		return ret;

Same.

561de45f72bd5f Girish Mahadevan        2018-10-03  649  	}
561de45f72bd5f Girish Mahadevan        2018-10-03  650  	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
561de45f72bd5f Girish Mahadevan        2018-10-03  651  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

