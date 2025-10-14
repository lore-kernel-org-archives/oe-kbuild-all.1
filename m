Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794621C1AAA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 00:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760402007; cv=none; b=CrSVFLbzS9jSBRW7APHsY5KpA9J5SGCwryDjKpkkdEV2uUeb8QLwu/TeV8XtoOYIM0xonca6FkfJcG1boLsC3VqV90al59IYKLO6A4U0qzAakxjeUxJzcO7W3nbnLqg8pboPNntf6V6AI2/AQE03WXTJe1PktCnUNhC/bygk4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760402007; c=relaxed/simple;
	bh=x+cETkDpogUNgfbxHLSIeIRIjIYWC2Wu9w/gvyY7HT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UyFhbNqp8eDuVXTOWWRmFweZN6ZvdM73Ude/X7y1kfXV63veIaiIXIeQJ8SUL7XIZcE2H0Wq0S7xP0rawfSZw4eQRVWDquTzcd7s7bHEhGoN7u8BBfaJ5oRFIODLhtPParY2py7zsSfCgYXXeStTnuoRkkJp58eGJ4loBxOHbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVR4KBFY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVR4KBFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760402005; x=1791938005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+cETkDpogUNgfbxHLSIeIRIjIYWC2Wu9w/gvyY7HT4=;
  b=nVR4KBFYtib3fSHFzOsKpHAOC9Cm1y5UY5lwULD6N4IfSH4E4HFDJ8BB
   bM1Zd7cPzopzaCdwgZjTmT2LuvTFs9931cVPZkHhDdP5Gt88pFFayMAr8
   qnF0gM1YtZcb7dPhpFaeRwRFsJWxd9i9iTf6aeeLhT4cgfE2SOR1++GGF
   N6d+A6eaxEDXsXXND70qFAdSgmYKSOhRFxUVbQpPTGW1YnPSQN7Mr5a6t
   aIAZMZAzIn1MrJGlHXaXS6uLclHKVlnK5ljN3JPUEEmW4zeCUpWtdVnHl
   CF1VKAzf+cjVUGRd4PVsStJXxopnwV50v4xcX/HtlitutAHf+bEJw0hwM
   g==;
X-CSE-ConnectionGUID: 1wfDrT/qTSeMCvmM4TXuJQ==
X-CSE-MsgGUID: G6HTaktJRjOYyNVpFR2VHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88013974"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="88013974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 17:33:23 -0700
X-CSE-ConnectionGUID: NAXJp1nRR6GWHQ4fFbGyaQ==
X-CSE-MsgGUID: mCPd9gSRRnS3+4VhEv/t3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="212360053"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2025 17:33:23 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8Sye-000000008y3-275F;
	Tue, 14 Oct 2025 00:33:20 +0000
Date: Tue, 14 Oct 2025 02:32:23 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 40/40]
 arch/x86/kvm/pkvm/mmu.c: pkvm.h is included more than once.
Message-ID: <202510140206.vVbmZAdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   c25c0799fe7f8512084371fc45facef68155c907
commit: d415e8225e5424134d087f05a2eaa9eb81f7c576 [40/40] ANDROID: pkvm: x86: Add PV MMU page table
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140206.vVbmZAdF-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/pkvm/mmu.c: pkvm.h is included more than once.
--
>> arch/x86/kvm/pkvm/mmu.h: pkvm.h is included more than once.

vim +2 arch/x86/kvm/pkvm/mmu.c

   > 2	#include <asm/kvm_pkvm.h>
     3	#include <asm/pkvm_spinlock.h>
   > 4	#include "pkvm.h"
     5	#include "mmu.h"
     6	//FIXME: clean up the header files
   > 7	#include <vmx/pkvm/hyp/pkvm_hyp.h>
   > 8	#include <vmx/pkvm/hyp/pgtable.h>
   > 9	#include <vmx/pkvm/hyp/gfp.h>
  > 10	#include <vmx/pkvm/hyp/ept.h>	//FIXME
  > 11	#include <pkvm.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
