Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2F1632D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124734; cv=none; b=aInvRc7JU5itUQ72yOlEjMngW+sQa6bb7F7atPbUb7/DLOM5uyPR1VkQxrsU0mo41+0KWBNzBrzsIEgH28v4Z/92S1X8lJAPkTsuPJs3I5V5rE+kemYRm3za4pswO9aDcwUMBHRE41RmIyc8+Gg/hzKoJmZf229FFktQpJ/qLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124734; c=relaxed/simple;
	bh=KHwOOHsJK1arR4rCLqsTdySHLrPJLjzd3b+72nf+SD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1LhR77C+MHsmoyb93iJmOToHenJmftDEz/NecBqRVvN5ZF/7K2ys47kSf4pCmaQ38Rj4Nnmn/kzT4/kKrvq/W7iEIP3H5s1haoJALRuSUeEJJAhqo1uOjqVL/YrcLMa96z72gf6+73EqiNQFo8OYZWbc6U9VXE2lobJOdSBiPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccXtOJ1+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccXtOJ1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737124733; x=1768660733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHwOOHsJK1arR4rCLqsTdySHLrPJLjzd3b+72nf+SD8=;
  b=ccXtOJ1+NhW53fLbYpk6k+aK6UivqeLEfzAGIfK1fzlV5b6pKpiLCNmW
   pj6KreG5Br7ky82L7xy9I2PCS2m4kJ/MK1WPNL005OG1wLUifurwzEJ9J
   LJ2g/HrRxGXh9VksNHqLkJGhOz8RYY2Sxwj8auriX4f3R9x22MUeSkRb4
   ULEaLRTmEccEEGh6x+RcwHjkiBfSmxNFFKb74ljLaLqiDlaEO+Zc2f86k
   zZQ4M2UFFWzDRpnQhW9wmoe7CiYfTvcVc+7lVtBuEeHdNc38tCZpoSKLq
   TrL4vd2TCSFRNOSU5KH2F2OTyOptoFwzeAPELeJjIMOoOs3ZmAtMD3vOP
   w==;
X-CSE-ConnectionGUID: nN+NEDmcQ2uj+hrc69XqLg==
X-CSE-MsgGUID: 5PG1BxXeQlCI++Lj/euaew==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37438933"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37438933"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:38:52 -0800
X-CSE-ConnectionGUID: fZWGUlxjTyCLTc0RE4TRdg==
X-CSE-MsgGUID: VpIHElahTb68TYnCtnw66w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106412342"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 06:38:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYnUn-000TKR-0o;
	Fri, 17 Jan 2025 14:38:49 +0000
Date: Fri, 17 Jan 2025 22:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen /25] drivers/virtio/virtio_msg_mmio.c:218:3:
 error: field designator 'remove_new' does not refer to any field in type
 'struct platform_driver'
Message-ID: <202501172222.YCKrSFKH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   2e3356784e87f20c8375b12adebc1e706091c1c8
commit: 939d9bc76a359f5336cd466a0989d0a204f46396 [/25] virtio: Add support for MMIO based channel bus
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501172222.YCKrSFKH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172222.YCKrSFKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172222.YCKrSFKH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_mmio.c:218:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     218 |         .remove_new     = virtio_msg_mmio_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +218 drivers/virtio/virtio_msg_mmio.c

   215	
   216	static struct platform_driver virtio_msg_mmio_driver = {
   217		.probe		= virtio_msg_mmio_probe,
 > 218		.remove_new	= virtio_msg_mmio_remove,
   219		.driver		= {
   220			.name	= "virtio-mmio",
   221			.of_match_table	= virtio_msg_mmio_match,
   222	#ifdef CONFIG_PM_SLEEP
   223			.pm	= &virtio_msg_mmio_pm_ops,
   224	#endif
   225		},
   226	};
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
