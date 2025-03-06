Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF425CC68
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281677; cv=none; b=fk1JX4sc3rOIJRCoxWXUzjW6DxzIUkilA3Zokgz2afH7ewVeGeI9JHHoSX/Ghc+VK4JLyzksaE02mx6dibM0GdR+zH22x57tdnmKIutXH3KlX+vwLvO9LO2PvMqYMQEOsdGOGQmdzbkycVpSg3KNGT0FLElYTkYn5fnD8r805NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281677; c=relaxed/simple;
	bh=Tc4PxN3A1lhkZm2jrND0N6ekrOxxHPpLYRANTnRmgqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHsU0wSrVVClEqr2JVC4nx9kceR/KGckj1WgU02s8VNb2QxtKD2HJptRYDbkzi1cWOyO5jzwMgKuyc6K9TLGSB+y845KUGCVLfkd/xfEbCeaRsqaSaqQr/GNP5VapvWOb5AdFMEDwuQWk2z8Xs6qn/GBt6gokYseov54YwwSSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfwkTSKo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfwkTSKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741281675; x=1772817675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tc4PxN3A1lhkZm2jrND0N6ekrOxxHPpLYRANTnRmgqQ=;
  b=CfwkTSKoFPIQcnXaIkPxbp+PV9QaIYC6fXOcUOj+0ko0I/b0SXD1PCzU
   Cc7o+rJzT33dEVdbLyw9qWBhj372di17jftMxRwofylLzoy5dhaLob+by
   TJ/w8QeDlQEIj9f7M4BY55JUbrutgySOOXYvwdUD0bkMRYfjx5UV5pn6b
   zn6/VZqtf8MFgFFCeB8jj/kHjdPQvmpOPravL5vEtRvPKssUn7xWOMzfI
   Ujz2gVasdza08jfqLsJD79jLccR/lLE+GM56F+Pk3jRlhpEDfPOAOqeyY
   ewWYJISEmZ3xG5Vig+rBfWAk3Qw2QTfAvADJxFS9msdZBjptJY8NL2t7U
   w==;
X-CSE-ConnectionGUID: A4+t3HpwTVmnCE76yq/EVA==
X-CSE-MsgGUID: kRVWmnHkSnCYFXgC6U8Z/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46234754"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46234754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 09:21:13 -0800
X-CSE-ConnectionGUID: vnfCDY6NSl20e9oAm5OCJw==
X-CSE-MsgGUID: es6ZjFnqR5S2p0rV+9+Y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156296743"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2025 09:21:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqEuD-000NM8-2c;
	Thu, 06 Mar 2025 17:21:09 +0000
Date: Fri, 7 Mar 2025 01:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1447/1447] kernel/futex.o: warning:
 objtool: get_futex_key()+0xf8b: unreachable instruction
Message-ID: <202503070152.Lezu4e8K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fa7c6902e19233b35b7caf7c8d591f1c48aa2be1
commit: b404141975c53fb7b92d74e28466b98b81db4b2e [1447/1447] futex: Provide and use pi_state_update_owner()
config: x86_64-buildonly-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070152.Lezu4e8K-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070152.Lezu4e8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070152.Lezu4e8K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/futex.c:56:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> kernel/futex.o: warning: objtool: get_futex_key()+0xf8b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
