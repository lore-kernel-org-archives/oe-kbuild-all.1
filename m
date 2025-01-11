Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4CDEC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 03:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736565621; cv=none; b=i4ubWy2UdvBiZetcaUX03aCUgUL9uQj6L3XA3N/eI4RwYB4qG8b1j7mtbuZyzmHm3BuNJL5bxmEfj0Kv4ESR6DOsJzZTaehxXeeJGUpjuAjuUrHSuOZbyL4u3n3AHAaA44kldw20Uq4Y6e2rjSRL/i6z7IszDbBrl8Ob92mAFig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736565621; c=relaxed/simple;
	bh=qguvkczEBSkAyjBseWSJLB7YP4sUKgERkXmPjBw2Zd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMn1A+v1FI7Cvw+QDmIdHo5NIFs5wTAmrDk+iHMr44a1Zfqq7G7aqR+GuCuduWcs0WQ+iLuKx5S/TsyFBYU0/5R6cpZsqLDARvCIQo9fOxKPz6akXyYRa9sh3iRlJ4znHcy6AHm6W36KkaT3yA2ZE5Lo3wC7O5cfeZUa7KoRuXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFayDGLI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFayDGLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736565619; x=1768101619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qguvkczEBSkAyjBseWSJLB7YP4sUKgERkXmPjBw2Zd0=;
  b=MFayDGLIZd+DwWq4ks2U04DPLAwhhleqnK6u9+8CWNpBK+gNQUP0JbXy
   6g1+SlCXL5sO6eN/vbmdd3NTKDO2830MdsVUPxuZ24bOapU+bb4x/EuMC
   AwKYUJ5D/CiltyltxkCwILi0IIJ0FPl8scYWdl5Ky8E4bwPtkvtUtou3Y
   MGc4u1/TBl2j5hfX823R4htIJUbRPqU567ZLjZvE3LCTPt/j606ksrikM
   VBKGy0ATdN+CmLJiVGM4IPEDR15ltXSupE/V6cylZpsoiHGYbuLv3lP6k
   v1JfEYax2Le+GZeGtDQMxQbU+5y4CHCRvDId+6jErHGCFKH30HaPOlkN6
   g==;
X-CSE-ConnectionGUID: pPIAcLjlQvyhImqAbW4pLw==
X-CSE-MsgGUID: UeQcy+tmSiS4SPY7vUSCow==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54412737"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="54412737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 19:20:19 -0800
X-CSE-ConnectionGUID: H8kzm/PfTG6X7+l5zRu2WA==
X-CSE-MsgGUID: 3ZyVhqdzQwWQr+2L07dRGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108939870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2025 19:20:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWS2p-000K5v-1w;
	Sat, 11 Jan 2025 03:20:15 +0000
Date: Sat, 11 Jan 2025 11:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 29/29] nios2-linux-ld: vmscan.c:undefined reference
 to `bpf_hack'
Message-ID: <202501111120.MqzCXmst-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   1b2329dd88553224f4ef9a26e1b22cea83b071a5
commit: 1b2329dd88553224f4ef9a26e1b22cea83b071a5 [29/29] bpf: arena hack/test
config: nios2-randconfig-001-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111120.MqzCXmst-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111120.MqzCXmst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111120.MqzCXmst-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: mm/vmscan.o: in function `wakeup_kswapd':
   vmscan.c:(.text+0xcafc): undefined reference to `bpf_hack'
>> nios2-linux-ld: vmscan.c:(.text+0xcb00): undefined reference to `bpf_hack'
   nios2-linux-ld: vmscan.c:(.text+0xcb70): undefined reference to `bpf_hack'
   nios2-linux-ld: vmscan.c:(.text+0xcb74): undefined reference to `bpf_hack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
