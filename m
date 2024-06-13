Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A775F133406
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272928; cv=none; b=uGfV2dF5e821AJka0WqSAHxKi9xjbfEl4fPLq0ksXOdVgTnyzVtez5GuJ0gDiSaIGBsX0HA+WZHHcfS8Dpjm11OY5ntHPV7bcGu7+xDovV7wf0fGnbJW505QscGkGj/QzqAKTlWYuaT0afEyJNNrOH2ddaBxl6BgbRL1V1WrTL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272928; c=relaxed/simple;
	bh=JMWGi5V0r/rg7HeWlkHlYdJ2riZd9v+rYAKOiPR9us0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqIuFys1e6Y0zcexCQYG9S6GvUmWs7Rn1mDinxHS+MxbE1UUTsf5g5d5FkWp+hF3e0OczASE4wdJuHzUMq+B1SvLIGKCPw5HbsQTd8NrasC9nNnNKwhiUHVJgN3evAiZ+aEcSgEPujn9Qfw+FPmcj1YsN54NuhpICr9L21/Sz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICCiKPZM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICCiKPZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718272927; x=1749808927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMWGi5V0r/rg7HeWlkHlYdJ2riZd9v+rYAKOiPR9us0=;
  b=ICCiKPZMfX976QK6f6FZS/QCvca9aCFvM+x/5Np3oNH2x24wU/CEG3e6
   AugM8k24bX5Et/yDVNBjgxQOL/aa3daA4YcdoX+QPW8V7IxtlLKG0min/
   cx7ozejAbK8KlNKzF13cje++ectoCqnzf2cas1Hm0gh2Ecpnb5f8CjNco
   T9y0TlBpnTgEQBGJkLha4tYwYEyhcE6JntD61Lj8HkKyoi9QWf6mqZ/4n
   7SlHHs3y64JK/UsoCSY/uK2BIJLPKBNCrGS081u4qH//m8ZIf8WIcJt99
   c8fzYMiwRWvYQ39xDnF73XYnn0M8d4Kk5pJIUu7TsH7AhXZCHnUejxe8k
   Q==;
X-CSE-ConnectionGUID: xktkBpsWT7eKq9shNGEhBw==
X-CSE-MsgGUID: 4n1tiK0/QYiQeaxzhFtvAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15048227"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15048227"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 03:02:06 -0700
X-CSE-ConnectionGUID: 3Fzf6dSCS9W4p19mhYfL1A==
X-CSE-MsgGUID: aUTkVkkvROGJ8rQNUvMUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="71300557"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2024 03:01:49 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHhH8-0002T2-30;
	Thu, 13 Jun 2024 10:01:46 +0000
Date: Thu, 13 Jun 2024 18:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.10-rc1 126/127]
 arch/x86/include/asm/resctrl.h:148:33: error: macro "rdmsr" requires 3
 arguments, but only 1 given
Message-ID: <202406131757.xrmzEoxi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.10-rc1
head:   928de66ad5fff2f15e2478fec40f5fbb4532314e
commit: b2c797b4b20c2a70a022477d75d5de1cdd78480e [126/127] fs/resctrl: Add cranky debug for reading CPU msr values
config: i386-randconfig-001-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131757.xrmzEoxi-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131757.xrmzEoxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131757.xrmzEoxi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/resctrl.h:12:0,
                    from fs/resctrl/rdtgroup.c:22:
   arch/x86/include/asm/resctrl.h: In function 'resctrl_arch_get_cpu_msr':
>> arch/x86/include/asm/resctrl.h:148:33: error: macro "rdmsr" requires 3 arguments, but only 1 given
     return rdmsr(MSR_IA32_PQR_ASSOC);
                                    ^
>> arch/x86/include/asm/resctrl.h:148:9: error: 'rdmsr' undeclared (first use in this function); did you mean 'wrmsr'?
     return rdmsr(MSR_IA32_PQR_ASSOC);
            ^~~~~
            wrmsr
   arch/x86/include/asm/resctrl.h:148:9: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/resctrl.h:149:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
--
   In file included from include/linux/resctrl.h:12:0,
                    from fs/resctrl/monitor.c:20:
   arch/x86/include/asm/resctrl.h: In function 'resctrl_arch_get_cpu_msr':
>> arch/x86/include/asm/resctrl.h:148:33: error: macro "rdmsr" requires 3 arguments, but only 1 given
     return rdmsr(MSR_IA32_PQR_ASSOC);
                                    ^
>> arch/x86/include/asm/resctrl.h:148:9: error: 'rdmsr' undeclared (first use in this function); did you mean 'wrmsr'?
     return rdmsr(MSR_IA32_PQR_ASSOC);
            ^~~~~
            wrmsr
   arch/x86/include/asm/resctrl.h:148:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/rdmsr +148 arch/x86/include/asm/resctrl.h

   145	
   146	static inline u64 resctrl_arch_get_cpu_msr(void)
   147	{
 > 148		return rdmsr(MSR_IA32_PQR_ASSOC);
 > 149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
