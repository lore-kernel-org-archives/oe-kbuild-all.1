Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B391A8F84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097565; cv=none; b=VnkmdWJ0/sdk+vwtvmdgE4iYv7OhM4UoiHUyDupJQSwEVo5JOSq4kPh4gRQk2fqtlt4SdkpbVo8D2rPeDTDXQX2pXqKIWnp5ZG3HfKPFI3tOcrER6YkFbD2u9lZvaDzDqPxdWdJQDxZoL1aMIWt69T/loJQ0ffHxaIe9mNdY0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097565; c=relaxed/simple;
	bh=cS1rKbtN/HQHFPt2r7fmlt8Txvaa3/l5HJCqXbPyiu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiCbQAIxuKCLL62Rzu8TL082ayMV/1O0Y+o07qz698AwrVwMTr7WG/CDrc2n/4d77zjSgr5JvTmwDNoXe8zAe4oJXWcWZ2gMLGNiBO6NVWH9f5Z7lZmVIBSPeXPx1TKcm98EXAjJBUgZM6D6nS6CXwjk0NIiTXmZOuY28QGiUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFsvKSAz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFsvKSAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750097564; x=1781633564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cS1rKbtN/HQHFPt2r7fmlt8Txvaa3/l5HJCqXbPyiu4=;
  b=UFsvKSAzV2uHOj9T75ecb5bpPrCwe1cqbP7XSgJMGDWVwJhUATItR8OO
   SpdW3SZ+eBvVF2QqybdpWy1rOILkuLgvUU2cvdnmzQeTJBZRsMxC5ZJcy
   N8Yok92qSFPk08RyHvAfu8q5iwRf1/CEAsHmPzPG5OOToA+IakALsoBl5
   VvwB8zChH694sZts//L2b9rN4NDsdagKdarQF43GB0teisNbx5NVvmxHR
   OT0IbZa3mfiGXmFm/gquE+rCs6oU1R4fhj8EF8j02S/J+OnMyciowWL9a
   s7dXzCkC2NG6LBlPfeCDkm1dvRYZ4Gbag2vXYPvI5O5/nV8NDVVgf1bre
   Q==;
X-CSE-ConnectionGUID: 7NyplNGOQYyRhWvrcBJZRw==
X-CSE-MsgGUID: 18wJi3PfQzGUYCAUqbZuCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63671159"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="63671159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:12:43 -0700
X-CSE-ConnectionGUID: QEADpGXpQpu8PIbkhTTJpQ==
X-CSE-MsgGUID: rwihn6hJRcGX1IhdsgsCOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148533460"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2025 11:12:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uREJz-000FFF-2p;
	Mon, 16 Jun 2025 18:12:39 +0000
Date: Tue, 17 Jun 2025 02:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/module-hashes 3/10]
 security/integrity/ima/ima_efi.c:71: undefined reference to
 `set_module_sig_enforced'
Message-ID: <202506170238.yl6XIX8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes
head:   648d8ee53095f775b2b1e38b64ba0575793b9248
commit: 61dd36c99aec6c00a2e290595b9e9923cddd6be3 [3/10] ima: efi: Drop unnecessary check for CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
config: x86_64-randconfig-006-20250616 (https://download.01.org/0day-ci/archive/20250617/202506170238.yl6XIX8v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170238.yl6XIX8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170238.yl6XIX8v-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/integrity/ima/ima_efi.o: in function `arch_get_ima_policy':
>> security/integrity/ima/ima_efi.c:71: undefined reference to `set_module_sig_enforced'


vim +71 security/integrity/ima/ima_efi.c

d958083a8f6408 arch/x86/kernel/ima_arch.c Eric Richter 2018-10-09  67  
d958083a8f6408 arch/x86/kernel/ima_arch.c Eric Richter 2018-10-09  68  const char * const *arch_get_ima_policy(void)
d958083a8f6408 arch/x86/kernel/ima_arch.c Eric Richter 2018-10-09  69  {
8db5da0b8618df arch/x86/kernel/ima_arch.c Mimi Zohar   2019-01-27  70  	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
8db5da0b8618df arch/x86/kernel/ima_arch.c Mimi Zohar   2019-01-27 @71  		set_module_sig_enforced();

:::::: The code at line 71 was first introduced by commit
:::::: 8db5da0b8618df79eceea99672e205d4a2a6309e x86/ima: require signed kernel modules

:::::: TO: Mimi Zohar <zohar@linux.ibm.com>
:::::: CC: Mimi Zohar <zohar@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
