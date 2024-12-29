Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32888194094
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 21:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735506968; cv=none; b=MJn/cAa4DsV6RavIE6eWVfnKMQZ0WYDfuO81MdqI+vNtyijgcKQLJ8XSmlNTNqSQcNmLJpNTQKqCJhbMody2kylqGUXn+hz5psSmFo9JtOg61BN9fFZkqsdN4uXh2iUHE9z8OR1ZTrmLowao+Y/IhWfklZn79X7VdXJGcYkAGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735506968; c=relaxed/simple;
	bh=L2ilbI4yPlcQpbEe9twOdylNt72FHtlqYjmt9v7DNz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9BhsUJ7uR+gaHuBZ0t8a5FXWvBqb+wsrQYE51RSXeQizBiGOMRFmElFGwXMHnVZGCw55WnD0sz+7b3P3ruACRkxpcv6M/+4QvNv3iaQrb7MI3rh4rAZbpLa5jrHPwr1iCTxMyC7q4ex1rOm0PlgE/aCHz+huPottko3sfJ1GFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuCMUltU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuCMUltU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735506966; x=1767042966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2ilbI4yPlcQpbEe9twOdylNt72FHtlqYjmt9v7DNz4=;
  b=VuCMUltUys7xJ0sUUPabC/E0+XV1Rl3VG00Yt6FY9zjCdENoDgtZVAOl
   O7yHcuQ6zMLHoMEEELUgbBVZJi+BLw5JCxu6ANhPnRMnHyu36+7GmvQr8
   CZhHs1NSjXhc90p0C4M/Zkh46Fe8YW7Nk/llBvecZ1HckP5ebMPVvCQ9V
   zSyTXAdygxo3U9oA8JdH06kZCvLFQ4zXz7ApQycRw9sH9/o7bRkm5MjLA
   3yOBnbiz4sGTGeSiXW6o4xsD7lXRPD13QUZILUqn0qOtKDpb7AcrNYXnF
   OySH0JUhr4jPImap+lL1l24XToExHtKJBqjbUqBJ9xybjZNIB2/6RM8W9
   A==;
X-CSE-ConnectionGUID: 7FYKu34BR5qTDIXSe77Vaw==
X-CSE-MsgGUID: q9PM9rSWT2edEeHciU0bqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39739017"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="39739017"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 13:16:06 -0800
X-CSE-ConnectionGUID: UBsjQnHyTZi27F0P0COfKA==
X-CSE-MsgGUID: dFYuaWt3RbuNdnmovlGkAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="100377895"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Dec 2024 13:16:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS0dm-00058u-11;
	Sun, 29 Dec 2024 21:16:02 +0000
Date: Mon, 30 Dec 2024 05:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/aht10.c:182: warning: Function parameter or struct
 member 'data' not described in 'aht10_interval_write'
Message-ID: <202412300451.KZjpUsgz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4099a71718b056d16af5ba095c91016c3b107862
commit: 8c78f0dee4371ab3b0422edf08597525c6219512 hwmon: Add AHT10 Temperature and Humidity Sensor Driver
date:   3 years, 11 months ago
config: mips-randconfig-c004-20220208 (https://download.01.org/0day-ci/archive/20241230/202412300451.KZjpUsgz-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300451.KZjpUsgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412300451.KZjpUsgz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.o: in function `setup_wakeup_events':
>> (.text.setup_wakeup_events+0x60): undefined reference to `i8042_command'
   mips64el-linux-ld: (.text.setup_wakeup_events+0xe8): undefined reference to `i8042_command'
--
   drivers/hwmon/aht10.c:87: warning: Excess function parameter 'client' description in 'aht10_init'
   drivers/hwmon/aht10.c:131: warning: Function parameter or struct member 'data' not described in 'aht10_read_values'
   drivers/hwmon/aht10.c:131: warning: Excess function parameter 'aht10_data' description in 'aht10_read_values'
>> drivers/hwmon/aht10.c:182: warning: Function parameter or struct member 'data' not described in 'aht10_interval_write'
>> drivers/hwmon/aht10.c:182: warning: Function parameter or struct member 'val' not described in 'aht10_interval_write'
>> drivers/hwmon/aht10.c:193: warning: Function parameter or struct member 'data' not described in 'aht10_interval_read'
>> drivers/hwmon/aht10.c:193: warning: Function parameter or struct member 'val' not described in 'aht10_interval_read'
>> drivers/hwmon/aht10.c:202: warning: Function parameter or struct member 'data' not described in 'aht10_temperature1_read'
>> drivers/hwmon/aht10.c:202: warning: Function parameter or struct member 'val' not described in 'aht10_temperature1_read'
>> drivers/hwmon/aht10.c:217: warning: Function parameter or struct member 'data' not described in 'aht10_humidity1_read'
>> drivers/hwmon/aht10.c:217: warning: Function parameter or struct member 'val' not described in 'aht10_humidity1_read'


vim +182 drivers/hwmon/aht10.c

   174	
   175	/**
   176	 * aht10_interval_write() - store the given minimum poll interval.
   177	 * Return: 0 on success, -EINVAL if a value lower than the
   178	 *         AHT10_MIN_POLL_INTERVAL is given
   179	 */
   180	static ssize_t aht10_interval_write(struct aht10_data *data,
   181					    long val)
 > 182	{
   183		data->min_poll_interval = ms_to_ktime(clamp_val(val, 2000, LONG_MAX));
   184		return 0;
   185	}
   186	
   187	/**
   188	 * aht10_interval_read() - read the minimum poll interval
   189	 *                            in milliseconds
   190	 */
   191	static ssize_t aht10_interval_read(struct aht10_data *data,
   192					   long *val)
 > 193	{
   194		*val = ktime_to_ms(data->min_poll_interval);
   195		return 0;
   196	}
   197	
   198	/**
   199	 * aht10_temperature1_read() - read the temperature in millidegrees
   200	 */
   201	static int aht10_temperature1_read(struct aht10_data *data, long *val)
 > 202	{
   203		int res;
   204	
   205		res = aht10_read_values(data);
   206		if (res < 0)
   207			return res;
   208	
   209		*val = data->temperature;
   210		return 0;
   211	}
   212	
   213	/**
   214	 * aht10_humidity1_read() - read the relative humidity in millipercent
   215	 */
   216	static int aht10_humidity1_read(struct aht10_data *data, long *val)
 > 217	{
   218		int res;
   219	
   220		res = aht10_read_values(data);
   221		if (res < 0)
   222			return res;
   223	
   224		*val = data->humidity;
   225		return 0;
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
