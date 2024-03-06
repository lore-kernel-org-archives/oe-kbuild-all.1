Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B317E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709692270; cv=none; b=X1rvVeD73gaKeUMybFy7ICTPjQFdJTupBzbSv+DTjsBSVAemL5OR3fJuY0HrsUGEsGqrBdSNORjGq7hCFkuicibiw5gfoNnxgQHZ/9aAyVeZkSp+ZROQzlWwLezr6w4cMKa1MCT38iGIM24wbOY1NDH8ZVPV5OXLLAWMcvdTpLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709692270; c=relaxed/simple;
	bh=+ZXYkfxeVmMErX8y+M9tZ121/VZl6JWaO8UwQu9tdAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5zQzSBp3yzHRj31KU7xJqG//anUZjRT7G+Y3zLG91abPxzAM3tHOZVlK51AWeP0N7qb10ZicC3U9gZMrEPyToFZEpj7qnRCjS00Kcg5nGlrJ6P6eTiXkAeFzcS0j0e76Al9erTmX4EVnuwL5FakunSJad/1UOBOW/Mcz+0YJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0QiLQBR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0QiLQBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709692269; x=1741228269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZXYkfxeVmMErX8y+M9tZ121/VZl6JWaO8UwQu9tdAQ=;
  b=E0QiLQBRR46qsX4nHRJxPsE+7HcZoA30a/orfvMzAX74qYMdueukzpvk
   2U9vbQtcmxK6HRDamKo3/UhOZ8lpRMTecayHgeFbuRev3Ynt6KJGMGx4o
   TIMQHQHs2HlEH8KUywt4ehivFAhPbAO3TXISMEpMDdD4ODXz/i3o5hsVV
   9FsE2LdpAI/pl7fop5CTtWP/ui+tKRsrIpD/23Gd7ZXgCtZTFehKNdelX
   d7Mcx5KwD9yzu1EESIlQgXpcTfwLAjWpPhwjVdJRuseyJgdWBu7lidUYV
   qZu/vghPUYdLjz/LPiMBiJyF9J/JMPHVaFsexKGRjmgXs7MhH03PCk0DS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4144135"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4144135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 18:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14154889"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2024 18:31:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhh3g-0003qb-1o;
	Wed, 06 Mar 2024 02:31:04 +0000
Date: Wed, 6 Mar 2024 10:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13475/21720] net/can/j1939/main.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202403061005.3SMjwiSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba030414a07b34111e8786469740412351906964
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [13475/21720] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-003-20240224 (https://download.01.org/0day-ci/archive/20240306/202403061005.3SMjwiSq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061005.3SMjwiSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061005.3SMjwiSq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/main.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
