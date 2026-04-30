Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141D331A76
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518458; cv=none; b=Votcj8Eo6ZPcULCPKu7HcrQP/2zD7kUKnApP7Fds8NQ+HO/foPqL9Db9MZzHybgZNDrLHAlDD0xJIoX01pDTyLCp6OUO//m2uDpQAkkFITZDAfc3mxgcGuYCNE/qh/UKdbrg6rGo+2gHRiGnAYt2OjnjueeP4vhx4mh0ggR4Q28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518458; c=relaxed/simple;
	bh=u2VlrUPVBUnzaWloJk9ky0BKD9EKlTnoSGKFrpV3GSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyVpCPRjlOW7EapJXhoDDhpUgtE2OhKPU09Zj+T8DEju1s8p2WeplypUrnau+dniGJIH8QBQbCiAd0DmI9dqLI9RZFjTUjh+3+2u7uDiNbHXyFVd89RV57glWJsIA/qE54mnkEME5RaqFYHLgtDKXvjdLjsk1rtM/kgDAcxoMhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1xlXiuC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1xlXiuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777518456; x=1809054456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2VlrUPVBUnzaWloJk9ky0BKD9EKlTnoSGKFrpV3GSw=;
  b=m1xlXiuCPxPdkRUayeCTf+g4IBhIE8JDg9SMVa2i3lzEOL8fCdEjmHtr
   /QFI2h0/wieW1fLzbRzOq0gZVJ+SkrJdzOrY0DL+6HMaqdBcy9FqPtGIu
   eMqq2HYc6/GmfeDD8JV2jWFwBe1TaTBBsnqNfcXDdttbAoRMCpl2+ivaW
   be8YJu/tg8J/qbbu4vzOTWw4D6HzyA5TXWh0WPmWTPEQ3PuGrMpWb7svP
   a6mRETV+Wj5Y1xIPLFiAyY7LXVovfKKAMm7vo4OYwFygDR36v4NbwpkVW
   V3Uadoley7RbH+7QP49WmRoX1eilabBzCqtTOSmTAi6c5Az8i427s4AfY
   w==;
X-CSE-ConnectionGUID: Z01C3rQCTwiUqUIIeOL8Vg==
X-CSE-MsgGUID: jnAFh5TQSbOyHwtZx2mQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65992132"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="65992132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:07:36 -0700
X-CSE-ConnectionGUID: /QrqABKOSEKIRgItJVk1JA==
X-CSE-MsgGUID: HVjXfoN2TMi1n0Fbe4E5tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234480762"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 20:07:34 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHkR-00000000Brw-2wud;
	Thu, 30 Apr 2026 03:07:31 +0000
Date: Thu, 30 Apr 2026 11:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: a <osalexandeko@gmail.com>, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	a <a@js-host.myguest.virtualbox.org>,
	Alex Kazansky <osalexandeko@gmail.com>
Subject: Re: [PATCH] [PATCH] drivers/misc: dummy-irq: use pr_* logging helpers
Message-ID: <202604301104.37n6lDbO-lkp@intel.com>
References: <20260419040308.4239-1-a@JS-Host.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419040308.4239-1-a@JS-Host.myguest.virtualbox.org>

Hi a,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next staging/staging-testing staging/staging-next staging/staging-linus linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/a/drivers-misc-dummy-irq-use-pr_-logging-helpers/20260426-190343
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260419040308.4239-1-a%40JS-Host.myguest.virtualbox.org
patch subject: [PATCH] [PATCH] drivers/misc: dummy-irq: use pr_* logging helpers
config: csky-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301104.37n6lDbO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301104.37n6lDbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301104.37n6lDbO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/dummy-irq.c:17:9: warning: "pr_fmt" redefined
      17 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/misc/dummy-irq.c:14:
   include/linux/printk.h:401:9: note: this is the location of the previous definition
     401 | #define pr_fmt(fmt) fmt
         |         ^~~~~~


vim +/pr_fmt +17 drivers/misc/dummy-irq.c

  > 17	#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
