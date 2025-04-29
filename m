Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F7267B6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959790; cv=none; b=G0fIVdfsYuovagmZo+PS+OosBaRyJ/NbILHCem+KCRj6IE8w2FBm0kMUN1jgYzDG+7MvRyApR42ikymxjYiXyV6ORruaJFpGvOJ6/WNCNYShG69nZRnT/uW1FihVuWH/g36ZRnIx+vic7wHngRZGq/IfuEU9jAJGVjr5k6QtpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959790; c=relaxed/simple;
	bh=VNOo8L+EADJ2qkKCw/hzz8TAYy12iNEXHNy1slxBdd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EilnjwxPl29i/YYV96ZTZTSly6p9G6VIsVEXSzhJxYwETGc6EG0wlGGDhsGNdL0TcNNCYaMbm9V1LZ+UWnkX0POiZuIF1ezCncNv5zKfG5x6fSPEFdqU8b4ymo0tyPWvc0bzsHJ4zs133dN3JLq3EXp7hqi2oaVyI1JueiA1sUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfOe7DrS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfOe7DrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745959789; x=1777495789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNOo8L+EADJ2qkKCw/hzz8TAYy12iNEXHNy1slxBdd0=;
  b=hfOe7DrSxcLRYda5S3mn/aBKNAWntjxeXxHCEjK6xfb+HcR4Q7eCvDZa
   lNLbdBucrI92WEICACEi9Va7m6jGMAbILwWalRwuD06JDIXrrWuPWmeB3
   wIHfpBEjE/luW1GIF0+s3mFj5zvXtKK9+svS3kBbM968ZSimVTUKSzkf+
   MVnASrjNEtL7fHJ/RaeynuXqYFPQqx/OC6akO8NkNpvDUR1uYxVVoCpDo
   EJqmgk5A6Z0QvKPXxmC8pXEwT86/SYyn2xEPlX0zqBctEPHwrbyYM2F2J
   LcdDbVcJmbVpEsHYJhB10JkYVWsGSRquhu+KWXSpFrdD8nZKy0wiVGoM7
   A==;
X-CSE-ConnectionGUID: MCIn3zHTQ16PLmTaZMd8Ig==
X-CSE-MsgGUID: 5Mhb47UFTnaHQg0cNj6fQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58966497"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58966497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:49:44 -0700
X-CSE-ConnectionGUID: t3d27xCYR2erb0/D8HUekg==
X-CSE-MsgGUID: Yjf/uwLCQM+bMG7Cb5blAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134434104"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2025 13:49:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9rtd-0002vv-1Z;
	Tue, 29 Apr 2025 20:49:41 +0000
Date: Wed, 30 Apr 2025 04:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?L=E9o_Paill=E9?= <leo.paille@enseirb-matmeca.fr>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 190/195] warning: unused import: `build_error`
Message-ID: <202504300449.NQuA6WtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 91ecba0e6fe9b5df5e633690fbf8aca5fa0a3ccb [190/195] almost sending packets
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250430/202504300449.NQuA6WtE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300449.NQuA6WtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300449.NQuA6WtE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `build_error`
   --> rust/kernel/net/dev.rs:15:15
   |
   15 |     bindings, build_error,
   |               ^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
