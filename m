Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E738E5FD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095271; cv=none; b=XzOI6fkTZW6tdeDEr7VdvV9tdWBY9vi0xwKTIU0YlnraX4xRZAvyrycStGmBFxb3RBeVCRaiIOKjPw0Mynl8XTlfQWv5WDavS8LkQlCxbxT+UA60K6MeXEZCWZiugrFtQIZuMQDEEMTXmPID6PxCBZeTP+/ZsX9ZcdHHC0nY4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095271; c=relaxed/simple;
	bh=wcE/RqyWIzd6Dup3DtDsHh/6koz+dJOc5yOTl2NI55A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sjOolIG/Ex6vDI2QVxmgiywCIGdrnFy6ooYVgvXQ8Mh98eRiwCw7W0EeNHV5U3vqxaN3A7GOA1P7PVEb+GJ8YShrEK0P1worWgnVE8UmDT9ClEOZkf62rw6EstU/lbK8iKop0a/JLknpm6/64lL1yjfpajrFLc0AKmPbnPUOkTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3HPAyci; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3HPAyci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773095269; x=1804631269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcE/RqyWIzd6Dup3DtDsHh/6koz+dJOc5yOTl2NI55A=;
  b=Y3HPAyciKRDE/He8YRt1uTHzECMjU6AtWBvltwtRv/5iBF/39K+bBIXE
   qjSqQ01S9H/anVTpGeFYJNREqG46xWPtuXCXVJgIySrUNJHFmMqk9Q3Gs
   pcRI13Dv9uerSRbZkj6XEiojZI7nWbYuqxEIPyxr5mpqQRocRqh9v0IoW
   q/1Tk+sKeu2sZ6NeQdoSzeKf64oBQ5cKeeWm3YomPxH8gwznUV+CChlj8
   U1SaT3BJCtKYzondp2BnTaR41z1kiBsWjoptEV8Xz1alLu0Oa2cX4CoG8
   cIh+cRYGJQEOCcQQM6B3sj15PdBt9yKam4HNm+uvQvVtE86LOmCeDraKL
   w==;
X-CSE-ConnectionGUID: lCxPnapSQhO6A5Dkjp0Amw==
X-CSE-MsgGUID: mBpR3fiuRCmDs7+/xPqFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73331909"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73331909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 15:27:48 -0700
X-CSE-ConnectionGUID: evIvZo7WRGajRGxi3nqgqw==
X-CSE-MsgGUID: Y1pXx1lVRgmYVOx6itiEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224594753"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 15:27:47 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzj4j-000000000uW-1PLJ;
	Mon, 09 Mar 2026 22:27:45 +0000
Date: Tue, 10 Mar 2026 06:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 2/2]
 arch/m68k/include/uapi/asm/ucontext.h:9:27: error: field 'uc_mcontext' has
 incomplete type
Message-ID: <202603100620.daXujbcR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   89dd25be8eeb8d7b52191bc5f82b7b5e7e5c216f
commit: b3b6bda8db008005cbd3da3b085bed301450704f [2/2] ucontext
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260310/202603100620.daXujbcR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100620.daXujbcR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100620.daXujbcR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/ucontext.h:8,
                    from arch/m68k/kernel/signal.c:51:
>> arch/m68k/include/uapi/asm/ucontext.h:9:27: error: field 'uc_mcontext' has incomplete type
       9 |         struct mcontext   uc_mcontext;
         |                           ^~~~~~~~~~~


vim +/uc_mcontext +9 arch/m68k/include/uapi/asm/ucontext.h

     4	
     5	struct ucontext {
     6		unsigned long	  uc_flags;
     7		struct ucontext  *uc_link;
     8		stack_t		  uc_stack;
   > 9		struct mcontext	  uc_mcontext;
    10		unsigned long	  uc_filler[80];
    11		sigset_t	  uc_sigmask;	/* mask last for extensibility */
    12	};
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
