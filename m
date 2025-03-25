Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A078818BC3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742906519; cv=none; b=Zb0jl4HqkkEowWPDFOGzugC13cTSzFFwynXAPw8n2eUildLZU+sJtNWkbG2ZAkBsZnH85lkfNmtwSRXTc43t0uthYIlwm8//IaDQ/2Fglcnezml1jvsd7anQOB8ePnYjMuMKV/U7thEazjjQg2pQkrZC9YIOPpJZBbnge3vAb3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742906519; c=relaxed/simple;
	bh=ZAPV9vDcKbEXB+/u11AefT782JqwFMWje7+VIhBg2rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfks4byeNcnOjZIPnNiNF5r2pITJvFD5gvTrGmi0cGf2MV9mCmPlT1qxTYdZp3UQvQo6dbjIY7SndDq2OwVrCtRoIelYtMjxmzMmbzm8N3ep3unk4rkyaxcw1vl7ZPd6n3x7qMJkvNiRUKLEZeBK/9zcIzpFEKJk1Zv29au8OLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GheEOZue; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GheEOZue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742906517; x=1774442517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAPV9vDcKbEXB+/u11AefT782JqwFMWje7+VIhBg2rw=;
  b=GheEOZuex9MIVt73HsFQWLiYamChBesYiPUMmInx1JZqyRzhk7bWqxPh
   nJoiV+kFY8Jw8rTVSnyu8qdyekzVpcR1+eh3MKKkRnLrjv9V1Q2LQtRTO
   VxgCd0nNddxnyhvf/7vs08H8kIEsC4FPglBXHJkHRe+XVILbwHg5STpze
   8mEnIJuKM16gL4rw04duKkPRyPQRorM8gkWN3WEVMqkK7hBpSDi4I7K/g
   RGAoxFTYs0paDAwfUir2vVAa0cDVUVPSKwqFuROjfz3n08BhDu04Q5wPe
   06Q5rLLQoBD+ACP4LBsV/4FW56E18NT4kGcvjqLsl3i4/e8SJSkdqWGAC
   g==;
X-CSE-ConnectionGUID: jNTLmwgeS8mbWQq4U/66tg==
X-CSE-MsgGUID: s5e+0BGFTpmmkrF8z4Iodg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31753049"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="31753049"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 05:41:56 -0700
X-CSE-ConnectionGUID: qkyn4axZR5+k/VU0KJvXJw==
X-CSE-MsgGUID: A23HTv4FS6eTrLcmBJR3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="155378781"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 05:41:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx3bN-0004cX-1e;
	Tue, 25 Mar 2025 12:41:53 +0000
Date: Tue, 25 Mar 2025 20:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2821/2821] arch/x86/kernel/paravirt.c:68:1:
 error: control reaches end of non-void function
Message-ID: <202503252017.UYNRpRjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0d616a77cb5f7198cca524a24f717f59ad51b41b
commit: 822da186955cbcd69b4715b8a307053e6c756f30 [2821/2821] x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
config: x86_64-buildonly-randconfig-003-20250325 (https://download.01.org/0day-ci/archive/20250325/202503252017.UYNRpRjt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503252017.UYNRpRjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503252017.UYNRpRjt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/paravirt.c: In function 'paravirt_patch_call':
   arch/x86/kernel/paravirt.c:65:9: error: implicit declaration of function '__text_gen_insn' [-Werror=implicit-function-declaration]
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c:65:36: error: 'CALL_INSN_OPCODE' undeclared (first use in this function)
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |                                    ^~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c:65:36: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/paravirt.c:66:47: error: 'CALL_INSN_SIZE' undeclared (first use in this function)
      66 |                         (void *)addr, target, CALL_INSN_SIZE);
         |                                               ^~~~~~~~~~~~~~
>> arch/x86/kernel/paravirt.c:68:1: error: control reaches end of non-void function [-Werror=return-type]
      68 | }
         | ^
   cc1: some warnings being treated as errors


vim +68 arch/x86/kernel/paravirt.c

19d36ccdc34f5e arch/i386/kernel/paravirt.c Andi Kleen          2007-07-22  61  
1fc654cf6e04b4 arch/x86/kernel/paravirt.c  Ingo Molnar         2019-04-25  62  static unsigned paravirt_patch_call(void *insn_buff, const void *target,
abc745f85c1193 arch/x86/kernel/paravirt.c  Juergen Gross       2018-08-28  63  				    unsigned long addr, unsigned len)
63f70270ccd981 arch/i386/kernel/paravirt.c Jeremy Fitzhardinge 2007-05-02  64  {
822da186955cbc arch/x86/kernel/paravirt.c  Peter Zijlstra      2022-03-08  65  	__text_gen_insn(insn_buff, CALL_INSN_OPCODE,
822da186955cbc arch/x86/kernel/paravirt.c  Peter Zijlstra      2022-03-08  66  			(void *)addr, target, CALL_INSN_SIZE);
822da186955cbc arch/x86/kernel/paravirt.c  Peter Zijlstra      2022-03-08  67  	return CALL_INSN_SIZE;
63f70270ccd981 arch/i386/kernel/paravirt.c Jeremy Fitzhardinge 2007-05-02 @68  }
63f70270ccd981 arch/i386/kernel/paravirt.c Jeremy Fitzhardinge 2007-05-02  69  

:::::: The code at line 68 was first introduced by commit
:::::: 63f70270ccd981ce40a8ff58c03a8c2e97e368be [PATCH] i386: PARAVIRT: add common patching machinery

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
