Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558994EB50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 00:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740185841; cv=none; b=FtYyNnFQIUPqX7YyQp4828awGccEq33Z1HAQ0jv5WrImssRb6yFd1K+1zo6SQyhszX51pVwbeywDV5KIKyG+BS2D0AsyUsPmf6sJvkeUB1D06sj4xXEqHNoxwCfKSuJrcFIvUlzFf1k8BDsWxZ7Z8lr8i4r+/eYjFrHLNtx0oPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740185841; c=relaxed/simple;
	bh=gIbhA2HoZRGm/SBgx8dv1l2TxtF9waa1Yeax4/LTpxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzPFmXJU3Lm2nIrll3hfNrdMYlPyiJzq0RDeAGjdPWQELLo0xZX3qh3uxxGDH1GAfBCJ74alP9mrqIE6iLyJ3Bas6XjX6Uxw/CqbPjTLBc6ew2CQE8n7lmHUaHGrq5/XYOJw8m7azsp2lMv5sPUqJB3pgx7MmFhky13FNYkrNR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaskN/rJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaskN/rJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740185839; x=1771721839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIbhA2HoZRGm/SBgx8dv1l2TxtF9waa1Yeax4/LTpxM=;
  b=JaskN/rJa2xn6yzAfXr7g1NcradNF1bYSETixJGq2ayf3HlJ5Iuvhq0W
   EAd5QqB3FNB5JSS36ktw4Vf/b3s1M8q3xAZqOTe8Gz2F3dnIjR3eOP3Zi
   QJ6GEGlrQNuoXwjk0jqlMONfYhSuEhm4u3R973BnQKVb7yamOXm7jXQyS
   vKi7eAV3uqaR46FhyY88QQjgNnIFqvmcwouSkFPy+5pbhG6l8DsjMpzAn
   ES+Pi89HOctBsR6KXDosrCSwEhISXphsLyQ/asOfNGiriQO6UBjmyfb+3
   PoEp59FBrcNYC1ikttzKIvpRAzVa5+MBuMszouh0nnAgnjyPfabifRiwp
   w==;
X-CSE-ConnectionGUID: c+70ywW9Q+mj2G0i0G0J4A==
X-CSE-MsgGUID: zWBk8kj8T6iwk/XRwXEJRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40252380"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="40252380"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 16:57:18 -0800
X-CSE-ConnectionGUID: Yv8rNbN2SuabtzUrqFWhKA==
X-CSE-MsgGUID: 3f/w0mKNTOiY8HdRI+YNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116016982"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2025 16:57:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tldpS-0006Br-0u;
	Sat, 22 Feb 2025 00:57:14 +0000
Date: Sat, 22 Feb 2025 08:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] arch/x86/include/asm/amd_node.h:30:16:
 error: implicit declaration of function 'topology_amd_nodes_per_pkg'
Message-ID: <202502220800.08S8jZj3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250222/202502220800.08S8jZj3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220800.08S8jZj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220800.08S8jZj3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sof/amd/acp.c:19:
   arch/x86/include/asm/amd_node.h: In function 'amd_num_nodes':
>> arch/x86/include/asm/amd_node.h:30:16: error: implicit declaration of function 'topology_amd_nodes_per_pkg' [-Werror=implicit-function-declaration]
      30 |         return topology_amd_nodes_per_pkg() * topology_max_packages();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/amd_node.h:30:47: error: implicit declaration of function 'topology_max_packages' [-Werror=implicit-function-declaration]
      30 |         return topology_amd_nodes_per_pkg() * topology_max_packages();
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && AMD_NODE
   Selected by [y]:
   - SND_SOC_SOF_AMD_RENOIR [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]
   - SND_SOC_SOF_AMD_VANGOGH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]
   - SND_SOC_SOF_AMD_REMBRANDT [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]
   - SND_SOC_SOF_AMD_ACP63 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]
   - SND_SOC_SOF_AMD_ACP70 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]


vim +/topology_amd_nodes_per_pkg +30 arch/x86/include/asm/amd_node.h

e6e6e5e85116b8 Yazen Ghannam 2024-12-06  27  
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  28  static inline u16 amd_num_nodes(void)
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  29  {
bc7b2e629e0c92 Yazen Ghannam 2025-01-07 @30  	return topology_amd_nodes_per_pkg() * topology_max_packages();
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  31  }
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  32  

:::::: The code at line 30 was first introduced by commit
:::::: bc7b2e629e0c9251ba96d864a30d34d1497b1b1b x86/amd_nb: Use topology info to get AMD node count

:::::: TO: Yazen Ghannam <yazen.ghannam@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
