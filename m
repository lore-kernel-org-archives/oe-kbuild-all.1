Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEBE156F45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775960785; cv=none; b=oZ6omphAqq7FobtvOGQzJBqjzifpYkloVvDJGDuIvC9ke69KRo0aRLQPmYpzKhPYIXvP4NXZ5mZSFB/pu5AkcHWD8HRwSz0C27MDMPquZxunm/qKy1VpGYX0jIKx0qQC79bHlwmVOK+dsVffZoGGAUowt+qZS2f6iF+UhyTtbss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775960785; c=relaxed/simple;
	bh=6zZ0b2akKhKpKYCXqalRmBYplIAyOtkaRJtOpx1YCTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YtsP0bpUkXJEeVYBpZwxATI/zQ5P4ga+eRxYmjQT31Jm2lqs8x79zGuhCZ/Q8Fh5Z4NTs/IlVuES6AMUoc0YJFWpcYT4jOqXsBtslYW3fXd3yuTV1i6oI9d4GGga2Tpw5adUZmTogBOC9vjqzZ2tIOvZ7w8QLvXYowR7Do79Udk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaxbpXoN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaxbpXoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775960782; x=1807496782;
  h=date:from:to:cc:subject:message-id;
  bh=6zZ0b2akKhKpKYCXqalRmBYplIAyOtkaRJtOpx1YCTA=;
  b=KaxbpXoNlO65LHLsoFxUN/hejlZHW6j/jntgmtEFj9ceSY7FQDeoZFBj
   pF21pADtDCfpcorHLJFk904MU+VSR2+5/ch3hhxaknIt5N9sQ03wwwKH8
   zOnUbAOQGP0gw1SDZH+sQrFSUwxRxBZAk4KoKYNRho+1URjBeBSnTZZuO
   wyLMOLXl4nf6uqWMp68AP/dtyNDOQs9l8yq7w6F40rnSlf657bT0NLi8b
   +yPdRvscDXP/1EB5r2d+3dJgftM+hdSPbpF8vXO+spI39/GQsSdmVRX7p
   /11yU5jXWrP5tgtx0N7MJer5PP0duOGW3gkkwRK2af18nDABqE/qPHgA2
   Q==;
X-CSE-ConnectionGUID: CVUTVNw0StKujhkOZzbZvw==
X-CSE-MsgGUID: cjbK73N9QKGGadVH4TQOxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76099725"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="76099725"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 19:26:22 -0700
X-CSE-ConnectionGUID: Ob/n1lPnRnGikutQ97eXjQ==
X-CSE-MsgGUID: OT4foHwQRnSGiJaYuqDRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="228595307"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2026 19:26:21 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBkWg-000000001lB-1Ylw;
	Sun, 12 Apr 2026 02:26:18 +0000
Date: Sun, 12 Apr 2026 10:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/usb/typec/ucsi/cros_ec_ucsi.c:136:24: sparse: sparse: symbol
 'cros_ucsi_ops' was not declared. Should it be static?
Message-ID: <202604121015.EPXHx8ut-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   af8565f8af514c1078861f15065036702659f1ca
commit: 21d2121e6b9b304937bd44176a3773a3e30e5286 [1/1] UPSTREAM: usb: typec: ucsi: Implement ChromeOS UCSI driver
config: x86_64-randconfig-r123-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121015.EPXHx8ut-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121015.EPXHx8ut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121015.EPXHx8ut-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:136:24: sparse: sparse: symbol 'cros_ucsi_ops' was not declared. Should it be static?

vim +/cros_ucsi_ops +136 drivers/usb/typec/ucsi/cros_ec_ucsi.c

   135	
 > 136	struct ucsi_operations cros_ucsi_ops = {
   137		.read_version = cros_ucsi_read_version,
   138		.read_cci = cros_ucsi_read_cci,
   139		.read_message_in = cros_ucsi_read_message_in,
   140		.async_control = cros_ucsi_async_control,
   141		.sync_control = cros_ucsi_sync_control,
   142	};
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
