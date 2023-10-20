Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC49369
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwniE1Np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697769344; x=1729305344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7KbEMdD747FTz1mxwT2kxRD6UVY1TwIE3oAsYpOuxg=;
  b=CwniE1Npa+9JLSlfZzbjH2Xr/Nb+KELWuWeUtPWO+ybfbqTGG5SOYepH
   Sx3JLZ8QOaUloaKPUX+yoE/l+KUCMPflGYjSFTEq4KBKBHHXKmEjc7ji3
   7TNqapp5CqvmloPy/weFKyVpRpgIXwoyfI360NqIhEBIeYsVIaOWa7nUz
   vSWLRQyfQTRkGLxUgsq4srv9xoX/LLoryeuuEjVXOdslLquK7H60OPUlb
   eCX7iO0M9zGdLzskdIim+WKdTVTzWXmXTyR3fTWkACVIpOoTBqcCZ6ikq
   e0T7swGsbMBhqNSdUVyPURYfYCG7v2Hn7bTHpsTIqlwhDVpSrkVG87Mx6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366649816"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366649816"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 19:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="760883345"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="760883345"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Oct 2023 19:35:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtfMS-0002tG-0k;
	Fri, 20 Oct 2023 02:35:40 +0000
Date: Fri, 20 Oct 2023 10:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 35/35]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1191:63:
 warning: '%s' directive output may be truncated writing up to 31 bytes into
 a region of size 26
Message-ID: <202310201020.BXWd5tj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   b2d0b6b6ced1309d1daa4df79ec6a36f126a903f
commit: b2d0b6b6ced1309d1daa4df79ec6a36f126a903f [35/35] extron: rename splitter-cec.c to cec-splitter.c
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310201020.BXWd5tj0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201020.BXWd5tj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201020.BXWd5tj0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_querycap':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1191:63: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 26 [-Wformat-truncation=]
    1191 |         snprintf(cap->bus_info, sizeof(cap->bus_info), "serio:%s", port->name);
         |                                                               ^~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1191:9: note: 'snprintf' output between 7 and 38 bytes into a destination of size 32
    1191 |         snprintf(cap->bus_info, sizeof(cap->bus_info), "serio:%s", port->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1191 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

1eb159538ab221 Hans Verkuil 2021-10-06  1183  
1eb159538ab221 Hans Verkuil 2021-10-06  1184  static int extron_querycap(struct file *file, void *priv,
1eb159538ab221 Hans Verkuil 2021-10-06  1185  			   struct v4l2_capability *cap)
1eb159538ab221 Hans Verkuil 2021-10-06  1186  {
1eb159538ab221 Hans Verkuil 2021-10-06  1187  	struct extron_port *port = video_drvdata(file);
1eb159538ab221 Hans Verkuil 2021-10-06  1188  
1eb159538ab221 Hans Verkuil 2021-10-06  1189  	strscpy(cap->driver, "extron-da-hd-4k-plus-cec", sizeof(cap->driver));
1eb159538ab221 Hans Verkuil 2021-10-06  1190  	strscpy(cap->card, cap->driver, sizeof(cap->card));
a951fe18ea166f Hans Verkuil 2023-10-19 @1191  	snprintf(cap->bus_info, sizeof(cap->bus_info), "serio:%s", port->name);
1eb159538ab221 Hans Verkuil 2021-10-06  1192  	return 0;
1eb159538ab221 Hans Verkuil 2021-10-06  1193  }
1eb159538ab221 Hans Verkuil 2021-10-06  1194  

:::::: The code at line 1191 was first introduced by commit
:::::: a951fe18ea166fda938678cd539211b0ee6ec1bf media: cec: extron-da-hd-4k-plus: fix warnings

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
