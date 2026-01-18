Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3835650096D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768742337; cv=none; b=ArInF6SWUnQv5smaXu27dh04fAX9kJaYCqOneirxP4QETCe+Yzif79Uzrt4t+aCB8nP+1bTqDiIRTlZYgA31t85NlVyQkdky86YVxJQp1R5AHpv02XsH1c5FrL9lJ8+VuW89Ck0STEVIWGqH0BkDGTNzGrWmDBNTEJ+r3vscLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768742337; c=relaxed/simple;
	bh=o/P3BhZHop7fdozwaxK35l0p9WZNhGvdYes4XZCjcH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SS3P3r4xzJMBq2/JUfNG9SbtWv4doAHowGA02lSJi8vbUP66bfU7ebmqicMjLwhftRziL8eUXZdFHTSVGUKsUPWb6b5fwnrYpwzre8LVxvUFFXYbMVxkeI5hqGQQif6JWCc37r/H02PStbSyEEhdYscg10boUDeVU160NuVn2m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSg7gbng; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSg7gbng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768742335; x=1800278335;
  h=date:from:to:cc:subject:message-id;
  bh=o/P3BhZHop7fdozwaxK35l0p9WZNhGvdYes4XZCjcH8=;
  b=CSg7gbngLpHQTHWpRU5ec73GX6OFJVsJxVop5bNMcpHdmw42wxv5XSbB
   Y5uaxOpIPWJPxKaDxzIQhBrMcYZj4lu0nbEZGUqztMYwyeds5+2GPh66o
   nYkWT7ex+FD5+nhigW9f+F++Rleht7TxYE5VsoI1ZUG1IwyGw+rRqLK2m
   Tgeo3VZXia6BN3PSjg/HskdRPZvs/fbc4EQvadS+gG13Iusi+EOi3AtLP
   Tyq6UUppyMdISaor3pCAgXE+qAl32tetHNAJWUEju4Sq2v2OWfA7FMM3K
   jTv3WlAGLdOsEPQ0Jm61JL5sZbEx3mNmDo+F28g8dOpzFQjA6O3RfzbAa
   Q==;
X-CSE-ConnectionGUID: gXkzlDrAS1Gt0wa5R8TQlQ==
X-CSE-MsgGUID: c2ekyvttTwCsAA/vgCIYtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73832703"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73832703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 05:18:54 -0800
X-CSE-ConnectionGUID: mS0RC1LTRbuFQ5xOi3SUDg==
X-CSE-MsgGUID: ueym8wddRXyxaz4UNaWl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205543844"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jan 2026 05:18:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhSg7-00000000Mxs-00Ax;
	Sun, 18 Jan 2026 13:18:51 +0000
Date: Sun, 18 Jan 2026 21:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 126/126]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202601182118.UDeuIdcU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   1f1c980823d4f683fef7223fc11d25f6f56854d3
commit: a9f3320a9a3f2e997a9768a4e6742dedb8df7c1b [126/126] firmware: add r3mini phy firmware
config: i386-buildonly-randconfig-001-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182118.UDeuIdcU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182118.UDeuIdcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182118.UDeuIdcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
