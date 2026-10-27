Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114805;
	b=QMVy3CgHq8QApdtdzsZZf3sk3EevD3KGXqXW2buTHip61Or6T5CZ4Wb4zDn6Zf8qptg6
	 jfiMXB94Wqe6nF/SncIOwUKh2qyFYogkjKDQwLLllVX1J85GQ+wUC+6JYnU7uL9fZK0vR
	 qx2bn9l8hw6ahWE15Hdrucnm2do8KAx8hgsVYx4rhXdfiGHoRIE/FBWIGF7De+oErXY+I
	 /gRwwxkX3CGGtm9L5/zZpMqJcrFPlSJKDSIEd3r5pZfz/swqDoVanmWGZSFNZTONDk77s
	 jjG7ZCeCZEKn+9BPbKXS8U28Zy9eBwJ7c/huX6fAwQRIk3ernrCW8xLdg3rdscKmRag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114805;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DHoqYNpioHdrfBAeCrHueStEKDvxFQZPvGY3FE6BpSA=;
	b=RaVPCmtFBpji7MN12T25Xs13I1dK6k+u0xa8OPDyn5B7mvvq7Hs1ziBrOvC9CKS/SvV+
	 CPT6ytd5YmQo1wuHiJZBK5+OWljsS2BmZJG6gOUmyvGOdihOWdXquOdmE/ryAxeqrVNrg
	 lntPE9D6QHSTug6AyPd78y8qSc1jFqAOrd8XD94jMzzo+3bD1bX4OwkFiAdyUx0Gscr65
	 wUvKOsD6U7O+UxH3o95RJmt8rJnTIq33Wbq1nCYAlc/ZLnscthM3GoAae4ZdQyLPcaLGH
	 heyQpskPbpOcMbTwNI6FCrL6mmHgwTxWLzSbyipwXb6l5sAVCLLiyGC+EFVbbpsr9Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TB2pKS4G;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97829606A31F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97829606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TB2pKS4G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793114805; x=1824650805;
  h=date:from:to:cc:subject:message-id;
  bh=CqBtInvh2apLdvNGHEFFoLIHN7FvGcUezRRCMcu3XOw=;
  b=TB2pKS4G84NIYt3FUpILK6OjSJkx1+FK1wnaotqvQ15faCHkttoo0Zhx
   AVwJQ8CBUt1B/LfDiG49a8GHoMaj9t+zwaVIqov1dDHM/6CNUWM/9oa5B
   2NXO+Ash35Jysq+q9crnOndNvfGWjYn3+W/Dj2LTyaSK1Taq6SwMTlWSA
   /kRh1R2mKpXr7lpnUDxDUaGP1f/vP2GC0ayoN+y+jkbzCPZunoEzFyB6Y
   2o87y0qqruaVIXQi/zywtfvGoUhp5sXvHYIlAbttilRaqmIulXa4KbySF
   ujcMX4V23rjw226z8w7+QPBFH0r44JdhIG1WV8+sbr3StPBNMagZHPSo3
   g==;
X-CSE-ConnectionGUID: o3RhWHhvRFSFetVH5Tj5eA==
X-CSE-MsgGUID: 0xBBoqRIQh+n0soLVq8KLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1704589"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1704589"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 08:26:33 -0700
X-CSE-ConnectionGUID: ee1AIL9pRjiq9EM21cB7Ow==
X-CSE-MsgGUID: bPdFUz4HQFOPzew+xi//YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4644588"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 08:26:32 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLj4G-000000004YN-4ASc;
	Tue, 27 Oct 2026 15:26:28 +0000
Date: Tue, 27 Oct 2026 16:26:25 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:random-stuff 9/10]
 ./include/linux/gpio/consumer.h:210:16: error: returning 'void *' from a
 function with return type 'int' makes integer from pointer without a cast
Message-ID: <202610271604.OXQPrE8A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git random-stuff
head:   6c5d9e149cf308ead35a6bd9016a5f1c74a33cea
commit: 2949919aef6a434982eb9e5e0b635f8eda0b4cbb [9/10] gpiolib: Add gpio_get_property_name_length()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271604.OXQPrE8A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271604.OXQPrE8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271604.OXQPrE8A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/nvmem-provider.h:16,
                    from ./include/linux/rtc.h:19,
                    from ./include/linux/efi.h:20,
                    from arch/x86/kernel/asm-offsets_32.c:6,
                    from arch/x86/kernel/asm-offsets.c:29:
   ./include/linux/gpio/consumer.h: In function 'gpio_get_property_name_length':
>> ./include/linux/gpio/consumer.h:210:16: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     210 |         return ERR_PTR(-ENOSYS);
         |                ^~~~~~~~~~~~~~~~


vim +210 ./include/linux/gpio/consumer.h

   206	
   207	
   208	static inline int gpio_get_property_name_length(const char *propname)
   209	{
 > 210		return ERR_PTR(-ENOSYS);
   211	}
   212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
