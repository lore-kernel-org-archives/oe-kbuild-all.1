Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A993B585F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788103073; cv=none; b=XvjaEtTuNeoDDoVrpPFnZXOL35H+i6AAlOJXCSbxDgKe612U3TYRAykXdZUy1rl6SqjRVt3zZQbLuzJWXoZ6CyF4VQZF4tvZ6rXYaUwa5lR4l1yWNhqFVTh1rFJJ6w9IVa9gG64ZfwYOnq2zouflFTRx5J3u3+oMZiF575PbFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788103073; c=relaxed/simple;
	bh=occq7EjDRtBDyWW2xoLSOPDVJBnxeIK6PS/ewAidCwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYm5Fz49csqntTfSs9mGYdjhUN/rWlBnRJ+U44glVuAT1jA1sFLqd4IV0i0cLwpNgUbI9n/ZTBUL1lPAvFvDWE3FFhC2dJ/YbKdgaJjnD6QJcfoQOaXniSMxVM5qXppCrbfEcuhrW+4Gc3gEUf7Ngf0EZJFgJ3HpHXsS+26PVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwNvDPxJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwNvDPxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788103070; x=1819639070;
  h=date:from:to:cc:subject:message-id;
  bh=occq7EjDRtBDyWW2xoLSOPDVJBnxeIK6PS/ewAidCwc=;
  b=gwNvDPxJ6DJ+paqH6+MwdJELr3Q5FVCaUjynbYaj92fmFw9MjO62bgAh
   h3jm0dT1rG13IsE6aspaRxmtHAOGT7ssxOQXKGSlTR9ArfcR8E0kGywtw
   0JpdPtLJ6lh7DRz8R5KsGJzXu/IzxmP8rGjRGjz275YTr1HWXocFC6L4K
   fc4uYbDlgN7QnNg4rh9F67PT8HqKI9g1tX3PCqy7xkqpgxh1xVtBeZzT8
   VO/WdQ3nFJEW9xV2vCiHQSLij1iqHM8v/dcMSbyNTFU8A9o6P3LBCei9Q
   iGQUqtPHdiZt/FFUagvOd5hdOZraqR/JcHBiIXTA+YlQA6tG6LMQEIT8/
   w==;
X-CSE-ConnectionGUID: VKaeHoFWSpOWL83ldDFzpQ==
X-CSE-MsgGUID: lBG+vEq9TNOTIgXMnlIQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88551474"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88551474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 08:17:48 -0700
X-CSE-ConnectionGUID: cWThWTw+TTqojR5nMuZOmw==
X-CSE-MsgGUID: SrWxFLfOSjmWAiIqvah9nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272098555"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2026 08:17:47 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0hI0-00000000E0O-0wUJ;
	Sun, 30 Aug 2026 15:17:44 +0000
Date: Sun, 30 Aug 2026 23:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/subpage 9/10] file.c:undefined reference to
 `__divdi3'
Message-ID: <202608302349.AXJE2LxU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage
head:   3a537197e7b9327a386b4c5deab273a387072d1f
commit: 7967e8f5c2c2f347acdc20281027d28c46b8a9e1 [9/10] f2fs: parameterize block size and mask macros
config: sh-randconfig-r071-20260830 (https://download.01.org/0day-ci/archive/20260830/202608302349.AXJE2LxU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302349.AXJE2LxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302349.AXJE2LxU-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/f2fs/file.o: in function `f2fs_sec_trim_file':
>> file.c:(.text+0x3468): undefined reference to `__divdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
