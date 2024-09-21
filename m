Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84C1531E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 21:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726955771; cv=none; b=CxfyKejrrvJoV+5TLP/MpBJOCogWyWux802PY2ebLia6a9xGht0SURne+nR4v3zz5faifhyoczbHfyEr5EqbYERdAXW7y8bhapdsVIJX39FWn871iO79uqwhAsJZHogIB0CbuXMohYvk90vAJn/pGHUZ+2O0HzWq7x6wnj7eXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726955771; c=relaxed/simple;
	bh=ow4dGFv4zqn1mPC6J0tvf/R/4qrm+musNpfQ3ZZ6vnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tijPI00FZi2eUZxfnUHQqU14ZeQXNL4LR5kYhyOsNlxmOxWN3b4pcGgD3qW/VUL38NsSQbyh7ea6/Nlnwc/4PhkbHOrkZi/Vc6iyv/xD47E4AUNZeYlCf6kbycUMGhFXZleJADmvPGI+Lz5OJ9e+gWlJOnWCT0q9R7LpUcjh1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTtkRPSr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTtkRPSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726955770; x=1758491770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ow4dGFv4zqn1mPC6J0tvf/R/4qrm+musNpfQ3ZZ6vnM=;
  b=NTtkRPSrdOdVGsowFllHcmY52JGfXn/ozMptmWTWhoAknfJ1XoO+FAlQ
   5cxDGE2R2o2npwbncAvgG2uXQs4rz7Zu/nRXFjqaw1KG/e//c6wf6x5ZG
   X7+Cyk69b8ySoXfdYffyl8eaKb7nB7c1qLS+TPGsn8bX1l8xjF8gaKlfG
   ghE0NEEvu4NkVS5qGk6NNJXC4u0u+T9HKkSlJdh11rARWdyOIoTz/RZn5
   blsM1k2fqkVwLv7e03n71c/GoXwEM7lkpROPHwRxUbYLCnTIOVD2ZWIdu
   LW8zJGTcIyKJsB8cPqKXiGhq1ZBuCI41SMFksUqy1KcWWhJZHifBLJGFv
   A==;
X-CSE-ConnectionGUID: SfYFS+uwSkiCQ3CcCO57SA==
X-CSE-MsgGUID: HB9em3gWQIKT8zbEvoBJbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37072352"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="37072352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 14:56:09 -0700
X-CSE-ConnectionGUID: pYhUPvw0RDKfSncWUqwbaQ==
X-CSE-MsgGUID: 11ZZXVmYQJ+RVCJoma78Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="70544372"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Sep 2024 14:56:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss85F-000FpG-0k;
	Sat, 21 Sep 2024 21:56:05 +0000
Date: Sun, 22 Sep 2024 05:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliuoc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20575/23728]
 drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202409220524.x5qCvvAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliuoc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3bbb0f885bf0f93bee0bb99c623877588ae005ee
commit: 050ff2f361bf733d1dde505dea8b0f5ecb23507c [20575/23728] hwrng: Add Zhaoxin rng driver
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240922/202409220524.x5qCvvAy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220524.x5qCvvAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220524.x5qCvvAy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
