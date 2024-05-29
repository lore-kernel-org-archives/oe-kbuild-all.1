Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF81591F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993168; cv=none; b=aRFtIVaAFmc1pSGXroy5RmzMxeehCXcO5TOEiADFGx2+b4Pq+qhfoDZqOYzfOR2+EirytBPyLaxkf/uaYdZGas25HVqwhyhbKuDG3eF7m+H/z+v8reH55bdjwWP4+N4yaRNAUlMK0+XZe0AUdVl5C8g+VE9h/TI8JOY+XE4ou1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993168; c=relaxed/simple;
	bh=li4ZbxG2F4FGjel82rPqgESS9j5jdY8puT5M++X2kzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jInkwshYaleJbYU8c2JTDAGyr1vaET4/O+zfshc3uE0uibnrzP8PajZJ3l0WuaZLDx2i3umkC5v25oSutt8aDqYwsPeU0RgBg0ueTjDiWpm4Panp6Y/dpmvSjZt7nkzjXHLe4pbbKScew3hAQDC29H0YA8JnfAe61yr/sfTcLgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQN0Y/Wz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQN0Y/Wz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5dcb5a0db4so271685466b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993165; x=1717597965; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GL+ZXu8YsVg8veqNeDMZZjWT6LtrFbHYU/tEpop01gE=;
        b=EQN0Y/Wz2zWXPkE8KmoYStDoJQu+HTlUrq3J7GVd4FCDDfEyvjElY+rcpykX/f/0eq
         RJfX/0DHgSdTbL3LP/9uFJnpELpO+g1IHhLGb/kRSVRGFbMy32gy51SockfGNGRBS9ns
         SKP0OKLIv4SZpDcSOdFhTE/5A63pr58FHVA+Hy3bmSrvY6Y1SwM+04iUDoTd6BXwRwrF
         eeW4NUTzTKgK0hxoGFrapCmIZzo2Ur8YJEsWVzeXbXrfwaSLbghye8M1lr5NKwJ8/B23
         2jhbIWT1rlANmNx6RqpTt1euxNmXFu32LyQHqetkRhr4DkFQxkm3xb3XjaLlAdky3vx2
         bwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993165; x=1717597965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GL+ZXu8YsVg8veqNeDMZZjWT6LtrFbHYU/tEpop01gE=;
        b=JfLyeXb5fVNdBrYsr+mo8FS/RhecD/KSVNvnOTMVNyiHV2ODnDnsumgf1Uf3zzS1CJ
         88+N+X6k0ncSm0J7RjfjSrnHc5i6xO11gPhhNX3yIdQbZVLPLkT08ex4yDbZZdllA+aN
         pRS20Dt2orlGP4pVm95Tnk+VgjrTyH2Z9J/K06ZqwYbEzQIlLN1ra1WtaYlQ7bw/ZSH3
         BD2SJMcMg6+73GunTbfgOjhyxN5wBs004FO2KsiL6pZWj2hDaZkqmwjHSMm1a83BsQDV
         izlZEw4pVyX0QfK71ssEuyMXzEl1+13HJd5MDiULLmdhU02P3Qwq/ZiRLWIuH8TCFyhz
         nIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNgq5C6hr98a1mMDGKe808CxWQkNoMVgsmo14dLZRTdouIlbCXZB/lxQx/s/Suytio5wSY/4kg+GE+LEGo9CgyapR+M/Jd+Y78CbOt1w==
X-Gm-Message-State: AOJu0YzLLlqODvYqpG09baER5DweYi8gR8cQLEEepYPWGZUZ2icH/ui/
	l2R0GW9bebPGFzB4EndVdu6n0XSSKpB2kS7oY18JZyrkiD7EmmC99d3iK0aUVHk=
X-Google-Smtp-Source: AGHT+IFHKZcI8vnShZhzgKqN73KpOv8IjqZ877BnV4ShkqFBb+Deu4xUihuipUqnmdso1P98gLeYAA==
X-Received: by 2002:a17:906:dff9:b0:a5a:5bd3:9f0 with SMTP id a640c23a62f3a-a62641df7b1mr987106666b.24.1716993164975;
        Wed, 29 May 2024 07:32:44 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc4f465sm717035366b.120.2024.05.29.07.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:32:44 -0700 (PDT)
Date: Wed, 29 May 2024 17:32:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ramona Gradinariu <ramona.bolboaca13@gmail.com>,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org, nuno.sa@analog.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ramona Gradinariu <ramona.bolboaca13@gmail.com>
Subject: Re: [PATCH v5 9/9] drivers: iio: imu: Add support for adis1657x
 family
