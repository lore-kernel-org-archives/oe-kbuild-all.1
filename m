Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09768E55B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 07:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208143; cv=none; b=tJmtKg9J0tx5yJiCvIHz7CbC+FzmPC6b6AxRddImu2K/CjUTGWOzhk6wt8xmHGOkimAjddfxFsARlrwHUnbFGNaoemdKgi4VSxuWFqHCm5O/Tx09NwQbBy3jEeG6xTG3IethE0kdNBUIkh+YW/6y1AxNf7WhOgeKdciIYr9dtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208143; c=relaxed/simple;
	bh=axCBWA9+nAp5Kl8P2U9s1qjPqKKUIoVexZjziSBLNaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atEA2hHE2Q3PZ1Qa6sTM7NGq6VmXUODwyh6zK5uI7U5T6cJwldvmD0lfWMJ1eI58Pjq2LRugM2AgEdHZKTzriScxZ68tV3JIxfEkhxIuhnQS4VKRlFJTbP9HlWzQm7ylthHKOlUCRE0QuQVPreRwG5lhNPVlB9S0b+EJsMwhEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuoyvKRb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuoyvKRb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b9303998so380324f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 00:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747208139; x=1747812939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKciRmDBZ9AwjGkD9L5BtEN88nJjMlk+l+zu6O+MRwE=;
        b=DuoyvKRbDwQTqPbfzDyuHEOHyZyOcU7KJ29B6yLFCKme7WquoHRR+Jup4L1kO2n3k1
         Vg49yYzuyNYfVSxNmnascym1JOKiYVo2fBTp2pc6L3JrC/zP5e7xsxGdnCT+IVIHXCTV
         lSl1RLK6noE236fQtgQkpdUafEwkNkutNlRcWjUrf1hB8wFbumLX0k+QqASLweX0VxrR
         JKseN6bLqarYls9ftaanbfklE722PHg2/l3/W8n/1sNDEn4/YRNg2DrxP4h88QwqRZmb
         MPAmSnpncBcv6RMAES0f0BF+ZOUP22iWPvBxllp/QT1PMzBu+y9KdDbtaOsChlWzmjXh
         ukdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747208139; x=1747812939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKciRmDBZ9AwjGkD9L5BtEN88nJjMlk+l+zu6O+MRwE=;
        b=hgvTm6QW1nFn/D0luJKcmYZJbpHZbh3HKO7V6JptTRUjdGR1PNd5qDIy9A1ReIrDET
         BtbuMJ5/HM8QfsAVfvQqiJ0nVRsnckQ8z3K8nTs9ncD1+Z3CwinQur3sVgIyCgbWBsoS
         6as2TE+RpVKsB9hTs8VLeMgfzzMEA2db4KkmxQVdDRgnQACvxoS2dRD8wroM5arf/ftC
         IZxOR7o62jPd80zzUXJwTZpqQplnkEHZGXxJwvD6jUpf4Iv/s+Oh+vOUB6WysUFzEQAN
         z7nv496PWCzsdGJlCi7OEdcOGoHHpdKWbF+A1i20nnpu3534yF6MJU9FQqNCJSeqXFKg
         PcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUox2mIynpxx3XCEu5HY7YMAmI2vTDxX1UsXO9W3noFjPPXns/9m0QnlmLosWMZ7Zj8BYTQKGuQdMnfjLTo@lists.linux.dev
X-Gm-Message-State: AOJu0YyCpuwTbk38nlaa+z0KIKG8yw7YxbOxp/QH5ci1rYNK34e9jMti
	5c79JNhlQbu1lyA2yGqTnySrTk5hAdM1SrCwDUsbfuxR3z+9Eg6PpQM83InxXykU5jxQ6UmaDCw
	BBsH64rv2Sx5w3xboxeGgoWQKnFo=
