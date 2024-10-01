Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42A1BBBC4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 07:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766737; cv=none; b=kTKv9Vq43zSiFIQrsjcH+uqy1h3Mgr1FFsG9UqPbYbntMnmjGRmHYnmicznSMjEev9Izlwor8BhSWzcUkk5mMfIcGjeN8qoLhToMdgMEpAJSqYMl1CamnHNn/O5kvwy0O96A5zx18YVVqjF1VwH8dKon7AUnNgYykPSM0BYpSOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766737; c=relaxed/simple;
	bh=y2ZFSAp9h5OoAQ0kAUI7RAoV2wwssCCCm97Xqni04RI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EnKmIUAghtIJqabMg3ijjOEdL9y8oPpD0J6ZiGW7rOq5881pjP3u+04SXTPSjR/i4jlRABKp5DUb/JriF8/hO65j5iLuhLRDMQdUfa2087HVQ6G8ky8PYA2SnDxcJ73tVoeIhQC63+HHjvYgIXoprtpn2xHxkG0b3IpTs658/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XperOrGl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XperOrGl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso791072166b.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727766734; x=1728371534; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXq3aoBFMmAhDE3lM+Bjt7VRVHfnevLQL+0yUSK1oVY=;
        b=XperOrGlzjp5DEcXgI2cUWWk7sCIevuxsA7XIG3kPzGkXVs/QNsj6xaGO+ZZQNYNTl
         kNOi4ydinXaVbnfmNdq4E0NyfCXYpc5VPu76aewSbR5p5VSbG1h8lDWhM6PzPSlPzm8I
         i5BURygSn83d45vBnvC4Wn1Nz4/YE/CyTis16cIYjlqUTbAeRoIZ1PsWLdX5I1b72pHr
         nwE7r/Jep3fND4fsPLjMWKoILnADReFdPqH3QwE4PpifVmMKXruYMm7SG35eXlT0ZeY6
         OzZYp2rjqDunZwzm/x3uxfbRPX/PlEdMC+F5IT0gvm9Z89gRd7NksU+3mYTICBgEITlk
         qWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727766734; x=1728371534;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXq3aoBFMmAhDE3lM+Bjt7VRVHfnevLQL+0yUSK1oVY=;
        b=N2vEa5TsrqF2gDCR3/i2e1e7Q2mLCf1G6d0tY57ZYITGr75b4I2M9Ma2XFnN/J3UZn
         oNLV1+Hvdb3CYtX5+lwy1tqcNIkd2i/hqcyHRQnBT8GUpURdBl+FAAh7BV6jxW+wvB1l
         tfZG0+YudUmNsdHJ06Y8DI7eWveBspG3KR8Ona3wvntS/LyETOeVCz/oU2eBA7ffPkBd
         Djxpdkijv053YqC4rNiHRuLVBiukBg5+TpOyE0+bczJUySbfqLTc2UTKWT/kAot2LBQD
         MkKyYwSFQ8gSi8Xdr3bYRyk01pqgTmRlfBAE9ama5UpXyR1QaLAowEhQS3zfT/Lu8StH
         tpWw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xehftWRsVES1Y60bj2/kzzs2CpoDJMvdEgGeRSJaER+5utmlanKUhxV/shpH4KWHhkFkwZT5a4KZMdCH@lists.linux.dev
X-Gm-Message-State: AOJu0YyAx7r5LkZg+KueKAGGr6zypyaEXn+5g3qWqffqBoOj8HH7gIZm
	j3LepLLxIOrVUrC6v9zXQj9gHgNy+Zi/PLUud3FGnmhFHUgyFsMAEhoTdeECdYc=
X-Google-Smtp-Source: AGHT+IHqAaKq6LIonk9hYr0vTdPApUmsZsbpWKu7M8xKZEMMSPeEwJcrvx29Fcsojreo80JNo7rh3A==
X-Received: by 2002:a17:907:1c17:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a93c4a87661mr1639975966b.46.1727766733469;
        Tue, 01 Oct 2024 00:12:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c277726asm666987666b.10.2024.10.01.00.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:12:10 -0700 (PDT)
Date: Tue, 1 Oct 2024 10:12:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shuming Fan <shumingf@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filekCZcLQ 7/13] sound/soc/codecs/rt1320-sdw.c:564
 rt1320_load_mcu_patch() warn: impossible condition '(addr > 4295491583) =>
 (0-u32max > 4295491583)'
