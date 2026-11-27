Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760483;
	b=nzl/pVVK5W8n2LvgHN1dquI5YXtQYgodvl9VxcTSL3yy+4YLJjvcJSMCyTiaxn6lCAB6
	 cbAvuEbLuKoqCsw19XTAkZtVAYiaMIChXjED6QDZjaTvB/JTRnxuStdspMBv8rZv6JpEZ
	 iYkE1WohAXPH5LIUI/MxoKJdgpGZdXOGhiNe+pX71yXHFq1zOfCSjRCzklWJ1qTEi8mrB
	 j1IGEvdWJOKBSsYD9HX+xM+HId62QLJt6nJGSneSMOVPrgm1NpFYLmvIZadJeJgM4NUft
	 m/hkFbm94PguwXjQIuMr12vqn2RY8N8GDlQvaLkikQTdv5zb/7/TBsEIVRS39mhIn9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760483;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=oEf/J+zc+LB0sBMUr6ZtroR9+kAxksqj0LGr+c0oSZs=;
	b=PV6qetqenbiWBQyQmf2dQ/l/gVPX4N6rIa1R+TVLDBPVENszFlRp6v/miywefYaqnS4h
	 vE+/gSLFmw2FHeqgeRn6icwATSyj9hEuf+18C3FWAueZMESvgbxvdomANv1TG06oTasdC
	 nzCPjVfDOTiEAmceH832VzcYWYvy9eAuVvsLAxZFRm+7cV5m0s1Me5lAwLsCBfJi4jnWH
	 7/3jNWg2TRFmDNtoMhNYAORRb2CMzX0L7HrEW7h/6xgxe5q+81uBhuT3heb8SsRLG2D6a
	 xYfpOHV8Kz7a4dvOepxiXCxtCJi/UrPdBPIUlmuDFNhpvwFwv3B6apP5p6FKSENsxWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S3B3zLcf;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EAF606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 06:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46EAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S3B3zLcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795760483; x=1827296483;
  h=date:from:to:cc:subject:message-id;
  bh=WGyBDogbkIeMz/YJ3mEssPV3ciA5yDHLyUFcv5YA+Lk=;
  b=S3B3zLcfzK1RVedJ2RUVh/34pQTB9nJyHdfjQ0OdDU7fmv/zosrwvV+8
   7L0tZEDBBCuj2Z+BsDlMg09YYRrQCiPqVq5e/eCYLYtZerCutrvy0RQd8
   ZKdcOFyZdAgjRpURqHufzSut7lI9Kh+SFhAVFsNesOq2d45Yi9gCiGXjr
   MnCPoAGzSLG5Nsgc80+o+Y45dxmW2Efv5LQY1NGvN2K7WeCpqQO/9ze0v
   LFzIgV5mSOxOhrdXAR59IRgOvRTUtMU9cFkFkkubP3Oew9Agqe8/NQjCI
   1JGbM6bIDtAWchinOUpceOKN3Y9SkoWwX1kimfJ8KQTcoOrC99kJWmF+7
   A==;
X-CSE-ConnectionGUID: Fd3f34zITsy0lOIVoWw0IA==
X-CSE-MsgGUID: rWcapi1fSIymvZnxWW0t8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4522401"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4522401"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 22:21:23 -0800
X-CSE-ConnectionGUID: Cwkzb0VCRq+zhkbsAfDarQ==
X-CSE-MsgGUID: uC1FbVJ/St2n5TgwT1Undg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="14097753"
Received: from igk-lkp-server01.igk.intel.com (HELO cbd2aa73d023) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 26 Nov 2026 22:21:15 -0800
Received: from kbuild by cbd2aa73d023 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWpKQ-0000000002V-2Do7;
	Fri, 27 Nov 2026 06:21:02 +0000
Date: Fri, 27 Nov 2026 07:20:49 +0100
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 13/26] Warning:
 drivers/hid/hid-magicmouse.c:623 expecting prototype for struct vendor.
 Prototype was for struct tp_header instead
Message-ID: <20261127055559.C1WI2jTW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   baa4b96295a94f4f19f4aad08847a46c4360d1e5
commit: eef359a5dd884deb210dcbe9308cbda0da470b4e [13/26] HID: magicmouse: Add MTP multi-touch device support
config: sparc-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127055559.C1WI2jTW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127055559.C1WI2jTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127055559.C1WI2jTW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:623 expecting prototype for struct vendor. Prototype was for struct tp_header instead
>> Warning: drivers/hid/hid-magicmouse.c:638 expecting prototype for struct standard. Prototype was for struct tp_mouse_report instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
