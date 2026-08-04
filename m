Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3C480DE3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862290; cv=none; b=RX/B7WkegMJTC2H4gt0KYphyBviMkt8tMW/cW/JiP6mFLiltikGUjTF/uxaxyju+NrgtA5QCAd2d5mwp4YFkVAYBNQf+N74QIvlLoO4mRpkJE2TLGgTU6es6I2n528tyiNxxa/xmJlPaV8FWpVBgPhUMktd5EronKFTskgrFOns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862290; c=relaxed/simple;
	bh=9WVPH9RZNaLwCuCg2xzLpElVFxf71sXrXJEsGe7GXxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITKnp2jbe6svxUitPqvoed3VYHYt9r7O9QxmvP/S2sOJT9yXBVQYqn5edSVP9idvo1GakSdBoDpkdMEgqw48EccnSOwwdK8VDAuI30ggG0TDMD3gi4w1y/t3F0Etze8dp8pUfhLewlZmrgr6fsBy/IQ9b36jqxGM4rUaML2t5/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRq0j94Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRq0j94Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785862281; x=1817398281;
  h=date:from:to:cc:subject:message-id;
  bh=9WVPH9RZNaLwCuCg2xzLpElVFxf71sXrXJEsGe7GXxM=;
  b=eRq0j94Yi9NsPiKwFJVgewkpiZTPbRgMeoQss9F+6YVJFzGVp8G2Vyym
   vrdfrMeyMIieM2srY2AgcJ45+AAAaKVL7OLt4RVR+W/z8eWTUId5Cuh/o
   ODaemfQQY/tzBKfMbjdaKrH+GH8+tZa4mbfIqqJz3K7tbDKHWvvnIY8eu
   lCXxrqDxgk2pztCa0Ue7qq/0sRZo4wPEkH/ea6PSp42A5ds51fBX0ylgC
   0eJAq5yWC70VjQI5ae8pBgAYPcTDWXa+8mKDA3976Xc3K/eLAdWxSw5BM
   LmovgNSdwd0+E5WNp0in75m0PaVNepc4Cp8sI/m/6pvEEW2169VWvGO3K
   w==;
X-CSE-ConnectionGUID: lTjMMxzpS2KRPTUhk+tufg==
X-CSE-MsgGUID: /mhpsTQVRE+xvjjnUKf73A==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90093826"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="90093826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:51:19 -0700
X-CSE-ConnectionGUID: bID/1JvvQhyAJuyENUY67g==
X-CSE-MsgGUID: AU9zpV9tRVmB6y/pT4XUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="291497331"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2026 09:51:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrIMB-00000000AF1-3xBA;
	Tue, 04 Aug 2026 16:51:11 +0000
Date: Wed, 05 Aug 2026 00:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [reinette:resctrl/controls_rfc_v2 88/88]
 arch/x86/kernel/cpu/resctrl/core.c:560:13: warning: 'mba_wrmsr_intel' defined
 but not used
Message-ID: <202608050006.kFBSkmWC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v2
head:   fbed64f80515241bc6da124585328fd5047a4a13
commit: fbed64f80515241bc6da124585328fd5047a4a13 [88/88] x86/resctrl: SAMPLE: Emulated controls
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050006.kFBSkmWC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050006.kFBSkmWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050006.kFBSkmWC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/core.c:560:13: warning: 'mba_wrmsr_intel' defined but not used [-Wunused-function]
     560 | static void mba_wrmsr_intel(struct msr_param *m)
         |             ^~~~~~~~~~~~~~~


vim +/mba_wrmsr_intel +560 arch/x86/kernel/cpu/resctrl/core.c

fbed64f8051524 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-08-03  559  
bd4955d4bc2182 arch/x86/kernel/cpu/resctrl/core.c Tony Luck       2024-03-08 @560  static void mba_wrmsr_intel(struct msr_param *m)
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  561  {
cae2bcb6a2c691 arch/x86/kernel/cpu/resctrl/core.c Tony Luck       2024-06-28  562  	struct rdt_hw_ctrl_domain *hw_dom = resctrl_to_arch_ctrl_dom(m->dom);
13548d0c5c4b65 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-05-28  563  	struct resctrl_hw_ctrl *hw_ctrl = resctrl_to_arch_ctrl(m->ctrl);
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  564  	unsigned int i;
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  565  
d4846284209b96 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-07-21  566  	if (!test_bit(RESCTRL_SCALAR_FLAG_LINEAR, m->ctrl->scalar.flags)) {
a1bcfaf0334053 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-04-07  567  		pr_warn_once("Non-linear bandwidth delay not supported\n");
a1bcfaf0334053 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-04-07  568  		return;
a1bcfaf0334053 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-04-07  569  	}
a1bcfaf0334053 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-04-07  570  
a1bcfaf0334053 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-04-07  571  	/* Program bandwidth percentage mapped to linear delay value. */
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  572  	for (i = m->low; i < m->high; i++)
13548d0c5c4b65 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-05-28  573  		wrmsrq(hw_ctrl->msr_base + i, MAX_MBA_BW - hw_dom->ctrl_val[i]);
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  574  }
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  575  

:::::: The code at line 560 was first introduced by commit
:::::: bd4955d4bc2182ccb660c9c30a4dd7f36feaf943 x86/resctrl: Simplify call convention for MSR update functions

:::::: TO: Tony Luck <tony.luck@intel.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
