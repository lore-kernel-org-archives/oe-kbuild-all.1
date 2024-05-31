Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C1158859
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158639; cv=none; b=J9CHnEKiJHXfnTgYp/z7VtOgxawjtZRwGBuB6lMU1w2kzoySpf/KrAyP+zNbnOoVhaOEolFfOgSXNL9HTudMtEOqUTWrM4mNk7gVAvjWT3UmDCxKeunoy0/dY7fiyf37qy+ymSzMO4iMz9R6jC3cMVLrafkD2p56l9gFOLeCFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158639; c=relaxed/simple;
	bh=peAvmxIzhwz539ttWTC7PJEj8aEdABEUXQsWorjPmyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3+1Jjsf3G5bJfRUIicUaEXLC2vArePMWyBI6h+jkaqtBWsAx+De3cJ2zaXG2qS8QRQmFSoe9UAabLpyeq7B5D8Ioj+ITeMpsOgtTcixPoFSGvQE37kdwr7TmAbPInp+2wbgpzbaBD3dJzo+YSoxUKkhHQJWX4oBZ4ptNMSft64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YX0W94Ue; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX0W94Ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717158638; x=1748694638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=peAvmxIzhwz539ttWTC7PJEj8aEdABEUXQsWorjPmyo=;
  b=YX0W94UeatUh4AGs+MaQ3qwgt5CVURSb3GLv13rbXnnfjF9itXBULKAq
   VfQX0w3LyWchrsE2DKGb0mKtPMLn8BatYWHDnnlfhLzEMAqrHftaf0dTY
   RG5ItIYEemhmh8+d8DGG4cXIHe24uc41lVuYL8uEnlZDBnYye+sy0J2gN
   pVEAbwm4U74QSpXrIUHfV04Ar/A7uyptopfCkL4tYBjvdNsWLscUllUjP
   BEn+VqN/s7gAS9bkqEOS59zeiyhqjTBVrEGZrDhUnz4c/DQ3SHtHWrIGM
   YwLRld6CYnuPsWCswtN4P9zMkSeYNZzcFDzk6guvRGawLUnSA6AbtYLMX
   Q==;
X-CSE-ConnectionGUID: q27afmbQRuefFT4R93qaNg==
X-CSE-MsgGUID: nsaskmfiS5+1ZnPMrsnCkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="39093345"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="39093345"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 05:30:26 -0700
X-CSE-ConnectionGUID: NHMUG4daR9ehGbcVvlTEZA==
X-CSE-MsgGUID: ynMV8vsUTMqS/a9F+BIlJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="59321518"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 May 2024 05:30:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD1Oo-000H4d-2G;
	Fri, 31 May 2024 12:30:22 +0000
Date: Fri, 31 May 2024 20:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 303/310] fs/xfs/libxfs/xfs_rmap.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
Message-ID: <202405312039.sSmSQfTQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   074ce47a8bd5ff767d2a86c6669ddba0d3a5526c
commit: 809f2de588851dce6922ab2cb501baf1d584f2d8 [303/310] xfs: use thread_with_file to create a monitoring file
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240531/202405312039.sSmSQfTQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405312039.sSmSQfTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405312039.sSmSQfTQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_rmap.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
--
>> fs/xfs/xfs_fsops.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
--
>> fs/xfs/xfs_health.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
--
>> fs/xfs/libxfs/xfs_dir2.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
--
>> fs/xfs/xfs_trans_dquot.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
