Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F84D8B5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717966533; cv=none; b=mFUEdgLLSoB5Q6eJsT3Ct+Y8nzG87C1z2oKvWMpO6LSYQLuTTw7NG0EZ6pLXFXjWMmf4YGruuJuwRFFaOiyFDxKX5iUJD9XrsGulbH/oTINsQTXoqWTjdxHZ6gx9pFisrI4cvwa80r11yacde4y9ieOn4R9z1H9LODeEp9c77vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717966533; c=relaxed/simple;
	bh=QB8f8ARZxE/77w9mwbdTGP7QEtQu0dgwsjLqlzQu018=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qC9DnKk+eP+IjVFhx1sIGmGKml+Hk9bK/zZvYXdqyQAmoY0s9BM6TbKO+VHVlGqq2va7mTXcQ+ckhABJu+WwBsSrVMavs8YeiEyjoAoMP8C8nBU1j3sFbEYMWQl97AzEMQc+eLvZ0smxjjDkXxwzuCUcR8Y9qETGdINU1jvqy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBzKV7Kb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBzKV7Kb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717966532; x=1749502532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QB8f8ARZxE/77w9mwbdTGP7QEtQu0dgwsjLqlzQu018=;
  b=aBzKV7KbQYp67hkKJSdNYjxXyaT9rsLB+TgYufD+qR8vtkATcVDYS8xl
   dOKitbWCEniZU0G6dUYqsd8rTqJ/vUHYClGhW16MTlhgI+yYwIkrJpjAi
   GD/0ysXGY2rLjlGLXWz6LcUC+tvCHV6F/33US+cvug/zbXZHvKm4t+aL9
   WE42Fy2ju/j2VxUiSt82zHt5illpbzC7lKQ5s7zJOPXB+o13fZp0Yo/lz
   D0yw1nTPkJiaeHlfrYdWJAFel+uB7v4BSXjf4Wnxvc7zN9AAu5NW3+GHY
   oYlNCNg6F6zLo4vVUWVuLxIbDcLk1QAZFuRN1a2IMw3sIrS6cYYNNHmoA
   g==;
X-CSE-ConnectionGUID: qHv/EtpBT8O16arv2T+tuw==
X-CSE-MsgGUID: q0+Rif4aRYGfhYfwTX17DA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11988104"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="11988104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 13:55:30 -0700
X-CSE-ConnectionGUID: DXydtxdbQXKGtB0s32gBAA==
X-CSE-MsgGUID: Bj7nEAPXS3GoESflUPLJoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="69654787"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2024 13:55:29 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGPZW-0001aI-2N;
	Sun, 09 Jun 2024 20:55:26 +0000
Date: Mon, 10 Jun 2024 04:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/35]
 drivers/iio/proximity/hx9031as.c:884:undefined reference to `__udivdi3'
Message-ID: <202406100424.6bIpWyc8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   6002d745d5a485733c2f84d7c9dfcb904d51329e
commit: 3c22f4cfab67e9e5d8cf9c56f5ed6906ee5533eb [8/35] BACKPORT: FROMLIST: iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor driver
config: i386-randconfig-061-20240610 (https://download.01.org/0day-ci/archive/20240610/202406100424.6bIpWyc8-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100424.6bIpWyc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100424.6bIpWyc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iio/proximity/hx9031as.o: in function `hx9031as_get_samp_freq':
>> drivers/iio/proximity/hx9031as.c:884:(.text+0xe79): undefined reference to `__udivdi3'


vim +884 drivers/iio/proximity/hx9031as.c

   871	
   872	static int hx9031as_get_samp_freq(struct hx9031as_data *data, int *val, int *val2)
   873	{
   874		int ret;
   875		uint32_t odr;
   876		uint32_t buf[1];
   877	
   878		ret = regmap_read(data->regmap, HX9031AS_PRF_CFG, buf);
   879		if (ret)
   880			dev_err(&data->client->dev, "[%s]i2c read failed\n", __func__);
   881	
   882		odr = hx9031as_samp_freq_table[buf[0]];
   883		*val = 1000 / odr;
 > 884		*val2 = ((1000 % odr) * 1000000ULL) / odr;
   885		dev_info(&data->client->dev, "Period=%dms, Freq=%d.%dHz\n", odr, *val, *val2);
   886	
   887		return IIO_VAL_INT_PLUS_MICRO;
   888	}
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
