Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541AC15AADE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715803326; cv=none; b=Hc259cUYPAHx+L7y23dHCLCjShtxFZ5lVnOR+raPo2fvI88gRIlSpZPyMXaHq6q7PQ6FWQhiBI58bNjlJ47PIkjlOqEmOjFpuqrx9i9n8a2T1rJxHfHX0Dn0tUanO6RKlLMYbtWN2sjp6QUyoVKdnMQR+/v2R21feDgdTXWVXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715803326; c=relaxed/simple;
	bh=nUVWCYsR8QoPG8yvKCD4ETx3N64Beo01jBY8fWX6AhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J52T5HTqfgWp/aQXyADgAZG8bOezSQi9bXdcNBPxEvqeqjjqGuFJRlttM51cAR2DH3UnHIXaXZ+9eTtPbdd1tgTS5LHJl68BvS8s8ke/GPvM7xX0fgs0UDEkMuIh979Hz1/C1CQjmAZtpvgJzTaCSrNfGFlLw1CjRzFkbUwXBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVTO5y/U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVTO5y/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715803324; x=1747339324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUVWCYsR8QoPG8yvKCD4ETx3N64Beo01jBY8fWX6AhM=;
  b=gVTO5y/U2edtIjsilAjfNVCDuiuCJw/VqriRarX++hPMRJsgCirxJHUL
   LZROdFusHIy6RdWZyq7N2Qa8i9yyKauJkzYAKO/ODWlFSwy8ll6PTyJRi
   OFKNasFLbXxb1PuUUDLbBFXclTcnJ4wh1mMOG4rWYTJfFz1Hcx7qWsrCD
   sK47tgkOEW/qH4KQwPpfT6+Ar9/L9cF8zxk/ihVFsbdN5clo0dCB+l7XK
   loFaNkKIWiIaD68p7JHE8cugGPV0aU3kVjY3v2gN36wmwfAuBpGq2eIVY
   eTyVm2g053L5IQVtU/4ICf2RN373tE7k7Rw9ZWqVi7C/OhpzoeY7u+TQE
   w==;
X-CSE-ConnectionGUID: EZH5X7d1Qgqdcea/+eHApA==
X-CSE-MsgGUID: 0+zN9kxXRZiAvPg3m9HKfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15657472"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="15657472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 13:02:03 -0700
X-CSE-ConnectionGUID: 7APRRgLvRCON7KoXLssGLg==
X-CSE-MsgGUID: pyeMvhfSQMa6ikJW9a4A4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31172725"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2024 13:02:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Kp6-000DDf-27;
	Wed, 15 May 2024 20:02:00 +0000
Date: Thu, 16 May 2024 04:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-device-removal 1/9] net/sunrpc/xprtrdma/ib_client.o:
 warning: objtool: unexpected relocation symbol type in
 .rela.discard.reachable
Message-ID: <202405160315.sHpRNCoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-device-removal
head:   0faa2658d00dc45d35a56dc144677cb00eb05020
commit: 6635b66ae616e667e3e0dc84cc11ee055057d753 [1/9] rpcrdma: Implement generic device removal
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240516/202405160315.sHpRNCoN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160315.sHpRNCoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160315.sHpRNCoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sunrpc/xprtrdma/ib_client.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
