Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D03FE7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 01:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756430426; cv=none; b=AqelOET7fbU9CtNyyFHcRs32Jpmu+we0wViRpwrGgJYJlNB0aE8SOy1xDvwNA+dHr243pRpqvGaMIa+6p99inzf1H3Nk4+EhjdVyVEB3BT2lMWhrRulAkYxqWc+v9WLUFblzE71QwYrO9E74OdtiMiLJKOyXeClrsjG/YZZadPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756430426; c=relaxed/simple;
	bh=1lMcc4NHcpwyZ4dcZWb5QgJNHD+DvzSg5VD6UdwDMas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UmDr2HjQl95gZTNS4b+TFmPj+GfuBU4Nq8WYjhJcj+h2m6VwR+VZ6BGJWGpnYlRs05nUfF2KK8sinNyktzbkvLdBZb0OvDKbUUk+04DsBJbhydOmBJzfFEi4h9j5Zfv8tQTd62I3YNShG9Wed1/Jtx2ZaQAVoJBZTHH3gzWcuJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeWAZOVj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeWAZOVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756430425; x=1787966425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lMcc4NHcpwyZ4dcZWb5QgJNHD+DvzSg5VD6UdwDMas=;
  b=UeWAZOVj9xobaMk5oF/ywOsPQJhjQMQzgYMjyUEMtk/0SiirwpNjiIsl
   ynIvw1yLTPkUKnEu/xqVBVFQQwE3He/zZAMZ/PS6JPf94i/Uadijwii2F
   fZ3/HLftcTG9itkv1MqtL9E4/PbTGwkhaUwA7pEmjBytFlYId1844Biyv
   7mw4VNp/vzxMWGmrFStx+8KWyzbvYFtXWLnC8P82LprkBuJYqIxlPDxK7
   E1Qc5K62cOAfgROVWw/9hVWKLW5Z8eivKARFXiZ4U0Gg1h+6kY3/QrwDv
   aqZ76zqg46DZdY9RDmzA/b4oHU8KZJ7kh3IklPCjmm7ZPZROnEdmoncr+
   g==;
X-CSE-ConnectionGUID: IfhinzzgSFSHsAJC7vFvYg==
X-CSE-MsgGUID: SWGR1sIFRC6ucrryY7Z+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84118467"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84118467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 18:20:24 -0700
X-CSE-ConnectionGUID: hnjCSjpDRBSHyv3zPTFXOQ==
X-CSE-MsgGUID: GjAtG680SA2QtOUVcl1Vhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170428785"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Aug 2025 18:20:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urnmh-000UCr-0I;
	Fri, 29 Aug 2025 01:20:10 +0000
Date: Fri, 29 Aug 2025 09:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2786/2786] kismet: WARNING: unmet direct
 dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA when selected by
 ARM64
Message-ID: <202508290917.vZHTpzab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e79492495d646fc0c384664bc65c3aa79360592c
commit: a91091aed1fa925eef3085facb44c4826b317f39 [2786/2786] sched: More flexible use of CPU quota when CPU is idle
config: arm64-kismet-CONFIG_ARCH_SUPPORTS_SCHED_SOFT_QUOTA-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20250829/202508290917.vZHTpzab-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250829/202508290917.vZHTpzab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508290917.vZHTpzab-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA when selected by ARM64
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
     Depends on [n]: CGROUPS [=n]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
