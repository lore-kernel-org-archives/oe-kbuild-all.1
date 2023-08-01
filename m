Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3F63D0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690873662; x=1722409662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E0wF9lS+jTbZs7c8WWkC/juC7G/VBndmP7qMKXsmwTA=;
  b=hsepEX0u+/eCs+aq5Y9bTKepVAlEckBqPb8e+Nea+9lOmh5oZJ/Dqm00
   bE37l/LAPzsmpNAWvDF1cfFEcpJsTqkWGliZ2nXC8HetIBX2s8i2k83rE
   qT42NFS69CDofha1VvPGIPot2mQGReYQvUPEtux/IoNnZNjn7s40fY8A/
   TRdQIydfaJC7PLiJoBAZEZlceM1uLNT7gpZODK0JQp9q2iD6sEHHFDO/M
   o8ZQqn/b7P+X5JK0CNf/hbIJFhyLWIe6T5a/29m8+rC56JGkKXcoVV+en
   r67u6N1qQ9yRAkOgFI5tUKNN0rPSyW99DuHl31fylpz4fT9ldiIfpsqby
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359263189"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="359263189"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975163099"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="975163099"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 00:07:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQjTn-00003r-2H;
	Tue, 01 Aug 2023 07:07:39 +0000
Date: Tue, 1 Aug 2023 15:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO
 driver
Message-ID: <202308011443.tZoz3kyF-lkp@intel.com>
References: <20230731122323.172834-3-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731122323.172834-3-tmaimon77@gmail.com>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-binding-pinctrl-Add-NPCM8XX-pinctrl-and-GPIO-documentation/20230731-202616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230731122323.172834-3-tmaimon77%40gmail.com
patch subject: [PATCH v4 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308011443.tZoz3kyF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308011443.tZoz3kyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308011443.tZoz3kyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1317: warning: "DS" redefined
    1317 | #define DS(lo, hi)      (((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
         | 
   In file included from arch/x86/include/uapi/asm/ptrace.h:6,
                    from arch/x86/include/asm/ptrace.h:7,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:5:
   arch/x86/include/uapi/asm/ptrace-abi.h:14: note: this is the location of the previous definition
      14 | #define DS 7
         | 


vim +/DS +1317 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

  1316	
> 1317	#define DS(lo, hi)	(((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
  1318				 ((hi) << DRIVE_STRENGTH_HI_SHIFT))
  1319	#define DSLO(x)		(((x) >> DRIVE_STRENGTH_LO_SHIFT) & GENMASK(3, 0))
  1320	#define DSHI(x)		(((x) >> DRIVE_STRENGTH_HI_SHIFT) & GENMASK(3, 0))
  1321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
