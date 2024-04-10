Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733E7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 22:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712788972; cv=none; b=erqiHliotOZlXBCuBq8+UVMBepZxh8V/46PYBA2gXngjntmGxot/4tr9UY0ZrRmAHfb581MlAhKkCk4y0HBINLiABLKkjUNK6tAJBRvdUtUZRX5sCPi1dxi77ym3IT/n+M7qiOu1mkGW6xBLduPqV1tr9wcY6JrLbhs5MmhPGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712788972; c=relaxed/simple;
	bh=aufZiezPrHijbaBKBSoWY3uAznm20TGsSIW3DKZJVw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sustvV6QhjX0zKE9gT+bb/nPDtZhEQJHLpAgXHIKTo/6BDxZpseSrkY7B0LiFUJES/j1KxMQKtZtIBHvFv6jmYMT6LPDeRA0vaqnleJemlYz40JxZl2G4aH6I9cHugeDPv8rtIU4Ivuckj/lQQRV1NzehZFmet+HKT25kx/frM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jp67wbnt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jp67wbnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712788971; x=1744324971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aufZiezPrHijbaBKBSoWY3uAznm20TGsSIW3DKZJVw8=;
  b=jp67wbntKbEhF+cTxSmjf+XNfOmRkfm21apsHiVMWKsCTYRgsBJChmxo
   rZzLfkuy2w0MsA+W+I2ilH3xVzBsAY2LB7+z2TSdEAU9oULJX/Ah/iJwE
   jlPs4RyP4e17OwtHMXMLUD9rLF/pYlqlSRWl1zkUN3cqaxTEVveRWWlf9
   qPe4II3XOAINlu6x0bDvwbloUbxg/PKGLfVGXP81c2AK9E87Ipa50grqk
   rv9lckTBR4DAY26NV4fxhVaJjjdNdVNOz7muDlFpFaxOtslYw8+ctcVRP
   QmHUh6thdBmdrHdBjj2cTtIFdLviB/ImVX+Ak+aY9VsHCmvFwQ2ozZeMc
   Q==;
X-CSE-ConnectionGUID: NtjOj0ilRPuq4DJ/yhyf7w==
X-CSE-MsgGUID: dmNn29hmSp+0Q14g00LC3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8356235"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8356235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 15:42:50 -0700
X-CSE-ConnectionGUID: coHzidz5TnWxsFXCsu3f/w==
X-CSE-MsgGUID: XfzFSogfTuiylSUzd++CyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25477939"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2024 15:42:49 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rugeU-0007uA-2B;
	Wed, 10 Apr 2024 22:42:46 +0000
Date: Thu, 11 Apr 2024 06:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] ld.lld: error: undefined symbol:
 mpfs_reset_controller_register
Message-ID: <202404110630.FyO5CfHx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   0dfe04a18b7c2cda3245498035e77d9f9cb33a85
commit: 0dfe04a18b7c2cda3245498035e77d9f9cb33a85 [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: i386-buildonly-randconfig-004-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110630.FyO5CfHx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110630.FyO5CfHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110630.FyO5CfHx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mpfs_reset_controller_register
   >>> referenced by clk-mpfs.c
   >>>               drivers/clk/microchip/clk-mpfs.o:(mpfs_clk_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
