Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02392236FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505921; cv=none; b=r5gXgYlhchNJnB3qGgF6itRQT3IUcuQgqQfpc3xoYgYJufSsXLCDuTio1jlWSHYHjOF3CFfPEH/54hf4F+o3VB5SCVhLE/4SAUgSSSYBpX5xyrPNNhP0DfBLCNcZx1ZwycEO1JAcsTuJoKLIJJUYoxzREgPAr/lyxVCQgpapfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505921; c=relaxed/simple;
	bh=OvkV3K10j8R+Fyilr9HO+hjilAOMcE+/ZeQwuuJjqwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hT1ULuyL1VWtJMzoEzL+e4+5rkzt0ITHshuCGyA93Ww0OrZY1bOpbgzzwM88qivxtc+vtisTAWab7dFdFEiOtogTFcXdYP8nVUSYfHEzMpEtuApZqhDXnTFtK1WGs352RpNb5hfmWFMe3J1LAhzFvSQPxs/IpQ59PbYqYN9Qeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jva5EmyM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jva5EmyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774505920; x=1806041920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OvkV3K10j8R+Fyilr9HO+hjilAOMcE+/ZeQwuuJjqwY=;
  b=jva5EmyMKbDgasAHldMOgRsQ9NZbHaekUCtOGddJnETLRvtQdADbTTAg
   dY2SMLx1FylWjadFrDTX5AF5grAcy1ywW3n8F5JsfMbb8pouNmCMXAx4x
   QDq3dUw9T4fVHBNACkspSHZnYOmvwwuJb1+CGJlBrrNmaf3I3lsIRKrCp
   3/WZOd/W569Sh+XRkSei1QVyY0tIbdiEQ65MQdDnUJhgiwum4U3Lu5wiY
   wYCCX5PKFX4LXVnK+5n9dIXO+JpAOpsKw9Oh6HythrHJ5k3Pv87XJabeG
   EKSjqs2KB3f7ZrNEkpERSFG5M7iErcbH/TZqz0xbJA/3Nnio7kQYeQTcd
   w==;
X-CSE-ConnectionGUID: HcyDPcrjQW6JHRLpSWdW3Q==
X-CSE-MsgGUID: RnqT3mzIQaOwtQveIkl/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86246801"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="86246801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 23:18:39 -0700
X-CSE-ConnectionGUID: lDrAJAwWQZqAWh3zMnQksg==
X-CSE-MsgGUID: Anf0kgl/T0iniK1ot7SW2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="248345787"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 23:18:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5e3A-000000007E9-0yO3;
	Thu, 26 Mar 2026 06:18:36 +0000
Date: Thu, 26 Mar 2026 07:18:19 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/nolibc-rcutorture 40/40] /bin/bash:
 line 1: kernel/rcu/.rcutorture-initrd.cmd: No such file or directory
Message-ID: <202603260713.EtSZf7ND-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/nolibc-rcutorture
head:   a55c66cad77542e2efcb3248af724efce7cc2d87
commit: a55c66cad77542e2efcb3248af724efce7cc2d87 [40/40] rcurorture init
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260326/202603260713.EtSZf7ND-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260713.EtSZf7ND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260713.EtSZf7ND-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: kernel/rcu/.rcutorture-initrd.cmd: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
