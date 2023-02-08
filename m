Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4103A2560
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675862466; x=1707398466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=odFHJElDA74IUmDliH3bUtLz25BTFPje1lbaU8RuEXY=;
  b=BFf7WWipKyCfLW1ydeAVltXLGCJuOAQcbbc67+Qng7MYm8jZAKlVL3CR
   QbfzuNer6DcQpBY2MiRzLZqnnbriWelIWYkswx/xmiAV3dCb9yWkSyGKz
   eZh8QBRgb2vaKNSftVtvbIWX9ugLchfEiNzLWZmUJxB6hVa28dsDCzMRQ
   iICNWiPS2g6izUNUYedtaEZs3atdBOd6XRc1ZE2dAmkv/kBy0efJw6VGm
   GP2lOKTb+m/NOkd0vsygXVqQ5NuSiyVLmvy+O2+x3z9jnmtFDDhzr/N8q
   SejlFb+BrVDe90s5WPFy2bgL/2jY/erwRh9ThgW2VLxIXcvtLaz2rdc/B
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309444768"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="309444768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 05:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="996136327"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="996136327"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2023 05:21:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPkNk-0004SY-0U;
	Wed, 08 Feb 2023 13:21:04 +0000
Date: Wed, 8 Feb 2023 21:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 6/16]
 arch/x86/kernel/cpu/microcode/core.c:383:19: error: too few arguments to
 function 'microcode_ops->get_microcode_revision'
Message-ID: <202302082123.3rfqz68t-lkp@intel.com>
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
commit: e98b502bf22e1e2bf60feb14c22eef59a70e866a [6/16] ucode-version-op-useit
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302082123.3rfqz68t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=e98b502bf22e1e2bf60feb14c22eef59a70e866a
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout e98b502bf22e1e2bf60feb14c22eef59a70e866a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'update_microcode_version_cache':
>> arch/x86/kernel/cpu/microcode/core.c:383:19: error: too few arguments to function 'microcode_ops->get_microcode_revision'
     383 |         u32 rev = microcode_ops->get_microcode_revision();
         |                   ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_init_cpu':
   arch/x86/kernel/cpu/microcode/core.c:576:22: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     576 |         microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
         |                      ^~


vim +383 arch/x86/kernel/cpu/microcode/core.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
