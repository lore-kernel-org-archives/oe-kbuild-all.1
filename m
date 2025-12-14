Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0DE2C21FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 01:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765674461; cv=none; b=YxCr+CzXWC0jYDLppOmFRtdZnyItMVp2WQ/iosyFZKvWHAQBNnpA2whRy2AG9PbeYMcq+vvO5bOVBzX4Jm/JE4hv+XVOYI6pSUFas3nMJ6OWZo1QohCBrfCuQoZOTS5WrY+F4yie9RBYJR1+WLiFcTjhJGNnIjn2eIfVcpMf2uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765674461; c=relaxed/simple;
	bh=oqiszCIrZLNtbsVRnkxKcM6qm6EPJi6MH4lQ5OiM5NI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWmmmCWz/wcNwokuKqPl4O8rqsXvp9zbDCd8cdbtvbNm6tlEvGU98IWjNKt1CaQNtL8CAiDUcpP6iYyRH/Af9RIN73PAhWLIxHunfzsEMdwFQodu+foK/ANWv/WdN+SXc1wmReA7Eea1xcrZSyyCsEDc1SE2VmwJnLn2o/zV5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCf9CQwc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCf9CQwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765674459; x=1797210459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oqiszCIrZLNtbsVRnkxKcM6qm6EPJi6MH4lQ5OiM5NI=;
  b=YCf9CQwc7/zEijwUafbcENfKUOrjaRESdV8NLty9z5VxdKS5X2MWDEd/
   fJKZRgZZ+3m71Ya1es7fshGulh+DO8e+ZPg1ucfvh8cnTHWbAL5V+mp/i
   N8RMTj59SLrr5SdTZ+bbV4JyOBISmtCP67JT9Ffwk71wKQD8xR1ieB6bE
   5JWQ5BWTQCmor+/uhsN39Rhpv9itJRLM1IZ709Ep/Vp0fXrQzHNY7KuRx
   U4vEy9ciGWhUjacuASGPUt9pWgcvtK69E/w4Cb9jo0eRopFrvIb+bwTaK
   kKQ4qQmtAa2pBVz1tD3PCwn0yo2eX7b7YzhnYtE7NXyKkFCpa5f2TkVAV
   A==;
X-CSE-ConnectionGUID: kIw6bgFGTr+docw9Yn876w==
X-CSE-MsgGUID: cu4woohkSkizrI1zsPDLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78266325"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78266325"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 17:07:39 -0800
X-CSE-ConnectionGUID: iD3QIwbwQKej66302sVtMg==
X-CSE-MsgGUID: 7W54mMkPS7OqgPeNtL1ulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202330768"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 17:07:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUaaG-000000002Ea-0bYB;
	Sun, 14 Dec 2025 01:07:36 +0000
Date: Sun, 14 Dec 2025 02:06:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] dirty_log_test.c:775:9:
 error: implicit declaration of function 'TEST_ASSERT_EQ'; did you mean
 'GUEST_ASSERT_EQ'?
Message-ID: <202512140211.51HpDBIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: e5ed6c9225378b7ab6b0e305dd84da7c87219a1b [40/40] KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140211.51HpDBIH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140211.51HpDBIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140211.51HpDBIH-lkp@intel.com/

All errors (new ones prefixed by >>):

   dirty_log_test.c: In function 'run_test':
>> dirty_log_test.c:775:9: error: implicit declaration of function 'TEST_ASSERT_EQ'; did you mean 'GUEST_ASSERT_EQ'? [-Wimplicit-function-declaration]
     775 |         TEST_ASSERT_EQ(sem_val, 0);
         |         ^~~~~~~~~~~~~~
         |         GUEST_ASSERT_EQ

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
