Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967047F51
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709193369; cv=none; b=UcxchUlLRrd9rTklsWovfc0+An3f4YKyKI20TmDAMNCo9+w1+rZmGxbxX0Tfc1Kerr8HiDK68yq89xhuWx9DY7MWx/iPV/l6Rak494jrUvrYuWZTAD7MZqVuqbpb+7BJDJJv+12Vr+5GJr4u74tYVqrTTEUd7lp+vljrAYiXSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709193369; c=relaxed/simple;
	bh=pp7udd62PLZ99BN71TM5n8CKWjNiXs/4jttblCyfSyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHSRgAY9bZdMbT9BB1wVHZXS02NlwrhDFygKultUqYUyYtEv2tfVUP4tGwcClMkPM6arTXUTeunufn14TA0yzFlnQcc6ec4qZZzUJt4Vp33JgUJ1+7f8D8LG9h1Ft2qWp49xR6xOfQCtr2+wWqpTDsG4C7ww6N3TBjxiQKB1ZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCq06gyq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCq06gyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709193366; x=1740729366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pp7udd62PLZ99BN71TM5n8CKWjNiXs/4jttblCyfSyY=;
  b=XCq06gyqhrUNNpXNpT2TXcFH9bgS6RhShs+okb9SOMKVmNRJxvxbNmOM
   lS7CnQ5qImbTgKl7ie4oi14ylxjbz1Bbp9YjOzBwgI3o8I4yxlXGf3N2I
   dJk4mTPmIUt6W/+8XR9C8RZbA5Xn90NNPXWdfWkt4J0bZFSmka9QwL4JQ
   G0g5I+wAhlIASC8HxDQB/XS2KhJAHUfKAAirbKWoqOvsBtj7M8Wr+Mj1A
   lgJ1RRegFnPfkU0WqGucpyer82Kj4O1LbUIgLNEf+cepnod0q4CtNPD6t
   b9yruVhraA5NOGABOC88RyYc64tZ3PV2lUF+p7Wq6E27nG/88seD2GoTj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3760698"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3760698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 23:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7775008"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2024 23:56:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfbGs-000Cky-0d;
	Thu, 29 Feb 2024 07:56:02 +0000
Date: Thu, 29 Feb 2024 15:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 1/860]
 .github/pull_request_template.md: warning: ignored by one of the .gitignore
 files
Message-ID: <202402291551.Vw9GI6mo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: a3ea857146954f18b02b1ac7ee28566072ab30b0 [1/860] xilinx: Add a github template telling people to not use pull requests there
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240229/202402291551.Vw9GI6mo-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291551.Vw9GI6mo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291551.Vw9GI6mo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/pull_request_template.md: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