X-Gm-Gg: ASbGncsG1yeKoKEb8EaW5sJpiyz8VVVfX6Jb2Imipagiw7845BUmYJW+dHa+q17VS2j
	wCTiSYn+7cVEAflTFOxUwOjSQdXsI9ys/sjISb1CuasL0rsskLyY8QzQ5SPSRxrJmXuiJuRgkWQ
	1QmxlP644wGiUDpfgZI0bO1bpWrM1aC6scBA==
X-Google-Smtp-Source: AGHT+IGpvyT7UCqYcGMTF0Q7/fR6dW3DH3J3Ou0AFgCUEgJOB0O9V6BVBHL7jzJmZShW45Wf42Ynm+1kTrOvivQW/2g=
X-Received: by 2002:a05:6000:3108:b0:3a0:825a:cf8a with SMTP id
 ffacd0b85a97d-3a348dc5277mr2110740f8f.26.1747208139009; Wed, 14 May 2025
 00:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505141248.faRUM6Fb-lkp@intel.com>
In-Reply-To: <202505141248.faRUM6Fb-lkp@intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 May 2025 10:35:27 +0300
X-Gm-Features: AX0GCFuU9plBeIKysb7fQHpgl8wLaRzLzIzwpVkyHxTMQwHu5l1XEeI-QrGDVBk
Message-ID: <CAPVz0n0EYq4FiurTBwHHVNjBjb4HYMVnkxEq-W7GvEyPuGnqSg@mail.gmail.com>
Subject: Re: [linux-next:master 9847/10774] extcon-max14526.c:undefined
 reference to `i2c_register_driver'
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 14 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 07:3=
2 kernel test robot <lkp@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> commit: c2aeb8647e53c49874429bdb0bf132ce25bd8c63 [9847/10774] extcon: Add=
 basic support for Maxim MAX14526 MUIC
> config: arm64-randconfig-002-20250514 (https://download.01.org/0day-ci/ar=
chive/20250514/202505141248.faRUM6Fb-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250514/202505141248.faRUM6Fb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505141248.faRUM6Fb-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>    aarch64-linux-ld: drivers/leds/leds-lp50xx.o: in function `lp50xx_driv=
er_init':
> >> leds-lp50xx.c:(.init.text+0x24): undefined reference to `i2c_register_=
driver'
>    aarch64-linux-ld: drivers/leds/leds-lp50xx.o: in function `lp50xx_driv=
er_exit':
> >> leds-lp50xx.c:(.exit.text+0x10): undefined reference to `i2c_del_drive=
r'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_smbus_byte_reg_read':
> >> regmap-i2c.c:(.text+0x2c4): undefined reference to `i2c_smbus_read_byt=
e_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_smbus_byte_reg_write':
> >> regmap-i2c.c:(.text+0x314): undefined reference to `i2c_smbus_write_by=
te_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_smbus_word_reg_read':
> >> regmap-i2c.c:(.text+0x354): undefined reference to `i2c_smbus_read_wor=
d_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_smbus_word_read_swapped':
>    regmap-i2c.c:(.text+0x3a4): undefined reference to `i2c_smbus_read_wor=
d_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_smbus_word_write_swapped':
> >> regmap-i2c.c:(.text+0x410): undefined reference to `i2c_smbus_write_wo=
rd_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_smbus_word_reg_write':
>    regmap-i2c.c:(.text+0x454): undefined reference to `i2c_smbus_write_wo=
rd_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_smbus_i2c_read_reg16':
>    regmap-i2c.c:(.text+0x4ac): undefined reference to `i2c_smbus_write_by=
te_data'
> >> aarch64-linux-ld: regmap-i2c.c:(.text+0x4d8): undefined reference to `=
i2c_smbus_read_byte'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_smbus_i2c_write_reg16':
> >> regmap-i2c.c:(.text+0x568): undefined reference to `i2c_smbus_write_i2=
c_block_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_smbus_i2c_write':
>    regmap-i2c.c:(.text+0x5ac): undefined reference to `i2c_smbus_write_i2=
c_block_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_smbus_i2c_read':
> >> regmap-i2c.c:(.text+0x5f8): undefined reference to `i2c_smbus_read_i2c=
_block_data'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_read':
> >> regmap-i2c.c:(.text+0x684): undefined reference to `i2c_transfer'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_gather_write':
>    regmap-i2c.c:(.text+0x738): undefined reference to `i2c_transfer'
>    aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regma=
p_i2c_write':
> >> regmap-i2c.c:(.text+0x7b0): undefined reference to `i2c_transfer_buffe=
r_flags'
>    aarch64-linux-ld: drivers/extcon/extcon-max14526.o: in function `max14=
526_driver_init':
> >> extcon-max14526.c:(.init.text+0x24): undefined reference to `i2c_regis=
ter_driver'
>    aarch64-linux-ld: drivers/extcon/extcon-max14526.o: in function `max14=
526_driver_exit':
> >> extcon-max14526.c:(.exit.text+0x10): undefined reference to `i2c_del_d=
river'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for REGMAP_I2C
>    Depends on [m]: I2C [=3Dm]
>    Selected by [y]:
>    - EXTCON_MAX14526 [=3Dy] && EXTCON [=3Dy]
>    Selected by [m]:

Undefined reference is caused by building i2c as a module, while
extcon is built in. This issue should be resolved by adding 'depends
on I2C' to EXTCON_MAX14526 Kconfig.
Chanwoo Choi, should I submit a fix as a follow up or should I send v4
of max14526 bringup?

>    - EEPROM_AT24 [=3Dm] && I2C [=3Dm] && SYSFS [=3Dy]
>    - TOUCHSCREEN_AD7879_I2C [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHSCREEN [=
=3Dy] && TOUCHSCREEN_AD7879 [=3Dy] && I2C [=3Dm]
>    - TOUCHSCREEN_CYTTSP5 [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHSCREEN [=3D=
y] && I2C [=3Dm]
>    - TOUCHSCREEN_GOODIX_BERLIN_I2C [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHS=
CREEN [=3Dy] && I2C [=3Dm]
>    - TOUCHSCREEN_HIDEEP [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHSCREEN [=3Dy=
] && I2C [=3Dm]
>    - TOUCHSCREEN_HYCON_HY46XX [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHSCREEN=
 [=3Dy] && I2C [=3Dm]
>    - TOUCHSCREEN_EDT_FT5X06 [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHSCREEN [=
=3Dy] && I2C [=3Dm]
>    - TOUCHSCREEN_TSC2004 [=3Dm] && INPUT [=3Dy] && INPUT_TOUCHSCREEN [=3D=
y] && I2C [=3Dm]
>    - SERIAL_MAX310X [=3Dm] && TTY [=3Dy] && HAS_IOMEM [=3Dy] && SPI_MASTE=
R [=3Dy] && I2C [=3Dm]
>    - I2C_MUX_LTC4306 [=3Dm] && I2C [=3Dm] && I2C_MUX [=3Dm]
>    - PINCTRL_AW9523 [=3Dm] && PINCTRL [=3Dy] && OF [=3Dy] && I2C [=3Dm]
>    - GPIO_DS4520 [=3Dm] && GPIOLIB [=3Dy] && I2C [=3Dm]
>    - GPIO_PCA953X [=3Dm] && GPIOLIB [=3Dy] && I2C [=3Dm]
>    - IP5XXX_POWER [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - CHARGER_ADP5061 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - BATTERY_CW2015 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - CHARGER_SBS [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - BATTERY_MAX1720X [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - CHARGER_MAX77976 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - CHARGER_BQ24257 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && (GPIO=
LIB [=3Dy] || COMPILE_TEST [=3Dy])
>    - CHARGER_BQ2515X [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && (GPIO=
LIB [=3Dy] || COMPILE_TEST [=3Dy])
>    - CHARGER_BQ25980 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && (GPIO=
LIB [=3Dy] || COMPILE_TEST [=3Dy])
>    - CHARGER_BQ256XX [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && (GPIO=
LIB [=3Dy] || COMPILE_TEST [=3Dy])
>    - CHARGER_SMB347 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && REGULA=
TOR [=3Dy]
>    - CHARGER_RT9455 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && (GPIOL=
IB [=3Dy] || COMPILE_TEST [=3Dy])
>    - CHARGER_RT9467 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && GPIOLI=
B [=3Dy] && REGULATOR [=3Dy]
>    - CHARGER_UCS1002 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm] && OF [=
=3Dy] && REGULATOR [=3Dy]
>    - FUEL_GAUGE_MM8013 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>    - SENSORS_ADT7470 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_ISL28022 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_JC42 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_LTC2947_I2C [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_LTC2991 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_LTC4260 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_MAX1668 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_MAX31760 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - MAX31827 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_MAX6621 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_MAX6639 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_MC34VR500 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_LM92 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_LM95234 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_NCT7363 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_NCT7802 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_AMC6821 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_INA2XX [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_INA238 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_INA3221 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_TMP102 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_TMP103 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_TMP464 [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - SENSORS_W83773G [=3Dm] && HWMON [=3Dy] && I2C [=3Dm]
>    - MFD_ADP5585 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_ACT8945A [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_SMPRO [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_BCM590XX [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_BD9571MWV [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_AXP20X_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_CS42L43_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_DA9063 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_DA9150 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_GATEWORKS_GSC [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - MFD_MP2629 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_88PM805 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_MAX14577 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_MAX77650 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_MAX77686 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_MAX77693 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_MT6360 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_MT6370 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_RT5033 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_RT5120 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_RN5T618 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_SIMPLE_MFD_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_SKY81452 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_LP3943 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - TPS6105X [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_TPS65086 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_TPS65217 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_TPS65218 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_TPS65219 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_TPS65912_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_TPS6594_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_ARIZONA_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_WM8994 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - MFD_STMFX [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy]
>    - MFD_KHADAS_MCU [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && (ARCH_MES=
ON [=3Dy] || ARCH_ROCKCHIP [=3Dy] || COMPILE_TEST [=3Dy])
>    - MFD_QCOM_PM8008 [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm] && OF [=3Dy=
]
>    - MFD_CS40L50_I2C [=3Dm] && HAS_IOMEM [=3Dy] && I2C [=3Dm]
>    - REGULATOR_88PG86X [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_ACT8865 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && POWER_=
SUPPLY [=3Dy]
>    - REGULATOR_AW37503 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && GPIOLI=
B [=3Dy]
>    - REGULATOR_DA9121 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=3D=
y]
>    - REGULATOR_FAN53555 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_FAN53880 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - REGULATOR_ISL9305 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_LP8755 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_LTC3676 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_MAX8893 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_MAX20086 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_MAX20411 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_MCP16502 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - REGULATOR_MP5416 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=3D=
y]
>    - REGULATOR_MP886X [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=3D=
y]
>    - REGULATOR_MPQ7920 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - REGULATOR_MT6311 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_PF9453 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_PFUZE100 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - REGULATOR_PV88080 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RAA215300 [=3Dm] && REGULATOR [=3Dy] && COMMON_CLK [=3Dy] =
&& I2C [=3Dm]
>    - REGULATOR_RT4801 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RT4803 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RT5759 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RT6160 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RT6190 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RT6245 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RTQ2134 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RTMV20 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_RTQ2208 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_SY8824X [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - REGULATOR_TPS51632 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_TPS62360 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - REGULATOR_TPS6286X [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - REGULATOR_TPS65023 [=3Dm] && REGULATOR [=3Dy] && I2C [=3Dm]
>    - MAX6959 [=3Dm] && AUXDISPLAY [=3Dy] && I2C [=3Dm]
>    - BACKLIGHT_KTZ8866 [=3Dm] && HAS_IOMEM [=3Dy] && BACKLIGHT_CLASS_DEVI=
CE [=3Dm] && I2C [=3Dm]
>    - BACKLIGHT_LM3509 [=3Dm] && HAS_IOMEM [=3Dy] && BACKLIGHT_CLASS_DEVIC=
E [=3Dm] && I2C [=3Dm]
>    - BACKLIGHT_LM3639 [=3Dm] && HAS_IOMEM [=3Dy] && BACKLIGHT_CLASS_DEVIC=
E [=3Dm] && I2C [=3Dm]
>    - USB_HSIC_USB3503 [=3Dm] && USB_SUPPORT [=3Dy] && USB [=3Dy] && I2C [=
=3Dm]
>    - TYPEC_TPS6598X [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] && I2C [=
=3Dm]
>    - TYPEC_STUSB160X [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] && (USB=
_ROLE_SWITCH [=3Dy] || !USB_ROLE_SWITCH [=3Dy]) && I2C [=3Dm]
>    - TYPEC_WUSB3801 [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] && I2C [=
=3Dm]
>    - TYPEC_MUX_IT5205 [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] && I2C=
 [=3Dm]
>    - TYPEC_MUX_NB7VPQ904M [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] &&=
 I2C [=3Dm] && (DRM [=3Dn] || DRM [=3Dn]=3Dn [=3Dn])
>    - TYPEC_MUX_PTN36502 [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] && I=
2C [=3Dm] && (DRM [=3Dn] || DRM [=3Dn]=3Dn [=3Dn])
>    - LEDS_AW2013 [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm] && OF [=3Dy]
>    - LEDS_LM3532 [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm]
>    - LEDS_LM3642 [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm]
>    - LEDS_LM3692X [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm] && OF [=3Dy]
>    - LEDS_LP8860 [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm] && OF [=3Dy]
>    - LEDS_LP8864 [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm] && OF [=3Dy]
>    - LEDS_TLC591XX [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C =
[=3Dm]
>    - LEDS_LM355x [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2C [=
=3Dm]
>    - LEDS_IS31FL319X [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS [=3Dy] && I2=
C [=3Dm]
>    - LEDS_LM3601X [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS_FLASH [=3Dm] &&=
 LEDS_CLASS [=3Dy] && I2C [=3Dm]
>    - LEDS_RT4505 [=3Dm] && NEW_LEDS [=3Dy] && LEDS_CLASS_FLASH [=3Dm] && =
I2C [=3Dm] && OF [=3Dy] && (V4L2_FLASH_LED_CLASS [=3Dn] || !V4L2_FLASH_LED_=
CLASS [=3Dn])
>    - NVSW_SN2201 [=3Dm] && MELLANOX_PLATFORM [=3Dy] && HWMON [=3Dy] && I2=
C [=3Dm] && (ACPI [=3Dn] || COMPILE_TEST [=3Dy])
>    - COMMON_CLK_SI5341 [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm]
>    - COMMON_CLK_SI544 [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm]
>    - COMMON_CLK_SI570 [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - COMMON_CLK_TPS68470 [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm] && (IN=
TEL_SKL_INT3472 [=3Dn] || COMPILE_TEST [=3Dy])
>    - COMMON_CLK_CS2000_CP [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm]
>    - COMMON_CLK_RS9_PCIE [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm] && OF =
[=3Dy]
>    - COMMON_CLK_SI521XX [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm] && OF [=
=3Dy]
>    - COMMON_CLK_VC3 [=3Dm] && COMMON_CLK [=3Dy] && I2C [=3Dm] && OF [=3Dy=
]
>    - EXTCON_MAX14577 [=3Dm] && EXTCON [=3Dy] && MFD_MAX14577 [=3Dm]
>    - EXTCON_RT8973A [=3Dm] && EXTCON [=3Dy] && I2C [=3Dm]
>    - EXTCON_SM5502 [=3Dm] && EXTCON [=3Dy] && I2C [=3Dm]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
