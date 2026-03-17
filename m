Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817A03358B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785873; cv=none; b=u9oz8bQYep8otLkC7mSjIsrHTGi3L+mQxcD/eGUVLa0GQ9N7v2EyS7vLWkawFN9NBxURwM1iPzJxAtvZND1KXbS6SjGkBG5oc9IwNoX6RmIF0+RQ/s8AUtuVTgSXLZwfapKAP+GD36CL1F9SOs/V9YM6mjU8vzb8FgbU+uahe4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785873; c=relaxed/simple;
	bh=01UAgCsvg100JmcL13EiapzwIOp2bQh7mtyvVTxTV0w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DMuZ6XHvZ9Y0JodM6afKHpirPCEuCqoklKaaNjgH5B0mvDJjKQu/uQ5sSEQUfX+0/HrBp83pdtOqx844JDHw48QrQXbMC+LiC5NHLA/KFNXry5gSwmcoyX14yKLcFBSqZhBkNDrjbsTh2tS72kqgHTaygQSJCdng1I6RC2/zv0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKLC5Ear; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKLC5Ear"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773785871; x=1805321871;
  h=date:from:to:cc:subject:message-id;
  bh=01UAgCsvg100JmcL13EiapzwIOp2bQh7mtyvVTxTV0w=;
  b=hKLC5EarHqr5UN17cXVnkP5uXFBrpgetqW3wUPBjSs+C2sSxD/LUJ2sx
   6U/401WE6Axhy4bqr6VTV1IdMZQiq+kCw7o/OdJ5gk9hUjghSXBFLBg5V
   bsGqJzL3e6Zu9OFWhnUIE0ZwsatT3fJYicZvX5Q74o3UmGA8Eb9tqD+pB
   5bAmflZBmvJogTQ4PDopez4Kjm1YO1cUPhDCd6N/7dz7GCnQbX+AHP7+3
   1W4vAKA6eZeNu7hZjvBAnoC9aOtkUGGnDUTJBDMMmfDtq+T/rTmd9wboc
   NAJDJsXfpXhiwe47P1DLkjQ2zI0XtomuDeYGGTie135Gs1LK9Oye38vWh
   g==;
X-CSE-ConnectionGUID: suiuhyKeSz2/kYUyxH+2LQ==
X-CSE-MsgGUID: /CrL+SX9TdiVVYfTIJ4vwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78441314"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78441314"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:17:51 -0700
X-CSE-ConnectionGUID: uOI4xKllREaCMKPcBBz9pQ==
X-CSE-MsgGUID: 3ax9xcVOTOuMtluJCHARFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226554618"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2026 15:17:50 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cjS-0000000026H-1Hal;
	Tue, 17 Mar 2026 22:17:46 +0000
Date: Wed, 18 Mar 2026 06:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 282/6828]
 drivers/gpu/drm/verisilicon/vs_dc.c:193:24: sparse: sparse: symbol
 'vs_dc_platform_driver' was not declared. Should it be static?
Message-ID: <202603180616.TM6qYvIY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: dbf21777caa8b8c88c12f7f036b01208fec0d55a [282/6828] drm: verisilicon: add a driver for Verisilicon display controllers
config: nios2-randconfig-r131-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180616.TM6qYvIY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180616.TM6qYvIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180616.TM6qYvIY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/verisilicon/vs_dc.c:193:24: sparse: sparse: symbol 'vs_dc_platform_driver' was not declared. Should it be static?

vim +/vs_dc_platform_driver +193 drivers/gpu/drm/verisilicon/vs_dc.c

   192	
 > 193	struct platform_driver vs_dc_platform_driver = {
   194		.probe = vs_dc_probe,
   195		.remove = vs_dc_remove,
   196		.shutdown = vs_dc_shutdown,
   197		.driver = {
   198			.name = "verisilicon-dc",
   199			.of_match_table = vs_dc_driver_dt_match,
   200		},
   201	};
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
