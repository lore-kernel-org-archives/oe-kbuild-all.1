Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89048202C26
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753572916; cv=none; b=khyzhT5ATdJZM0g3mlw/frSSHtFeVpMGTvVdGD+2b9tOd6wfAbhQsrLYT0+Q76r83UrdNe9QNEwbFgs87tnBPWsUQVSpjipP/c2sRQxeoVS6zSu8Dua6hMOwq6A3ElUIWhbB//H3OGHQOhv1DU00/Uf5kHL98NwT2kfJQWNycLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753572916; c=relaxed/simple;
	bh=Vg0+HjwMYL1r/7hjb9d84TNJrLk23p/bdthdzQzzabs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTcyY0hDCSPiO0EVGbYkJU4rFsZ4mSMc+xZmVlYZH/q+MG1rZC0GJvkE4Qn6AldV3liE/2mTk1VjYQFPkVIo2NvM5TJDzl3rpFRJ9L+bejCRLg6IOMETgdm07IOV4JFVRcuNgW6R1kq+jDe5zixewtZi0NFhFp9Pm0BmKfVvbU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApCgIzfw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApCgIzfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753572914; x=1785108914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vg0+HjwMYL1r/7hjb9d84TNJrLk23p/bdthdzQzzabs=;
  b=ApCgIzfwS3PaJeEPgpLvJqEQMozNYl9gVDilJ2z+HurXp02qbXBGpLD7
   YPaMnUX5Hd1OKYOJuTaKZCoYf4ncmBTvsJ8E/gBKN+KrSQW31as4dRCQW
   22A3+scBdnd7rYuY+VTyB72QrHgP3IHHoC3SBEe3vv/cJqFvXvDgNAjnS
   tBniI5N3yddAgLpnYm8EpWzhXOBieSGWKYpGDcaK86IFg4X1bCnsZWFZT
   BpMCUP159/vnGhRO7phmShq3301EycbtmE2d8vVHAP+cYq7rbZtsSIJK2
   6oFf0uWq7pgA0e/briObPzmPI3JVX62VY66CS5KiBIVFVS66HyBOCDHW3
   Q==;
X-CSE-ConnectionGUID: ALRq9WRQRTyty2EkI3hYzw==
X-CSE-MsgGUID: rmwNHLzPQkimUosuWfpRoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58487176"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58487176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 16:34:37 -0700
X-CSE-ConnectionGUID: g3CtGmgrS6WOhxJUmrOoUA==
X-CSE-MsgGUID: IuJQgsP6SHyrooXF6W3mhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162321447"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2025 16:34:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufoPS-000MLl-1R;
	Sat, 26 Jul 2025 23:34:34 +0000
Date: Sun, 27 Jul 2025 07:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 45/45]
 drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202507270745.ziCNW3ST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dongjin,

First bad commit (maybe != root cause):

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   5970e23fb597e5a60b1284c83332aee45fb222d0
commit: 5970e23fb597e5a60b1284c83332aee45fb222d0 [45/45] squash! ODROID-COMMON: input/touchscreen: Add D-WAV Multitouch driver.
config: hexagon-randconfig-r122-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270745.ziCNW3ST-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250727/202507270745.ziCNW3ST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270745.ziCNW3ST-lkp@intel.com/

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

