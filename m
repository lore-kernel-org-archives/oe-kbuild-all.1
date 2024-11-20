Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29D17F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 04:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732075668; cv=none; b=pqmi0iWLVOEpng29TL8i42e8QpylRua1szh5AjCLhWF+vwuWpyyjrHRP92QLoFMEwX/NDmYJl3msKEkfPc+j0ajijrGeb5cGGNOI25SLqYFQIjKLVN14gpfKhyq6c/8zNpzHQZH6/S6jmMm/qr/hiHxJUtsds2AOgcLMsi0ekmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732075668; c=relaxed/simple;
	bh=AdkNFtERARLKnFp6l/lE6TTRwnJxvaMnUnHIWI9hAb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8RzPzxTU2zdLqW55ifFS49qGM1Km8eeTnA5/xYFp5XPF55FLRK73fBCxhjmmJccIjnecxklisp1EhezeCNmxJqff6rLbMS5fTsRXHBwAgQLXIIRfCMK7A4GCpyX49tBWHwHIFPIVJo6opapTH9mylsLCIy0MR3Jo5IqNAYEwIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyaVTJEv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyaVTJEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732075667; x=1763611667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AdkNFtERARLKnFp6l/lE6TTRwnJxvaMnUnHIWI9hAb0=;
  b=dyaVTJEvXNVXQllM7ezlwZusdjc0WY6auqKpLxfv9iSVxnjYrJls/D76
   TzFx1oNbNYfhROFdOE/Kav/gDDcJvHRvL3k3QJhOP6nTYu4wBlNhehf4V
   lz9VMdX7RS2SIdhrzLf2oXoUP5av/Ud7/xwiWmGaDnfv76mpNYjlo53hn
   wzRMi/xN0YL1AzfuJfzHtgBZAdSziHp8RT3cw2th8YObO+0xQ2auayuBl
   DEmCwX/fZdqCHtPYDTrxS2QbyZOOK+D2YOCqlh2J1R873SX2nH5dZ1AuU
   7770htr5KgsPR4dRZ0+UbdkKDF4pf9P+DVSFZ43i/YzI8fikhqQlsYxOF
   Q==;
X-CSE-ConnectionGUID: mpBC9Wq4SV2ev8Maxgyepg==
X-CSE-MsgGUID: OVFaUkMJQ4yDq4DzNdXSbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32248439"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="32248439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 20:07:46 -0800
X-CSE-ConnectionGUID: S5EXiHlrR6mlnetLFaJepg==
X-CSE-MsgGUID: Bzy9ha2OQpiq5Crm0ObMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90175271"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 20:07:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDc0E-0000Td-0t;
	Wed, 20 Nov 2024 04:07:42 +0000
Date: Wed, 20 Nov 2024 12:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2451/2451] arch/x86/kernel/paravirt.c:65:9:
 error: implicit declaration of function '__text_gen_insn'
Message-ID: <202411201154.x6DQX3dV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e74aedc9df70f84e50a280478b93d98b3a622bc3
commit: 822da186955cbcd69b4715b8a307053e6c756f30 [2451/2451] x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
config: x86_64-buildonly-randconfig-005-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201154.x6DQX3dV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201154.x6DQX3dV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201154.x6DQX3dV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/paravirt.c: In function 'paravirt_patch_call':
>> arch/x86/kernel/paravirt.c:65:9: error: implicit declaration of function '__text_gen_insn' [-Werror=implicit-function-declaration]
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^~~~~~~~~~~~~~~
>> arch/x86/kernel/paravirt.c:65:36: error: 'CALL_INSN_OPCODE' undeclared (first use in this function)
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |                                    ^~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c:65:36: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/paravirt.c:66:47: error: 'CALL_INSN_SIZE' undeclared (first use in this function)
      66 |                         (void *)addr, target, CALL_INSN_SIZE);
         |                                               ^~~~~~~~~~~~~~
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
    66				(void *)addr, target, CALL_INSN_SIZE);
    67		return CALL_INSN_SIZE;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
