Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6682D2AD20
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751626965; cv=none; b=RX7sXVw4poaIyV3rUJ09NJHPuTUg4asks6n2pGu4KF7Mt6Zb8jOoVqZIs6tdsRV5GIhfIqWnvHKNChxRWfoY19qaYHcmqvEHpZ/ad2UQRHi9w5xiI3pEp25apmf/oV6CTX39Fqx9Z4k2BeHgwmKN0N+idsadSD80I11Cf61g2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751626965; c=relaxed/simple;
	bh=2WY+1qiegW/0O5P9cNs/w9jIBAMDxrgF4RkyOaNKurk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1UfWUJHpvLHHZvkA9VxWSwrHWoUHVt+IXKcQsiSQ3a+ymjFLW9bkxhnvtezO+hCnjBc4sgnGA0QsmMdBsEOVCrTM+zviZ5sibZ+FPPiN9AZF9mTwlcSjUv7uR0s5S3VU1+K4DtuX+VbLZO9BBe/n9CvQXTUdoi2jtvnyGfCaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhyEWsa2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhyEWsa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751626963; x=1783162963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2WY+1qiegW/0O5P9cNs/w9jIBAMDxrgF4RkyOaNKurk=;
  b=FhyEWsa2+aPr8o+Ms5oWTRQZocrX0DdkiLZ6asEHRJUSWI9C7/RvW+5t
   z9pkatZN1l+6DyWb7vCKoTNI3Ed0IFb3pi+YtlZ/ztWT7C80vHLoqxhQ2
   L8+uKZtvX3zf5xhpV5CAcrXoRiyepvnBTzS23CpzVcjMuklgAO1WSGBCm
   714UhdPejKImHmAJ2NPlDALeHUcfI1sH/NlJ7i5EbYXqLnJtWUxtQeC2F
   gzKeas+mW1Tu9SlS2vSHuChK6mdOZzXzpc6r/+jHPWHfB61wTora8ji0w
   WNq2wgzRjW+ow7aRT4+qkOoKO10Tg3G1dvnpDXJuOKxm90GGuhrk1Unoy
   w==;
X-CSE-ConnectionGUID: xWT7tJejTaqUhwO8Wx0dHA==
X-CSE-MsgGUID: nDI/iWMZSoSQAPj9Q/nKzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76508695"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="76508695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 04:02:43 -0700
X-CSE-ConnectionGUID: cec6iDqtRveFuRAwO+kpYA==
X-CSE-MsgGUID: AGkolEJBSSO/AvrG38goFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154260169"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jul 2025 04:02:42 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXeBj-0003d3-2z;
	Fri, 04 Jul 2025 11:02:39 +0000
Date: Fri, 4 Jul 2025 19:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/sched/core.c:1660:7: error: 'struct sched_entity' has no member named
 'avg'
Message-ID: <202507041822.oUTpdIMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   57eaf09d30ceb65be00c907370420547a7992943
commit: e0515f89730a8597730e11f244a80d37c7970d4a [1/1] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: arm-randconfig-003-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041822.oUTpdIMz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041822.oUTpdIMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041822.oUTpdIMz-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:1660:7: error: 'struct sched_entity' has no member named 'avg'
     p->se.avg.util_guest = attr->sched_util_min;
          ^


vim +1660 kernel/sched/core.c

  1656	
  1657		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1658			return;
  1659	
> 1660		p->se.avg.util_guest = attr->sched_util_min;
  1661	}
  1662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
