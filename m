Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45E3563E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149309; cv=none; b=UckPj3D5d3l+5llE0BS/tZueut+SRr8gqQ7ExOrWzL9tjIyHRo48vK5FdID9bxUVlDuUXcwyfmw8CbIV9hgqj4z6cemzCPl+nKmh7W7TFuXJy9t8AXTHqCIG3UNobkhkt4D7WdqZI4k3OqtVHfDFDSPc7e9/119DUSES6bSqDOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149309; c=relaxed/simple;
	bh=Nk9eI4aVcYUWS51KZcgqoA9HnBRh6SumVUmABqejdc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZTdT0KUdDSxb03mHL1+8Usa0gBOt1M9A3G6pPQk9WFuscpLzRW3fi1XUoyl71IRen5mU9xmc4u1w9j/PBtBj1q+1bwU5hEQcuzizF20MZrSEah8lb0eS8MzyOVtqoa9kqouLAt2XERfiXWVakH15x8FQf/X/wzmWczbq4189cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPfuZev3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPfuZev3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761149307; x=1792685307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nk9eI4aVcYUWS51KZcgqoA9HnBRh6SumVUmABqejdc8=;
  b=FPfuZev3rIziptZ7N5AnYIRxRYDK+TwuTi2sTm2PnDfpPYxQFMG5Qiq4
   BZk4QVR8KTeeZMEwjLK2jguBD6VsGgBJXczi//w3FXZDqPdc+J32j3Yd7
   us4URfw0jWV4aH0c0aABvBi8+hz+d1lpf9F9yA0PcMmOODeAwS7QLsCdy
   BGQJe0YHrkvoFr3TiJNdOfptS7cxoch+GETIBdBTCOdTyAtBmxgao1ofn
   RyT/24XzLZI6zAKF0Ut8LeJXqYIiMYTB43/DI7SilzdjPmXzvJaSIzDl/
   lVtlImVq8bN4RXf77vBs6db4HnO7RQtqa7Yn0UpEpbWwWuTyQNxib/JU2
   w==;
X-CSE-ConnectionGUID: zBBRJK5hSX2UjH+z1bx8vA==
X-CSE-MsgGUID: KG9TK3N2QW+HNpjRO3F+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63341535"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63341535"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:08:26 -0700
X-CSE-ConnectionGUID: BUguCTW0ThmPDcRDfxy3MA==
X-CSE-MsgGUID: jg9G04avQX2Y+CCBtVHR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="188316132"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 09:08:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBbNv-000CUf-0D;
	Wed, 22 Oct 2025 16:08:23 +0000
Date: Thu, 23 Oct 2025 00:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Petre Rodan <petre.rodan@subdimension.ro>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 2373/3483]
 drivers/iio/accel/bma220_core.c:394:undefined reference to
 `i2c_verify_client'
Message-ID: <202510222324.SxYlIaLW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: 3499375209ca839a741e775d579f8bb9b85529d5 [2373/3483] iio: accel: bma220: add i2c watchdog feature
config: i386-randconfig-054-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222324.SxYlIaLW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510222324.SxYlIaLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222324.SxYlIaLW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iio/accel/bma220_core.o: in function `bma220_init':
>> drivers/iio/accel/bma220_core.c:394:(.text+0x375): undefined reference to `i2c_verify_client'


vim +394 drivers/iio/accel/bma220_core.c

   365	
   366	static int bma220_init(struct device *dev, struct bma220_data *data)
   367	{
   368		int ret;
   369		unsigned int val;
   370		static const char * const regulator_names[] = { "vddd", "vddio", "vdda" };
   371	
   372		ret = devm_regulator_bulk_get_enable(dev,
   373						     ARRAY_SIZE(regulator_names),
   374						     regulator_names);
   375		if (ret)
   376			return dev_err_probe(dev, ret, "Failed to get regulators\n");
   377	
   378		ret = regmap_read(data->regmap, BMA220_REG_ID, &val);
   379		if (ret)
   380			return dev_err_probe(dev, ret,
   381					     "Failed to read chip id register\n");
   382	
   383		if (val != BMA220_CHIP_ID)
   384			dev_info(dev, "Unknown chip found: 0x%02x\n", val);
   385	
   386		ret = bma220_power(data, true);
   387		if (ret)
   388			return dev_err_probe(dev, ret, "Failed to power-on chip\n");
   389	
   390		ret = bma220_reset(data, true);
   391		if (ret)
   392			return dev_err_probe(dev, ret, "Failed to soft reset chip\n");
   393	
 > 394		if (i2c_verify_client(dev)) {
   395			ret = bma220_set_wdt(data, BMA220_WDT_1MS);
   396			if (ret)
   397				return dev_err_probe(dev, ret,
   398						     "Failed to set i2c watchdog\n");
   399		}
   400	
   401		return 0;
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
