Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0DB1CA82
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712255168; cv=none; b=K0HHeJdCy+I02A5TKOgZFfYlop1jGWZuqpMy1XfrMUGo8QQbu9OytfVN517dvSk4xXoKKa9qpclj5CEbWUk8eCRrKEGQR0fpGpyuwQcsOvMUDV8tLgiMSHDVRwdn/gFlqa6q2OKf1FYSVYZwfMhL/Pg8hf7TNvpclv1oU5NBHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712255168; c=relaxed/simple;
	bh=jmJXOfoDImmIbYe7gSht0Is/BzrzjPQGUxsetvT7szI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8+EOhxuW4ADN6AEa6jHd1IGewBHLQvEoFaB8kTLaBoAYzIW9zJ2A0tkMTaZgOvTzorma5K7g0Mra3YblkcwxDnrk4w8lvAa/FLYgRj3b0pNGilKSDXtvz0lZiEESzfTfaaz9A1zqS7SKphb00P6lavTH0sGVQx5MgRN1t/LDMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyDonxgd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyDonxgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712255166; x=1743791166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmJXOfoDImmIbYe7gSht0Is/BzrzjPQGUxsetvT7szI=;
  b=CyDonxgd/CW92Je4ugwM6GEluMbvzJtJ0y3MvqJy0xWw0DW0JZzUTG2H
   Gm4jBAkQww8Tctp4ATPIrOUvh58wvACLcwf+G1POZrQBrC6wORCnVrAMr
   28Lzlwmjl75PvLKChUivmYCzNgkBl45M7AsF1V+8TDBh7YbB4ZRZL4SEz
   rL5oIRXIf5d+lZM7RF7tbX60wLdJ/tdMtYuLZJQhtvRmH+6wEXaKstyIO
   WD2KF73O6czHsVHFQ94njiYyKYT8yczidfP60gN7XHKjTmkEQ6E3v7057
   affUQpprh8fvapuy8LcTQxz6gwCgv6tBuyoVlVM3SND8yAS/B9qgxD5P6
   Q==;
X-CSE-ConnectionGUID: TlvNTN9NRFmKb8JFODOvhg==
X-CSE-MsgGUID: nRlRaJetRWqPC+H1CzDDhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7718505"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7718505"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:26:05 -0700
X-CSE-ConnectionGUID: +KWj1scEQQ+Zy4Hi+tmsPQ==
X-CSE-MsgGUID: vsiidV+jQVyHxQV9HhriFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23569730"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2024 11:26:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsRmk-0001Mg-1A;
	Thu, 04 Apr 2024 18:26:02 +0000
Date: Fri, 5 Apr 2024 02:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest 4/8] arch/x86/coco/tdx/tdx.c:63: warning:
 Function parameter or struct member 'hdr' not described in
 'service_query_req'
Message-ID: <202404050249.J8I1tGE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest
head:   e0c511fe981d8b05dd0a945acc1e8d7f4fba3a59
commit: 614408cfce8b25afb96c6051f29a0a978feae893 [4/8] x86/tdx: Add tdx_hcall_query_service() interface
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240405/202404050249.J8I1tGE0-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050249.J8I1tGE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050249.J8I1tGE0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:63: warning: Function parameter or struct member 'hdr' not described in 'service_query_req'


vim +63 arch/x86/coco/tdx/tdx.c

    44	
    45	/**
    46	 * struct service_query_req - Service query command buffer
    47	 * hdr: Command buffer header.
    48	 * @version: Command version (default is 0).
    49	 * @cmd: Command ID (0 for query command).
    50	 * @rsvd: Reserved for future use.
    51	 * @guid: Service GUID to query.
    52	 */
    53	struct service_query_req
    54	{
    55		/* Command buffer header */
    56		struct tdx_service_req_hdr hdr;
    57	
    58		/* Command data */
    59		u8 version;
    60		u8 cmd;
    61		u8 rsvd;
    62		u8 guid[16];
  > 63	};
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
