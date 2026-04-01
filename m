Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1933332612
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021059; cv=none; b=Lv2gxhCnhAydkGRhgw3muPlsN4MX4PtTlRr4n35RYH4p64pYXDuIqerqqSjrRi9cbI+oRMNsQ30jJK5jED6VdhVSPcgcvrvSWw+2VxkCUkuGgrmzUi2MfI2VIcGj59VWXR5nD3ETacGkDFrvG733SL6RoPUNmc3o4h49c3f6ddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021059; c=relaxed/simple;
	bh=ZNGFqXpgYHWj2My9TsowTUFqXEJOAFbH70wHx25iQcM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nKJqMpqNn1VBlgYAWhHEMjiEhZhLY9NHwwIs7hYXpfVSGVHWF4Aew+qKqkFJII+p3OkIC+GCwmV/RMfstMbD8mQBoIoJIgyOP0f8KhJDMnZiYKuurMEE/BVnHg5BJq/ydLYFZbwQ6i0sfdi7P+sqszgWcNueqWTB7UbI4Fyo0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeRTOLxM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeRTOLxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775021058; x=1806557058;
  h=date:from:to:cc:subject:message-id;
  bh=ZNGFqXpgYHWj2My9TsowTUFqXEJOAFbH70wHx25iQcM=;
  b=VeRTOLxMpExO9sXIGnW5HXoq0Yk36532nGrA24OUn6ayo7QGs/FWjZgo
   9UQTTpgAQvtPpFkXpoSyUmhdsSE0FYXBkqbbKOjETtU89ziymn0AqZd/b
   ah5YHvoJMqkmHEpiubR8VTB4ixGW82M5Im3/TORDMAlyCi1wdYgAXTgWG
   DWBnPBjZdhtxrbi7tOHd2hbsRsoqby1Hidl0X5rQvZy0oI0sVM13qdvk2
   yywi3ayRJV3GPieCHQekHKbyELjT/HQmzKJEFgMoyTAallZKtWvTlFkbl
   HSb0zI+JORGWS1BWsRcJs7X842Oo+jSvfZHoMRoxx7IlbXV6es2cLrffs
   A==;
X-CSE-ConnectionGUID: CKhL2pmWQnyvGLe9DIoMhA==
X-CSE-MsgGUID: LpzO5VynRPKAlMUQsJTG/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79653274"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79653274"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 22:24:17 -0700
X-CSE-ConnectionGUID: awGKTHSFRBWTz1kX/LRllQ==
X-CSE-MsgGUID: xAh7g0c5RXS28XY/BWC2Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226446079"
Received: from lkp-server01.sh.intel.com (HELO 9def6ffd2e71) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 22:24:16 -0700
Received: from kbuild by 9def6ffd2e71 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7o3p-0000000004J-0Ptl;
	Wed, 01 Apr 2026 05:24:13 +0000
Date: Wed, 01 Apr 2026 13:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 190/190] setup.c:undefined
 reference to `topology_apply_cmdline_limits_early'
Message-ID: <202604011319.SeddQPbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   666b43ed3d6a1bcc6c4d71681beb459cd846cad6
commit: 958a42aeddf62f2857c597e278636e6b389927c9 [190/190] x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260401/202604011319.SeddQPbP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011319.SeddQPbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011319.SeddQPbP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x7dc): undefined reference to `topology_apply_cmdline_limits_early'
>> ld: setup.c:(.init.text+0x7ec): undefined reference to `topology_init_possible_cpus'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
