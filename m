Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5121CC5F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825963; cv=none; b=qBraxChdBdpAAQgzDzqtEEO0HiMgm1AwjbS/Fs0WnNLqXAWH8BEuQa7WPNZTYfZF8zxromlzTUUEo8yvJg4K3xLac+eYLVz4X6wT3p22pw3sZLmb2ia68BpjE4RawiFp5IayLGY3E7rTQOOdtf7hf4hDek23chPfLttF6N18KrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825963; c=relaxed/simple;
	bh=OLdFawD0qtiOC3ABpznMV1NoUtDuUsp0gtgs8gYDrZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llqtWhvbJP4uIDO9VO5m4s/HJ1E4rwRG/7QdD4cpGLMW0Tuzg/904ep/9U/Oq32iwCr13Y3daVx1oMi+RyJQqaxNH6XR9ylP/m5PqOhEyAIQ1+0kHQ6dFjBHul65P2M1evLBqalZmEtr4aQoRfb49UhfUJbbTYPVP498feBRsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsedXzs4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsedXzs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746825961; x=1778361961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLdFawD0qtiOC3ABpznMV1NoUtDuUsp0gtgs8gYDrZ4=;
  b=jsedXzs4FM9H3hj0pSTGXShwO9jTs/Y2ccONdz3CLoWy77dpBndf0Ubw
   JG0PGee4KSVxHvRJT+UuJDZophxOhh5p/7TdFeMl/S1vsjVl6KO/vcvBX
   GvQXh4PKBSh/F0yz1Jl0GCmr627IwZYmxnr+JRw1RtLumIqsFSDALZhe/
   1XJcClx71uSB1fbEIsGpyLD/fQfNpuemHDkASRlglW6kqfz4z8awUUkBA
   9YWwYxWNtDVSqkr9JYhi4bsR5M6ytv1mMS9JE/Ueso5gsQs6PAwcAgj9V
   oF4Ff5yRun4YLVHbrNg9yHXMFh00juA66JaPVOu7PzoxZhljLNGVjOCo6
   w==;
X-CSE-ConnectionGUID: AJ1yoSDaRQ6Ef8zzfGgy/Q==
X-CSE-MsgGUID: 4JPsjYCyT+i9lABo0xtJXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71182376"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71182376"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 14:26:00 -0700
X-CSE-ConnectionGUID: lMo3YAD8QkW3S9j29iPB5A==
X-CSE-MsgGUID: 2CwJbGEfQUSIgMl4qEHXPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136435117"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2025 14:26:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDVED-000CUt-1I;
	Fri, 09 May 2025 21:25:57 +0000
Date: Sat, 10 May 2025 05:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9630/9729] error[E0560]: struct
 `drm_gem_object_funcs` has no field named `vmap`
Message-ID: <202505100558.gYKiqSVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 2e9c1d12f7ab0b14fe909eb060874b3184d45b09 [9630/9729] Merge branch 'nova-next' of https://gitlab.freedesktop.org/drm/nova.git
config: um-randconfig-r051-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100558.gYKiqSVX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100558.gYKiqSVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100558.gYKiqSVX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `drm_gem_object_funcs` has no field named `vmap`
   --> rust/kernel/drm/gem/mod.rs:198:9
   |
   198 |         vmap: None,
   |         ^^^^ `drm_gem_object_funcs` does not have this field
   |
   = note: available fields are: `kernel_vmap`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
