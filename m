Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B418EA75
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053690; cv=none; b=Y5ROVHqrISs0NAix0RJsdR1eRENET0laDoD8BNStQEAGffkunUXbSj2MfBPKOT73NM/OV82uNoaaKuPyma7gbF+d9AEY81DgM6z1+KIu461eU3dkLoaLd8FfuS3bKm1ISUuzqhUYuWPYAZEYQ5Jg+L/RAk0VsOKLDUU4bcNtHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053690; c=relaxed/simple;
	bh=aD695Z2Vb+Elln7TT9u3sOxncaDMONiPMQD3EsngM5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b63HKjWoBPvKIIi5605YyWv+h+mVIl/w4WAzwOVSLMnITlaIZVPNNsYlP2ZA06m8+Z3RPtseCaYhJcCEbN2s+qhZZZ3U2Q852vNfGAA6wVqyTy3uzoCa+zM3Z6ZTk3XFA9EYi5VShKBPvX2lM/BD+w5V5r4vBPtQneh1HHv/YPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpmFojYB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpmFojYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721053689; x=1752589689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aD695Z2Vb+Elln7TT9u3sOxncaDMONiPMQD3EsngM5Y=;
  b=QpmFojYBi62RyclcFAwwCUO89+1yh20BVrxqMJ8pwL7+WZGoecDXeqnR
   D3o+delkahNA5MOFAqOC/u8blDVVNK1tCY9lbCzyd/6kmyErUv57/skXg
   fS4qnR96+rDobms0GUDF0fsTv546Jzm05sTLO4oClwU+lp7oO2wmIQglq
   Opu+p2LfcTc1PEFW9IOk6Vr9HAprz1nui1TZpPaLvSPZz0GEdgmkPFtld
   dXCBURERT/Z4bfKn5zUUsDZEbL7k9gKFguaW8o3DLE6HPzTkCLLSlUXDx
   LvH1HtHpOuoYOgq6jooofMEfa1sXvqE3XJ5fgeMBEiLY9KSQrtOmctQEN
   Q==;
X-CSE-ConnectionGUID: 757ERd2eSt2l7U6cn05rsQ==
X-CSE-MsgGUID: K1rRRgmGQ/+PZd/1qlboZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="43855423"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="43855423"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 07:28:09 -0700
X-CSE-ConnectionGUID: zEK26NtLQYWPDJ/WliAU/A==
X-CSE-MsgGUID: JwoUWNI0Qaeo0wcYd/urUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="50408841"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jul 2024 07:28:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTMgP-000eKM-1Y;
	Mon, 15 Jul 2024 14:28:05 +0000
Date: Mon, 15 Jul 2024 22:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>
Subject: [snitzer:nfs-localio-for-next-test 8/51] sh4-linux-ld:
 fs/nfsd/nfssvc.o:undefined reference to `localio_version1'
Message-ID: <202407152202.9Sp4JUim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next-test
head:   84abb53e3a3b011456fdf7aa2a57fa9378867f0e
commit: a76ff78afa2bc51e3e2ba4853962ab1190d8c4e9 [8/51] nfsd: implement server support for NFS_LOCALIO_PROGRAM
config: sh-randconfig-r132-20240714 (https://download.01.org/0day-ci/archive/20240715/202407152202.9Sp4JUim-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240715/202407152202.9Sp4JUim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407152202.9Sp4JUim-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/nfsd/nfssvc.o: in function `nfsd_startup_net':
   nfssvc.c:(.text+0x6cc): undefined reference to `nfsd_uuids'
>> sh4-linux-ld: fs/nfsd/nfssvc.o:(.data+0x78): undefined reference to `localio_version1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
