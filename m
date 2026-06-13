Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6737AA94
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 04:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781324244; cv=none; b=CLE6s6MuCV6gFZY25Upn7dH7klpq+SiJKRU1rqQLBeS8DoNACZrfGQZ2kr/5QQe3JvYFcZpGJmF0HviwArRtgoeokiKJTZ9lgmmiHA3QsmiNmhSGjDQSkc72yPQ0EuejiHTA7S3nV4ilGaDB0vYe53evvPCHxjuQVgkCMBoZyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781324244; c=relaxed/simple;
	bh=8OtsHk0z3mu5RCRt12yekyGMB+vBbZsZzrJJIl6SpYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sRXDj3X56pScEqb7XRcTbVGzhhSQp1Sp+uRan+dXu1MEkFQ8f9m/aVJ/Gg6MAPmcw2F0IPVsiuxnoFn2FbWiiFThEwNOP61TnEWEkKcX+EjcpkzeMB+8oKYy4KZrGZrStkXSvMDDJkEMAWtwYOYQUUBvNpUsnnOps7r/nE8Jhcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZI+ClmK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZI+ClmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781324242; x=1812860242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8OtsHk0z3mu5RCRt12yekyGMB+vBbZsZzrJJIl6SpYM=;
  b=lZI+ClmKWxsUnVkI5YTcUa5ilQGcnkcHYrjXEcrzT1Xw01O1mftECpLl
   OoiAihzlQ/VhRjis0iJMcy06lgjLQM/3zr9kGbov1N+q6cGy5KkibPCl7
   pWd9jBV+lVv+6TDgFpfsT4Jt50RkOIA2Sg6heZfHFXe4MHUBBwhqHrM6i
   w4i+Ma/0KoUJN7KzF+PPvVanXANJm43klXqJCjAhFWJKAtLqfrIT/NYUP
   mu/SnqEYCuFBbti3xyysYWymqC09UMZV+v1lVtjqyltmJPu/Ay42EAweg
   kvwgsISXTzXAlPqPAwIcTdr4JzkkLjQTCgHThmkVDQR8KGnJZwRHpnU2v
   g==;
X-CSE-ConnectionGUID: 2bgSAeNTTb6xOrFKtZwDUw==
X-CSE-MsgGUID: L2sHdONDQFWMqjGdRjfrtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92718422"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="92718422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 21:17:21 -0700
X-CSE-ConnectionGUID: AuegGGacQuuW+JqrNLopSA==
X-CSE-MsgGUID: 0P06nSKcRJuPAdwkCelmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="285094510"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2026 21:17:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYFo5-00000000PfO-1mrK;
	Sat, 13 Jun 2026 04:17:17 +0000
Date: Sat, 13 Jun 2026 12:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12]
 =?us-ascii?Q?drivers/accel/adla=5Flegacy/kmd/drv/port/platform/linux/adl?=
 =?us-ascii?Q?ak=5Fplatform=5Fdevice.c:314:12:?= warning:
 'adlak_platform_sys_pm_resume' defined but not used
Message-ID: <202606131259.M035GKnl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3e1cd9728037a89d53b1973467e84cf36e811d34
commit: 3e1cd9728037a89d53b1973467e84cf36e811d34 [12/12] Temporary use Adla Legacy driver
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606131259.M035GKnl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131259.M035GKnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131259.M035GKnl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_device.c:314:12: warning: 'adlak_platform_sys_pm_resume' defined but not used [-Wunused-function]
     314 | static int adlak_platform_sys_pm_resume(struct device *dev) {
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_device.c:309:12: warning: 'adlak_platform_sys_pm_suspend' defined but not used [-Wunused-function]
     309 | static int adlak_platform_sys_pm_suspend(struct device *dev) {
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/adlak_platform_sys_pm_resume +314 drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_device.c

   308	
 > 309	static int adlak_platform_sys_pm_suspend(struct device *dev) {
   310	    pm_message_t state = {0};
   311	    return adlak_platform_sys_suspend(to_platform_device(dev), state);
   312	}
   313	
 > 314	static int adlak_platform_sys_pm_resume(struct device *dev) {
   315	    return adlak_platform_sys_resume(to_platform_device(dev));
   316	}
   317	#endif
   318	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
