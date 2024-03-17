Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE1611E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 05:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710653359; cv=none; b=C7IRyv67vjOsUrPX1jGppV7X/dt8B07pEga4S2fSSPJKP0K3gq9e89W0rop+oLBuohN9XcGewLD5p31UCCn+vtlAa+9EJCMXKh+1T2wHY/dpuYHVWzozA/g/mS+EiU4uccvIqXbPd1KOy2VwEIRy8HAcuAUoNLNIx2F64hIponA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710653359; c=relaxed/simple;
	bh=0r7gCEVSJSD+wOaHD9Q7GyICDCVaLUk8zBToTRTLZc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQxoalaAuXVXk9naqh0sXyFcwkerYhJpo5FgeWDy18Sth2W1ic4CWBud+SMD1zplpu3UE6+iO7J0wqEIyl/MaYYJA6NNnIGV/NyZrc82XPtvKWOEIo3weSzn3C7Nz6AjcrRwe2PhsOu3FuXXeSKNl1y4g+3gO+wuFnvRlJF5Tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hj9urqoe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj9urqoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710653356; x=1742189356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0r7gCEVSJSD+wOaHD9Q7GyICDCVaLUk8zBToTRTLZc4=;
  b=hj9urqoe2CZ7nIyDE+YK7zPRn139fsueJt2JU+HmK77nADUiiQGOu2wY
   kMSTYz8+bONbZI9cs3FBLRJ04tBqK2PA0p5nr4dqHcQdXoezrYy7YmI6g
   2p49fJxEaJIMcRDLp22kIoWjKUYHOFYklXIAumKIgLP0Tj1EDg+Vm07fR
   4FnL6U7kLMflmCa/Bd+scziD4RutV6i9MNqxt/Mq0hnYV1ID0sHAb2Wmr
   lSeZSxaT4QlAa+Q8BA2PWXpIpMi84OlI2ucTcOryOio/SXB9FSXIQC1vS
   CTwbZWBt/s3/XdWfLipaxv6hySxJayFsPrnwCO7kghKmr+OVUPEeqR6DD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="8425711"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="8425711"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 22:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13053537"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 22:29:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlj53-000G2T-2X;
	Sun, 17 Mar 2024 05:29:09 +0000
Date: Sun, 17 Mar 2024 13:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27095/27507] mm/async_fork.c:20:31:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202403171341.Qolvjr2i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 1d3b19bef19e0474822d5ab062ed1d2843b9f84c [27095/27507] mm: async_fork: fix designated-init error of dummy_async_fork_ops
config: x86_64-randconfig-122-20240317 (https://download.01.org/0day-ci/archive/20240317/202403171341.Qolvjr2i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171341.Qolvjr2i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171341.Qolvjr2i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/async_fork.c:20:31: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:21:31: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:22:28: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:23:33: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:24:33: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:25:33: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:26:35: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:27:34: sparse: sparse: Using plain integer as NULL pointer
   mm/async_fork.c:28:28: sparse: sparse: Using plain integer as NULL pointer

vim +20 mm/async_fork.c

    18	
    19	struct async_fork_ops dummy_async_fork_ops = {
  > 20		.async_fork_prepare = 0,
    21		.async_fork_mm_bind = 0,
    22		.async_fork_fast = 0,
    23		.async_fork_fast_done = 0,
    24		.async_fork_fixup_pmd = 0,
    25		.async_fork_fixup_vma = 0,
    26		.async_fork_madvise_vma = 0,
    27		.async_fork_fixup_vmas = 0,
    28		.async_fork_rest = 0,
    29	};
    30	EXPORT_SYMBOL_GPL(dummy_async_fork_ops);
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
