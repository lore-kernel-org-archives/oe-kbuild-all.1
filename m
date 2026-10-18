Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94B320CD3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792359272; cv=none; b=cCWGDlpNGH3A1a4s9KNUWirQgVB8I+GvzmOBpAT1u75annzkVIfXX/YAM2Ub9mRLtloHVV14RXxbgHu+dimy08aNl79CqnCHLMO+IWhyH+QKzC10Vgxzr3oFIpkXWZiZtwrcE14ctP6ecegD7PgZEcLsUnuaynGZG/Zw4DTakkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792359272; c=relaxed/simple;
	bh=4EiAgMQ4B76Y1iIf6MiE5gkRPaU2eqlIdIiKfOMjONU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V3Zrvr34kVgkpID3AhwXMDrw7z1blgIhtr1wOfxPSCSWI+4KowFsK++irHrFLrecS6TejmSBNklxpnsPn2gyG79mUBkFfOy9XLT6klnXRPWDZxPKvv0LQW/mAeoopRGPI5tn8Gl2BOOAEHZn4gZ9bknDJtQYSeyTDJf0YXQSzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgV8vxGE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgV8vxGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792359271; x=1823895271;
  h=date:from:to:cc:subject:message-id;
  bh=4EiAgMQ4B76Y1iIf6MiE5gkRPaU2eqlIdIiKfOMjONU=;
  b=AgV8vxGERuA/ZTMR23kkD8YDkTEEQMCFc49O8K02suLmeqsJyn+XMsPz
   71+EBVlwSrw2chIIBfeNVS/JglGBb4ada5oPXlfVCR0Y/AUIjc8JRCaA3
   zAK7D2Y6j3mGfPMQScgw3GbaR4G//Q6M0Ze5y594Ck89BRYqGxaPBl2c7
   VECQ0hMCvDw4wcpqo7Ryb4LHtBJzf8F2pgkaStB9TIYTdv2d3hdT/U3pj
   vgSr1J75/YVhNpyt5YUqqJvWcnMLws7U/4LddHzCc3G6plefYIkRbhRCQ
   uKi5ShvqeuabOAY0f4gt70UCq0wrRWJjkF038dog8WX2vbcpqyrjIXk1D
   g==;
X-CSE-ConnectionGUID: uHNAhIfeTHCmiXdsG+ajTA==
X-CSE-MsgGUID: ZTZMBSmfRTGy2reDhU9rlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1059259"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1059259"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 14:34:31 -0700
X-CSE-ConnectionGUID: gtyLM7OzSZOqi+65p7QIug==
X-CSE-MsgGUID: 0hp9/ozlRHO5nV4Cj8Xwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2720810"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2026 14:34:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIYWR-00000000Krm-2SKO;
	Sun, 18 Oct 2026 21:34:27 +0000
Date: Mon, 19 Oct 2026 05:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 27/32] arch/x86/kernel/apic/apic.c:1058:
 Error: `rdsspq' is only supported in 64-bit mode
Message-ID: <202610190529.sMXTkbS3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: af4f990bae706330577d32faa7a7970cb22943f1 [27/32] kss-debug-irq
config: i386-randconfig-1011-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190529.sMXTkbS3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190529.sMXTkbS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190529.sMXTkbS3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/apic/apic.c: Assembler messages:
>> arch/x86/kernel/apic/apic.c:1058: Error: `rdsspq' is only supported in 64-bit mode


vim +1058 arch/x86/kernel/apic/apic.c

  1053	
  1054	static __always_inline unsigned long rdssp(void)
  1055	{
  1056		unsigned long ssp = 0;
  1057	
> 1058		asm volatile("rdsspq %0" : "+r" (ssp));
  1059		return ssp;
  1060	}
  1061	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
