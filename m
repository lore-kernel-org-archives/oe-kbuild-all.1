Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7381095C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwrHLvXx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-336897b6bd6so9324616f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jan 2024 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704205504; x=1704810304; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOeqNxFoyeCrwhIc7Zm0oAD7FdzCAicDI/pSsXWJWsw=;
        b=iwrHLvXxU4EANuhuba00J9YSuajgjf19DkLoDee2XLutbMOOU1kKsCXIQHMKeIYalK
         xZ5/0USJPDWVkzJljVko9so48gdAsndVeohRbhp49UV/9DaId8HMRHTAo7R01VcJ2tLh
         BOXFWxg0aCOT1FN1opJBvvJlx+jErIwSJaqrKgfmZTkB1lMjLGN8uT9lCsk+dzFXkrtE
         XFoL/bVHd+sXrGLIscTvIZfBPAngDI/hcs4YK3ZSyJIXVLOGhqOKF3jc1mqkCsAh1h4X
         ugIaJ4L8QrFIERdxw1yec+BE0H84NZx2wjfjO4iALdgnPnhDUZZUA+XaZOEtFD5Ondb6
         UwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704205504; x=1704810304;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOeqNxFoyeCrwhIc7Zm0oAD7FdzCAicDI/pSsXWJWsw=;
        b=q+MyJZgv9H4EEZDZcoYZpVVvJgy9oSTxaeImnMiS0zSj5197H+UTWKUnZIFSoaQoLh
         cuTKr3c5UmmYwXHe7YTWXo/a71t8h4c9T0HQP/jqSZNTiFGAW/4tVbwucsBMJqVmwL3Q
         djfq5LN4pL0bF2n4Ojd/a04/gcclrkSs4NHdCgf2ro1fi3B/ESZ3kALlnGnknZTgCwmf
         U+xWpFJSn2AgTx87/AsJcVzbCS+ZtpclRqzYjvD0ex8KjCjWwXfNKUSC+o84yrdylWwU
         9gH2eeSFwIuyY7bsBHgZrzZxo1pHk4ozi+TcAixdMt34UqAaraihncwJ6WkY0O5NcF/I
         ojbQ==
X-Gm-Message-State: AOJu0Yx4Jmxw+fcpfM0NzDeMsvQzwPJ7dSC+kv/mHQDw6AKQMKUlXVIf
	xSPnqdufFkQ+MOE/Acuvrf5SeFmcoX3jX5HY+KlOfcesNsQ=
X-Google-Smtp-Source: AGHT+IEVm0tzuC8KOvDwfwRU2/npZZmvHr2Mldh8PlxFjg3vD47oh97YWQ0llQ1CkT05+Hkpwf6iXw==
X-Received: by 2002:a05:600c:4918:b0:401:b6f6:d90c with SMTP id f24-20020a05600c491800b00401b6f6d90cmr8930723wmp.35.1704205504217;
        Tue, 02 Jan 2024 06:25:04 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id hg10-20020a05600c538a00b0040d7c3d5454sm15271021wmb.3.2024.01.02.06.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:25:04 -0800 (PST)
Date: Tue, 2 Jan 2024 17:25:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6418/8213] drivers/hwmon/pmbus/ltc4286.c:88
 ltc4286_probe() warn: passing zero to 'dev_err_probe'
Message-ID: <fe2b4d4b-b650-4366-a649-3438fb3d4dae@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 263835c7e3879a2bfa33fe86711349b30af0b0cd [6418/8213] hwmon: (pmbus) Add ltc4286 driver
config: riscv-randconfig-r081-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170449.GymH8cUN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312170449.GymH8cUN-lkp@intel.com/

smatch warnings:
drivers/hwmon/pmbus/ltc4286.c:88 ltc4286_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +88 drivers/hwmon/pmbus/ltc4286.c

263835c7e3879a Delphine CC Chiu 2023-11-23   67  static int ltc4286_probe(struct i2c_client *client)
263835c7e3879a Delphine CC Chiu 2023-11-23   68  {
263835c7e3879a Delphine CC Chiu 2023-11-23   69  	int ret;
263835c7e3879a Delphine CC Chiu 2023-11-23   70  	const struct i2c_device_id *mid;
263835c7e3879a Delphine CC Chiu 2023-11-23   71  	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
263835c7e3879a Delphine CC Chiu 2023-11-23   72  	struct pmbus_driver_info *info;
263835c7e3879a Delphine CC Chiu 2023-11-23   73  	u32 rsense;
263835c7e3879a Delphine CC Chiu 2023-11-23   74  	int vrange_nval, vrange_oval;
263835c7e3879a Delphine CC Chiu 2023-11-23   75  
263835c7e3879a Delphine CC Chiu 2023-11-23   76  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
263835c7e3879a Delphine CC Chiu 2023-11-23   77  	if (ret < 0) {
263835c7e3879a Delphine CC Chiu 2023-11-23   78  		return dev_err_probe(&client->dev, ret,
263835c7e3879a Delphine CC Chiu 2023-11-23   79  				     "Failed to read manufacturer id\n");
263835c7e3879a Delphine CC Chiu 2023-11-23   80  	}
263835c7e3879a Delphine CC Chiu 2023-11-23   81  
263835c7e3879a Delphine CC Chiu 2023-11-23   82  	/*
263835c7e3879a Delphine CC Chiu 2023-11-23   83  	 * Refer to ltc4286 datasheet page 20
263835c7e3879a Delphine CC Chiu 2023-11-23   84  	 * the manufacturer id is LTC
263835c7e3879a Delphine CC Chiu 2023-11-23   85  	 */
263835c7e3879a Delphine CC Chiu 2023-11-23   86  	if (ret != LTC4286_MFR_ID_SIZE ||
263835c7e3879a Delphine CC Chiu 2023-11-23   87  	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
263835c7e3879a Delphine CC Chiu 2023-11-23  @88  		return dev_err_probe(&client->dev, ret,
                                                                                                   ^^^
Use -EINVAL instead of ret.

263835c7e3879a Delphine CC Chiu 2023-11-23   89  				     "Manufacturer id mismatch\n");
263835c7e3879a Delphine CC Chiu 2023-11-23   90  	}
263835c7e3879a Delphine CC Chiu 2023-11-23   91  
263835c7e3879a Delphine CC Chiu 2023-11-23   92  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
263835c7e3879a Delphine CC Chiu 2023-11-23   93  	if (ret < 0) {
263835c7e3879a Delphine CC Chiu 2023-11-23   94  		return dev_err_probe(&client->dev, ret,
263835c7e3879a Delphine CC Chiu 2023-11-23   95  				     "Failed to read manufacturer model\n");
263835c7e3879a Delphine CC Chiu 2023-11-23   96  	}
263835c7e3879a Delphine CC Chiu 2023-11-23   97  
263835c7e3879a Delphine CC Chiu 2023-11-23   98  	for (mid = ltc4286_id; mid->name[0]; mid++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

