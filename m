Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9E9DDC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 01:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775869485; cv=none; b=P2DcTlN5FDJgI3fmOpbjg9Wh6IHkSkpV9nTvKGmg8e9HOJppiaFmS8KqFDtN2z039Cd0W2Jp+ZRQgL4muDnCpNZogN9BQ8Yo0p7uTd0zd24NmeTjd24h/h0NWrQhYidi7sFg6Joem9RcD2rPEZTk5JGrISXC0jVUIt64gnQX2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775869485; c=relaxed/simple;
	bh=qvByuA8Lzw6hvBh+Du+pbp4J3doy5sm96QIdLEnbSfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=geXlEAOOXoBcEdiaJfXNUDIB7kd7NA5ipAt1uv0/EBSMj5VnCQ+lFFY3/ptIoDmWgQlIIoa59to5xtSiJ9pY4OPpxvvoNLpRh3e2rwbQbnW/k9avKW42WlgpvI4m+KZfneMBvVvLraKR95V6h2jVPEsHU9dKrwP3aPox/MZIK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOy67/fg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOy67/fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775869483; x=1807405483;
  h=date:from:to:cc:subject:message-id;
  bh=qvByuA8Lzw6hvBh+Du+pbp4J3doy5sm96QIdLEnbSfk=;
  b=AOy67/fgYEBxE47Vkwufg4r7/M7Yckj8Blje0fVR1reNYZmu+2gDke7W
   /SVcyZcdppj6F6/+x8smkL+am7No+G7tZXtaObfVLpeQ33W/+OgBL06Nj
   SylKiJ6BoZvuFexs9pEwBtbtFReZxV0s6w0MqtjmvwgH71X1EbkFnThfQ
   hMEASPmedAG+SdIZf6LTc60bk3gJ6ByTuQkMmrCy3VsQ0KukcC/u5PaGK
   5atNRhKt45An8//PN/G+XWyYVvnaU0RLZxYpliqhDAWMcMRwYaIrv1+fP
   CieciqPdTvvhZqj+IdsA8tpOFc1bukZpZc7FzIFRO9RQblBnwBQneeqyZ
   w==;
X-CSE-ConnectionGUID: rrJpbDRNS+2CzurItRViYg==
X-CSE-MsgGUID: dxEl+9cAQwSYls8eoiII1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79479660"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="79479660"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:04:43 -0700
X-CSE-ConnectionGUID: W1JQFFaWRdGHylxu/Lzugg==
X-CSE-MsgGUID: SjCJslyUTHmd5PB0tlAHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259715563"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 18:04:41 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBMm7-000000000Yv-1972;
	Sat, 11 Apr 2026 01:04:39 +0000
Date: Sat, 11 Apr 2026 09:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 1/38]
 include/linux/compiler_types.h:44:10: fatal error: asm/percpu_types.h: No
 such file or directory
Message-ID: <202604110856.jUoymOW2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: bd0087d97e3a6c9fc7d4ecc5e9c7e2e3bf704d9e [1/38] percpu: Sanitize __percpu_qual include hell
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20260411/202604110856.jUoymOW2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110856.jUoymOW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110856.jUoymOW2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/include/shared/skas/mm_id.h:9,
                    from arch/um/include/shared/os.h:13,
                    from arch/um/include/shared/longjmp.h:6,
                    from arch/x86/um/bugs_32.c:9:
>> include/linux/compiler_types.h:44:10: fatal error: asm/percpu_types.h: No such file or directory
      44 | #include <asm/percpu_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +44 include/linux/compiler_types.h

    43	
  > 44	#include <asm/percpu_types.h>
    45	#include <linux/compiler-context-analysis.h>
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
