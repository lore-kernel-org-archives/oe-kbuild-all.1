Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0C7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685351085; x=1716887085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CS+64cfGMkifnvf19CsNASk9Hl347b/hzZ7/jaFoKSQ=;
  b=S751bVx8BvNx9Z5wP7ERTfHh7w3a/loITWBwQJlkdNWeF9OxpaZRXl7q
   a7FJjfL96q5wiR6+fY2rcTUbebW6BqDEmd9AsLOwVTrmH1CLOvJhQe5YA
   MVzo7BdxsZHxMGeP9P9LJsS8zmPS+Iq9WQenmmxexjZFvejXyprkbBsJe
   xNGQVqJn1x+fcEOHwFt3s2ZZw1jXSCo/zeLJCEVzV8cAjCIMSXRiTo6nH
   DPnLFtePNTjB8k5z/cxZu3RpmOSN6/rIkk61qoFjot8pTJzQUwSG03Hpc
   UVj9E87n0hfyCpGTEaSuvkyA3+cPLfE3jV914GGx4qBmGUljOx7LATb24
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="418144392"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="418144392"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 02:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="709186687"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="709186687"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 May 2023 02:04:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Yny-000Kx8-16;
	Mon, 29 May 2023 09:04:42 +0000
Date: Mon, 29 May 2023 17:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/6] ALSA: emu10k1: actually disassemble DSP instructions
 in /proc
Message-ID: <202305291658.Q6wZncPQ-lkp@intel.com>
References: <20230526101659.437969-4-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526101659.437969-4-oswald.buddenhagen@gmx.de>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.4-rc4 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-hide-absent-2nd-pointer-offset-register-set-from-proc/20230526-182102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230526101659.437969-4-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 3/6] ALSA: emu10k1: actually disassemble DSP instructions in /proc
config: x86_64-randconfig-s021-20230528 (https://download.01.org/0day-ci/archive/20230529/202305291658.Q6wZncPQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/13e0e28f29ed98ae73420158c2a879c4e32c694a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/ALSA-emu10k1-hide-absent-2nd-pointer-offset-register-set-from-proc/20230526-182102
        git checkout 13e0e28f29ed98ae73420158c2a879c4e32c694a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/pci/emu10k1/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291658.Q6wZncPQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/emu10k1/emuproc.c:294:21: sparse: sparse: Using plain integer as NULL pointer
   sound/pci/emu10k1/emuproc.c:316:21: sparse: sparse: Using plain integer as NULL pointer

vim +294 sound/pci/emu10k1/emuproc.c

   282	
   283	static const struct emu10k1_reg_entry sblive_reg_entries[] = {
   284		{    0, 0x10, "FXBUS" },
   285		{ 0x10, 0x10, "EXTIN" },
   286		{ 0x20, 0x10, "EXTOUT" },
   287		{ 0x30, 0x10, "FXBUS2" },
   288		{ 0x40, 0x20, NULL },  // Constants
   289		{ 0x100, 0x100, "GPR" },
   290		{ 0x200, 0x80, "ITRAM_DATA" },
   291		{ 0x280, 0x20, "ETRAM_DATA" },
   292		{ 0x300, 0x80, "ITRAM_ADDR" },
   293		{ 0x380, 0x20, "ETRAM_ADDR" },
 > 294		{ 0x400, 0, 0 }
   295	};
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
