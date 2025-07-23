Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331C921CA1E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292737; cv=none; b=TH6N/PpumEwK8rKPG/WIqPmaMezffHxZZIiQn6+6Rm7V3e9mT6FgwynrfqTDWv1l26x9VcH5Pb2u0Zu1yOJ9lh9ixt53Ljenq5Yz0vU+6jTQ/LsMtoRm+osluiGI2UakP4TatFmAruTkxRQVwh0h4lHEjn6D6byLluh24ZxXnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292737; c=relaxed/simple;
	bh=QCqmqy3i2BSNKF8d6To0zZGVl/TeP5zYFRjQtgacaV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GD4qkav0+reQ16GSMkmNbTZISn8phlF/uPYo9m/5ihUTwNX9mGZc9furLfzTr8lq6E01KjFKTaDLjEBFjIJOnHJ4w4U0t+E8eN1M8cRFsEqJNPnY3w/DJwgLVVDtcjE8OsRtiN4+NSmVWS+HROVNcdYLRjuQua06IIXq6l8/ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wdm9yXA9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wdm9yXA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292737; x=1784828737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QCqmqy3i2BSNKF8d6To0zZGVl/TeP5zYFRjQtgacaV8=;
  b=Wdm9yXA9gTby8wSlZbUvAnTQ+gt/5cO7FgBac/M7N/6f1BtRvsxeH4dd
   dFFsUWa+0DNyL+3u8sVzS2nb9viBx8B20rmQAOIBVKxGgG5czBoL35OkQ
   MWhWlAF/PFC609kRWM6quQUrIHV5QD4E04gZ8FRAx+gq2R1qUdgCY5KB2
   tgMqMQxlbYA7h9Y3ftFK1gkxovohWvWJyFRB8OjW3xHgksEZRl5NcabJD
   NcmvgGV2mzUQopUWgXPhyyUhTvSqYWVNbBV9gWCIX9VeAi/TxyQNd3mYH
   f1aWGKXJp8OLC7bdymwDwbcwIHn44MZKOT3EQdwzkYG2cM3CoLNMWbWv+
   Q==;
X-CSE-ConnectionGUID: PkEelwNgTyyQe3ccH12fqQ==
X-CSE-MsgGUID: bxqfO9SKQ36JVGk0N8jSuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043035"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:34 -0700
X-CSE-ConnectionGUID: jL4sMX3eQ6KfR6Hp0sh2jQ==
X-CSE-MsgGUID: +b2Zl9UAQVGPDVQP5Tw0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159417975"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2025 10:45:33 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX0-00001B-22;
	Wed, 23 Jul 2025 17:45:30 +0000
Date: Wed, 23 Jul 2025 15:24:37 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/090-spi-hid 13/26]
 drivers/hid/hid-magicmouse.c:590: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202507231521.uTu070PQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   9da5f109e42a00118fe6327d7774c46116780937
commit: 6c777754fd9890693a267f3829e3aa6f142e6645 [13/26] hid: magicmouse: Add MTP multi-touch device support
config: alpha-randconfig-2002-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231521.uTu070PQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231521.uTu070PQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231521.uTu070PQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:587: warning: Excess struct member 'crc16' description in 'tp_finger'
>> drivers/hid/hid-magicmouse.c:590: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * vendor trackpad report
   drivers/hid/hid-magicmouse.c:604: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * standard HID mouse report


vim +590 drivers/hid/hid-magicmouse.c

   588	
   589	/**
 > 590	 * vendor trackpad report
   591	 *
   592	 * @num_fingers:	the number of fingers being reported in @fingers
   593	 * @buttons:		same as HID buttons
   594	 */
   595	struct tp_header {
   596		// HID vendor part, up to 1751 bytes
   597		u8 unknown[22];
   598		u8 num_fingers;
   599		u8 buttons;
   600		u8 unknown3[14];
   601	};
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
