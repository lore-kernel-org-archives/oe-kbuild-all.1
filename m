Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD9F1553A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724884595; cv=none; b=GzudNf2kKbuhMY5iOcP+XTnPKvc66Jv71Y3aj3bw2swiHFSS8zlPHyeNZSR5K7E3FoIDmAMQqvxg0zywMCXb8+0cTQeRjMzuvj4b1jOixyiDEyAAZt0qGKKyP7HveKCiCSdXpQ0j5wvjSSEx9c7CnEsjR3aJkWH8oWQmc0jmP58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724884595; c=relaxed/simple;
	bh=hE1IuHgry/lJZID/kIrFZLdfAjbLub6GC1fPNLHKC2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvVOq6Wqli3grXZTBywMuNcvYpYgv/avGoDekiTE1E/1DRYclpS8BPuHUHD2dHnAtg1+KB0rUc/FzlDfMhyd5Xukq9WhPWx+bJ7gLfXMEzthV2SRp+ZAWeNZyfCZAgKB7Aj7h6MtZFtpxHCj+Ly5kxbxkqhnkHTIqu3OUFPiSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFPBoiR0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFPBoiR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724884594; x=1756420594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hE1IuHgry/lJZID/kIrFZLdfAjbLub6GC1fPNLHKC2E=;
  b=IFPBoiR0lt9dg9bANtlvqxnMJFGG5y/gCNnHljFLuNSAMMgDlBrZ+MyB
   2V2/dn7EUBoWxZtl2WA6oVH4GP+MRBR3YCxDMs7Fo/fJIdTbMpYsiZHey
   l29Poc4jvdGcOVNCG6gxnJJb0gNcr8Eqxmkx3qduhdw4oggqKjgO1pdHb
   6c1fk/5pN644JLgz+uFCNAOtsFspWiL2AfyPhZCZDqiQeQtIBhdBy9FmF
   8J+Re5TumH/JsBdY5LZ1iptzw2BTB5OjDPNqqxu0hzs3Ueotcu8LYwHFT
   DSuxzblTSMfcQNduyA6Osmxvdl1m92LDTLtUqs0v1qA3QpiqpPdEs/KB7
   Q==;
X-CSE-ConnectionGUID: JgIuw8xHTBGymw/FfrOeWw==
X-CSE-MsgGUID: 4Ptnyp2eQF6yb+Zdo/i53g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34601101"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="34601101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 15:36:33 -0700
X-CSE-ConnectionGUID: UO5XU/fVRjC45nK4mfraRg==
X-CSE-MsgGUID: C9Nfb1L6TIO2KSmvFQAm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63370480"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Aug 2024 15:36:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjRHC-000LPW-0D;
	Wed, 28 Aug 2024 22:36:30 +0000
Date: Thu, 29 Aug 2024 06:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29221/30000] arch/x86/kernel/paravirt.c:65:9:
 error: implicit declaration of function '__text_gen_insn'
Message-ID: <202408290612.YVWkhiUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b3492b88408a530f644afcd9e80b98cbf9883a82
commit: 822da186955cbcd69b4715b8a307053e6c756f30 [29221/30000] x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
config: x86_64-buildonly-randconfig-005-20240829 (https://download.01.org/0day-ci/archive/20240829/202408290612.YVWkhiUH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290612.YVWkhiUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290612.YVWkhiUH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/paravirt.c: In function 'paravirt_patch_call':
>> arch/x86/kernel/paravirt.c:65:9: error: implicit declaration of function '__text_gen_insn' [-Werror=implicit-function-declaration]
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^~~~~~~~~~~~~~~
>> arch/x86/kernel/paravirt.c:65:36: error: 'CALL_INSN_OPCODE' undeclared (first use in this function)
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |                                    ^~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c:65:36: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/kernel/paravirt.c:66:47: error: 'CALL_INSN_SIZE' undeclared (first use in this function)
      66 |                         (void *)addr, target, CALL_INSN_SIZE);
         |                                               ^~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c: At top level:
   arch/x86/kernel/paravirt.c:99:13: warning: no previous prototype for 'native_pv_lock_init' [-Wmissing-prototypes]
      99 | void __init native_pv_lock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c: In function 'paravirt_patch_call':
   arch/x86/kernel/paravirt.c:68:1: warning: control reaches end of non-void function [-Wreturn-type]
      68 | }
         | ^
   cc1: some warnings being treated as errors


vim +/__text_gen_insn +65 arch/x86/kernel/paravirt.c

    61	
    62	static unsigned paravirt_patch_call(void *insn_buff, const void *target,
    63					    unsigned long addr, unsigned len)
    64	{
  > 65		__text_gen_insn(insn_buff, CALL_INSN_OPCODE,
  > 66				(void *)addr, target, CALL_INSN_SIZE);
    67		return CALL_INSN_SIZE;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
