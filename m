Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED93719460
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln516RMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701178612; x=1732714612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJ9Pn7GCzs4O8oxUA7N3FdeyLvZkwkc1tJNo8CJGWFs=;
  b=ln516RMasErtaWwy+GR99xTn1uE9LXp+te9q81dhGHjdjqHWZA6ZC7TY
   N4n5XpMhdKOAplu5TVXxU7sVpodNsGivtZtwh2pW5x7CILBHpH36KcQkI
   8jV77Mj4IPhulMLtDuc6VQicoYo6FUQPMnqNpNOm0t5SrJyii1FvT7h47
   Fy7EpqchRpyQ2EwTjwkeJUdyEhagD9XpomCwKIe0ltpL55xtirIyCDtB6
   o+uEHUipLgErbd5KXARA1vSEmI7j08R1prij55I61q/shbSWlD2xzGcLX
   Tw3NYjRzVzExLVK87WYHx2OoqX2wm8XaBjPYQ0MPfOrA9tHLGjzVwFbW6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14484676"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="14484676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1100100561"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1100100561"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2023 05:36:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7yGc-0007bU-2O;
	Tue, 28 Nov 2023 13:36:46 +0000
Date: Tue, 28 Nov 2023 21:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Maimon <maimon.sagi@gmail.com>, richardcochran@gmail.com,
	reibax@gmail.com, davem@davemloft.net, rrameshbabu@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, maheshb@google.com,
	maimon.sagi@gmail.com
Subject: Re: [PATCH v2] posix-timers: add multi_clock_gettime system call
Message-ID: <202311282046.3hMwdKes-lkp@intel.com>
References: <20231127153901.6399-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127153901.6399-1-maimon.sagi@gmail.com>

Hi Sagi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on tip/timers/core linus/master v6.7-rc3]
[cannot apply to tip/x86/asm next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sagi-Maimon/posix-timers-add-multi_clock_gettime-system-call/20231128-000215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20231127153901.6399-1-maimon.sagi%40gmail.com
patch subject: [PATCH v2] posix-timers: add multi_clock_gettime system call
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231128/202311282046.3hMwdKes-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311282046.3hMwdKes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311282046.3hMwdKes-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1585:2: warning: #warning syscall multi_clock_gettime not implemented [-Wcpp]
--
   kernel/time/posix-timers.c: In function '__do_sys_multi_clock_gettime':
>> kernel/time/posix-timers.c:1458:1: warning: the frame size of 2004 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1458 | }
         | ^
   kernel/time/posix-timers.c: In function '__do_sys_multi_clock_gettime32':
   kernel/time/posix-timers.c:1489:1: warning: the frame size of 2004 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1489 | }
         | ^
--
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1585:2: warning: #warning syscall multi_clock_gettime not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1585:2: warning: #warning syscall multi_clock_gettime not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
