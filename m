Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4D2367D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125618; cv=none; b=TA40hKs3RzguiN76edQ/0RkbmEKxMaeEGPSZWSGZBA7bBuzaXg2cbH0lLcYVQUNaun3vIJBtruMfCLxOn8Wr2wM1kgJpQuK5EAVjiruTBd26ePpgkiyuyEZBaLqX2fPbeKZd8RPh5MYPETi3r9wPM6QKBFnuKtJK8DaXAORrB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125618; c=relaxed/simple;
	bh=vSiVc1FEG2yPxQwTvgN9s5HUsmXxMvkDVTsJO7R5Vwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MBz/xcmAYKWkgcarquRf/VVDrBUlahU7QNua91DOBrU4txJk8k7951SCYWB2UtBuHL+Uw/zSvKO9xR5WF8zfRTd+ppfOFzaRxBR2we1JBRzUHM+zZQfiF471bqdIP6yrHpHHuC2B+W79wFdSpujW6AyXgNNCYjf1gXjnF59tsxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0sOXCvZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0sOXCvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779125616; x=1810661616;
  h=date:from:to:cc:subject:message-id;
  bh=vSiVc1FEG2yPxQwTvgN9s5HUsmXxMvkDVTsJO7R5Vwk=;
  b=a0sOXCvZqDw+7OxZQ+A77HYjCcXF741zk8EuP73zNcH6CN8LcwhqYYRm
   4/zHBxcv8AR+O+Ljralaeluow16MsfQIhAUi+GygzbDV41dVKdlqDjg09
   6ekVlp2qiR4c7CygG6yw/0bSJiE6KVb2TZVoLNUm5G4IcMK2rDjQxCHcy
   8bAlA2gxBL19xffdWbmnTq6g1XoIBNi6oaDtv38hkEAw7RnrDoCztvSTj
   neCeWYhHsXDc65GmP1NeTh/R5BgMz2n9tYfsCl5EJQMlGg7XSDWtaDtOS
   qM/J4YxPdS6ldW7Ja8yf/AhBy7gMZDCMlnuNpqfYiFnv0w3Y/ZWZfDufU
   A==;
X-CSE-ConnectionGUID: X/dLnZB8RmeiagcS8Z5quA==
X-CSE-MsgGUID: aUnfC5WJRAqtIRdO9Bddfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80161626"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80161626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 10:33:36 -0700
X-CSE-ConnectionGUID: pBN7u1rbS2S9FBIgT0Upmg==
X-CSE-MsgGUID: Ge0JK58CS664MIuiW5yk+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239752551"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2026 10:33:34 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP1qO-000000003CC-0Eq2;
	Mon, 18 May 2026 17:33:32 +0000
Date: Tue, 19 May 2026 01:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 1/15]
 include/linux/compiler_types.h:638:10: fatal error: asm/percpu_types.h: No
 such file or directory
Message-ID: <202605190145.hfzQP5jA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   2b2ed0b59c61d67712474679cd0dce58e983e656
commit: 0742d6b30874ad043eb39a7a1b9e96a296a70ce8 [1/15] percpu: Sanitize __percpu_qual include hell
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260519/202605190145.hfzQP5jA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190145.hfzQP5jA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190145.hfzQP5jA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/include/shared/skas/mm_id.h:9,
                    from arch/um/include/shared/os.h:13,
                    from fs/hostfs/hostfs.h:5,
                    from fs/hostfs/hostfs_user.c:18:
>> include/linux/compiler_types.h:638:10: fatal error: asm/percpu_types.h: No such file or directory
     638 | #include <asm/percpu_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +638 include/linux/compiler_types.h

   637	
 > 638	#include <asm/percpu_types.h>
   639	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