Message-ID: <12dcf576-c9ef-4962-92d0-819e25a9aa53@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filekCZcLQ
head:   4649cbd97fdae5069e9a71cd7669b62b90e03669
commit: d72498fad93abf1817c4998d172a3d7f98f76bbe [7/13] ASoC: rt1320: reads patch code from firmware file
config: i386-randconfig-141-20240930 (https://download.01.org/0day-ci/archive/20241001/202410011117.3dImGD4j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410011117.3dImGD4j-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt1320-sdw.c:564 rt1320_load_mcu_patch() warn: impossible condition '(addr > 4295491583) => (0-u32max > 4295491583)'

vim +564 sound/soc/codecs/rt1320-sdw.c

d72498fad93abf Shuming Fan 2024-09-14  532  static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
d72498fad93abf Shuming Fan 2024-09-14  533  {
d72498fad93abf Shuming Fan 2024-09-14  534  	struct sdw_slave *slave = rt1320->sdw_slave;
d72498fad93abf Shuming Fan 2024-09-14  535  	const struct firmware *patch;
d72498fad93abf Shuming Fan 2024-09-14  536  	const char *filename;
d72498fad93abf Shuming Fan 2024-09-14  537  	unsigned int addr, val;
d72498fad93abf Shuming Fan 2024-09-14  538  	const unsigned char *ptr;
d72498fad93abf Shuming Fan 2024-09-14  539  	int ret, i;
d72498fad93abf Shuming Fan 2024-09-14  540  
d72498fad93abf Shuming Fan 2024-09-14  541  	if (rt1320->version_id <= RT1320_VB)
d72498fad93abf Shuming Fan 2024-09-14  542  		filename = RT1320_VAB_MCU_PATCH;
d72498fad93abf Shuming Fan 2024-09-14  543  	else
d72498fad93abf Shuming Fan 2024-09-14  544  		filename = RT1320_VC_MCU_PATCH;
d72498fad93abf Shuming Fan 2024-09-14  545  
d72498fad93abf Shuming Fan 2024-09-14  546  	/* load the patch code here */
d72498fad93abf Shuming Fan 2024-09-14  547  	ret = request_firmware(&patch, filename, &slave->dev);
d72498fad93abf Shuming Fan 2024-09-14  548  	if (ret) {
d72498fad93abf Shuming Fan 2024-09-14  549  		dev_err(&slave->dev, "%s: Failed to load %s firmware", __func__, filename);
d72498fad93abf Shuming Fan 2024-09-14  550  		regmap_write(rt1320->regmap, 0xc598, 0x00);
d72498fad93abf Shuming Fan 2024-09-14  551  		regmap_write(rt1320->regmap, 0x10007000, 0x67);
d72498fad93abf Shuming Fan 2024-09-14  552  		regmap_write(rt1320->regmap, 0x10007001, 0x80);
d72498fad93abf Shuming Fan 2024-09-14  553  		regmap_write(rt1320->regmap, 0x10007002, 0x00);
d72498fad93abf Shuming Fan 2024-09-14  554  		regmap_write(rt1320->regmap, 0x10007003, 0x00);
d72498fad93abf Shuming Fan 2024-09-14  555  	} else {
d72498fad93abf Shuming Fan 2024-09-14  556  		ptr = (const unsigned char *)patch->data;
d72498fad93abf Shuming Fan 2024-09-14  557  		if ((patch->size % 8) == 0) {
d72498fad93abf Shuming Fan 2024-09-14  558  			for (i = 0; i < patch->size; i += 8) {
d72498fad93abf Shuming Fan 2024-09-14  559  				addr = (ptr[i] & 0xff) | (ptr[i + 1] & 0xff) << 8 |
d72498fad93abf Shuming Fan 2024-09-14  560  					(ptr[i + 2] & 0xff) << 16 | (ptr[i + 3] & 0xff) << 24;
d72498fad93abf Shuming Fan 2024-09-14  561  				val = (ptr[i + 4] & 0xff) | (ptr[i + 5] & 0xff) << 8 |
d72498fad93abf Shuming Fan 2024-09-14  562  					(ptr[i + 6] & 0xff) << 16 | (ptr[i + 7] & 0xff) << 24;
d72498fad93abf Shuming Fan 2024-09-14  563  
d72498fad93abf Shuming Fan 2024-09-14 @564  				if (addr > 0x10007ffff || addr < 0x10007000) {
                                                                            ^^^^^^^^^^^^^^^^^^
Impossible condition.  I suspect there is an extra 'f'.

d72498fad93abf Shuming Fan 2024-09-14  565  					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
d72498fad93abf Shuming Fan 2024-09-14  566  					goto _exit_;
d72498fad93abf Shuming Fan 2024-09-14  567  				}
d72498fad93abf Shuming Fan 2024-09-14  568  				if (val > 0xff) {
d72498fad93abf Shuming Fan 2024-09-14  569  					dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
d72498fad93abf Shuming Fan 2024-09-14  570  					goto _exit_;
d72498fad93abf Shuming Fan 2024-09-14  571  				}
d72498fad93abf Shuming Fan 2024-09-14  572  				regmap_write(rt1320->regmap, addr, val);
d72498fad93abf Shuming Fan 2024-09-14  573  			}
d72498fad93abf Shuming Fan 2024-09-14  574  		}
d72498fad93abf Shuming Fan 2024-09-14  575  _exit_:
d72498fad93abf Shuming Fan 2024-09-14  576  		release_firmware(patch);
d72498fad93abf Shuming Fan 2024-09-14  577  	}
d72498fad93abf Shuming Fan 2024-09-14  578  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

