Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AF3242BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583155; cv=none; b=CRP0bYXkpNBsEshNcFLi58lqqtzFsTBY3H77S9Iq/6txWiElUcE1vcHYcpI/wo5Bj7viHA5yJlZ7ol5nvZfLwTHczo95v3U2DZ0haXHancgro0TzSICxA8664s2hbOOJHJJ6gA0tq5AbZrk1MMraRW/WHmFPgxMyEGbCQ061hEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583155; c=relaxed/simple;
	bh=dCvPeAJW76/i+bvaStaj7xfjrDurZkY2/3HjRPxN9Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNmwXS4u3MpW93IOorDiSzgNcAFfEBxH5fNecAx/OX7F/2E55MpSejaR0yveBaDfrafnYxqTCHpl5We7DizT/I7S/VoAAtcxUvoUj9lMqlzEhUt2hck8S3bAXzG2RSgwdEKv2oUYuITY2vqvSz/cr93nGdlvSv1bwCKHsvo/KKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sT0QRcJO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sT0QRcJO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-481188b7760so15627995e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 02:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771583152; x=1772187952; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYn+3Ywjl5NbsUInHvxsRp94AMznrrcXlSDarMtm8gU=;
        b=sT0QRcJOFhauUmLmfRY1I9ZjpCe6GMvNbHZ69ZdOu9fJgdQlE/BhYKZFo4Rmqhu7wk
         cAdGc8mIAs0X2Y8U88Wzc7A/CgCZxusEV1pVl726GaLx4RJZBtrZ0q1VZSSq7L9VlHMC
         iX1IAt2KTHcN4gPT4zDk+b5QXZHtOl76MYZQ04h+HYemoVfNC4owdeB0Vb3u2anfCS7X
         IpeK8t2tIQwI4FY5hU9in8avKKeMctxCknyed90NT0XGfai6BBxeEpjzaH+9iFnFnuDA
         4gPDSYYOmuh5B6avUbay5CkUAFRVrWK3AryRXpDtlSgsn+tocQwx9BwJSw1gaIW43g66
         dguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583152; x=1772187952;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYn+3Ywjl5NbsUInHvxsRp94AMznrrcXlSDarMtm8gU=;
        b=ZUKGj+2cn5glvHFQHhIFoZSW1Ka763v+nENnCGnP6BKpaxw6an+KTr5nAa4Gufr+9R
         GvYDZxiwPm3onUXbtiDn1i+TJq7K3o2arDLZENwmdtQX9aq/ipoKq9enMZLZuMMiT5YE
         49/9oTxCj2Zr6b7eH6KIJQNf1Vx1nUy7fIEY4TzmvvcJfBi3WGEsLvxVQRLpC+4rAw6d
         Zhag7EsIs69rUkwlN4G5CrBp/J92rMU3BNlXplbWzjPobMVjFBDPpwRDYI9YaOKL3CoR
         pOP0pc9fqLO9yY8UhHhr8n1mxXDbXaDNyimJ8AOF3R1tmJFds1NqJrrVfhpzffK/1okM
         EiCA==
X-Forwarded-Encrypted: i=1; AJvYcCUa7A9JxBw0+vENKgH8UmpSGECSF/PsMa2VhDcUJ1lHOvtV9qAs8+oqhnFKAF7x7MEwySDAVci7l/z2IROZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8iyg3+C1dkEDjO47/yV9WI83Gwh+IbQ/j0QXzU2qBxDAqhyrS
	Wv33jjKNGTHGhlJkc5EmtCTJxV5cywzM/fgouTzaeh+xbqnKqesZyxih75OI5BaTTM0=
X-Gm-Gg: AZuq6aIyflhORZd5skU/A+rcZYQ/EcfABrgbSNxxrO6Sdz4pw7Q0Y6sA8sSCmCGPSz1
	STcZutf3EIz5kzu9hwObWwm63XgCsFScHIib5Wbuqay1vi9MKSrfxU+k6IJjDPuftEgYwMslE5I
	rxmglPUTSi63XXtTnEiiZbXUYRy5PqIRWw3bbSa7Shu97TXQue+H9KiwaJdNuj19xbFKUsfVdZl
	htJU4J20wLYONtn5jnoFWYQlLhrBz3xH7oFOFFUhowP7lNjDRbMPWdeUAvtVTV8lHWFAU388tBy
	+Q2lHX3g+vEfwydphaqMz04kWXHT4RjG4D5nX6YoYK5xeqd7ZXq/TC4KpiwoQcIsPJtUCqMLFK1
	x0sTmQkxifSSQdEUx3PW1Pr+Dc9+tXZgpRgrmTx1KJzAZpNVo9q80X2jAjhToGXKZVAYY/3L+v1
	RLZgG/7ZROOaKXbWCP3Rhw2ySeSnjz
X-Received: by 2002:a05:600c:46c7:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-4839e6614c4mr86530055e9.17.1771583151722;
        Fri, 20 Feb 2026 02:25:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a316c2aasm61312035e9.0.2026.02.20.02.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:25:51 -0800 (PST)
Date: Fri, 20 Feb 2026 13:25:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/ks8995-fixups 5/7] drivers/net/dsa/ks8995.c:314
 ks8995_get_revision() warn: was || intended here instead of &&?
Message-ID: <202602201735.XhNCovu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ks8995-fixups
head:   ea4d9288b053886fb1063467e90076b1bac75212
commit: 8391defbf00b98a8458722096cc571e598e5b8da [5/7] net: dsa: ks8955: Delete KSZ8864 and KSZ8795 support
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260220/202602201735.XhNCovu6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602201735.XhNCovu6-lkp@intel.com/

smatch warnings:
drivers/net/dsa/ks8995.c:314 ks8995_get_revision() warn: was || intended here instead of &&?

vim +314 drivers/net/dsa/ks8995.c

484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  291  static int ks8995_get_revision(struct ks8995_switch *ks)
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  292  {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  293  	int err;
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  294  	u8 id0, id1;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  295  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  296  	/* read family id */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  297  	err = ks8995_read_reg(ks, KS8995_REG_ID0, &id0);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  298  	if (err)
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  299  		return -EIO;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  300  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  301  	/* verify family id */
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  302  	if (id0 != FAMILY_KS8995) {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  303  		dev_err(&ks->spi->dev, "chip family id mismatch: expected 0x%02x but 0x%02x read\n",
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  304  			FAMILY_KS8995, id0);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  305  		return -ENODEV;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  306  	}
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  307  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  308  	/* try reading chip id at CHIP ID1 */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  309  	err = ks8995_read_reg(ks, KS8995_REG_ID1, &id1);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  310  	if (err)
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  311  		return -EIO;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  312  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  313  	/* verify chip id */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09 @314  	if ((get_chip_id(id1) == CHIPID_M) &&
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  315  	    (get_chip_id(id1) == KS8995_CHIP_ID)) {

It can't be both chip IDs at the same time.

484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  316  		/* KS8995MA */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  317  		ks->revision_id = get_chip_rev(id1);
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  318  	} else {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  319  		dev_err(&ks->spi->dev, "unsupported chip id for KS8995 family: 0x%02x\n",
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  320  			id1);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  321  		return -ENODEV;
c0e6cb1fed5a73 drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  322  	}
c0e6cb1fed5a73 drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  323  
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  324  	return 0;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  325  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

