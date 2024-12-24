Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993217E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 00:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734998878; cv=none; b=kOcnrBcGKsDIH8ws+OrYeYR3XZalRDqW6V4afm8dByC2z0KhVfP0x7AuF1tp2m4/zol+EKJNo68NcKuzefo5BXDqPabOSlym0YDqBSbO/v8NiM/hR2rmr/HK87sbLSj66bbfHE0X7QYxmQAdihPfmskCzT9haDzrEUHfaBJSj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734998878; c=relaxed/simple;
	bh=kHFUb1uicAxvrIoFeMIuCff8hX78FRx3HXAKno210Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U21m+hpjd/Q38vlPwKkKLrTyH/HoS92Ufrqj8ILaz2DIFQkM11aY0DJUe8+VecKUguykd2/XGJl1B50JR43j0SYeAKQnTEZIZr3yfie41n5v7ycF5+bsVgaW8d1OVV7fuf1WvsX1Gr5DpaGmZekhvURUILM0PMzJ9s+rNDSlvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFveL+ZR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFveL+ZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734998876; x=1766534876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kHFUb1uicAxvrIoFeMIuCff8hX78FRx3HXAKno210Lo=;
  b=RFveL+ZRhV319qYGTc3mlLg/NMWV/Xxu+Cc3H9avchBHshe4afIWiEPV
   4xj4qCTq8H4mk9rlF374I7elMAw1xRLIMpc4UKLNaygF6/aSThEnn2eBC
   C2E6RFZk8G5KFhH+OmfIh7Lb936FvhYRLhyACP8e2VLhulyeZTIm87/kj
   fdFTQi7Dv/OCKQ1kCR3EC6U6LYXQ37+E7vUvS0j6SmJv3MvaGJcOocz9A
   Jq4KgOHFkqD64pntqzJorhYcTaCOAh5erC7G06/mq6WQQaHtrHTFvYpsR
   mvXCWc4G5t8CcePzECOIzRMBbWngMPVWBRq0ZjX9++Mi3RpEeHOTJHER/
   w==;
X-CSE-ConnectionGUID: rphp1tH6S26cAL7xavm3pQ==
X-CSE-MsgGUID: ZCsg27auSrKJKfJhzLCmLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46155527"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="46155527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 16:07:56 -0800
X-CSE-ConnectionGUID: cnqeVrurQSa5W8G0pGu8xw==
X-CSE-MsgGUID: fndGkOPOQUKmU0N+ZW3cDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="99191991"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2024 16:07:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPsSm-0000iN-14;
	Tue, 24 Dec 2024 00:07:52 +0000
Date: Tue, 24 Dec 2024 08:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/aht10.c:182: warning: Function parameter or struct
 member 'data' not described in 'aht10_interval_write'
Message-ID: <202412240737.3JBrlh9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f07044dd0df0c9d0ad177c3098b62ccddb735a2d
commit: 8c78f0dee4371ab3b0422edf08597525c6219512 hwmon: Add AHT10 Temperature and Humidity Sensor Driver
date:   3 years, 11 months ago
config: arm64-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241224/202412240737.3JBrlh9w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240737.3JBrlh9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240737.3JBrlh9w-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
