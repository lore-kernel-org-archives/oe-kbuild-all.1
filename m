Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51411FDA92
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763865331; cv=none; b=RsioA4j/dT673kM7QDMRiLiBVP8uT+iPdzdjBeg0+BWZ50zOUrQaf/KXr0Y43eNOXxEJEMeVgbOTrx6549VacIv9W5L9o7P2u43tLkbRCot7Lm/MWFs10f8txoQrmmd5+ZJedGdz7YVFhtKfMK3tYFmJDN2XP0J61NDWHRECP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763865331; c=relaxed/simple;
	bh=9FgCXthz7jihQ+fD5usOU+0PSm5g2GAgF1q/ikVt6go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwCquEWBoDXqIQcMoTK3dBU1HIEPHS1FuSpv/f86h9t0PwEaX2xfv0QIO9iDwnZa7Tx4eXbC1FLPTMC1bY7P1AHwYSB15+7xO/KuPBT04sVH7ZI0pCZTLHb5CiiBsUczTHN2OuItkRXufZwjy9IiVXJvbp6BH/5DRH/ZpEOyVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBpznRv/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBpznRv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763865330; x=1795401330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FgCXthz7jihQ+fD5usOU+0PSm5g2GAgF1q/ikVt6go=;
  b=WBpznRv/4zHd/NiMzR7vlGyk38liYg2NIwRi98Vy0R0bq37lB+Fpb96Z
   XgOOk0m29nu8WzTZWNw4tIZcE+BEzXdenBtV2WXr9wKU48eF6Ph2h7rtJ
   2r+oFafn9e7b15nbeyxUUZe3tQUZ0EnKNTR+rqGroIGnLYKIO5U7CYh6C
   EubvFlEQl/CzW6A4WzmoFkdefFsKX9a7/HraGDOjZXW5ZyeF62SSUHtVh
   wc2kljlQiMobHBCKNwF28MqvEar2cucwYlnhwW3n9l9cpUmaTqq/JXWaR
   V6Ds22mAfQ16Q60nFTD/7Erkp2f0KoW839KFfBvfxvhFJ6keW7WaF/M+g
   A==;
X-CSE-ConnectionGUID: 6LC19ZHCSjm+Lr2IRNOu/A==
X-CSE-MsgGUID: /iDPn+RuSFKLpbOqtRFLYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76239367"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="76239367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:35:29 -0800
X-CSE-ConnectionGUID: XB8q/iTMR+yEO1253eChDw==
X-CSE-MsgGUID: BMmWg+snTCKfBuhnWkYuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192796380"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 18:35:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzwj-00080F-23;
	Sun, 23 Nov 2025 02:35:25 +0000
Date: Sun, 23 Nov 2025 10:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Dittgen <mdittgen@amazon.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/13] KVM: arm64: Implement vLPI ENABLE ioctl for
 per-vCPU vLPI injection API
Message-ID: <202511231019.9HQooAqv-lkp@intel.com>
References: <20251120140305.63515-6-mdittgen@amazon.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120140305.63515-6-mdittgen@amazon.de>

Hi Maximilian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[cannot apply to kvm/queue kvm/next tip/irq/core linus/master kvm/linux-next v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maximilian-Dittgen/KVM-Introduce-config-option-for-per-vCPU-vLPI-enablement/20251120-221612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20251120140305.63515-6-mdittgen%40amazon.de
patch subject: [RFC PATCH 05/13] KVM: arm64: Implement vLPI ENABLE ioctl for per-vCPU vLPI injection API
config: arm-randconfig-003-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231019.9HQooAqv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231019.9HQooAqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231019.9HQooAqv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:40,
                    from drivers/irqchip/irq-gic-v4.c:10:
>> include/uapi/linux/kvm.h:15:10: fatal error: asm/kvm.h: No such file or directory
      15 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +15 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   4  
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17   8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  10  
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  13  #include <linux/compiler.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  14  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @15  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
