Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396043B7B71
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757542; cv=none; b=fian8biM7UYiBL99FBBoRQsLO5IOd8weyJA25ggLfOkPvYMT72an7fDg6QMB9qahrXJE76KvhcRuKaq8K0defWWXWzNssTsGBInhiWX5aOTqV/LIybSyJTL44kQWkxGk+yw0NuZhU6RnCMgRW8yM2ctddBrDfHDWJo32YrLi5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757542; c=relaxed/simple;
	bh=jqgSi4K+Fm3ZzJZFGsjuXXKYlcVYUMWSk3tmCTkRTpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q3SK5MmVOR1sUyATu/wAjeRmOBJQJUDZr+dFTP5jtvGpMrFtOf3cSwkspijYhG5bWIUMH14mDxjDU1tSgeGh+BhwN7LMwuKnwbr5W8jwJj32bBZ3iAW43TlShVLtokQE0W4PZkVkp47xEMDRuNSO7TBupL1rqifyDdDMRWv9jd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXEuY/ql; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXEuY/ql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778757540; x=1810293540;
  h=date:from:to:cc:subject:message-id;
  bh=jqgSi4K+Fm3ZzJZFGsjuXXKYlcVYUMWSk3tmCTkRTpw=;
  b=cXEuY/qlpAHLn0gg2vVZmyYaHcv5LX7o86VCK1vnVjh/XULM1ziRIdV+
   Wb4jjWQk55Q91Y4ODMhqxMOk2mNaNps29uoIHFhDQWTkoQpnNGI1b2iTQ
   OqqGAW4t6lxCXtw41hW2LTTq3VQNFKI1ZHMrO2rziT3h9hJ29yhXMa2zS
   cUxLL22hJO9JLKLjHxaVZbKVTMnQBuvkfpB+a2ar4XVibJvZZnypzurwO
   0kiEhObtkJxsPM0JKSUn3EoVHQJM/lc+bwyW+ObO6kn5Vu0bA/CORkKFq
   4xnpYkQM0kgrtjtHpNrnJh2+1en46oMMrwWWeHsFjYDA9Kq3fDq2kzqn+
   g==;
X-CSE-ConnectionGUID: 7dh8D6d1TsWT0uawUu4rsg==
X-CSE-MsgGUID: KG1cpmMUQOaghyvVQhjswQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90800740"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90800740"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:18:59 -0700
X-CSE-ConnectionGUID: 0m30AusXQaGor2UtRExQzg==
X-CSE-MsgGUID: IjkIhxhRRCGzTkhcxX01Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238477292"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2026 04:18:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNU5f-000000008o9-2nft;
	Thu, 14 May 2026 11:18:55 +0000
Date: Thu, 14 May 2026 13:18:32 +0200
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/pci/liveupdate.h:31:1: error: expected identifier or
 '(' before '{' token
Message-ID: <202605141324.KdK4R1PU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Matlack/PCI-liveupdate-Set-up-FLB-handler-for-the-PCI-core/20260514-111126
head:   b4570b026ee40593fe4f6931f522a15adc6ea247
commit: f88bd26914e11847b921b4d09d4b91be5dec94ba PCI: liveupdate: Freeze preservation status during shutdown
date:   8 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260514/202605141324.KdK4R1PU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141324.KdK4R1PU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141324.KdK4R1PU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/probe.c:27:
>> drivers/pci/liveupdate.h:31:1: error: expected identifier or '(' before '{' token
      31 | {
         | ^
>> drivers/pci/liveupdate.h:30:20: warning: 'pci_liveupdate_freeze' declared 'static' but never defined [-Wunused-function]
      30 | static inline void pci_liveupdate_freeze(struct pci_dev *dev);
         |                    ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/pci-driver.c:24:
>> drivers/pci/liveupdate.h:31:1: error: expected identifier or '(' before '{' token
      31 | {
         | ^
>> drivers/pci/liveupdate.h:30:20: warning: 'pci_liveupdate_freeze' used but never defined
      30 | static inline void pci_liveupdate_freeze(struct pci_dev *dev);
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +31 drivers/pci/liveupdate.h

    29	
  > 30	static inline void pci_liveupdate_freeze(struct pci_dev *dev);
  > 31	{
    32	}
    33	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
