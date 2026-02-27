Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538532ABF3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176767; cv=none; b=W4fMKm1K3qy2tymSeSm8ApVkWrUC7t4eBPFcF4jk398gv71GeCJQo7WAFsJCpX5CKdUlgZjCjbSyQCTSIVPq2DOSxurGGfcHu5ybztspAtAxE+LmM8HFdwhIh6qpUCgY/or4n+KB9fEuFL5aOqcV4NwqKqV6CPf01kslBQGF9gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176767; c=relaxed/simple;
	bh=b5zw1odScAL0AxiVV59MVY5FpAW0QUYpDTKBhsMiOG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dd4+3PRgyRyE/n1LwCwJ6CUIPeqlCQ8YG71WHGvrCbGLJOXv6aXCyv2LNomtwGKcrP1Vm+jhsAc4/RXQoaZ7L6NMmmjbhSGxkAaN1xYGk19RJHC8vFqOTTjp22AyLO7FQ0zUpQSuNI64BLJySK4LyYtfhhyeWsKJk334uXi23Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp3xv1iN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp3xv1iN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772176766; x=1803712766;
  h=date:from:to:cc:subject:message-id;
  bh=b5zw1odScAL0AxiVV59MVY5FpAW0QUYpDTKBhsMiOG4=;
  b=Gp3xv1iNdzOEXuho3A472/aZr3nczafAAgQdB2cxrckCkW/OGmrDkzc1
   JGBvw0wg3u86ELBCF610sOYL27y9G/3bkTqb0sXRjdS1nIQFtg8Ap5X+d
   V0LOBK5iVrVmRSaW8cP2fqGuWPPczoqljGrrUZ/8iZ80J3+PrMvAle06+
   47ne5qXQ0j3Q2VOYZ8NzCibtnT+TDPeGM7QOCg0onPafLoI4cKJ5H3d0Y
   bIxYRcTyxXU3CSZBKw3elH428h+ywxmQZojuIaL8bbdvQv4ss4PE47tgE
   qddizAI1G+eZnnl9YFw+Zmtqvj3JEtr8AL6Djj/fyenyp0Llnxf5ifTjx
   g==;
X-CSE-ConnectionGUID: xvp7Sw3cTxWSYbELZ2+3UA==
X-CSE-MsgGUID: OoaIHUWkTvKBv8V6Y/VNrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90658087"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="90658087"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:19:26 -0800
X-CSE-ConnectionGUID: 1fGEOHoWTbSy2qT8NfLJFw==
X-CSE-MsgGUID: iAsMFrgnT3Si4w6xpbf+tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216720758"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2026 23:19:24 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvs7h-00000000AJH-2cBs;
	Fri, 27 Feb 2026 07:19:09 +0000
Date: Fri, 27 Feb 2026 15:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>,
 Vitaly Lubart <lubvital@gmail.com>
Subject: [acrn:6.17/linux 1627/3102] Warning:
 drivers/misc/issei/host_client.c:419 function parameter 'cl' not described in
 'issei_cl_read'
Message-ID: <202602271507.nL8RWsjG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alexander,

First bad commit (maybe != root cause):

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: f6896065a2048df5ca9aa66bc01ee1058022ba10 [1627/3102] issei: add firmware and host clients implementation, finish character device
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602271507.nL8RWsjG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271507.nL8RWsjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271507.nL8RWsjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/misc/issei/host_client.c:419 function parameter 'cl' not described in 'issei_cl_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
