Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FCF2D73B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471145; cv=none; b=Bysuf/trd4SDFEjJpv00caLqIU3/V+uts7BA1eoodg4bp/xsO7MDpx8gv7xEwNMAwc5hgLCbqU/1WwZle19pHGfpVMHEGRCSJrnKiQZ23i3S7Crxo4qtTWoL5FIK1NBBaDeK1jGaYu3pTVAWfKGY/uMjO7X9RO/jOdlmav6khwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471145; c=relaxed/simple;
	bh=jMv0wamVc4fRhe7tPlSmpe0HCSYkf04npmWMJ6+vUZ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TztjyML6Rh8I13LYelaj5DKbhJZM06XEjSaMiMzoXB+jDUdXUodyo/4SjmwcXJoApNWqybz6grPEITtONmgAP/BrANDAwhUOqRWQX2fC2dLWKo1TjEGdjq623iHYqRaDgs2mSSQmVRqIP9Lv0vYA7FP1Pz1A+bU88wbH79OptYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeePR2e+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeePR2e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780471143; x=1812007143;
  h=date:from:to:cc:subject:message-id;
  bh=jMv0wamVc4fRhe7tPlSmpe0HCSYkf04npmWMJ6+vUZ8=;
  b=PeePR2e+1X6QR4wyZdUEkDU3Cch1Zp0YkgWIiWnlLDE5yQSCrxLOIbZv
   EriSbQPb9Qr1Q0RqE/z3pduTsn3YbVhSCi4FL3YXdYJLJsk2PdPmu7xv3
   aarV5puednonuQ4h4pS4MWdLdIenfHcPTnnwWl8/niRRfLzQP0rIEd03D
   depe43h81EdPbj+1ARoBjlJPu7oZivgXeGCrYDpSxmxwSJRQ44UzvAjre
   cZsEcat7q84xTzvNjPT/K/0gKiwDLf3YFneDs52xf0zxT+yKQngv8avBv
   HGxke/jrfNjz31o05OD47HUnfS/ztIpJucv69zv4Ftn9cqfOXPAO6nUoq
   Q==;
X-CSE-ConnectionGUID: J4Efo4nvTfGd2HJwDhnq4g==
X-CSE-MsgGUID: OxsYILvIRQ62LeccIwsQzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81299556"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81299556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:19:02 -0700
X-CSE-ConnectionGUID: ELite5jtR9q0bHBJ5pYkBw==
X-CSE-MsgGUID: olDkhtwVRw+c+ZH9uZE3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="243983744"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 00:19:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUfsQ-00000000D4M-3rdh;
	Wed, 03 Jun 2026 07:18:58 +0000
Date: Wed, 03 Jun 2026 15:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>
Subject: [joro:kvm-planes-v7.1 59/60] arch/x86/kvm/svm/svm.c:5326:13:
 error: implicit declaration of function '____sev_snp_guest'; did you mean
 'is_sev_snp_guest'?
Message-ID: <202606031529.Wby5Il9d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.1
head:   02b786614480597a489766ec45b0ec286a3301a0
commit: a476e7f4b75733365b448899e65f4326eaebf9e3 [59/60] kvm: svm: Implement max_planes x86 operation
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260603/202606031529.Wby5Il9d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031529.Wby5Il9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031529.Wby5Il9d-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/svm.c: In function 'svm_max_planes':
>> arch/x86/kvm/svm/svm.c:5326:13: error: implicit declaration of function '____sev_snp_guest'; did you mean 'is_sev_snp_guest'? [-Wimplicit-function-declaration]
    5326 |         if (____sev_snp_guest(kvm))
         |             ^~~~~~~~~~~~~~~~~
         |             is_sev_snp_guest


vim +5326 arch/x86/kvm/svm/svm.c

  5323	
  5324	static unsigned svm_max_planes(struct kvm *kvm)
  5325	{
> 5326		if (____sev_snp_guest(kvm))
  5327			return sev_snp_max_planes(kvm);
  5328	
  5329		return kvm_x86_default_max_planes(kvm);
  5330	}
  5331	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
