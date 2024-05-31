Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D1757ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141427; cv=none; b=ty4Z8QoOBWjQf3k7TXAR79Yitbig6RYlylZ6tlVFst8e+O1v12/Aam8iHYvHFQ+IjbBocuob5ri3aN/KyAEpvo06zKG8qa0ms1uO0XoaO9h+dMV39Yeb+9A1FC3jSpTIK1ag3hwvrJf0fgUUPTUFazGVv9bX3Fas2Lm0Yoj21SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141427; c=relaxed/simple;
	bh=LCzz/ikyseoXsJDRUX/DmIus6ulducn3piJDktf2NCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKOpXf1crYkBQiN0PKctYLlAKH/rpOSUWXolQd0sbi/cL/ofBma2EPxgDo7MpeEbR7xjK/H7esYcmm8gicGfTzwhZPSXoG33R/AQDMQsFK9tzcOGxaa21ad8D0n62z7t88lvGMDmQGBtCOXR/gidLAHMOqBIqeyuHUMYqW8VE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrAR3YH/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrAR3YH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717141426; x=1748677426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCzz/ikyseoXsJDRUX/DmIus6ulducn3piJDktf2NCk=;
  b=TrAR3YH/7noXhZdTudLloIe/iMYUiOaCiTbJ+pKdHSAi7nz5rX3zRHfJ
   RHxNvoFjbnBjMlcPKS0NPCBHRvQC5Qj4C6Nelk7IyJ3L4WdRbaftm3kuO
   2Rlc9UtGMPDukpx60UknR9eqIKXc+tGW18IyrmOXYSCd1T9ZcFV6z9tMT
   keQPaMt90b8+kr0pDaqs/7dDBxSd/mBB/RsMJ0xClCl8XH9rHLY2ZJeh5
   e7PDt4Vcjbwb4jTuSPdxAEmcj+qI0S2TRPBotvdfsubUkep4somWO61iQ
   +8w+GLbL82CfqtVVU2BRO+jtvKArMhEhOuAUNZenAGiWxWSjCR/FkqfXT
   w==;
X-CSE-ConnectionGUID: bwdEd3iYQF2mSCp7d2GwHA==
X-CSE-MsgGUID: nJPPLYpYT6OhkmK+/MWZuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25077306"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="25077306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 00:43:45 -0700
X-CSE-ConnectionGUID: qZb4euQlSlOG/O++UUeHbw==
X-CSE-MsgGUID: RIP9eCqdTSe32CS9ONtVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="67276816"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2024 00:43:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCwun-000Ghd-30;
	Fri, 31 May 2024 07:43:23 +0000
Date: Fri, 31 May 2024 15:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 242/292] fs/xfs/xfs_fsrefs.o: warning:
 objtool: unexpected relocation symbol type in .rela.discard.reachable
Message-ID: <202405311529.UJVEHwpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   a8ca57320047c6e994ecc4bc1f0be07f3ab9d13b
commit: b29b683b1d42aa98300d77d66784553723f71c1c [242/292] xfs: export reference count information to userspace
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311529.UJVEHwpy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311529.UJVEHwpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311529.UJVEHwpy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_fsrefs.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
