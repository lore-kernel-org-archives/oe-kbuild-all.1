Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5164E28E3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675864988; x=1707400988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItTbFCWdD1WXmdCV/j7kxh5mLwZaiKOjye4ROFUOw1Q=;
  b=MXwdaNyetpMEYtwuw/Y+mj6XpICrtJrcnAk5KbXlVe0vCa1rbvNTbXpL
   87rucUDcarx/hgBXakgOxsRW1C10pAGzXsYt0qIVS9pXeCrbvE0luS8Ev
   xxKIS665SoE7hL18nuwZ7LjLZmH0Eh1a/jCj1U/SPoc1mf4HailICKlDi
   A5OpwznEOIQV71Uhsegx+tvBesFoWfHBagie7iV9zagO00PxwzGVkX/Pn
   QPQSluEkuv02qKb3dvvz9By5+d2aABTqdFDRXqPb9VdMirKS3p1sEB1co
   OHBCDogiUWfD0kTJI3e1nb3My4lvyDugz1SzMjr2B48/2AuvPwBWLOFnQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="317803758"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="317803758"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 06:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="667246121"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="667246121"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Feb 2023 06:03:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPl2P-0004UA-1Z;
	Wed, 08 Feb 2023 14:03:05 +0000
Date: Wed, 8 Feb 2023 22:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 8/16]
 arch/x86/kernel/cpu/microcode/core.c:395:18: warning: no previous prototype
 for 'apply_microcode'
Message-ID: <202302082104.zO1Fh9ZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git ucode-for-ashok
head:   01bd4486138ec018e1bb204d93e4e52190dfde21
commit: 88b8da34648a29f5a371e20ffe9b4dcc1d83c076 [8/16] late-ucode-apply-microcode
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302082104.zO1Fh9ZW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=88b8da34648a29f5a371e20ffe9b4dcc1d83c076
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout 88b8da34648a29f5a371e20ffe9b4dcc1d83c076
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/microcode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'update_microcode_version_cache':
   arch/x86/kernel/cpu/microcode/core.c:383:19: error: too few arguments to function 'microcode_ops->get_microcode_revision'
     383 |         u32 rev = microcode_ops->get_microcode_revision();
         |                   ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c: At top level:
>> arch/x86/kernel/cpu/microcode/core.c:395:18: warning: no previous prototype for 'apply_microcode' [-Wmissing-prototypes]
     395 | enum ucode_state apply_microcode(int cpu)
         |                  ^~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_init_cpu':
   arch/x86/kernel/cpu/microcode/core.c:581:22: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     581 |         microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
         |                      ^~


vim +/apply_microcode +395 arch/x86/kernel/cpu/microcode/core.c

   380	
   381	static inline void update_microcode_version_cache(int cpu)
   382	{
 > 383		u32 rev = microcode_ops->get_microcode_revision();
   384		struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
   385		struct cpuinfo_x86 *c = &cpu_data(cpu);
   386	
   387		uci->cpu_sig.rev = rev;
   388	
   389		c->microcode = rev;
   390		/* Update boot_cpu_data's revision too, if we're on the BSP: */
   391		if (c->cpu_index == boot_cpu_data.cpu_index)
   392			boot_cpu_data.microcode = rev;
   393	}
   394	
 > 395	enum ucode_state apply_microcode(int cpu)
   396	{
   397		return microcode_ops->apply_microcode(cpu);
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
