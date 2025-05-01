Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB11C5F10
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120966; cv=none; b=CQCNcDq41HjPUfrSSF6b8XaKqR/zX9qas70QgWEmESjY1weIugFgyfYgHnF8k8tXbh/IkYOyYkYX0oWpFB4QgMorHV5lh+DHcaA5VM9Ch+UeV2y9mK1aMCV1I0BOOa4paxPuooRJReuqav2X4uM/d8dL2Ws0snT+TQ7rZ1A/onc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120966; c=relaxed/simple;
	bh=vJMl81OwYhDCq/Xe6/b5c2kunMjwoVapARf43BF2LUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Welaqc3YPPj0wIA22OAJbt1ecXkqSGMv2DcUgeRgNfPJDPAny3i4WYxrwc1/9CadKC4RX2N0PtcH5fEyvqXJX2d01t/JOLF/d39fcrMt8kjKioQxyegyXGnttDJXEDd8OtFe8LgbXv++NNwrGnSsy4fZsN15yIR4tQnB3OHo1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3bwWMiY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3bwWMiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120964; x=1777656964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vJMl81OwYhDCq/Xe6/b5c2kunMjwoVapARf43BF2LUs=;
  b=S3bwWMiYCEpdapDYabOclKEUZLRTz2pe8VcpncikyVL4gW29vMC4/vZk
   y1a9DJgpHNF9jPZmHLcTcJGHM/UVEE3e+oQYsRyrEE5ylFbMYnNRWgdUp
   aOfxOCLr7UHjldndc8+A7nB+Otk28b+BTIAdCPV2K5EjDtJ9BnP6qKF0M
   jJnE4Ujk0b4+rtF/Ygf+basPYLHi4pmpKlZxrGBbWup7zn/vQb/kLjmwa
   qS4EtzKPCmU+MgY9Hyv4Hy/YBr/E7Kf+0cOyNYicRRdAtXtRre1EGjw2y
   E1vlhrzdtRqP4QBY71isWCHGPvjaTEg+xPG6Rt2+O/KlNjwG537KlZA6s
   Q==;
X-CSE-ConnectionGUID: X5vS0ymDQ6qS1PQnAzUX2Q==
X-CSE-MsgGUID: 0J8UINGMS1Ci/ob88Bf/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51622639"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="51622639"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:36:04 -0700
X-CSE-ConnectionGUID: fDeTTngFSya1d4MZCcDT8w==
X-CSE-MsgGUID: Wfc0x/jfQWadgMhDhXNi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134940910"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2025 10:36:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAXpH-0004IL-3A;
	Thu, 01 May 2025 17:35:59 +0000
Date: Fri, 2 May 2025 01:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] coredump: support AF_UNIX sockets
Message-ID: <202505020158.k0MgUz2u-lkp@intel.com>
References: <20250430-work-coredump-socket-v1-3-2faf027dbb47@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-work-coredump-socket-v1-3-2faf027dbb47@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 80e14080a00bc429a4ee440d17746a49867df663]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/coredump-massage-format_corname/20250430-191417
base:   80e14080a00bc429a4ee440d17746a49867df663
patch link:    https://lore.kernel.org/r/20250430-work-coredump-socket-v1-3-2faf027dbb47%40kernel.org
patch subject: [PATCH RFC 3/3] coredump: support AF_UNIX sockets
config: csky-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020158.k0MgUz2u-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020158.k0MgUz2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020158.k0MgUz2u-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/coredump.o: in function `do_coredump':
   fs/coredump.c:851:(.text+0x1338): undefined reference to `__sys_socket_file'
>> csky-linux-ld: fs/coredump.c:870:(.text+0x1352): undefined reference to `__sys_connect_file'
>> csky-linux-ld: fs/coredump.c:875:(.text+0x135e): undefined reference to `sock_from_file'
>> csky-linux-ld: fs/coredump.c:875:(.text+0x1364): undefined reference to `__sys_shutdown_sock'
   csky-linux-ld: fs/coredump.o: in function `do_coredump':
>> arch/csky/include/asm/irqflags.h:38:(.text+0x1488): undefined reference to `__sys_socket_file'
>> csky-linux-ld: arch/csky/include/asm/irqflags.h:38:(.text+0x148c): undefined reference to `__sys_connect_file'
>> csky-linux-ld: arch/csky/include/asm/irqflags.h:38:(.text+0x1490): undefined reference to `sock_from_file'
>> csky-linux-ld: arch/csky/include/asm/irqflags.h:38:(.text+0x1494): undefined reference to `__sys_shutdown_sock'
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/rio_cm.o: defined in discarded section `.exit.text' of drivers/rapidio/rio_cm.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/rio_cm.o: defined in discarded section `.exit.text' of drivers/rapidio/rio_cm.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
