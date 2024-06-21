Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193E12C54B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004525; cv=none; b=i6jLtO05MWV2Ad60KrkiMoxDHchwDIIvLfsMLd1slj5i1fdXsdujauRqfUOp5m93JLaWmpG6fAHhM1VPAVPt8JvQ+Sa7+kx/Ngr+XWskKR6S3GmdpwI8kdx03TtHv/oaBEF04kfWO7EMRBK1D7CnZS/jp7yfP7CsoKUO27Whf5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004525; c=relaxed/simple;
	bh=fxvFSHyHhmn/eryMFOppkvCTE3FriwF1zljqbYypgNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfYIsV85jkEUIPbpm3GtDrggepDfPZ4pOfx2pE7JzlD7sg+GFnmiY8SaDKgvKw5AsetvX8HiiVrsCDCn13QTHFnVEXFTwIqanj6fSV0XS/dWeyDFGB2dI94qaLWbe4Qrxmq/vovq9iAuExiKuD9YZ56qdpxk0nnJjkCdyx7yDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsipR8eH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsipR8eH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719004524; x=1750540524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fxvFSHyHhmn/eryMFOppkvCTE3FriwF1zljqbYypgNE=;
  b=AsipR8eH7Y8ngTqbcd+Saef1Kl1I7FG+8TRL8g9zzjw4+iAOmYXpdkQk
   PNR9u0g3wQEyMym+pA5H0s6Y94LfbL488TdvT5NKeNq4dSbnxCcPQymzL
   RvL+T1D2jx3EALkbm0EA0dK0lD3PMIw3TBAsaWprP2t31zR6mW97h6YTx
   vssZzMwoAni72jl+x6VDYXBxlouS4uTRfwqay0pbM8hm66E7t82bevRpJ
   GgohXyUJUyOB8zxHgRRLXXvOU9s1yBoKA1GY/HCXT8Lzfw7SZ8tYtZ3re
   thKGRVOEq5Aj2RrA+bXoS68EEnq/Rwx3KqIZCB7HLVZNl+x0RyPDxukDI
   Q==;
X-CSE-ConnectionGUID: P/Rvp2J1QmqA7m9Zu5iWWQ==
X-CSE-MsgGUID: ffEeDiUCRdmzUMCbOHTJpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15814073"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15814073"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 14:15:23 -0700
X-CSE-ConnectionGUID: Psgg5KnLRBK/RCO/GCPMIQ==
X-CSE-MsgGUID: UzpoBPfmRgWOkbHscOo+Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="73918129"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2024 14:15:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKlbM-00090g-16;
	Fri, 21 Jun 2024 21:15:20 +0000
Date: Sat, 22 Jun 2024 05:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 14/26] error[E0425]: cannot find function
 `clk_get` in crate `bindings`
Message-ID: <202406220556.9WHpEeYw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   628de6b80d860108301bd4b60aab350d3e0e9e5e
commit: f7ab4a39ec5b92abb428e639d69830b4d078234b [14/26] rust: Add bindings for clk framework
config: x86_64-randconfig-005-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220556.9WHpEeYw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220556.9WHpEeYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220556.9WHpEeYw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `clk_get` in crate `bindings`
   --> rust/kernel/clk.rs:29:23
   |
   29 |             bindings::clk_get(dev.as_raw(), con_id)
   |                       ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `clk_put` in crate `bindings`
   --> rust/kernel/clk.rs:42:28
   |
   42 |         unsafe { bindings::clk_put(self.0) };
   |                            ^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
