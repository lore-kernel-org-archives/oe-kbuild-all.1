Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F62A34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 00:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712450577; cv=none; b=JbJiONgBpkX9IVSlnMa+/B7RY7QheBC+xxxYqbr68coHnflxDLTmkkxW+UPmuuTftWjfC0Ve3H+Ni9AVlTciPo0TfVzoZ3eRLdkd1J9cRfdqxheifI/6hpvKftYpcHr49y6TNBBJ+Wsr4ct41peLaI9l7M4RFQkPLMlXpKommDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712450577; c=relaxed/simple;
	bh=0SQRG2KcauHY3SklxGoG3KUHkc7gpIwkFcXxMdPJEEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FO4bAGy3xQkN0Szhcs5ei2UScB8uLTK1wmK+FfxqRtNhTwkvxcppxbS7yGGS4D88dYCY/zx5Eh9XvqDJo7NCirg1OHUrguBCzkD/HU4+4PX7Q+ABABng2HJPcLhR/NzYpYXqdOGCkdhW6g5fZU0GqwJXfx/KOjGJWA90PSIzZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDv5K7FU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDv5K7FU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712450576; x=1743986576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SQRG2KcauHY3SklxGoG3KUHkc7gpIwkFcXxMdPJEEM=;
  b=GDv5K7FUj6wFvlvhWV4XKP7WcBdzcB3SrqezMtimaVceh3PfknEDc2gU
   zO00TY+8m7McPSZEqDKI882xYdHdyKQftR7y2i9w93fWYDuzB/t6qN52u
   2hL93gp2zaCc4rS6AfEDsdsk9lxBU3Vg3wb9XEJxwuFvPzph2rJDdqmDI
   jrqxsXMtaSY5kMHg0iYKRfDB8aKBSi6X2c9vxmE5HG/ijsoyxWsh8kD8D
   VwXaKjBqaRrIlNNIxWFcubPLGJ5K3Jkq8pcevjDSFosbJqpb2Gmv7P8S0
   jBq5fXhG1BwgdOud/s6w8ZjG9BL+S9NougRzKHhG6Snucvv6bZIZ+6cXL
   Q==;
X-CSE-ConnectionGUID: IEXTP770QROWItpeGL9ITQ==
X-CSE-MsgGUID: mgBNf/EjTMiHF1HkE61FJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7608597"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7608597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 17:42:55 -0700
X-CSE-ConnectionGUID: 7MxIyB9zTz2fdUKXbrClhw==
X-CSE-MsgGUID: xbwlwdz6R1errG7IYjNhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19431919"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Apr 2024 17:42:54 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtGcW-00041a-0b;
	Sun, 07 Apr 2024 00:42:52 +0000
Date: Sun, 7 Apr 2024 08:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 133/133] drivers/fsi/fsi-scom.c:517:11: error:
 initialization from incompatible pointer type
Message-ID: <202404070837.DdPET6fd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: 1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100 [133/133] REMOVE ->read() and ->write()
config: x86_64-randconfig-005-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070837.DdPET6fd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070837.DdPET6fd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070837.DdPET6fd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fsi/fsi-scom.c:517:3: error: 'const struct file_operations' has no member named 'read'
     .read  = scom_read,
      ^~~~
   drivers/fsi/fsi-scom.c:517:11: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     .read  = scom_read,
              ^~~~~~~~~
   drivers/fsi/fsi-scom.c:517:11: note: (near initialization for 'scom_fops')
>> drivers/fsi/fsi-scom.c:517:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
   drivers/fsi/fsi-scom.c:517:11: note: (near initialization for 'scom_fops.compat_ioctl')
   drivers/fsi/fsi-scom.c:518:3: error: 'const struct file_operations' has no member named 'write'
     .write  = scom_write,
      ^~~~~
   drivers/fsi/fsi-scom.c:518:12: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     .write  = scom_write,
               ^~~~~~~~~~
   drivers/fsi/fsi-scom.c:518:12: note: (near initialization for 'scom_fops')
   drivers/fsi/fsi-scom.c:518:12: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
   drivers/fsi/fsi-scom.c:518:12: note: (near initialization for 'scom_fops.fsync')
   cc1: some warnings being treated as errors
--
   drivers/iio/imu/adis16400.c:237:3: error: 'const struct file_operations' has no member named 'read'
     .read = adis16400_show_serial_number,
      ^~~~
   drivers/iio/imu/adis16400.c:237:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     .read = adis16400_show_serial_number,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/adis16400.c:237:10: note: (near initialization for 'adis16400_serial_number_fops')
>> drivers/iio/imu/adis16400.c:237:10: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
   drivers/iio/imu/adis16400.c:237:10: note: (near initialization for 'adis16400_serial_number_fops.fallocate')
   cc1: some warnings being treated as errors


vim +517 drivers/fsi/fsi-scom.c

d8f4587655f968 Benjamin Herrenschmidt 2018-06-20  512  
680ca6dcf5c222 Christopher Bostic     2017-06-06  513  static const struct file_operations scom_fops = {
680ca6dcf5c222 Christopher Bostic     2017-06-06  514  	.owner		= THIS_MODULE,
d8f4587655f968 Benjamin Herrenschmidt 2018-06-20  515  	.open		= scom_open,
680ca6dcf5c222 Christopher Bostic     2017-06-06  516  	.llseek		= scom_llseek,
680ca6dcf5c222 Christopher Bostic     2017-06-06 @517  	.read		= scom_read,
680ca6dcf5c222 Christopher Bostic     2017-06-06  518  	.write		= scom_write,
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  519  	.unlocked_ioctl	= scom_ioctl,
680ca6dcf5c222 Christopher Bostic     2017-06-06  520  };
680ca6dcf5c222 Christopher Bostic     2017-06-06  521  

:::::: The code at line 517 was first introduced by commit
:::::: 680ca6dcf5c222765cb2fb22959c5282865b6655 drivers/fsi: Add SCOM FSI client device driver

:::::: TO: Christopher Bostic <cbostic@linux.vnet.ibm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
