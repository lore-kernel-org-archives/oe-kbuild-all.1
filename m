Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AB2192B74
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737805855; cv=none; b=sqYxyp2lM+38cVpAUsC/ir5pdwKhjyic81xJHH9hvTOGPjtFYZj2AzTTtBmI6JyknEQGFBn+CNEaUS2TmZ8pZKYFherWw+0cKIT6/knqAnNRvvmz5jUd/efpZsjPlFzGJfvmpUCLzgkeN7WIi2J3u69dK6cClPSyd5plkYiyFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737805855; c=relaxed/simple;
	bh=BP0jT4gXyq529z5GtZQwQY5f4z9DTZHD17yPa8bsoV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTMKlLV+/9I3YRGK6HCGJdnE6QdT+PtEupJtuOT2O1918liczjloDCdwctK36nmAOdjZDXiN9pmGOeT0QqlAOZJ6yXdGDPRAQlSolmGdJJWeoyR7VHe2tXUw5YODCfKlHUGbj2cYf6EqLbaO0/2lSC+CIbTD4swmYHGkM6TDHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aK9L4eNJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aK9L4eNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737805854; x=1769341854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BP0jT4gXyq529z5GtZQwQY5f4z9DTZHD17yPa8bsoV8=;
  b=aK9L4eNJxTqHEq8orTiRFFbykZKywEDXGieckt7pJsQ6lNovgHkxyVde
   P+wSCUvBKMV1vFilUfTo9ZaPoG7UWeuSAryX1SCLo2IcVUrA0iNsrNj9p
   8NxpDrC0ORU6zLi8CQJbB/K/SMlvbpJAK2Si9cLm7IDwiKunPPYHD8L1S
   dIuXlgD25/FZyxrBZbUqqNf+5fpPVMB2QVUIyMNnN+1K/OFNnjUxv1CkA
   RyyWGdw0XAFnz3dVYxUjuzTScFpf6oudyr2gnEDvCMWLsD1JYouJrl/l9
   1qABcjC4KAk1MHwqsMpD34h9Yil2M/6Y96qkFDJ6jVUGC9f+gFY0cn4Qt
   g==;
X-CSE-ConnectionGUID: yJxUIQfvS+6Sy6kWkGgmdQ==
X-CSE-MsgGUID: uf8rCyNHQJ6EEXwyMz7Z8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49748157"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49748157"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 03:50:53 -0800
X-CSE-ConnectionGUID: rFWAVs4sQjOH1bml5qoBDg==
X-CSE-MsgGUID: oPIuGKTkSx6jgpdvL3tt7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108537798"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 03:50:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbegc-000dmT-1W;
	Sat, 25 Jan 2025 11:50:50 +0000
Date: Sat, 25 Jan 2025 19:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/rcu/rcuscale.o: warning: objtool: rcu_scale_writer()+0x371:
 unreachable instruction
Message-ID: <202501251921.xJn1leM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   cf32d6ffe2eb44f4f011f25c0692458cf0032772
commit: ceff6f5e71735251c43a2647c03bdccac9f32c64 [1/1] rcuscale: Provide clear error when async specified without primitives
config: x86_64-buildonly-randconfig-003-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251921.xJn1leM6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251921.xJn1leM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251921.xJn1leM6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/rcuscale.o: warning: objtool: rcu_scale_writer()+0x371: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
