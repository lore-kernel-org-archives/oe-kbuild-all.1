Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C3A1D0496
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200897; cv=none; b=BcMYsf0Ax+vpBAh4Dq1hZRY3KINfsjmJLAETftXY+iecpUjKWaEEQ48MDK7QoqLpNAHRFBgMTLTOuqxQrEGlbPMvDDzRH3NuE2mGVmzCTxy+5Ffl9epktvvGP5g9SUInj5BAFa48Hm4hH8MwFzhhh4o3FdqA43sO+keNEEWxNK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200897; c=relaxed/simple;
	bh=yz8mhqVRr/RlfMWpp6NxMaDoivmjoYVShHRYMyRmSQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qb+xs0DHHSBMKQrwLaUVS2pj8+HMGuf+yzlezhuT3WR/80wRhVeAlLZJDFzF2JcJ8Puxl47/fVlbKMssf6h7KUouCgRVH+1l8ywUSgHA8BB6yCBl/IOn9LTAfraahAUfskbyQuHGvsnigB21W03IFv2C/+jGtKsx5kKXKITAJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DySTIvyl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DySTIvyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729200892; x=1760736892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yz8mhqVRr/RlfMWpp6NxMaDoivmjoYVShHRYMyRmSQM=;
  b=DySTIvylsuDUNFnxj0EPIZb+uaCf/jkwfActQoenhmAPuF9nBlr2P/3f
   184Pzsyg//KFQlXD9Qptfoh8b/4TADBsvTTxz8M0MB3l62gd0wNqqt8s1
   jdoH9fhs/lWDazkmiv8MidW8T3whFN5mztkxkeE66sbcQE/e+bl53xgub
   8Qcpn5k5D3nUW9v14FdSH/Th1mgdKCnao6V44NWakeYjI07CzB4Ny4Em7
   TRfTAIKWqHIQIZkweOwtDvMtV9G7LcA10cV3kWiQ9ns+5Y2EA8k3t+ayf
   vAMHd/s1YmowPHp2XcIbXHgsP9C7N77WhPpcj9K9xWij3Xi2Ve52Nr2Tq
   Q==;
X-CSE-ConnectionGUID: LgrIbn3oQbumCp3HwjbNaw==
X-CSE-MsgGUID: U+At/wq2TB25OJ7wNluqRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28153940"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="28153940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 14:34:52 -0700
X-CSE-ConnectionGUID: uljl3NshTSC8/MvKHwQwnA==
X-CSE-MsgGUID: JXhIDCO3QEykrHbJrvtnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="83313100"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2024 14:34:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Y8u-000My9-2s;
	Thu, 17 Oct 2024 21:34:48 +0000
Date: Fri, 18 Oct 2024 05:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>
Subject: [linux-next:master 4569/5321] WARNING: modpost: vmlinux: section
 mismatch in reference: ip6_mr_cleanup+0x7 (section: .text) ->
 ip6mr_rtnl_msg_handlers (section: .init.rodata)
Message-ID: <202410180543.4rFp8ThL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: 3ac84e31b33e2051e59245b8ceb25d707fa0e553 [4569/5321] ipmr: Use rtnl_register_many().
config: i386-buildonly-randconfig-001-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180543.4rFp8ThL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180543.4rFp8ThL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180543.4rFp8ThL-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ip6_mr_cleanup+0x7 (section: .text) -> ip6mr_rtnl_msg_handlers (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
