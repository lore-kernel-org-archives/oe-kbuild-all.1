Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7BF2D3A6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434458; cv=none; b=IOWShT/BXSj3cSNNc6f8yh72ik4jvpda923eRCYoKvdqeTsnYZeGHR5DSmGazIRno795r5N1ObGug9xK9FofFFe5drHNYBo5ux+X6cvK502V1e7Or8DoVb0Iy5TuBH/CWYAOSDhlDWL3NybLqSK1N5g+WDzK3Ch5+4UxyVweWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434458; c=relaxed/simple;
	bh=HB6q6Zx5mOBujUOsBMfV/rOeFmq/1ii8asxoKAUsy0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwoYzACGRIEWQyV80f9VgDPq59sZg8l24BgCmXx0Xkag79v7mYUKhBZOPAGlOXSfWyY6sVylFFJfUyFDoDMouU/MiamhEgfgcT/9vO0M0rMTfyz8GtF5MjJqLWzOUcjysWZTxL8DT5QqysBoKNrocdYbOTKS9PrlcVtY3t2l9gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6VCjRPS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6VCjRPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750434456; x=1781970456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HB6q6Zx5mOBujUOsBMfV/rOeFmq/1ii8asxoKAUsy0o=;
  b=H6VCjRPSG9fa+i7tr4zIIAoxLQLOQXRwVKXpz7AqFpH/IdkiPGpiBIKK
   8v0xmm0U/qpXFKJ6pT0iv8IoJsTodR6uEhd9gX90q+LSxMBErjrPDewXL
   Varzmb3DCkSzo9oopS5K3+pRoi8ruB03uE8shjd4FldZCqQREpRTHTftC
   5I4KG8JyXq8Z20LgbmkS0dwurrJ37MA7aU6oUpSThcJGg8IlZzPzMUkLQ
   keXr50IcvDoVzItvBL0hwRKBDcggrk8ZOa92yjEAnhqPAX1YMpn1sw1Gh
   UHw4ssX+DwTH8QI5APinZTIix594IdG6YCdqUYlYnnAfiU/anEbs1bMPo
   A==;
X-CSE-ConnectionGUID: Zfu30IxmRLKDqG4kcH96Dw==
X-CSE-MsgGUID: f3Nzr2C+TyiugRcyGaWcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51929931"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="51929931"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:47:36 -0700
X-CSE-ConnectionGUID: mizpIV4gQTyf+VLZoEzF+w==
X-CSE-MsgGUID: kWYn61oQT7StHW/fudnPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="155236555"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2025 08:47:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSdxj-000LuE-1D;
	Fri, 20 Jun 2025 15:47:31 +0000
Date: Fri, 20 Jun 2025 23:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: cp0613@linux.alibaba.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, arnd@arndb.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH 1/2] bitops: generic rotate
Message-ID: <202506202300.dZGgBtbQ-lkp@intel.com>
References: <20250620111610.52750-2-cp0613@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620111610.52750-2-cp0613@linux.alibaba.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cp0613-linux-alibaba-com/bitops-generic-rotate/20250620-192016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20250620111610.52750-2-cp0613%40linux.alibaba.com
patch subject: [PATCH 1/2] bitops: generic rotate
reproduce: (https://download.01.org/0day-ci/archive/20250620/202506202300.dZGgBtbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202300.dZGgBtbQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [Makefile:1281: prepare0] Error 2
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/orc.c:5:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from check.c:13:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitIn file included from orc_dump.c:8:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
   o   27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ps/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/special.c:4:
--
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
   :13   27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   :
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:86: tools/objtool/weak.o] Error 1
   In file included from elf.c:22:
   In file included from tools/objtool/include/objtool/elf.h:12:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from builtin-check.c:15:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:86: tools/objtool/arch/x86/orc.o] Error 1
--
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:86: tools/objtool/check.o] Error 1
   1 error generated.


vim +27 tools/include/asm-generic/bitops.h

    25	
    26	#include <asm-generic/bitops/hweight.h>
  > 27	#include <asm-generic/bitops/rotate.h>
    28	#include <asm-generic/bitops/atomic.h>
    29	#include <asm-generic/bitops/non-atomic.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
