Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6C13EFE3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 May 2025 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746238258; cv=none; b=bAe7488x1fQDeC8/n108xJQjXSPIGlNx3G7lIeONMhUKrhifxmN9qS1dGaOo63SNXp2/FhEbBCPJX6OHh+iiLjhe0mnoMAir2Q+W6Eak/cHccGy3Li/IqfPZ99PFBuQ3cqJqYIF8VKXJXA6MLF8eB6dP1rpUuLMPMCMU2Wpfr+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746238258; c=relaxed/simple;
	bh=Ji5AMln2LuyeVOY/siwVKBbUXRaDFbOYnJWuFamV4fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jjXQILiq9hFByQ/wCI5aiLGjsAG+2yvjIkrgYPd6abwJUflO753FFa9+B73+QnEGuDSOBLWT8wHckiZkBnhNE6acj0u+x2ZW7qnBfxIBClzxVVwgKHFLtuAaydXCavuGdShvLLA2h0cT73pcasQ7XGC5lRBwdAn2sQwVBJDia80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IphYLmGh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IphYLmGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746238256; x=1777774256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ji5AMln2LuyeVOY/siwVKBbUXRaDFbOYnJWuFamV4fM=;
  b=IphYLmGhrRaLrOGY5x0jHHcero9XPjaMxRQLOeH0Y2iPGcl2eL/MVos+
   6s5tDoGF8SqPPyAAcAuPVhaPgcmt/d+ALkSA9B1/c95lolWGVkxFsQF/U
   VHSqjN9v+OrWBtOqgooRTvzHjD1Mus9mm3miFl5WEdSTrkDmx3ccpQ4m/
   /UP323a71GSClRtGLBpbqBSa2FSilzPl38WFh8x2eLLh89AikebvZ6luU
   tMiYwJk+vcG/wdLIqYqO7emvVeXXEIrmBzccd62aOTv/8gXdX6EDswo2K
   YOkuNhTEqQJPs66noG7rWjp2bD/+CQwJC1owWkwMh7SKEMsZOlglJWvCw
   A==;
X-CSE-ConnectionGUID: BFfs18rDQ+OKLIcLkbVt7A==
X-CSE-MsgGUID: cuBgymC8TSyU+O6Z4Mr9uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48069428"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="48069428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 19:10:55 -0700
X-CSE-ConnectionGUID: X7OBxpUSSCe5bWxln4MXAg==
X-CSE-MsgGUID: bz01z6PsRkGbMw1J3axtWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="135105191"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 May 2025 19:10:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB2L1-0005A5-28;
	Sat, 03 May 2025 02:10:47 +0000
Date: Sat, 3 May 2025 10:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 24/24] error[E0061]: this function takes 2 arguments
 but 1 argument was supplied
Message-ID: <202505030937.tzGdrPqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   31cf6c183114b708a082f3e4ce6141e3f2423a5a
commit: 31cf6c183114b708a082f3e4ce6141e3f2423a5a [24/24] fixup! rust: num: Add an upward alignment helper for usize
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250503/202505030937.tzGdrPqW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030937.tzGdrPqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030937.tzGdrPqW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0061]: this function takes 2 arguments but 1 argument was supplied
   --> rust/kernel/num.rs:13:16
   |
   13 |         self = usize_align_up(self);
   |                ^^^^^^^^^^^^^^------ an argument of type `usize` is missing
   |
   note: function defined here
   --> rust/kernel/num.rs:19:14
   |
   19 | pub const fn usize_align_up(val: usize, align: usize) -> usize {
   |              ^^^^^^^^^^^^^^ ----------  ------------
   help: provide the argument
   |
   13 |         self = usize_align_up(self, /* usize */);
   |                              ~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
