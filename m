Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116551FF5F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730227405; cv=none; b=lwO0hSN82gZwWA86REKfOR8K1V5It9yX2qlQi/xxars80lPM7uX6sPj4i91b1dUUmJ9GwHOBL8ma2timTt3svNdJ7Ct7VszXxwuwNoM5qfNFVMlbJ+WE+Kc6XaMI5hapBZXSZCH6nhaPFvuRnU03pKeHaL7N0KC7CbmTya04K4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730227405; c=relaxed/simple;
	bh=G1vmtN6mvz9u5C2CeYdKnpdIDc3mVPf/pFseJFymysI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3m74xDwHjH7jkRbqg1snJRfT5ADxvF+hXbtw+UTtIVM2x1EYyoa4yiX64yiJULERTwxXVWkZCnvTNlbbo0V+nrqmaW4/lUJqrIbof2We83heqMCGtr+C3ShNUlPJkqpAqG2wlejEBXNjPoR2LeE1mBd70AwwKiqSYgG5BKWgPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMPtlNiI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMPtlNiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730227403; x=1761763403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1vmtN6mvz9u5C2CeYdKnpdIDc3mVPf/pFseJFymysI=;
  b=LMPtlNiIxZXrsrAP2N9yuyezmYsLFau10JP23v1UzNzKURnGv/ioqvfa
   1KhFwh6B/stRX7tCFBXvdN7q1fPMknLZ/5F3wlWM4fX/w0A/aPAy7RYJc
   I7mudi6HNrSdnu5V/YhDo5cc+qo7m0LnUvP1nngmyGCpUZ3smMtr8omCc
   TqSPkI/6bMG1riqB4h2bUbqAs4K75tZ+Mk6sQ7lq6/v4QoSvD3Yh/PTdO
   4f0dULQf3jJj40VNJsiE9/0etRw9mGVIqpOVCe2uW+no+m+TK9B3FgJrv
   G2UUUVfmPjktlPihUi1EA5tEpsCQKrQc/kJO+dxToPUpt44W4RckvwMnp
   w==;
X-CSE-ConnectionGUID: 871uwrQET7KKfbYyDJ84uA==
X-CSE-MsgGUID: GexiElR5Q/yCfCjSTo044g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30005060"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="30005060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:43:23 -0700
X-CSE-ConnectionGUID: OrFY3ef6QkOVgiVH4Vshmg==
X-CSE-MsgGUID: Wl+kEZQaS5KHzA5JtpXwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82206717"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 11:43:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rBW-000e0J-3A;
	Tue, 29 Oct 2024 18:43:18 +0000
Date: Wed, 30 Oct 2024 02:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-10-25.1-host-metadata-v6-rebase 82/164]
 arch/x86/kvm/vmx/tdx.c: common.h is included more than once.
Message-ID: <202410300233.fbcIk4Ex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-10-25.1-host-metadata-v6-rebase
head:   72c4f049f4b5856431ceeeaeb5e12518979f720f
commit: 582c36ddce68ca73ba67386673a482bfbd214ac1 [82/164] KVM: TDX: Implement non-NMI interrupt injection
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300233.fbcIk4Ex-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: common.h is included more than once.

vim +11 arch/x86/kvm/vmx/tdx.c

  > 11	#include "common.h"
    12	#include "tdx.h"
    13	#include "vmx.h"
    14	#include "mmu/spte.h"
  > 15	#include "common.h"
    16	#include "posted_intr.h"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
