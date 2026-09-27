Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AD2949E0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790520581; cv=none; b=tEJm4Idb34d2RsQhmE4GiQ9FgEK6TY0siaLtldyMvTOplJtZU93VasK2FDitUosvw6XjTLkw4TtYy2tdIzxHyg3TWZsDn5kAgyCByK0zCkCjsLdDhQi7zbx7JBRs79h4+tg9IsrOyiRy8gEs0A64Ceg/O77+sAIIMbdGlozMSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790520581; c=relaxed/simple;
	bh=aF0fMAAd3piHMjAy72ykHjBCFrHa2kWMGDTHgf/9SEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erRRyhOhrS2HwQTP3KdYlm1cB9SaEfrt3v6NPWWWnqp7rhCOawGSC/Xjje6VUIRqljzzIMnSZzACQVvW1BPeQA6w08WHcoC/lUJrRJOGHs3RHGC3MezlE6qsEu20VfQ/EYbzzYuliOVCcvnZpDPaJxyF2TslfgQQuJ2MDGH9eIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgbWXDf/; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgbWXDf/"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so1153578f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790520577; x=1791125377; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDBs+pGiiC8Zy3ZyTqjKtuxEwWOKvQV0mtUWYXMi48o=;
        b=CgbWXDf/NH6Bca4IQGl4h2DHi8BqYLzMG3SN8sT5DE0uVYYHcBK3BVBwZ4O4fBh2Ea
         Olgrl36oO4/LD7CKZVi0IAdPx3BBzBJAk64otYSqSR2s9haFJBaXEDwcj/v1gZl6VYRN
         aI2MyKQIIusfzMBSFi95bf3sNqeNshwsl0Xc7Y7I2sxzHpsG7cHm7hotERDSe8Hj18vV
         Z6LjriDnRxQ4YObiNr8CAfSDDE+5qRibfGKMSSRSiVdoPbF2Sqb+kM3rHVtmHeCCEDyH
         EIRxUKdDHLt4+OFzEXCosgHzuu3rgzuDXJ/Qbbjr4XYJE/kXhJ7z+Cm4wptxkllo+gXr
         6pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790520577; x=1791125377;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDBs+pGiiC8Zy3ZyTqjKtuxEwWOKvQV0mtUWYXMi48o=;
        b=MBYtROELo7arUHoaOobH5Rwj27klPL1QgNMwh4ck1hWxVi7I5XumwzhtPC7Ypenx20
         aTAnKek+PkAayWYW/fe3iGsqOa2piWP5mVXouBq3dlFQ8OLVKr3AG/c+7EBxbfxXFqNl
         o+E/U7ADAHpyx7MLlOjB6+4nd6NYtBjUrL/+g2uDmfmeBj0LJmTn+5tfPxhqAqew+frF
         wrsS0/NZb7Ciz0tVZds1CysCYjLojQqwB3FUd0CoS6VuokuP04PCL4lHNhfPR/Y6W/IE
         oW5KL9CC+jeWv44YCNdEog+Qh7RgmfwKNl/cpBhG5olXLJH5+yi97CUL7M4IZFAszzgu
         7o/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8CUYW3jUCYNG0RStQOW8oZpCbAuYNBOwFkk7PQ5DGK8IA+YcYH6mS99GzBvNgBUQPNno7q57TCt4hftsz@lists.linux.dev
X-Gm-Message-State: AFq9FYIl76VX1H9ZtjrNhtWJeqypqYKe8V3UT3cci0ZJrTGrma3b0rt/
	8zGDQO/KdNQqSsy5yOv7+XXilOmhIB85/H3JhvUpcGkHDnU48TAeyIZW
