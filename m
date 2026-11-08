Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794118753;
	b=KNvZz88Odbfhap4hIDxuscjcjxOOwmaWpj6U40aitvk6Hhmn9jh0rQqBw/cr1Q9BKtNb
	 hvqoDzichrvj6zz1QFLXRdk7mWtfAIz7LCX654JKsEuj4kPPrnTu9kOwcH2EMxjsw5dH9
	 k/pKNW/BY+ev/APUxYae4s4RlVQ9v5wLRBlWPXMDkH5JjDLtL57UijgCPiBioocCIjWz3
	 6sFLvyPt0FeakEL0jFcyK6kDv2GjZtn+buHRLBT2Np45qiCvPJz1JWb2JHSC+mAb3ElRq
	 QHOb9h2Ma6vlN2ozJSlgRcEGQah4gsrm9oCcgkOE2oxSse7k6XDO6MTr7m8uFZb6RzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118753;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=q07c0ME6KhFeOTQNxs5DbHH3rc4xBWeh2B8/AV3dXRc=;
	b=l/1pD2rGA/uyZk7ulPoiX0MSUIYOMwZitJnYj+aJ1Ctt0QpElwHXLHInzj/GTdgVRUJs
	 dFGXqZIgSaMp7rB7Dm+x9sxyrax6EEsAko3PlcVshvZLDEupqD14TJ7+Ozc4TAHSP0UeK
	 UMCEzG0D3I4jK6x7o7FttS6r+Ju5XeXYL3A/uQ/Hh0YsmHhwblDeDqQMDi3XgoHw/P8qL
	 M5PzIVokmI1roqmWIw5r2YJcovCcqoLbBBrfCXm8LXSG2bQCi7miHa73V+vwC13wTET5e
	 +A4KgcboYGsoTOKCl0mTsL/FV6S6q4gHuRAqR+G0tQcbdcWHdLw2VANZ4I0MP1lvDtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YbHdHwB0;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A211606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 06:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A211606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YbHdHwB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794118751; x=1825654751;
  h=date:from:to:cc:subject:message-id;
  bh=QuBmr2JpLPaA+QeydftAKQYJO4qPHP0vuMOYLZo/+VU=;
  b=YbHdHwB08kyA1YJVcAs8nHJ11ND2PK8F9IyLcnqWmZhMj2yazmxwqFo+
   HZDFJ4Pxh8UqEXYTQpnX+AcK3Rw5kyxXqxyhb8mQV8lERHmNN5LI2kLyx
   pWElReT/KyQAhrrDXb95Vbed6aaoXapUQj3cJUiuEBCIm9hXRdageEl4W
   Zgr51c7S8I7oWnu5ewz1kVDMgmbqyeObuP4lPvvQF2L+bE41rLtoweH93
   RxxqrodYWIPjIH07b2gkXE0JxASILSzG56e3Gculicb7sXIjkCC0MnYnK
   xwDgH5AS5GT0/oLrlMoeuZkZGDj8DRGzNS0Pvdg5kKGG8RwY+G4Ckgtq6
   w==;
X-CSE-ConnectionGUID: Xh92dEr4R+S7Vw/p0zTw/A==
X-CSE-MsgGUID: 5uWS9MakTISj8I+nRc/nYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2762308"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2762308"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 22:19:11 -0800
X-CSE-ConnectionGUID: bqwOA7WvRECfVE8SNvxcsg==
X-CSE-MsgGUID: VObnSJy5Qd6f4vkwVpqLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7786617"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 22:19:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPwF9-00000000sGb-0Izn;
	Sun, 08 Nov 2026 06:19:07 +0000
Date: Sun, 08 Nov 2026 14:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 91/154] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202611081410.wFjN8nki-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: fba64c5bff92869d5b2532a1a6ad56b34a15a2aa [91/154] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081410.wFjN8nki-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081410.wFjN8nki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081410.wFjN8nki-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2801 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2820 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
