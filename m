Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2914C597
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712842062; cv=none; b=VbnHKvgxwb+6f6UwKe4sIXmXSq28artiMdxaD7NX/rZ/b62YC3vWftemWY9dnVUHwpaCc1bM++6jc+C8BPMc6nBip5NAsbFTllQxYScuAUglx7dmcEM8ckRWgJ6FjF20aIjpffJ2oMTu3jXrOuaLwLlbDrEdOM8xSUp916jusRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712842062; c=relaxed/simple;
	bh=3MvBHLOnMEDaLFNVEg8C6nkokI2G7dgYUu5z6GQp520=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoX+7tTgYs3EB+eZ43Y4wiSgKwRAeXjwel7ywgT2M73seKey4feHlY4V/Tyeetv6yuQZl7L5bMgA3T3tBgL/Lv43DmCz/L7E9ds79O/af912nfsOhbEIpbNMWb4XYs4c5EFz2bg9lqWxLOaYpOMc92KeCo7Q0FVvt7hqK/XubPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjv5s3W8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjv5s3W8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712842061; x=1744378061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3MvBHLOnMEDaLFNVEg8C6nkokI2G7dgYUu5z6GQp520=;
  b=mjv5s3W81AEQyybCXPK3mPi1wfnnfRocslT2hzNZ4EfntjEDs0XMLjXh
   5MOdFLH/u1GwyzRBm3hDd8JEIYLHkF0a91BgoS7v8cRE7ibmaLBNkK7NV
   qlC5QECUTVKGnDRIiPPr63HbNI3xOiGG52xNymOsbW3mD1fonwl9HE5Jt
   36NnOshJZ+nTeEYkTFb199gJ0bl8YpYf5UMK8zbQOyiHtSa9PUtsVC98Z
   wd9COMsmtunXO1a/1m56seUL2GEXQoHmYjHIpQemUPLmKCOy5s0zeMQ4z
   scjTj3fhBc6PTDFlc2b/JqVmyXFRX3o13BqanMghb7f40HynnJjlP1hry
   A==;
X-CSE-ConnectionGUID: 5Lzbu0w7QBi6lxMKiS4Gkg==
X-CSE-MsgGUID: qfraRjgXRziDAo46cB8usQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12027942"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12027942"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:26:39 -0700
X-CSE-ConnectionGUID: lkOTYvZ/Sn6SuUGQm5hM3Q==
X-CSE-MsgGUID: IJ32ZfV2TCmh4QKDxPtFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="58321048"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2024 06:26:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruuRh-0008e7-17;
	Thu, 11 Apr 2024 13:26:29 +0000
Date: Thu, 11 Apr 2024 21:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zayd Qumsieh <zayd_qumsieh@apple.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Miguel Luis <miguel.luis@oracle.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Christoph Paasch <cpaasch@apple.com>,
	Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Baoquan He <bhe@redhat.com>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Joel Granados <j.granados@samsung.com>,
	Dawei Li <dawei.li@shingroup.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florent Revest <revest@chromium.org>,
	David Hildenbrand <david@redhat.com>,
	Stefan Roesch <shr@devkernel.io>, Andy Chiu <andy.chiu@sifive.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Oleg Nesterov <oleg@redhat.com>, Helge Deller <deller@gmx.de>,
	Zev Weiss <zev@bewilderbeest.net>,
	Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH 3/3] tso: aarch64: allow userspace to set tso bit using
 prctl
Message-ID: <202404112107.DRkoPR2Y-lkp@intel.com>
References: <20240410211652.16640-4-zayd_qumsieh@apple.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410211652.16640-4-zayd_qumsieh@apple.com>

Hi Zayd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.9-rc3 next-20240411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zayd-Qumsieh/tso-aarch64-allow-linux-kernel-to-read-write-ACTLR-TSOEN/20240411-061830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240410211652.16640-4-zayd_qumsieh%40apple.com
patch subject: [PATCH 3/3] tso: aarch64: allow userspace to set tso bit using prctl
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404112107.DRkoPR2Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112107.DRkoPR2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112107.DRkoPR2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:805:5: warning: no previous prototype for 'arch_set_mem_model' [-Wmissing-prototypes]
     805 | int arch_set_mem_model(struct task_struct *task, int memory_model)
         |     ^~~~~~~~~~~~~~~~~~


vim +/arch_set_mem_model +805 arch/arm64/kernel/process.c

   804	
 > 805	int arch_set_mem_model(struct task_struct *task, int memory_model)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