804dbb7299c970 Hyeonki Hong 2020-03-05  161  
804dbb7299c970 Hyeonki Hong 2020-03-05  162  static void dwav_usb_mt_process(struct dwav_usb_mt *dwav_usb_mt,
804dbb7299c970 Hyeonki Hong 2020-03-05  163  		unsigned char *pkt, int len)
804dbb7299c970 Hyeonki Hong 2020-03-05  164  {
804dbb7299c970 Hyeonki Hong 2020-03-05  165  	struct  dwav_raw *dwav_raw = (struct dwav_raw *)pkt;
804dbb7299c970 Hyeonki Hong 2020-03-05  166  	unsigned char bit_mask, cnt;
804dbb7299c970 Hyeonki Hong 2020-03-05  167  
804dbb7299c970 Hyeonki Hong 2020-03-05  168  	for (cnt = 0, bit_mask = 0x01;
804dbb7299c970 Hyeonki Hong 2020-03-05  169  	     cnt < DEV_INFO[dwav_usb_mt->dev_id].max_finger;
804dbb7299c970 Hyeonki Hong 2020-03-05  170  	     cnt++, bit_mask <<= 1) {
804dbb7299c970 Hyeonki Hong 2020-03-05  171  		if ((dwav_raw->ids & bit_mask) && dwav_raw->press) {
804dbb7299c970 Hyeonki Hong 2020-03-05  172  			dwav_usb_mt->finger[cnt].status = TS_EVENT_PRESS;
804dbb7299c970 Hyeonki Hong 2020-03-05  173  			switch (cnt) {
804dbb7299c970 Hyeonki Hong 2020-03-05  174  			case	0:
804dbb7299c970 Hyeonki Hong 2020-03-05  175  				dwav_usb_mt->finger[cnt].x
804dbb7299c970 Hyeonki Hong 2020-03-05 @176  					= cpu_to_be16(dwav_raw->x1);
804dbb7299c970 Hyeonki Hong 2020-03-05  177  				dwav_usb_mt->finger[cnt].y
804dbb7299c970 Hyeonki Hong 2020-03-05 @178  					= cpu_to_be16(dwav_raw->y1);
804dbb7299c970 Hyeonki Hong 2020-03-05  179  				break;
804dbb7299c970 Hyeonki Hong 2020-03-05  180  			case	1:
804dbb7299c970 Hyeonki Hong 2020-03-05  181  				dwav_usb_mt->finger[cnt].x
804dbb7299c970 Hyeonki Hong 2020-03-05  182  					= cpu_to_be16(dwav_raw->x2);
804dbb7299c970 Hyeonki Hong 2020-03-05  183  				dwav_usb_mt->finger[cnt].y
804dbb7299c970 Hyeonki Hong 2020-03-05  184  					= cpu_to_be16(dwav_raw->y2);
804dbb7299c970 Hyeonki Hong 2020-03-05  185  				break;
804dbb7299c970 Hyeonki Hong 2020-03-05  186  			case	2:
804dbb7299c970 Hyeonki Hong 2020-03-05  187  				dwav_usb_mt->finger[cnt].x
804dbb7299c970 Hyeonki Hong 2020-03-05  188  					= cpu_to_be16(dwav_raw->x3);
804dbb7299c970 Hyeonki Hong 2020-03-05  189  				dwav_usb_mt->finger[cnt].y
804dbb7299c970 Hyeonki Hong 2020-03-05  190  					= cpu_to_be16(dwav_raw->y3);
804dbb7299c970 Hyeonki Hong 2020-03-05  191  				break;
804dbb7299c970 Hyeonki Hong 2020-03-05  192  			case	3:
804dbb7299c970 Hyeonki Hong 2020-03-05  193  				dwav_usb_mt->finger[cnt].x
804dbb7299c970 Hyeonki Hong 2020-03-05  194  					= cpu_to_be16(dwav_raw->x4);
804dbb7299c970 Hyeonki Hong 2020-03-05  195  				dwav_usb_mt->finger[cnt].y
804dbb7299c970 Hyeonki Hong 2020-03-05  196  					= cpu_to_be16(dwav_raw->y4);
804dbb7299c970 Hyeonki Hong 2020-03-05  197  				break;
804dbb7299c970 Hyeonki Hong 2020-03-05  198  			case	4:
804dbb7299c970 Hyeonki Hong 2020-03-05  199  				dwav_usb_mt->finger[cnt].x
804dbb7299c970 Hyeonki Hong 2020-03-05  200  					= cpu_to_be16(dwav_raw->x5);
804dbb7299c970 Hyeonki Hong 2020-03-05  201  				dwav_usb_mt->finger[cnt].y
804dbb7299c970 Hyeonki Hong 2020-03-05  202  					= cpu_to_be16(dwav_raw->y5);
804dbb7299c970 Hyeonki Hong 2020-03-05  203  				break;
804dbb7299c970 Hyeonki Hong 2020-03-05  204  			default:
804dbb7299c970 Hyeonki Hong 2020-03-05  205  				break;
804dbb7299c970 Hyeonki Hong 2020-03-05  206  			}
804dbb7299c970 Hyeonki Hong 2020-03-05  207  		} else {
804dbb7299c970 Hyeonki Hong 2020-03-05  208  			if (dwav_usb_mt->finger[cnt].status == TS_EVENT_PRESS)
804dbb7299c970 Hyeonki Hong 2020-03-05  209  				dwav_usb_mt->finger[cnt].status
804dbb7299c970 Hyeonki Hong 2020-03-05  210  					= TS_EVENT_RELEASE;
804dbb7299c970 Hyeonki Hong 2020-03-05  211  			else
804dbb7299c970 Hyeonki Hong 2020-03-05  212  				dwav_usb_mt->finger[cnt].status
804dbb7299c970 Hyeonki Hong 2020-03-05  213  					= TS_EVENT_UNKNOWN;
804dbb7299c970 Hyeonki Hong 2020-03-05  214  		}
804dbb7299c970 Hyeonki Hong 2020-03-05  215  	}
804dbb7299c970 Hyeonki Hong 2020-03-05  216  	dwav_usb_mt_report(dwav_usb_mt);
804dbb7299c970 Hyeonki Hong 2020-03-05  217  }
804dbb7299c970 Hyeonki Hong 2020-03-05  218  

:::::: The code at line 176 was first introduced by commit
:::::: 804dbb7299c970e3cb07ee5eac596f8ca42f620d ODROID-COMMON: input/touchscreen: Add D-WAV Multitouch driver.

:::::: TO: Hyeonki Hong <hhk7734@gmail.com>
:::::: CC: Dongjin Kim <tobetter@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
