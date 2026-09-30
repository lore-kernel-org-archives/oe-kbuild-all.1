Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624A547059
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 05:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745888; cv=none; b=TOaLIl5JpohgjVj/UUW9clKfl3ys04XSFt5dU/ZL5xD3XaRRUjl1LBER3XlZfYTeWv1FOnPU0ERWWZpV/rt1EkXIZNuIRd8Y9qkpa4smWTdQXoJMLKINxyDXoC+kgyy9mMEKttxSsSIf8JV9vyrWz5rgGjrHC87k7aZ63R8+rHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745888; c=relaxed/simple;
	bh=A8/9CZxCXbreYd+wbDr0i1RS0zrOvTdmBoCkHs/H40I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lhF7osm9s9LMk+NcLEinppV3tyEfwPSs9dRribLrLrUMG4y1aJyqvHoE1KRDloHkfhlz5Ofv7WCtj0wzPK2X0MvdFyNjeJydDP63oDFYT9oxmzvtMpux9HEOXqRFf7lUGpcQvfzh/lM6um6vA/VmGOYg8sLkVZ7sV3FDErXSbls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZn+WZy0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZn+WZy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790745887; x=1822281887;
  h=date:from:to:cc:subject:message-id;
  bh=A8/9CZxCXbreYd+wbDr0i1RS0zrOvTdmBoCkHs/H40I=;
  b=aZn+WZy06vzYocztlxyibZNqTtllxUSDzEcEuY1bjHSVDsaCpw/SCiZ6
   pbhT+leB4eA+3D7yKJdITBWyaLxjGFJU15vg6zSwNhWWIyPrkNqtt1AZp
   jO2COpckuJ70T2apiKSZXKTxgDDX04iaBqG9RzVg2xTK+QYfzk39pg/E+
   x107mApv8HMJREQZiHR/idKlQ5AJSmreJdo/q+kF3Zm0gd3nrFyEZpuGI
   aWwyub+2i3gCodzEik6gLTFtbISBZasDuWNzC+K98opeSuuZYUJA0f375
   gkdr908yBYCAj+fmHT2Ixlu6JQBTbV+f5dNHyuZ3WQmxN5G27afQP9VLs
   Q==;
X-CSE-ConnectionGUID: T8zSPZNmST2MG8BD6lqlDg==
X-CSE-MsgGUID: kneEggyMR2WYdmO8H4o7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90517570"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90517570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:24:47 -0700
X-CSE-ConnectionGUID: yI4pyOWvTjaZ5gu5l9K4Jw==
X-CSE-MsgGUID: aQgNHvnDStaKIwwOVIrHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274695983"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2026 22:24:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBmo6-00000000QAi-2vZa;
	Wed, 30 Sep 2026 05:24:42 +0000
Date: Wed, 30 Sep 2026 13:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] arm-linux-gnueabi-ld:
 warning: orphan section `.text.start.constprop.0' from
 `drivers/usb/host/sl811-hcd.o' being placed in section
 `.text.start.constprop.0'
Message-ID: <202609301327.HCNGxbll-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d26d03d72731ff281605b9c99f1acecaa0556bfc
commit: 12c2f68d8501e0f7fb5e5a28a94ef8d701e95bb1 [1/1] UPSTREAM: vmlinux.lds: Exclude .text.startup and .text.exit from TEXT_MAIN
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260930/202609301327.HCNGxbll-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301327.HCNGxbll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301327.HCNGxbll-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/usb/host/sl811-hcd.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/dvb-frontends/drxk_hard.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start' from `drivers/media/dvb-frontends/stv0910.o' being placed in section `.text.start'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/pci/ddbridge/ddbridge-sx8.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/usb/host/sl811-hcd.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/dvb-frontends/drxk_hard.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start' from `drivers/media/dvb-frontends/stv0910.o' being placed in section `.text.start'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/pci/ddbridge/ddbridge-sx8.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/usb/host/sl811-hcd.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/dvb-frontends/drxk_hard.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start' from `drivers/media/dvb-frontends/stv0910.o' being placed in section `.text.start'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/pci/ddbridge/ddbridge-sx8.o' being placed in section `.text.start.constprop.0'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
