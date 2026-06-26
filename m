Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E336A35C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782501874; cv=none; b=NHGNxUqM2ZdXnyl4MoVkjP3DWPIy+ll1VfO8QCjk/ukXIKhRk18C+aFul6VQdHj1aktZGHir0lbohd5YRah9p5nhdJ/INE+VZOuf9b0UroiCeJql5J/v6eRjXelpyCjiGbMV7+ArqOyPkbW2pa2sxVoK8RSnGn7rMr4RKMw0yQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782501874; c=relaxed/simple;
	bh=/mOgjXKhCTOJ+8cep4DXcim/VxiN76QhX0LHM6SrElA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zq59xfuapFB/16GpNo0PKncntFKulK1EYMYlfhMKj2K5FIKnv16vMS+PYDvBOlIRBkslL8mnaLw6RNZBKXcosO6Ea7ZVvGoppWxXD0eM+p58RB2ydZsFEhh/CHrdv11JRIEnj/SWr4c4OV8CEJpNx7YVvDaCmdG4ANQPF2DN3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4x6sQTz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4x6sQTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782501873; x=1814037873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/mOgjXKhCTOJ+8cep4DXcim/VxiN76QhX0LHM6SrElA=;
  b=E4x6sQTz65JIsRGBRKcsXHyTqxhy8SVeoshaLWZI9g4KT2vSfwWn+2+T
   7IRpKocCmtSEoE6pJX3AjbQZO9mhAWBjW9HqNycPor/UZnm6d15jGArbg
   /6bK8KWmy6gY2O0T0/oRZ5n6PfWubj9nuB2PwkCZn2KUUIopxX0oFPJQi
   6GhxFJ9AErxzPr2xXodJsaok7D5j3fs3hYDXmJN/9uX0TmDTt0PU1ySKE
   /uK+gVvnQsc4E1jykpNGsA2De+M2IWS1x0IGrXLiXA7o6uKe3TwwGJmDw
   3IOU/uinVgNY3qOetEud6QuV8+NyzyrtMpw4gW6jR4ww0UQYL0BviWSeV
   Q==;
X-CSE-ConnectionGUID: S11elZ74R9GwjiKtAtvsVA==
X-CSE-MsgGUID: tyxhvNbIRy6mz9RStYJFtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83441228"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="83441228"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 12:24:33 -0700
X-CSE-ConnectionGUID: Ld6o23L1RxiDXuUpFnia5w==
X-CSE-MsgGUID: faeTq+FdQoaJlSSjz9fHJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="253300559"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2026 12:24:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdCA9-000000005NF-0TvE;
	Fri, 26 Jun 2026 19:24:29 +0000
Date: Sat, 27 Jun 2026 03:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 5/5]
 include/linux/hrtimer_rearm.h:79:24: error: unknown type name 'bool'
Message-ID: <202606270323.GqmH4GyF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   0fffc8fb3ee52eaf84481a67834faa5bb8b482b0
commit: 0fffc8fb3ee52eaf84481a67834faa5bb8b482b0 [5/5] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260627/202606270323.GqmH4GyF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270323.GqmH4GyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270323.GqmH4GyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/hrtimer.h:15,
                    from kernel/time/vsyscall.c:10:
>> include/linux/hrtimer_rearm.h:79:24: error: unknown type name 'bool'
      79 | static __always_inline bool
         |                        ^~~~
   include/linux/hrtimer_rearm.h:1:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
     +++ |+#include <stdbool.h>
       1 | // SPDX-License-Identifier: GPL-2.0
   include/linux/hrtimer_rearm.h: In function 'hrtimer_rearm_deferred_user_irq':
>> include/linux/hrtimer_rearm.h:80:97: error: 'false' undeclared (first use in this function)
      80 | hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif_mask) { return false; }
         |                                                                                                 ^~~~~
   include/linux/hrtimer_rearm.h:80:97: note: 'false' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   include/linux/hrtimer_rearm.h:80:97: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/hrtimer_rearm.h: At top level:
   include/linux/hrtimer_rearm.h:81:24: error: unknown type name 'bool'
      81 | static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void) { return false; }
         |                        ^~~~
   include/linux/hrtimer_rearm.h:81:24: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   include/linux/hrtimer_rearm.h: In function 'hrtimer_test_and_clear_rearm_deferred':
   include/linux/hrtimer_rearm.h:81:82: error: 'false' undeclared (first use in this function)
      81 | static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void) { return false; }
         |                                                                                  ^~~~~
   include/linux/hrtimer_rearm.h:81:82: note: 'false' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'


vim +/bool +79 include/linux/hrtimer_rearm.h

15dd3a9488557d Peter Zijlstra 2026-02-24  74  
a43b4856bc0396 Peter Zijlstra 2026-02-24  75  #else  /* CONFIG_HRTIMER_REARM_DEFERRED */
a43b4856bc0396 Peter Zijlstra 2026-02-24  76  static __always_inline void __hrtimer_rearm_deferred(void) { }
a43b4856bc0396 Peter Zijlstra 2026-02-24  77  static __always_inline void hrtimer_rearm_deferred(void) { }
a43b4856bc0396 Peter Zijlstra 2026-02-24  78  static __always_inline void hrtimer_rearm_deferred_tif(unsigned long tif_work) { }
a43b4856bc0396 Peter Zijlstra 2026-02-24 @79  static __always_inline bool
a43b4856bc0396 Peter Zijlstra 2026-02-24 @80  hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif_mask) { return false; }
a43b4856bc0396 Peter Zijlstra 2026-02-24  81  static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void) { return false; }
a43b4856bc0396 Peter Zijlstra 2026-02-24  82  #endif  /* !CONFIG_HRTIMER_REARM_DEFERRED */
a43b4856bc0396 Peter Zijlstra 2026-02-24  83  

:::::: The code at line 79 was first introduced by commit
:::::: a43b4856bc039675165a50d9ef5f41b28520f0f4 hrtimer: Prepare stubs for deferred rearming

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
