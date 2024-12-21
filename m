Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C02905
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734757317; cv=none; b=CsUb2wqPVP64zTmWojedycuYQM03gFj7MkTrqfknDcTXPJhJz4zBn0qXB5aSgGHHrUaBI3yfVfZO9u1YEiwg2/ueGRY3PR/PLQRzs7Y3REB1/PH9fwVEth/VkCy9xavCxeWry0u4V0/W5XozkWFosvUMbI9qIHiKCkSG9WRw0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734757317; c=relaxed/simple;
	bh=2Wf2t9IhHY+VUI7e5wdNZoZhH7PJDWhBXmA/1pD/Ato=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GdBOuz8Kdx5UORlLdZHtK6IczE6kLhn8jU5fGf8qojGUdudpnRNEwI66a9msfACNlELfMmZDYrFzj921EB8FCxGlUrjYxMZ2S9t7wJ9hPSQxqyxtt+KwH8Pd1DlINgRNGxXjWy7OcM2AUT3GAYe5ysuMB/xwdf7aq/OZOL8PjMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFNxL5yP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFNxL5yP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734757315; x=1766293315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Wf2t9IhHY+VUI7e5wdNZoZhH7PJDWhBXmA/1pD/Ato=;
  b=AFNxL5yP8Wnpb56RBJktD+MblEDx7VHj/MJQJg7U9aclWyCwm/jZ999z
   oqgaQ+96k7s4EMCx+ABwoDrnUrQZv5+SMguoSc1qztIE6Pzt6pjL37qhS
   F6y+IJcHyZssNX41VoeAfz4KVcBJI0xSTpQLAsodART9ZGQviMSQTozY0
   fow4gGcsAzq9Z2uyNyVuCNvZCyNXcWG3ld2EBdmUSlpEKTGymdqhSXf3q
   uW+ikftAGn4FrN8fHFsD6IR9UJZk6lmVL5fgQ2HDVrSA0wb478yuHOGNN
   EcnteU0xFov14JfKF0HkCG4w7GR97X3UM24Vqef4IwuGS/eLhCZKcc4ej
   A==;
X-CSE-ConnectionGUID: LqcYPkghQ4yDYTMeIEkrQQ==
X-CSE-MsgGUID: LdCZas0xTo6E//KhY9pk3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39087358"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="39087358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 21:01:55 -0800
X-CSE-ConnectionGUID: vwmCdiW9T2iAwCDLefFs3A==
X-CSE-MsgGUID: vYs3csm8SnOjNSf7HEA7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="99096589"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2024 21:01:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOrce-0001w1-0P;
	Sat, 21 Dec 2024 05:01:52 +0000
Date: Sat, 21 Dec 2024 13:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 2/9] drivers/firmware/efi/libstub/zboot.c:36:15:
 warning: no previous prototype for 'entry_offset'
Message-ID: <202412211326.nA9PQPbo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   3b9b64db6d8de0eb1d3af75bba5d1b3c8e9f750f
commit: ac83e82f6882b44c8520a0ef4added7d424ec427 [2/9] efi/zboot: Add support for ELF payloads
config: riscv-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211326.nA9PQPbo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211326.nA9PQPbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211326.nA9PQPbo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype for 'entry_offset' [-Wmissing-prototypes]
      36 | unsigned long entry_offset(void)
         |               ^~~~~~~~~~~~


vim +/entry_offset +36 drivers/firmware/efi/libstub/zboot.c

    35	
  > 36	unsigned long entry_offset(void)
    37	{
    38		return entrypoint;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
