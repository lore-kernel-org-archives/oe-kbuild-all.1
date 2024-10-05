Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE21C687
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 03:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728099477; cv=none; b=se0MM3gfsUH9e9mL7sdDG9Cfpf6Xva96oabRJVez9KUo9vY2oDOj6/TRQirq8Y0uMG6FR9DK8/aSpNRpJMsv4UQ2Ft44HNRo5Eaq4wYylyVvGVG1llw5ubMkcYG0l2F2/JUH6pizrCT7+SLtMNa4CXvoho03qJSywm6uWDDLmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728099477; c=relaxed/simple;
	bh=weyGTfWAqYO9NZ6I3UWpYNAJheFE0cbwzuLACSHKQZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stN0VCwraZtNE2Va0Iv3X482VjMGHIWna+IKSPyRvlnxR5hgmo6RAXsJ51bpOzWt7HWjg/chjJkCOOo6fir3lJIe1RIPeKxx/DLXbxJ5n0WeJ+Y13AULrBRguK27BiZcqWdgxA5d0sAarXLpoWho+K6S0cp6+I9ExFXC3I1LTbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmzW55am; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmzW55am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728099475; x=1759635475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=weyGTfWAqYO9NZ6I3UWpYNAJheFE0cbwzuLACSHKQZc=;
  b=JmzW55ambUfUX2D/9NX+BFC3JvbglJIoowPoNDW8tL2SdMxTRBvnTkk8
   KhoVhuM0VshsnP92uVhDDrr/jZoiLMCDX4kQZJcp4fvsHy8k62rrdWqaO
   c5ZeIjHhIKOALD+NNL5ngSkup2hpx6RF8WcA5CvVwZpZv9xLwxXYgNd7s
   AbmDzldiH18FNNbWNku4ibxAjSSNGzDRIWBpcwFGlgG6rJdeqJPUceRBZ
   aGYbU3j9eEvPi52SX64/EckibbP/kZcva6BS6ZdP+tBtsyVdD/hgR32bs
   0VwpwKFd4iBknXe6v4rmXmOuQBKgBRkgZ3qjcNoJo5WlAxVvJXTcUvgDC
   w==;
X-CSE-ConnectionGUID: qcejQAksTbeYjB0hs8oARg==
X-CSE-MsgGUID: SBLT6Cn2SPegdf1ScVitvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49858338"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="49858338"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 20:37:54 -0700
X-CSE-ConnectionGUID: QZcPJo3rSwWizY4krpF9ig==
X-CSE-MsgGUID: AlHeHd0TS++9saPXuORg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74722499"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 20:37:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swvc7-0002WQ-0M;
	Sat, 05 Oct 2024 03:37:51 +0000
Date: Sat, 5 Oct 2024 11:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-10-02.2-seamcall-part1 62/104]
 arch/x86/kvm/vmx/tdx.c: common.h is included more than once.
Message-ID: <202410051127.1X2MNjMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-10-02.2-seamcall-part1
head:   54072b973dce03f0b8486c46792d3b4802cf6368
commit: 34a4f91cc3cb61abc7010ca44463c2b8a5eef513 [62/104] KVM: TDX: Implement non-NMI interrupt injection
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051127.1X2MNjMo-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: common.h is included more than once.

vim +9 arch/x86/kvm/vmx/tdx.c

   > 9	#include "common.h"
    10	#include "mmu.h"
    11	#include "tdx.h"
    12	#include "vmx.h"
    13	#include "mmu/spte.h"
  > 14	#include "common.h"
    15	#include "posted_intr.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
