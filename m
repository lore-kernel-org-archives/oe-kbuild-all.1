Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4726B86146
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067490; cv=none; b=L2myYe4TOEg1vvwvnjLOm24vEq8h8RocdYrcKKKBO6LjZMM3202OO9d5x/xBQzPOIFYa7NFY7VZsbtiziZHDGSLk4wdE4d3dpwHg9Q7Z97u3UjWdJDsFXp8x4HJ+4+gBL/W7h085ySimC6tm5XcFAjY8j5Efr/ZK8czXuJBrEbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067490; c=relaxed/simple;
	bh=9SzI6/qStDH7KduKHrq1dZebQtl+X3pKy1Y0Op6vkv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCURQqnJyK0xdyFCTNrIcn6cF157IxuUN2hwOjTsGon8W7nQgW1t/5JYJVROT8ZBLiuQilmGad+S5hKAmwD/GuNIghut0KV1l2vjAz+/79l49fbQ2xgj3xJrx1X5CFYkox8QRmp0IXLT5RjcHrq7a1/Ug+mdu5b8eiu32L2a0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aqq0WVPS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aqq0WVPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712067488; x=1743603488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SzI6/qStDH7KduKHrq1dZebQtl+X3pKy1Y0Op6vkv0=;
  b=Aqq0WVPSSkkyQilpIXvDlWY8jNeOMEl86ejI2NZzdE2d98ts9djENJb2
   BqZtQPgxxA0BIaAIYpj1VWoOD+TSuWmDwOwpTTB5ZxkxZiWgju/kI79JI
   8l9AsK/rmxqkLM2wFUdD+Q1lZ6tzOll89nGmqXozRxv89ct2UNj3sKNaU
   HdtFpmuLdmDASQDIo3LCRYAo2BpOMW9k/0K7Bwdf7X4buP/AEmlkZrzWG
   VgNEMFy8V/1xt5HTepM1Paqpakb8gRRpDhr4SjxlOHWo2KdaNI5AtTnvU
   MgyVocnQbwkv8SEMW5dHRukqf/6QiOaQrlLc36PvohgiHUl1E5ki1jFej
   A==;
X-CSE-ConnectionGUID: wRlZNXC+Q7KMr2Vt7dPPbQ==
X-CSE-MsgGUID: befwCFsoThKA24vWDf+0AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7104617"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7104617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:18:07 -0700
X-CSE-ConnectionGUID: 889/FlF+Qmih+qNtwfaI2g==
X-CSE-MsgGUID: 7qW+1URsSHS2UPVsoM8k2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22778483"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Apr 2024 07:18:07 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrexg-0001F3-0K;
	Tue, 02 Apr 2024 14:18:04 +0000
Date: Tue, 2 Apr 2024 22:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377] ERROR: modpost:
 "ntb_register_device" [drivers/pci/endpoint/functions/pci-epf-vntb.ko]
 undefined!
Message-ID: <202404022237.0360c2NY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   9465fef4ae351749f7068da8c78af4ca27e61928
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: arm-randconfig-r111-20240402 (https://download.01.org/0day-ci/archive/20240402/202404022237.0360c2NY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce: (https://download.01.org/0day-ci/archive/20240402/202404022237.0360c2NY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404022237.0360c2NY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ntb_register_device" [drivers/pci/endpoint/functions/pci-epf-vntb.ko] undefined!
>> ERROR: modpost: "ntb_link_event" [drivers/pci/endpoint/functions/pci-epf-vntb.ko] undefined!
>> ERROR: modpost: "ntb_db_event" [drivers/pci/endpoint/functions/pci-epf-vntb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
