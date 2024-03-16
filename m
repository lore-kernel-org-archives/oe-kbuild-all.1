Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA3B63A9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710629768; cv=none; b=HiJw8l6dsdar7FDTMGQeIaaH6G/dB0ZzJGG4IC2SOfA4kFeDX/LIjz1JCkL4dNbmaQGZWqhHpHYHF8ISmvEEimmhAUQ1qropSz3vZiEMXLAWHFIC9vUz8rikarx73a7bcWhsCMlSXW25VoGlXf10dIto2TbgD217HPcCaIB2zus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710629768; c=relaxed/simple;
	bh=vNtsipIv3tXXja15PrNLs6iMReVo3uNWkyhrzoUCflg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIqqZZigeawNLDyq1SlSu0l+e5ZEipK/SwJNOoVUmQJCxR3h5b3atgx0a54KfEcCXRkgtGt1JP+3W2T0Iq+Rz7i8r6lYu7ZAqIBlZoQbsRWzl5fg2jJbv5aFAdwB31Y7HuombtDV/f4u2o0MUTz7kddVB81KEGQd0zb2Ne3jTmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEIt8VIc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEIt8VIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710629766; x=1742165766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNtsipIv3tXXja15PrNLs6iMReVo3uNWkyhrzoUCflg=;
  b=OEIt8VIcm8CzsYFe54B+oENKuDW/xhPzbMzqOk+6XhcEOVGCunxReKgA
   w52H3iqFLbwGr3VQEy0LWVys05sZtxqOxKN7L6RyHkYk0QyvfvZ3nsbzY
   J7NzR6/LJcOmh3Zoi3DXf1buyHJX8r6QUEP79VgC/evUehH2T4dz6npao
   h/3xFOx7F2J1d8FfuCdpwspiy0X17n+vrzkncwB3cib/plOY832olOspe
   BgWTV55xUzaRytmWmeShnFVFFlZgkscclsH3fmBakAgLY4B6T83DswhaX
   Dd1mVcHXSUYLrBipAfqhM6b+IwXBSoqz/9XwP24uu0rW/edvxqjX25x3/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9305608"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="9305608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 15:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="13131148"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2024 15:56:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlcwb-000FqU-1V;
	Sat, 16 Mar 2024 22:56:01 +0000
Date: Sun, 17 Mar 2024 06:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/bbr3 1/1] powerpc-linux-ld: tcp_bbr.c:undefined reference
 to `__udivdi3'
Message-ID: <202403170652.MqUBXOtC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/bbr3
head:   2a5d0f70029ff84422ee9e01e0eb7bf17f16d981
commit: 2a5d0f70029ff84422ee9e01e0eb7bf17f16d981 [1/1] tcp/bbr3: initial import
config: powerpc-randconfig-003-20240316 (https://download.01.org/0day-ci/archive/20240317/202403170652.MqUBXOtC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170652.MqUBXOtC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170652.MqUBXOtC-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
   tcp_bbr.c:(.text+0xd68): undefined reference to `__udivdi3'
   powerpc-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_quantization_budget':
   tcp_bbr.c:(.text+0xeac): undefined reference to `__udivdi3'
   powerpc-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_inflight.constprop.0':
   tcp_bbr.c:(.text+0x1098): undefined reference to `__udivdi3'
   powerpc-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_packets_in_net_at_edt':
   tcp_bbr.c:(.text+0x378c): undefined reference to `__udivdi3'
>> powerpc-linux-ld: tcp_bbr.c:(.text+0x37c8): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
