Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F8D20E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975227; cv=none; b=I6yLbd8aJ00pmMPXAEZwMAJDa9FHlBMr67DuDrsapC0/7yEZRMJdVwTQ5L+/8JAkXBqvIVsDdUaLWTaS23lOZyclptOT3hJ3vYGvWN6LFP0RkpyEdh17OEEf01GIuzP4EHucJD4iqxd7IHF3JiBDhPTSSzdyxDeeAratTkIGD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975227; c=relaxed/simple;
	bh=JrGthNauP4n0ZEV9k1v2TJ5l56DHuEPKqRJ47tIj2lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgvhI2WsMu15nHghjK7HIMpKG4UIKmoB+7oBw6w+HmlnKgLLfhosNPfLQ/sS5xzefkpGCnKf+qPz10f2thXkzoD183touq/5cf6gahrhBCBVjgKz362XkTVeGLrxLkqkrSc2kByCKAJTTAQprl7pYwMJiP2SebCUUXsUjaGU2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFVJfZ51; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFVJfZ51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975225; x=1763511225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrGthNauP4n0ZEV9k1v2TJ5l56DHuEPKqRJ47tIj2lE=;
  b=IFVJfZ51n/1X/cSUH94QVLZvApoNUGX499a6hWlbDhJy1Hc318Hu3rq4
   /7xHROTOeV9GnFY84ewcJaerH0Ucf2mL+TLvTE61WcZbAU0QtSaUSRBVd
   FSmrAvo4LRm1OgMkFH5oTacEaO05rQNn21UezszXQP3zwJCtnmRncMGlY
   /6y4MBDOx10FXz1Cn+a6dwgHIIIYP3PPnNyNr8VK6+Zg6ymiqVvPsR8wV
   oKYDewojG7hutFmax82c1M2jaCNtklLzixlh6x6OLGT2mrIihPyCTKpkY
   8nk91dwpudxuv+CCHFMV9kEM+IVpzp+RDmgpp1xPvO1Vp1G/a8V/6ZKZv
   Q==;
X-CSE-ConnectionGUID: TOk7bLcdRlOfJmSXForiwg==
X-CSE-MsgGUID: tLHe5ustSPeEPiOaUQND7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49492230"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="49492230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:13:44 -0800
X-CSE-ConnectionGUID: YmRdpzTtSumYkToEyGFiOw==
X-CSE-MsgGUID: yeGcd+VRStGlQVIaFSWbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89787289"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2024 16:13:43 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDBsC-0002hh-27;
	Tue, 19 Nov 2024 00:13:40 +0000
Date: Tue, 19 Nov 2024 08:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 9/35] security.c:undefined reference to
 `__traceiter_cros_security_socket_post_create_enter'
Message-ID: <202411190801.RbQVYaeU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   6445ba2974a305267769867aeb4ee60078547ada
commit: a47abc59e9bca0bf07b465aa42be61338759c90b [9/35] CHROMIUM: add cros_security_post_create_exit tp
config: arm64-randconfig-004-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190801.RbQVYaeU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190801.RbQVYaeU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190801.RbQVYaeU-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: security/security.o: in function `trace_cros_security_socket_post_create_enter':
   security.c:(.text+0x5d8c): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security/security.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_security_socket_post_create_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   security.c:(.text+0x5d8c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: security.c:(.text+0x5d90): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security.c:(.text+0x5db8): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security/security.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_security_socket_post_create_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   security.c:(.text+0x5db8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: security.c:(.text+0x5dbc): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security.c:(.text+0x5f44): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security/security.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_security_socket_post_create_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
   security.c:(.text+0x5f44): dangerous relocation: unsupported relocation
   aarch64-linux-ld: security/security.o:security.c:(.text+0x5f48): more undefined references to `__tracepoint_cros_security_socket_post_create_enter' follow
   aarch64-linux-ld: security/security.o: in function `trace_cros_security_socket_post_create_enter':
>> security.c:(.text+0x5f7c): undefined reference to `__traceiter_cros_security_socket_post_create_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