Message-ID: <ff870fa7-436c-4ab1-9e8b-a5efcdd28c29@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527142618.275897-10-ramona.bolboaca13@gmail.com>

Hi Ramona,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramona-Gradinariu/dt-bindings-iio-imu-Add-ADIS16501-compatibles/20240527-230203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240527142618.275897-10-ramona.bolboaca13%40gmail.com
patch subject: [PATCH v5 9/9] drivers: iio: imu: Add support for adis1657x family
config: x86_64-randconfig-161-20240528 (https://download.01.org/0day-ci/archive/20240528/202405281539.EXGy0dhk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405281539.EXGy0dhk-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16475.c:1608 adis16475_push_single_sample() warn: missing error code? 'ret'

vim +/ret +1608 drivers/iio/imu/adis16475.c

c49e2871e50119 Ramona Gradinariu 2024-05-27  1577  static int adis16475_push_single_sample(struct iio_poll_func *pf)
fff7352bf7a3ce Nuno Sá           2020-04-13  1578  {
fff7352bf7a3ce Nuno Sá           2020-04-13  1579  	struct iio_dev *indio_dev = pf->indio_dev;
fff7352bf7a3ce Nuno Sá           2020-04-13  1580  	struct adis16475 *st = iio_priv(indio_dev);
fff7352bf7a3ce Nuno Sá           2020-04-13  1581  	struct adis *adis = &st->adis;
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1582  	int ret, bit, buff_offset = 0, i = 0;
fff7352bf7a3ce Nuno Sá           2020-04-13  1583  	__be16 *buffer;
fff7352bf7a3ce Nuno Sá           2020-04-13  1584  	u16 crc;
fff7352bf7a3ce Nuno Sá           2020-04-13  1585  	bool valid;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1586  	u8 crc_offset = 9;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1587  	u16 burst_size = ADIS16475_BURST_MAX_DATA;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1588  	u16 start_idx = (st->info->flags & ADIS16475_HAS_TIMESTAMP32) ? 2 : 0;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1589  
fff7352bf7a3ce Nuno Sá           2020-04-13  1590  	/* offset until the first element after gyro and accel */
fff7352bf7a3ce Nuno Sá           2020-04-13  1591  	const u8 offset = st->burst32 ? 13 : 7;
fff7352bf7a3ce Nuno Sá           2020-04-13  1592  
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1593  	if (st->burst32) {
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1594  		crc_offset = (st->info->flags & ADIS16475_HAS_TIMESTAMP32) ? 16 : 15;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1595  		burst_size = adis->data->burst_max_len;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1596  	}
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1597  
fff7352bf7a3ce Nuno Sá           2020-04-13  1598  	ret = spi_sync(adis->spi, &adis->msg);
fff7352bf7a3ce Nuno Sá           2020-04-13  1599  	if (ret)
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1600  		return ret;
fff7352bf7a3ce Nuno Sá           2020-04-13  1601  
fff7352bf7a3ce Nuno Sá           2020-04-13  1602  	buffer = adis->buffer;
fff7352bf7a3ce Nuno Sá           2020-04-13  1603  
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1604  	crc = be16_to_cpu(buffer[crc_offset]);
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1605  	valid = adis16475_validate_crc(adis->buffer, crc, burst_size, start_idx);
fff7352bf7a3ce Nuno Sá           2020-04-13  1606  	if (!valid) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1607  		dev_err(&adis->spi->dev, "Invalid crc\n");
7f174ee4adeb12 Ramona Gradinariu 2024-05-27 @1608  		return ret;
                                                                ^^^^^^^^^^
return -EINVAL

fff7352bf7a3ce Nuno Sá           2020-04-13  1609  	}
fff7352bf7a3ce Nuno Sá           2020-04-13  1610  
fff7352bf7a3ce Nuno Sá           2020-04-13  1611  	for_each_set_bit(bit, indio_dev->active_scan_mask,
fff7352bf7a3ce Nuno Sá           2020-04-13  1612  			 indio_dev->masklength) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1613  		/*
fff7352bf7a3ce Nuno Sá           2020-04-13  1614  		 * When burst mode is used, system flags is the first data
fff7352bf7a3ce Nuno Sá           2020-04-13  1615  		 * channel in the sequence, but the scan index is 7.
fff7352bf7a3ce Nuno Sá           2020-04-13  1616  		 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