X-Gm-Gg: AYBFou3jMXYl/+/uWGxEcr0FVJgaYbsWsKnoxeTMUFDeEjgf4JJ5DkqevnH0KFb6CAm
	LYVwS7nJRLaRBfsJNWT0md8Ga5mkv5RC7hHJPXY39tkvJeGrv0iFC2uDACxhiycR8xsZxwAm7mA
	CopywDHOFWTgG/3vDB5rLmPXdF3pLJN1xLsMqoApQ3vkHnThTHsRMYSmhp7GgIgPWHSHo3lAdJI
	+eF07v6OpRL2061YLgEJnnGNeYDMuieN2NCXul8RdWlrEr2hczenJMbC/uxYMMukkOV+gwzMdTI
	S0OcuZTXavW0cliWnsJD0o0nsVURMLANlVT01AY5Hu8Zep1szlwe0B8uiino5ZWmT7ke5xSLHhp
	0XrOhogaWYAncrH61DH8ZnpiyvhHpYMByZjHmFGUr6BJkPEU4zQvO/COXLTtGn94JlNWV6fm/Km
	AVAZqV++GOuZZVMEZmoQ1dJqcBCf4StLQbk7DrSUdRyzMUiYqQngqKudl7erRA8EDqNOFG5HN9e
	U719A==
X-Received: by 2002:a5d:5f87:0:b0:488:8468:3bc0 with SMTP id ffacd0b85a97d-48884683e06mr8818136f8f.17.1790520577283;
        Sun, 27 Sep 2026 07:49:37 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm21212184f8f.12.2026.09.27.07.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:49:36 -0700 (PDT)
Date: Sun, 27 Sep 2026 17:49:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [jic23-iio:testing 66/82] drivers/iio/magnetometer/ak8975.c:627
 ak8975_setup() warn: passing zero to 'dev_err_probe'
Message-ID: <202609270219.cCECv2b8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e5b9e42a20392b669097c8c4aa09c3aed82ba10c
commit: 4f8ee49c28b1a537a23e64cfee6ff2e5ec616f7f [66/82] iio: magnetometer: ak8975: use temporary variable for struct device
config: x86_64-randconfig-2200-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270219.cCECv2b8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609270219.cCECv2b8-lkp@intel.com/

smatch warnings:
drivers/iio/magnetometer/ak8975.c:627 ak8975_setup() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +627 drivers/iio/magnetometer/ak8975.c

79ab48ae4f9e06 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-05-11  608  static int ak8975_setup(struct ak8975_data *data)
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  609  {
79ab48ae4f9e06 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-05-11  610  	struct i2c_client *client = data->client;
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  611  	struct device *dev = &client->dev;
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  612  	int ret;
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  613  
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  614  	/* Write the fused rom access mode. */
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2014-11-21  615  	ret = ak8975_set_mode(data, FUSE_ROM);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  616  	if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  617  		return dev_err_probe(dev, ret, "Error in setting fuse access mode\n");
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  618  
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  619  	/* Get asa data and store in the device data. */
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-05-05  620  	ret = i2c_smbus_read_i2c_block_data_or_emulated(client,
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-05-05  621  							data->def->ctrl_regs[ASA_BASE],
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-05-05  622  							sizeof(data->asa),
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-05-05  623  							data->asa);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  624  	if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  625  		return dev_err_probe(dev, ret, "Not able to read asa data\n");
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  626  	if (ret != sizeof(data->asa))
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20 @627  		return dev_err_probe(dev, ret, "Error reading asa data\n");
                                                                                                                                  ^^^
s/ret/-EINVAL/

3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  628  
040f3e5833b942 drivers/staging/iio/magnetometer/ak8975.c Leed Aguilar     2012-06-06  629  	/* After reading fuse ROM data set power-down mode */
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2014-11-21  630  	ret = ak8975_set_mode(data, POWER_DOWN);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  631  	if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  632  		return dev_err_probe(dev, ret, "Error in setting power-down mode\n");
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2013-05-07  633  
2c289e63944467 drivers/iio/magnetometer/ak8975.c         Linus Walleij    2019-12-02  634  	if (data->eoc_gpiod || client->irq > 0) {
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2013-05-07  635  		ret = ak8975_setup_irq(data);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  636  		if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2026-09-20  637  			return dev_err_probe(dev, ret, "Error setting data ready interrupt\n");
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2013-05-07  638  	}
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2013-05-07  639  
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2014-11-21  640  	data->raw_to_gauss[0] = data->def->raw_to_gauss(data->asa[0]);
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2014-11-21  641  	data->raw_to_gauss[1] = data->def->raw_to_gauss(data->asa[1]);
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2014-11-21  642  	data->raw_to_gauss[2] = data->def->raw_to_gauss(data->asa[2]);
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  643  
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  644  	return 0;
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2010-09-08  645  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

