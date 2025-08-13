Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6F2D97BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081607; cv=none; b=HHhGbxHkifMerieKtfFGrA0BLiteQlbiKZ7D3XTDMhzU5cnav6M69cJQ6OSnyEG5hIUuDj9ClgAPN9CbNJqPeUUQt3kPh9u1AGynCHzTEedjDCEzx4sze6Kvm+shYn+jCm6SnEvGH4qMriEEyUP5KpQY3Nz/2FUX9NSS6G+70K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081607; c=relaxed/simple;
	bh=QPOPVxDu9BE1jXoV57wVZilWqr3X5J2wSoX0kHRQrTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAtRyabRG2Cn5IpGu+2VmRD1jXEn33WYwM/+i6vz/fCmptPMWkEk34i9RhJY23NNa0nD0tfW9sR6ZU/rUo4dsNt9zHnTC0gPoKrdJ6aRk4/g6ZHs/1xVl0u3iY2mIl6BOblEMziqH22hjZkLI8ObQh4vct/eHB/2ldfhbm5mM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCPKc58i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCPKc58i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755081605; x=1786617605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPOPVxDu9BE1jXoV57wVZilWqr3X5J2wSoX0kHRQrTY=;
  b=YCPKc58idt1rOqezgke+0tZB0pHtlIIka3mltJa5OcT2cbABI8PHRqrR
   1I6/QDLXTyzfgayw0EL1wVqMFJSpegOULyyMQBV8vwTk6uAzJVnY0ZvYu
   38Xbr9jcVWLvoGbFW3u3pPuIzKPCi7ByFnytU3nuxXkuZBqBpA/mRLztU
   tq0tQcCix7Sw1dafyzTIMYqYBl+XqpYh9tRzMOzAIMioHSV7jF8pEw+7J
   JjSXTxXgfChIhLHxaMdo/Bu6XsUbcIF1L46GduvX2u2Eiu17a9oNcaUtt
   PJYOvGIFSaKbwOzUmH5ka+Y8Gk3Kr6oCb0NToYGzAu6nr6qJgIsDUe+qk
   w==;
X-CSE-ConnectionGUID: KSgbW2q5QsmKyJf7uCzDGA==
X-CSE-MsgGUID: wi3MFczLQC6cdK64PwFnxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57487184"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57487184"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 03:40:05 -0700
X-CSE-ConnectionGUID: 89T+KyuJSKyah8lKDheZ6Q==
X-CSE-MsgGUID: SZkOfjMySgefYXlUg9okzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171691000"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2025 03:40:04 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um8tm-00002r-0f;
	Wed, 13 Aug 2025 10:40:02 +0000
Date: Wed, 13 Aug 2025 12:39:04 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvm_exports_for_kvm 22/22]
 include/linux/kvm_types.h:9:10: fatal error: asm/kvm_types.h: No such file
 or directory
Message-ID: <202507240325.eJpslRcu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvm_exports_for_kvm
head:   c73ddac47cf3ce218049c5b0bf59384a6f752e8f
commit: c73ddac47cf3ce218049c5b0bf59384a6f752e8f [22/22] x86: Restrict KVM-induced symbol exports to KVM modules where obvious/possible
config: alpha-randconfig-2006-20250724 (https://download.01.org/0day-ci/archive/20250724/202507240325.eJpslRcu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240325.eJpslRcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240325.eJpslRcu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/events/core.c:29:
>> include/linux/kvm_types.h:9:10: fatal error: asm/kvm_types.h: No such file or directory
    #include <asm/kvm_types.h>
             ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 include/linux/kvm_types.h

d77a39d982431e drivers/kvm/types.h       Hollis Blanchard    2007-12-03   5  
fe3b65938b5830 include/linux/kvm_types.h Sean Christopherson 2025-06-20   6  #include <linux/bits.h>
fe3b65938b5830 include/linux/kvm_types.h Sean Christopherson 2025-06-20   7  #include <linux/export.h>
fe3b65938b5830 include/linux/kvm_types.h Sean Christopherson 2025-06-20   8  #include <linux/types.h>
fe3b65938b5830 include/linux/kvm_types.h Sean Christopherson 2025-06-20  @9  #include <asm/kvm_types.h>
fe3b65938b5830 include/linux/kvm_types.h Sean Christopherson 2025-06-20  10  

:::::: The code at line 9 was first introduced by commit
:::::: fe3b65938b5830aa4e28614fda752906b2dbb4e0 KVM: Export KVM-internal symbols for sub-modules only

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
