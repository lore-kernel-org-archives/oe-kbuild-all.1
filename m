Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB39194A59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731798621; cv=none; b=KvB22lCVnrT3k96otIuwYr4Vd1kdx0PwPbIbARiQAYwz4XLeWZLuEX5+foolRAS46bWCyLak7ZnKSVsWbylJfBGR+1mudd5npBX4T3E5QY+LKaDWRLwC7xtktFI5vf7sx7+rdpZk4UyaN9x9yWoCW7+LKpmSgMTPvqFHMqh9/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731798621; c=relaxed/simple;
	bh=uBLYHkwHzUqh7O+u1dMI5Vb5+tlbxMNUg1hf3/CIAPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHfaNH5duHbEA9ERPw41xpVPTt6bt/xgZWhu1ArFIu1AjR5WETpyvuyDXoPHD8x5zKZt0GNo19h/JYHAWsgeKP/qDWOc54rAXrz5oepVV7v7zyIPyxyko6uCreqNefaOjjN5nKPLTJsczYHJUAXGzDzf0BHuNABTIWG+LcZxwZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSRHHsfn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSRHHsfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731798619; x=1763334619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBLYHkwHzUqh7O+u1dMI5Vb5+tlbxMNUg1hf3/CIAPw=;
  b=JSRHHsfn6L+Nyzkh5Ud+sHLmdxkL+xyoDXqErG/skjeX3cUrEERIfcZD
   kbyN8TRkDP1vrAGfi3JCdqL1kwfXPJ5zz5Lcgh59dIX/yyWTuas8m1Dff
   9Kxd+E/5yVkavYztJy4MyDwHX6qqWvOUx1XGgEsYvVkBYP7xKA9MzHkpF
   YHDgYi6jD3W3zljcJbWNP5KYJNnwnaGmMw3dAgOT8/Br0hKAfY8E/GL7D
   NvYa9MlOer27QB/vqH0CR2FfkvM6R9lmg0z46+Qo6GBbxMermgRfTcSp7
   arzU/7XZZ3ju57Hx/aQBzmmVLG6uu7RkpX7MQKODrSVSblWdl3/C1Ut5r
   w==;
X-CSE-ConnectionGUID: MqZ0v4J4RjqgZI6mul4+pQ==
X-CSE-MsgGUID: S4Co/qoJTMeb36eoRRvJZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31936051"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31936051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 15:10:19 -0800
X-CSE-ConnectionGUID: Cehklw+BRYm6MPZk6DfCSA==
X-CSE-MsgGUID: tYv69yiJTfa/CZsq3FssVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88636102"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 15:10:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCRvi-00019z-2s;
	Sat, 16 Nov 2024 23:10:14 +0000
Date: Sun, 17 Nov 2024 07:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 35/259]
 arch/x86/kvm/vmx/pkvm/hyp/init_finalise.c: mmu.h is included more than once.
Message-ID: <202411170748.IYH5ISiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: c14be0a0537a7c27b78a353f30b00c5e0f2d4991 [35/259] ANDROID: pkvm: x86: Create MMU pgtable in init-finalise hypercall
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170748.IYH5ISiY-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/pkvm/hyp/init_finalise.c: mmu.h is included more than once.

vim +7 arch/x86/kvm/vmx/pkvm/hyp/init_finalise.c

   > 7	#include <mmu.h>
     8	#include <mmu/spte.h>
     9	#include <asm/kvm_pkvm.h>
    10	
    11	#include <pkvm.h>
    12	#include "pkvm_hyp.h"
    13	#include "early_alloc.h"
    14	#include "memory.h"
    15	#include "pgtable.h"
  > 16	#include "mmu.h"
    17	#include "debug.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
