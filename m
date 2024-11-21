Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650F028687
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171874; cv=none; b=tAT+lpF5W0+I4jgSPRwsH1+SxERF+jTl791KohobQtVGXPW+fPuSAd39a4odVGm9z+VT8vjHfCMhyyUZzaMzSLC3V+mRehGzEnu0WrnKN5gN+e2qpUqe2LdjP6og5YkAK9voIti3qZeKTwtLaZsb0HE+vfxrEK/vqCLuSq6LZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171874; c=relaxed/simple;
	bh=6H9PO6aKIKm/bd4dEarcE1qdfi9Q6wUOu9thKSrxK4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G8KnY/3i3WqxseY2J8zCEQclBcRBkLzpNFG2tDDi4ILjDxG9AdpoinP3cKkly5EF9NRUFG8IMNLWz00dS3hcEqKDC9FVTogi2PWgV6zodHxsD8nLa7q0FdgZBOGUL/XcXvyDKda0WdU3vDupLgk9XzlzkImMpK/zv2T35eWh39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+fJ9ySr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+fJ9ySr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732171872; x=1763707872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6H9PO6aKIKm/bd4dEarcE1qdfi9Q6wUOu9thKSrxK4o=;
  b=F+fJ9ySrp/WGuU0TOl3k7fYFTIh29zOy1VWFTst18o893RickaFwfJlO
   DSS4MOWsldeUPn8K4ySHl6XXYi2oApLKqpbLy9Dja41btLskoVWJE5JAq
   PXP08ydTx5p9jBO5Bv5JNOIug1aR6P1u2yASt1sGPtvGHyNzYBBo2/up+
   c6Q4N8GpMDnbYOOeIjp40i6kXBs2kBo83XlUtOlkayfC8tqvyZw0u70cT
   8vMD2F9uVApjmun4HXTnifuZG/qpCA1GYC2sf4lzseV55unjJXsOHfSP+
   zGQ2qaKtuNqpXYk4qtKUUo55PYDkdCEMwRbLnlUMqsv875xbPQKdu+ShN
   g==;
X-CSE-ConnectionGUID: b8bYANdNRTaRsTtim3BFrA==
X-CSE-MsgGUID: 5EL+qmg3SZGuarlO5dLTBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32382122"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="32382122"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 22:51:12 -0800
X-CSE-ConnectionGUID: l/OjjrEYR7iL1ZeFxdrDKw==
X-CSE-MsgGUID: Yqu6TnuaSIK/bMwtPdPIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90954649"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2024 22:51:10 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE11w-0002UB-1c;
	Thu, 21 Nov 2024 06:51:08 +0000
Date: Thu, 21 Nov 2024 14:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] drivers/dax/bus.o: warning:
 objtool: missing symbol for section .exit.text
Message-ID: <202411211416.91mda8Dw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f49b713adeb7d09d40da433b7700b1666a7d6e32
commit: cf93bd4f61bbc1a08af93c20d7a2cdfbefc7db8b [1297/1297] Intel: device-dax: Introduce bus + driver model
config: x86_64-buildonly-randconfig-005-20241117 (https://download.01.org/0day-ci/archive/20241121/202411211416.91mda8Dw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211416.91mda8Dw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211416.91mda8Dw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/bus.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
