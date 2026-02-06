Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D53396B72
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378899; cv=none; b=oaMk+1jBATSRBK5WSuuP3OOniR/JgLxfj216+aSH5SHkMQNVJaVPiGXyb9HJ5i+kbC0PBWRIVXn0hydL9x9fA8FrGMCUy38tQizGF0s+wQ1UqM01GbwfAAoznAxHC8BKWVu9T5RGyC8y2Xnf8zZWcidrMRBj9i2Y4blYvNF9LKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378899; c=relaxed/simple;
	bh=h2VuUVKlDV4jAZxEPd2lvx3rurC5dt2iKxf6GP6j/58=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qC2GN+DYg1K895eJosag6bFoXTRQipeL2oaMQ2/U6UHQNge5zG1VVb257dnglkNL+jqu8+nlpLVHNIRz55/i0Ng2gg98KTGrO8QewpxeXs3Qs98nc4qSOh46+Vd1pYkwjPo+WQs52ts8YVtc5ukPiW4AsFqbY7t++Te/PaJd57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5Y2i9mb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5Y2i9mb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770378898; x=1801914898;
  h=date:from:to:cc:subject:message-id;
  bh=h2VuUVKlDV4jAZxEPd2lvx3rurC5dt2iKxf6GP6j/58=;
  b=S5Y2i9mbFpQLuyW2UqHmu5J/k+zUV1INhu0TEVcl6piTkIUbsEWnkA2U
   4ztAgBhRB+E5lXPGYJVqJ6c64fct0yp6qecIgzwuAU2Rfm2k5l9DAHFZF
   KTupoBsWm6YU/qriv9xcfLIEOyTEvv+y2+iLg8Tbi3I3Pshh/RSwVsPQC
   WVIoYWXk8dkhgrrcWQ8Zk4uOYGXA4Gwt+OkW0XfRaSKFailZJvi8W1Y0r
   ZqOIdvH/Gs9cs/NGI++bpUzKQvpGtqTmx2g6/4HQZiWRtZske4zRzmstk
   HW8wG1mt2KLJ7C9rj7IkbAL/Mbwo+zqQtC9e+ESoAsiji5Co8I1Vs+lb7
   w==;
X-CSE-ConnectionGUID: 0pq1GEeVR6ioTXAPVY/06g==
X-CSE-MsgGUID: haCD6BirSiy+jSaq666DNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71477519"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71477519"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:54:57 -0800
X-CSE-ConnectionGUID: jrUXA3S7QP+Q+SzwAB2qiA==
X-CSE-MsgGUID: 359qtXgzT0Crxfe+8qonFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="209944919"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Feb 2026 03:54:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voKQH-00000000ki6-2aYU;
	Fri, 06 Feb 2026 11:54:53 +0000
Date: Fri, 06 Feb 2026 19:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/macintosh/windfarm_lm75_sensor.c:70:21: sparse: sparse: cast to
 restricted __le16
Message-ID: <202602061945.ZOOQ49cV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   6b1c42d783637b473efce598dce9deab5c10ed42
commit: 6b1c42d783637b473efce598dce9deab5c10ed42 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc64-randconfig-r133-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061945.ZOOQ49cV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061945.ZOOQ49cV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061945.ZOOQ49cV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/macintosh/windfarm_lm75_sensor.c:70:21: sparse: sparse: cast to restricted __le16
--
>> drivers/macintosh/windfarm_smu_sat.c:82:15: sparse: sparse: cast to restricted __le16
--
>> drivers/rpmsg/qcom_glink_smem.c:108:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *s @@     got void * @@
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     expected void const volatile [noderef] __iomem *s
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     got void *
>> drivers/rpmsg/qcom_glink_smem.c:111:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *s @@     got void *fifo @@
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     expected void const volatile [noderef] __iomem *s
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     got void *fifo

vim +70 drivers/macintosh/windfarm_lm75_sensor.c

75722d3992f573 Benjamin Herrenschmidt 2005-11-07  42  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  43  static int wf_lm75_get(struct wf_sensor *sr, s32 *value)
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  44  {
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  45  	struct wf_lm75_sensor *lm = wf_to_lm75(sr);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  46  	s32 data;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  47  
351ca3e3119792 Jean Delvare           2009-06-15  48  	if (lm->i2c == NULL)
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  49  		return -ENODEV;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  50  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  51  	/* Init chip if necessary */
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  52  	if (!lm->inited) {
351ca3e3119792 Jean Delvare           2009-06-15  53  		u8 cfg_new, cfg = (u8)i2c_smbus_read_byte_data(lm->i2c, 1);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  54  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  55  		DBG("wf_lm75: Initializing %s, cfg was: %02x\n",
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  56  		    sr->name, cfg);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  57  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  58  		/* clear shutdown bit, keep other settings as left by
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  59  		 * the firmware for now
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  60  		 */
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  61  		cfg_new = cfg & ~0x01;
351ca3e3119792 Jean Delvare           2009-06-15  62  		i2c_smbus_write_byte_data(lm->i2c, 1, cfg_new);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  63  		lm->inited = 1;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  64  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  65  		/* If we just powered it up, let's wait 200 ms */
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  66  		msleep(200);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  67  	}
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  68  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  69  	/* Read temperature register */
351ca3e3119792 Jean Delvare           2009-06-15 @70  	data = (s32)le16_to_cpu(i2c_smbus_read_word_data(lm->i2c, 0));
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  71  	data <<= 8;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  72  	*value = data;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  73  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  74  	return 0;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  75  }
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  76  

:::::: The code at line 70 was first introduced by commit
:::::: 351ca3e31197929535418f5affc761cd9fb07428 windfarm: Convert to new-style i2c drivers

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Jean Delvare <khali@linux-fr.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
