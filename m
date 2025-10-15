Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD52D5C7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563132; cv=none; b=h5o5aNRw4S1DHJdLk0KIZANrBta6UF98yz2w7mP2ba4lJftfOZOjS43h1XReV/Lp6EaaHjYbSTMoeFN4hwdWG/hkA337cYHZMQCAQrfmShgBnHGF9ClgHsKRruHOROBiznllhI9OKbgyyRDlTTI2U95YoI0r1qtu3b3hwUNv0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563132; c=relaxed/simple;
	bh=CBvcYXORGUpoXJoLgqmO3zqw2DeRNqYzgxJL6uI1TsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TansDtD7GNnYRflryadgs7DHAhihFFhJSJJN3u2rKD74IS03xlHB06tExHCIsAnZIRBX2NPq9KFYT/C+SH5S3SjnPHIYTAEeJdmq5oiBugNdK9442C54TswYC+HRxJuNIuxrqZhmZeD+WXt0bnBmfbVojISRV+BqW3DbXqUyMro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3gb/53Z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3gb/53Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760563130; x=1792099130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBvcYXORGUpoXJoLgqmO3zqw2DeRNqYzgxJL6uI1TsM=;
  b=B3gb/53ZnvcGRXpqdgw7oTbXbHCjtZF28Q9mb3G8aHOPAqmt4xAWCiA5
   CPWopB2TMmXWPWw3d2OZsIM7leiL/kZ9bGsGvUVwL3F8QBMonZP2UCTCf
   kWMTjL4uLEBUTGN07Ck++uimTn9ulUE6DPxCPPfH8OibAy7YAL4Ec0MD3
   gSAv3dA5poQrBFhFJWVPdTStbBcd+wY6CKz9xdY+gfvUi0FbPwd82mAcV
   TQojDSKUyVO64lqJDcyfUdMgGL0z7/HAEz/2OhTVaJcSxaYt/eV1HKWnz
   pXrNOILUZDCAli7Pszq79wn+keGUUXdxmnE9cSjfjtD86F9A8b5D3AJyy
   A==;
X-CSE-ConnectionGUID: jZjc761PQYyW2+b1+FvEDQ==
X-CSE-MsgGUID: psL2UZjnTa+AgjCzw5jyjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73350318"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="73350318"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 14:18:50 -0700
X-CSE-ConnectionGUID: /SNmf+mASUymr1z/QsZDhA==
X-CSE-MsgGUID: w51bhWqVQcCcx3LWuA6SDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182264613"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2025 14:18:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v98tS-0004Et-08;
	Wed, 15 Oct 2025 21:18:46 +0000
Date: Thu, 16 Oct 2025 05:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Remi Buisson <remi.buisson@tdk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 69/79]
 drivers/iio/imu/inv_icm45600/inv_icm45600_buffer.c:41:39: warning: field
 accel within 'struct inv_icm45600_fifo_2sensors_packet' is less aligned than
 'struct inv_icm45600_fifo_sensor_data' and is usually due to 'struct
 inv_icm45600_fifo_2sensors_packet' b...
Message-ID: <202510160550.GqthmiPd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4b17a60d1e1c2d9d2ccbd58642f6f4ac2fa364ba
commit: c7dd90861c9052f7e28ef93fa03aeb94cb5dc43b [69/79] iio: imu: inv_icm45600: add I2C driver for inv_icm45600 driver
config: arm-randconfig-r072-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160550.GqthmiPd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160550.GqthmiPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160550.GqthmiPd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/inv_icm45600/inv_icm45600_buffer.c:41:39: warning: field accel within 'struct inv_icm45600_fifo_2sensors_packet' is less aligned than 'struct inv_icm45600_fifo_sensor_data' and is usually due to 'struct inv_icm45600_fifo_2sensors_packet' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      41 |         struct inv_icm45600_fifo_sensor_data accel;
         |                                              ^
>> drivers/iio/imu/inv_icm45600/inv_icm45600_buffer.c:42:39: warning: field gyro within 'struct inv_icm45600_fifo_2sensors_packet' is less aligned than 'struct inv_icm45600_fifo_sensor_data' and is usually due to 'struct inv_icm45600_fifo_2sensors_packet' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      42 |         struct inv_icm45600_fifo_sensor_data gyro;
         |                                              ^
>> drivers/iio/imu/inv_icm45600/inv_icm45600_buffer.c:35:39: warning: field data within 'struct inv_icm45600_fifo_1sensor_packet' is less aligned than 'struct inv_icm45600_fifo_sensor_data' and is usually due to 'struct inv_icm45600_fifo_1sensor_packet' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      35 |         struct inv_icm45600_fifo_sensor_data data;
         |                                              ^
   3 warnings generated.


vim +41 drivers/iio/imu/inv_icm45600/inv_icm45600_buffer.c

7e1e1e37402c95 Remi Buisson 2025-10-07  32  
7e1e1e37402c95 Remi Buisson 2025-10-07  33  struct inv_icm45600_fifo_1sensor_packet {
7e1e1e37402c95 Remi Buisson 2025-10-07  34  	u8 header;
7e1e1e37402c95 Remi Buisson 2025-10-07 @35  	struct inv_icm45600_fifo_sensor_data data;
7e1e1e37402c95 Remi Buisson 2025-10-07  36  	s8 temp;
7e1e1e37402c95 Remi Buisson 2025-10-07  37  } __packed;
7e1e1e37402c95 Remi Buisson 2025-10-07  38  
7e1e1e37402c95 Remi Buisson 2025-10-07  39  struct inv_icm45600_fifo_2sensors_packet {
7e1e1e37402c95 Remi Buisson 2025-10-07  40  	u8 header;
7e1e1e37402c95 Remi Buisson 2025-10-07 @41  	struct inv_icm45600_fifo_sensor_data accel;
7e1e1e37402c95 Remi Buisson 2025-10-07 @42  	struct inv_icm45600_fifo_sensor_data gyro;
7e1e1e37402c95 Remi Buisson 2025-10-07  43  	s8 temp;
7e1e1e37402c95 Remi Buisson 2025-10-07  44  	__le16 timestamp;
7e1e1e37402c95 Remi Buisson 2025-10-07  45  } __packed;
7e1e1e37402c95 Remi Buisson 2025-10-07  46  

:::::: The code at line 41 was first introduced by commit
:::::: 7e1e1e37402c95acd5ae6aace9e363a982038b11 iio: imu: inv_icm45600: add buffer support in iio devices

:::::: TO: Remi Buisson <remi.buisson@tdk.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
