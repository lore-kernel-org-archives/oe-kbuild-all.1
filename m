Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4513FBF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710455629; cv=none; b=uTKvVrAVX2GJh3CI03qlHDnNrFcCu9Fv3FJQNrARDFgowi9N58mzgtmLY4gx6US2xdxN3QlgHSxPKAsgq/BFieF2mSemk2Z7n/WY8+tHdr1b2Ht8QeVUmNOBRHdcCoTV4ckLsaivxKZjLi9Zk2tdpPzkC2Jd97VmfrGnOgftG98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710455629; c=relaxed/simple;
	bh=nZ+8NY8YGd+cWaCgmC6DbEGtpkRIp74YNPNHBKFl6DY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3abZT4FXvSlJy2kA5mBhW+W0Yw4OtDo8nAQXKBoB8MREAqlRKgQF87Q9HgUj/ZDwi2HvioHTTCzH8oJ5gqFNSE10TqSuivFCWn1OdP/a7ZxDBVHzUDRuASRyzjbgi2G9i9QOS/bYjSc0sgGfJm/CBgPn19i80SnG5hC7YbSjvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdSG+/BK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdSG+/BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710455628; x=1741991628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZ+8NY8YGd+cWaCgmC6DbEGtpkRIp74YNPNHBKFl6DY=;
  b=kdSG+/BKniWyjnMnr8IqfxbvnxS7eLPomlGiXqr96WoQ6q2pyYZlRctN
   KSDVGOOpEdTCiy8FlN4Bhkf/avcuqFH0dGiiu5V93EjP7UvY4wgItVvUa
   2OBS4IbVVhezKbAPxlXmCUU32tj83uJRIY45wGzNSSlfpSGVy760wDjc2
   th0xl+Nu1KPElNmMztHjEHxjoIgk+RhhWNJ1U7kpDFHgo7hACMC/pXZk1
   XhiUfTva851sBm6n2Zk/U6oiYv/lFHYMta7WILDKzJyBo0izork9xhYX+
   O+GY+6L8in0hQBeXlJkF+JmDxZYnjl5/TsCZwApI/vI7ANcJBAuXKQ253
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5905726"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5905726"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 15:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="12534733"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Mar 2024 15:33:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rktdv-000DqD-2F;
	Thu, 14 Mar 2024 22:33:43 +0000
Date: Fri, 15 Mar 2024 06:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonki Hong <hhk7734@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.8.y 17/50]
 drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202403150625.v0MrTLLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.8.y
head:   acad72b08e300e6aef1322a1bfd2d7b2c42cd860
commit: 5eb6ab367a64137ac87b566a60abc5eb8483b1a9 [17/50] ODROID-COMMON: input/touchscreen: Add D-WAV Multitouch driver.
config: x86_64-randconfig-121-20240315 (https://download.01.org/0day-ci/archive/20240315/202403150625.v0MrTLLA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150625.v0MrTLLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150625.v0MrTLLA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int x @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse:     expected unsigned int x
   drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse:     got restricted __be16 [usertype]
>> drivers/input/touchscreen/dwav-usb-mt.c:178:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int y @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:178:41: sparse:     expected unsigned int y
   drivers/input/touchscreen/dwav-usb-mt.c:178:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:182:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int x @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:182:41: sparse:     expected unsigned int x
   drivers/input/touchscreen/dwav-usb-mt.c:182:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:184:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int y @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:184:41: sparse:     expected unsigned int y
   drivers/input/touchscreen/dwav-usb-mt.c:184:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:188:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int x @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:188:41: sparse:     expected unsigned int x
   drivers/input/touchscreen/dwav-usb-mt.c:188:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:190:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int y @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:190:41: sparse:     expected unsigned int y
   drivers/input/touchscreen/dwav-usb-mt.c:190:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:194:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int x @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:194:41: sparse:     expected unsigned int x
   drivers/input/touchscreen/dwav-usb-mt.c:194:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:196:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int y @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:196:41: sparse:     expected unsigned int y
   drivers/input/touchscreen/dwav-usb-mt.c:196:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:200:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int x @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:200:41: sparse:     expected unsigned int x
   drivers/input/touchscreen/dwav-usb-mt.c:200:41: sparse:     got restricted __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:202:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int y @@     got restricted __be16 [usertype] @@
   drivers/input/touchscreen/dwav-usb-mt.c:202:41: sparse:     expected unsigned int y
   drivers/input/touchscreen/dwav-usb-mt.c:202:41: sparse:     got restricted __be16 [usertype]

vim +176 drivers/input/touchscreen/dwav-usb-mt.c

   161	
   162	static void dwav_usb_mt_process(struct dwav_usb_mt *dwav_usb_mt,
   163			unsigned char *pkt, int len)
   164	{
   165		struct  dwav_raw *dwav_raw = (struct dwav_raw *)pkt;
   166		unsigned char bit_mask, cnt;
   167	
   168		for (cnt = 0, bit_mask = 0x01;
   169		     cnt < DEV_INFO[dwav_usb_mt->dev_id].max_finger;
   170		     cnt++, bit_mask <<= 1) {
   171			if ((dwav_raw->ids & bit_mask) && dwav_raw->press) {
   172				dwav_usb_mt->finger[cnt].status = TS_EVENT_PRESS;
   173				switch (cnt) {
   174				case	0:
   175					dwav_usb_mt->finger[cnt].x
 > 176						= cpu_to_be16(dwav_raw->x1);
   177					dwav_usb_mt->finger[cnt].y
 > 178						= cpu_to_be16(dwav_raw->y1);
   179					break;
   180				case	1:
   181					dwav_usb_mt->finger[cnt].x
   182						= cpu_to_be16(dwav_raw->x2);
   183					dwav_usb_mt->finger[cnt].y
   184						= cpu_to_be16(dwav_raw->y2);
   185					break;
   186				case	2:
   187					dwav_usb_mt->finger[cnt].x
   188						= cpu_to_be16(dwav_raw->x3);
   189					dwav_usb_mt->finger[cnt].y
   190						= cpu_to_be16(dwav_raw->y3);
   191					break;
   192				case	3:
   193					dwav_usb_mt->finger[cnt].x
   194						= cpu_to_be16(dwav_raw->x4);
   195					dwav_usb_mt->finger[cnt].y
   196						= cpu_to_be16(dwav_raw->y4);
   197					break;
   198				case	4:
   199					dwav_usb_mt->finger[cnt].x
   200						= cpu_to_be16(dwav_raw->x5);
   201					dwav_usb_mt->finger[cnt].y
   202						= cpu_to_be16(dwav_raw->y5);
   203					break;
   204				default:
   205					break;
   206				}
   207			} else {
   208				if (dwav_usb_mt->finger[cnt].status == TS_EVENT_PRESS)
   209					dwav_usb_mt->finger[cnt].status
   210						= TS_EVENT_RELEASE;
   211				else
   212					dwav_usb_mt->finger[cnt].status
   213						= TS_EVENT_UNKNOWN;
   214			}
   215		}
   216		dwav_usb_mt_report(dwav_usb_mt);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
