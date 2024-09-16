Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C41870
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 01:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450444; cv=none; b=X9XuvPQ2AyWQiO+S6J224mzbR5TMtSbugepkc9iuVkAV8aq7dKw4RHsoFtJY0zdGjA6gUo9+USTXg6j0AdapK01Mwr0jPYOsjP+9oBI4lt7jaA1B4Jp4rQhpBpSF1UMB7h3PMOFF3qwN/zP3LD0qP+ZdR91Wg6Nt/RRd2VpUEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450444; c=relaxed/simple;
	bh=bLZIH0//DzfSSZOcL9nbHsb1EPmXU9WgCr/K1ZbbPzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/+6wNSKnpw+9DMkyK9siRjQWfZFPWX0o2+lnnoj7kQRD1Rb2M1cPz0SJedOLrO1V6BLXqd+Dqy20nd3SYSBst7dpZj/wXj9t7IFR1nNEQABIF+EVCIon204+FpC3dZvXazNMxRPGdfEnTZTF6XqSGCHMl9BK7cq1M0HPfq0EOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuPxKAWj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuPxKAWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726450443; x=1757986443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLZIH0//DzfSSZOcL9nbHsb1EPmXU9WgCr/K1ZbbPzQ=;
  b=EuPxKAWjq5mrCA+O1mdT8/bYHZKL5fetIuiOUNUA9XydzLbAU+prW1HU
   hEyKkpiWwEBjkV0qc9KvZcSzjXDz737skyo0jAPu3Uq0G6XBCvwDAKlXb
   vkWpoazt0rykLZZpRIUX5QQdSicLUZMyHVV9nIgTmHYZMFSoKnPKkQYvD
   6dohJkRY6iLc8KNEqcvRRFGgSJ9oXeewjcjD1Jj6IPJsq6+lxs90ypC5d
   DAJLqKHgDrfQFWgmO6H0AA3sGpJpRBAu4S/kcdd9/lEdEoTHlk8lkm4Ce
   VPt8CWD6SdYUFTzgOdAIkQoQNQxF6c12GRC1/5D5S9iEt5h2sCj6lfoSN
   g==;
X-CSE-ConnectionGUID: qwHX0hfZQtu8lsf9aOJY+Q==
X-CSE-MsgGUID: IHE9iDLlS5uTPVjkrFvlDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24761223"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="24761223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 18:34:02 -0700
X-CSE-ConnectionGUID: U/n6iS+9TKipWaYBrnVLKQ==
X-CSE-MsgGUID: rT2mZWy1Tg63ImrGPemy+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68977050"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 18:33:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq0bx-0009DY-1W;
	Mon, 16 Sep 2024 01:33:05 +0000
Date: Mon, 16 Sep 2024 09:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10902/23714]
 drivers/pci/hotplug/pciehp_core.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202409160928.GS8enSKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 58d584102f06f870f118644f1022c751e015e7bb [10902/23714] PCI: portdrv: Initialize service drivers directly
config: x86_64-buildonly-randconfig-001-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160928.GS8enSKA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160928.GS8enSKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160928.GS8enSKA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/hotplug/pciehp_core.c:214: warning: Function parameter or member 'ctrl' not described in 'pciehp_check_presence'
>> drivers/pci/hotplug/pciehp_core.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
