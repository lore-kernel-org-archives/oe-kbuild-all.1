Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF41849
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 00:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728779551; cv=none; b=MwyNpr/ycp35hF6pfX4INRHOEYB3lTkyn+ZrqdaI3scCkKvQQCfAoUncQtD/ZS7jU497ayc4wLQm0jU1jtfa5sEo6ynij3brgcWRPD10aEsknIBwrUCi8th7+2Js/S0oUWrW1VvQJO7itepxm3eh98OCXqSVef5rsp3go1Rk9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728779551; c=relaxed/simple;
	bh=1QgxvC3NfWxKWNOzZNT4N7f22aroo03fUob/7nNpcc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHrO7Iabd4I3Qls+hnmoQ91LYGmsNwtib0yqsYfIPWKsR8J5Uji1qy8RLo/NtUm0k250WSgvAqBobPird3HjEHxOKZggyzZBoniwf57RnDTqKWCsZVCOZpzYmQE6P8nv/P/AvIN/+Jwjt6xmVGRFWnKFY1tP7gdL18v7CRhNgyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBVFrFPf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBVFrFPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728779550; x=1760315550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1QgxvC3NfWxKWNOzZNT4N7f22aroo03fUob/7nNpcc8=;
  b=XBVFrFPfa6sAARQlfwyOS+3Y/X1tgR5iwJ3xtqJMcI99mlpJCIV87AuN
   hOthYRUATGxnxmd3ElWk4N0RvinvXk32jGSw4h81s9eMSCzFpmOZMwDs+
   d/QTGoSoyi0t3Noq7YuyE4Ydh8Sl4YVD2puTDz9mei3mgcviL0ECiPGVA
   51VThkCGnQtGu5wIP+CuQIv7vMxXOmCLRzwir9rgKCbKT7fbAIg+ChtE2
   S4E+Mzhe2SV943gWQtYdZKIZnmZ1GHCl3Jh+Zkw6bNdbteEc2nVNdXXK7
   ppPDSdbY3w2eq18qXTwI3FUK70eXmPfI3Vjp5PQ4nO+ki+A0dML3C7Z3/
   g==;
X-CSE-ConnectionGUID: zMvbdIBsQfiZqKumAgJDCg==
X-CSE-MsgGUID: Ntf6xrySQbK88AQCrhbsmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28245873"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28245873"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 17:32:29 -0700
X-CSE-ConnectionGUID: GQ0XB7d/SfO9oxFtFSPzNw==
X-CSE-MsgGUID: zXSuhBapTQiFsg4CUaAwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107964732"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Oct 2024 17:32:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szmX4-000Du3-0E;
	Sun, 13 Oct 2024 00:32:26 +0000
Date: Sun, 13 Oct 2024 08:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3134/30000] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202410130816.PxEwyDhC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [3134/30000] FROMGIT: power: supply: Allow charger manager can be built as a module
config: x86_64-buildonly-randconfig-006-20241013 (https://download.01.org/0day-ci/archive/20241013/202410130816.PxEwyDhC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130816.PxEwyDhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130816.PxEwyDhC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ERROR: "__memcat_p" [lib/test_memcat_p.ko] undefined!
   ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefined!
>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
