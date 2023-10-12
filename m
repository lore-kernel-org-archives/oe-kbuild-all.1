Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DBEA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 00:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5XXGnug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697069055; x=1728605055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6QIDMeDKc8t0udsMGz/eCeqhabUyKnmppmy4d8YsRk=;
  b=g5XXGnugWfv2ispYK06me4i16y0MMU/UQ7o9Z2NgSYIjQpQol+5y71Ia
   1JFceQnoTBKu5jeOhuIF7fV+Y4I2+DE6OtC1108ZMSNqq7tiX8GJB4llN
   7ULUuRaObnLvjkX+CH2vR6XmzYlsq+l7zvhVNQ2ItnvAewU/VXV0BPQNX
   IrSZAygznnHC/MBo/5PSdu5aFgy7f8rijAITjb3u2bzMtBvmbngiw8SCt
   NazudMnZDZqt25S+GvyFshL5Yr8v0btjvbMPJTmc5wmLtlzitTdbSem8Q
   1yKEXd8TDadQSBzMQUYo82A3WZjBbxfMXD58kA9dWLXqX2CKJ66XxlphW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383662559"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="383662559"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897859229"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="897859229"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 17:01:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjAy-0002sY-0Y;
	Thu, 12 Oct 2023 00:03:40 +0000
Date: Thu, 12 Oct 2023 08:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-07 1/1] hid-core.c:undefined
 reference to `uhid_hid_driver'
Message-ID: <202310120742.Iox2gvIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-07
head:   9aca00e0566134a23c2c16b930c4733462c66376
commit: c93516a2d02c0a1f0466b3f512977c40c1bee4f0 [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: i386-buildonly-randconfig-004-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120742.Iox2gvIW-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120742.Iox2gvIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120742.Iox2gvIW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-core.o: in function `hid_add_field':
>> hid-core.c:(.text+0x2186): undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> (.text+0x28ce): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
