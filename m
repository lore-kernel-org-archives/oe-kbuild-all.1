Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718D52253A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918129; cv=none; b=eBxdoA346EeoLcU+pYIaDWlrrUm7nAkrhfvtmW2oAPMfHA2TQgSRJxhV7aeHt6YJhErtcQFIeqUWO6wwwwwXFqiaVPruqnRpcGxDsF1ef5SOcUW0VgipXm2nmQd7+01nPVZiwCnNwMlnkVIIkX+eyuMPA+nSiFPk6FzduJeyPGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918129; c=relaxed/simple;
	bh=5XQQxk5Quq9LfmqxbOFA1luh7EJqeo3TGebSB0ZSrrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZMLYq0pfX0YkpczBRQnKStEUgUotIcUFOq/n3DPcedFNCWLLAbVBnzGT62ex2a91cwwoEE34sTDlF3/2O8SNClb3vAmpGkMX93eBluTZ7fDWRTVcUplqcq1WUiTQvvGhQ8Y/UTHXTcRWOBQ5HAkWBq/NxwILAHOoCm49Zp8oKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkWMcoPl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkWMcoPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761918128; x=1793454128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5XQQxk5Quq9LfmqxbOFA1luh7EJqeo3TGebSB0ZSrrU=;
  b=gkWMcoPl2ad+pv0VBPnASaklvLM6HvRseYuMaBS+fcxQld0qDKqkmy6g
   JGeyKxY5ey6qlgwcBFUKIF6B3neGQ8DMhqUIKyxqUtsq0uE4zYOt5T6J5
   ZZqFkxObCMmOqg1/uNkVRMjT5pKtyawVx4y9IMvpyNCp2OTagonWOx3r7
   nB0x0YwCU7kOGvbjj0MhjcmOtVV2r1LhQOJAlgckQSSSqyrVFhMCoLBQM
   CBQbKPF3Jd4VHtiLrtTiBt2xRwjlbsTqMaXZE3IQ5SmyBgKYo3vpXOw3z
   Z7LRzjff5TZBBVUxkd7OlHB1eNuSPyM/x4T6sgM4v5HskTwt9SWkG9P1f
   A==;
X-CSE-ConnectionGUID: 64a0OAvtSYaJk1tW9eHPmQ==
X-CSE-MsgGUID: ekqYzvJcQpefgOXiX6/BCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64120041"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64120041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 06:42:07 -0700
X-CSE-ConnectionGUID: 19hcE78rSRKY8GFYA+msJw==
X-CSE-MsgGUID: Fe6Amo+oQZaMedH/c1u1ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186115786"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 06:42:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEpNy-000N9C-22;
	Fri, 31 Oct 2025 13:41:54 +0000
Date: Fri, 31 Oct 2025 21:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 524/5383] ld.lld: error: undefined symbol:
 xe_configfs_get_max_vfs
Message-ID: <202510312106.aS6MqS7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: c09a9933af08cdcb295ccc65a6d9862bf8474706 [524/5383] drm/xe/pf: Add max_vfs configfs attribute to control PF mode
config: i386-randconfig-061-20251024 (https://download.01.org/0day-ci/archive/20251031/202510312106.aS6MqS7h-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312106.aS6MqS7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312106.aS6MqS7h-lkp@intel.com/

Note: the linux-next/master HEAD 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_max_vfs
   >>> referenced by xe_sriov_pf.c:24 (drivers/gpu/drm/xe/xe_sriov_pf.c:24)
   >>>               drivers/gpu/drm/xe/xe_sriov_pf.o:(xe_sriov_pf_readiness) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
