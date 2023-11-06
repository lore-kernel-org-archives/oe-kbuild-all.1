Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B910A08
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lra2GlM9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9c603e2354fso834689466b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Nov 2023 00:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699260607; x=1699865407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsCANmYwXRnDmiAjkr58/AtcQu8TsUqslllZf46Wsxw=;
        b=lra2GlM9Nd/g02AYh9HWI7PEWqiAOaekY5s2yhANsSXqeHqbWfkAoKIfqQMnN2Rl9C
         Hb8j4y+6RVIqpgky6HugjXQjGrLHuhIQU0WgOU3OfQcUph8HfSOaNhF1kmmDMH8szXdn
         ZAJeMUVHDvK9lA0UyZum2XFFyVxqaiwz+VTqKFfPwAqrYzyxo74zyvjFaYUZkZBVwiix
         4uUiUoxJ520CsExSFa3QAVj57OUDw8WwAwRk2IVmxj12kL7xTyF4DONPReeOL00banUV
         RyCby9JseoJWPrKfjBAHT/Zxyd+LzG2JzL9rUn2GDfJEYmKG4EmIzU4mUm2eQGNvFnCr
         BGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699260607; x=1699865407;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsCANmYwXRnDmiAjkr58/AtcQu8TsUqslllZf46Wsxw=;
        b=uQAgCciyY8td1iYCosqt/AQTbxUSBIjGw77LIqNKD9OTyqD84X9H8KyDNUcguCbB97
         ynnOq6M7kmSUZ/AX4i/kCCHa49KZR5lZlhceYPQv18FzGxlUNBENc02ayx9hWry1BPKU
         Ec3BfPn/vGKExVNizEjyEXiH7+PaZnE9BMuGVbyPHPRf0HuE5lR2lDiRrYzdB+TkQ/SF
         eikmQuKlOqJ5b7QjjYLJs4T80cwqtuPvASsziuEBZgKa2f4PrEVxcS4TbPPoNxcWqCUb
         bVxiyNoBGfPRQQujDoyz9G0ORD5pnvif9krmiRqYoXJKM9jfVzswQ+K2I8AzIQYuk5fl
         78/Q==
X-Gm-Message-State: AOJu0Yz0zKLBalvHi8AnrVUwh6+cJLjClsGyIc7olBvGEzDVv3OGTp/A
	pzkWcBf4p8cypLZ/ODuM1Bmj/w==
X-Google-Smtp-Source: AGHT+IGqyaj7aBrtiaX/Xyz9ylIOat9r5LKS0SxYceKAy6Bcncptk2m+e4S7ZdYkY0O94IOLq9Da8w==
X-Received: by 2002:a17:907:785:b0:9a9:f042:deb9 with SMTP id xd5-20020a170907078500b009a9f042deb9mr8692907ejb.19.1699260606885;
        Mon, 06 Nov 2023 00:50:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906349300b009c3828fec06sm3859301ejb.81.2023.11.06.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:50:06 -0800 (PST)
Date: Mon, 6 Nov 2023 11:50:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [alobakin:pfcp 5/20] drivers/iio/imu/adis16475.c:363
 adis16475_set_freq() warn: set_bit() takes a bit number
Message-ID: <ff4ef031-774e-4e4d-a009-31f242bf6aee@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/alobakin/linux pfcp
head:   89565e300e3d4033b8bb568774804fdc09d4f3cc
commit: 945a0d6e86d97bf60f2fae88ee557ed3eae18b94 [5/20] bitops: let the compiler optimize {__,}assign_bit()
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231106/202311060647.i9XyO4ej-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060647.i9XyO4ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311060647.i9XyO4ej-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16475.c:363 adis16475_set_freq() warn: set_bit() takes a bit number
drivers/iio/imu/adis16475.c:363 adis16475_set_freq() warn: clear_bit() takes a bit number
drivers/iio/imu/adis16475.c:416 adis16475_set_filter() warn: set_bit() takes a bit number
drivers/iio/imu/adis16475.c:416 adis16475_set_filter() warn: clear_bit() takes a bit number

vim +363 drivers/iio/imu/adis16475.c

fff7352bf7a3ce Nuno Sá 2020-04-13  357  
9da1b86865ab43 Nuno Sá 2021-09-20  358  	adis_dev_unlock(&st->adis);
fff7352bf7a3ce Nuno Sá 2020-04-13  359  	/*
fff7352bf7a3ce Nuno Sá 2020-04-13  360  	 * If decimation is used, then gyro and accel data will have meaningful
fff7352bf7a3ce Nuno Sá 2020-04-13  361  	 * bits on the LSB registers. This info is used on the trigger handler.
fff7352bf7a3ce Nuno Sá 2020-04-13  362  	 */
fff7352bf7a3ce Nuno Sá 2020-04-13 @363  	assign_bit(ADIS16475_LSB_DEC_MASK, &st->lsb_flag, dec);

assign_bit() takes a bit number like 0.  But this is passing BIT(0) so
it's like BIT(BIT(0)).  Which is fine until you get to 5.


fff7352bf7a3ce Nuno Sá 2020-04-13  364  
fff7352bf7a3ce Nuno Sá 2020-04-13  365  	return 0;
39c024b51b5607 Nuno Sa 2021-02-18  366  error:
15aacc980dcb32 Nuno Sa 2021-02-18  367  	adis_dev_unlock(&st->adis);
39c024b51b5607 Nuno Sa 2021-02-18  368  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

