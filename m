Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B131E848
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 04:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780115958; cv=none; b=qjhnMgTsjmYtaLhj8zw4jA0lZycm7Gzu2mhhRuQeCoJIfs4SNKHtS/EhxfIu4vmSvMX4YPgAvWQXE5TQ+iOD2i+Ula3okLIZbkiCHfl3APyudISeVoe7Dmz0YqP6ga1xouJRk67JEVpgMBrY7oDq+vOX97RjUJbz1Rf4eo8L/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780115958; c=relaxed/simple;
	bh=MOxHJInR4U7FHUKNtD5jLQlWo7DPcRM+l/hwxBwtIV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nSeqxjjfRxPJ0YXbMe0wbFhxoEV3vUTvTvp7Q9Zk7aBlkNOS7VdypPi8D549hcAsoIcr7VHNDYh5jWZJxXk5vGf78SEZiEFmVDaAYuxjD3LqBO9zghRhb2M0zwZmiLsC76W4EbxBXx/1QhpI+8M6BAQTsaVBt0pFUf2GUdy1ksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFi0xV4T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFi0xV4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780115957; x=1811651957;
  h=date:from:to:cc:subject:message-id;
  bh=MOxHJInR4U7FHUKNtD5jLQlWo7DPcRM+l/hwxBwtIV8=;
  b=OFi0xV4TvDlZbGSlSg8L4R1Yp+MirAqfeH+T8jmSL+k2Vto9pnB2RG43
   QUaL1L6hiJDpXPB55FHcCLLuXS4GVy6X1ELO+CClRUvyXPNEGqqbl+72H
   pW94BiD6brEXA1CEKLbtJoEY3hfZKe6pbrUVHHrhU0LLZsiArLyudrO6J
   Qh0j7JVHwwePDZfkQSEhaCXLbHMcUgdPSrXD/Y1Gk6sDseSRKYR5Gc2XI
   oXV4FlMSaTDByGJbKHaCiqRXTdAhTE2EhEn5UZUUJp76adxXRahzM8ZyA
   C+54/Eoc1kzjv5hsK9Ov0unwm5BHA3u+BKHEJ5iXoTkxrb5UWkxyQlDH+
   A==;
X-CSE-ConnectionGUID: AE70QvdiSwm1eRPI6TPLSg==
X-CSE-MsgGUID: YwLX/pH8Rdiba8Dqd8uA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80991654"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80991654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 21:39:16 -0700
X-CSE-ConnectionGUID: SIKemS4ZQ1GOrykVsLm/Hw==
X-CSE-MsgGUID: 1YhAAaIoSqaC7w9HqM9E5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247035882"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2026 21:39:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTBTc-0000000086w-0bU9;
	Sat, 30 May 2026 04:39:12 +0000
Date: Sat, 30 May 2026 12:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Subject: [jic23-iio:testing 240/253]
 drivers/iio/light/apds9999.c:201:undefined reference to `__umoddi3'
Message-ID: <202605301225.6MQ3YOMu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   7b84b1e9dd850a5c9b55e27daa4ecdc2dd5b3431
commit: a67c818e7a5ce49e141f0d73f8330026e82bcc31 [240/253] iio: light: add support for APDS9999 sensor
config: i386-randconfig-r071-20260529 (https://download.01.org/0day-ci/archive/20260530/202605301225.6MQ3YOMu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301225.6MQ3YOMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301225.6MQ3YOMu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iio/light/apds9999.o: in function `apds9999_read_raw':
>> drivers/iio/light/apds9999.c:201:(.text+0x1cf): undefined reference to `__umoddi3'


vim +201 drivers/iio/light/apds9999.c

   166	
   167	static int apds9999_read_raw(struct iio_dev *indio_dev,
   168				     struct iio_chan_spec const *chan,
   169				     int *val, int *val2, long mask)
   170	{
   171		struct apds9999_data *data = iio_priv(indio_dev);
   172		int gain, itime_us;
   173		u64 scale_nano;
   174		u32 counts;
   175		int ret;
   176	
   177		switch (mask) {
   178		case IIO_CHAN_INFO_RAW:
   179			ret = apds9999_read_channel(data, chan->address, &counts);
   180			if (ret)
   181				return ret;
   182			*val = (int)counts;
   183			return IIO_VAL_INT;
   184	
   185		case IIO_CHAN_INFO_SCALE:
   186			/*
   187			 * Scale (lux per count) = 54 / (gain * integration_time_ms)
   188			 *
   189			 * The constant 54 is derived from the datasheet table:
   190			 *   at gain = 3x, itime = 100 ms -> 0.180 lux/count
   191			 *   -> C = 0.180 * 3 * 100 = 54
   192			 *
   193			 * Expressed as IIO_VAL_INT_PLUS_NANO.
   194			 */
   195			gain = apds9999_gains[data->als_gain_idx];
   196			itime_us = apds9999_itimes_us[data->als_res];
   197	
   198			/* scale_nano = 54 * 1e12 / (gain * itime_us) nano-lux/count */
   199			scale_nano = div_u64(54ULL * NSEC_PER_SEC * USEC_PER_MSEC, (u32)(gain * itime_us));
   200			*val = (int)div_u64(scale_nano, NSEC_PER_SEC);
 > 201			*val2 = (int)(scale_nano % NSEC_PER_SEC);
   202			return IIO_VAL_INT_PLUS_NANO;
   203	
   204		case IIO_CHAN_INFO_INT_TIME:
   205			*val = 0;
   206			*val2 = apds9999_itimes_us[data->als_res];
   207			return IIO_VAL_INT_PLUS_MICRO;
   208	
   209		default:
   210			return -EINVAL;
   211		}
   212	}
   213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
