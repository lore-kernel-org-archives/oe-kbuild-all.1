Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F21FCFF3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737120827; cv=none; b=MJodur4cvLVUK9Bf+Xp/30cU95Z6J9RHA6dVNz1+p0+RR+5RWuD49mgEKgLMHh4SJXtPFQkTBL6+bqPZzVzlgQrKqAe0vk949IG0VVOCZtUAgcwQqWvBfmpdErOsNKPFNy6GXEOlGGTmP+a129BnvUj1cxr1uBDwFLaL3c4bD1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737120827; c=relaxed/simple;
	bh=BcaPu11oXizmwDfOz0QhF1bitH5Dl+AXdw49qWVy+KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMvQQ+mf8nnapu6QfAGRWWUYgyShgBKCApYlpzGDw5hsv8vauBtbRF1/avawSjQYd6viOFGhXZupadOs727CrZGkUaqG8xuFS4BHlgcm7Ce0MvGvN9oQu4Fq66s46x88qEUmnd3fuqbZWXfAPGpxsQqSQrHnlD37c/ScKSAOxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5v62OBN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5v62OBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737120825; x=1768656825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BcaPu11oXizmwDfOz0QhF1bitH5Dl+AXdw49qWVy+KQ=;
  b=b5v62OBNlG7MJEoNZqBQBXZABDbk6Vrnx03QnPFoFiL7Ck9eHyqRvFQU
   WoY12o6dgzF4GJAdSoyvFU4KrBXRqUT4+hmuE+oiE81GRhD1Owrt5e88A
   w7ggCAXl+9sdAAcjLYmtC2n5kjS9zxP+oBC84hpnp2c1NlkdF1biDJ5aZ
   q43luEK+nvAE+mWZ+9Jj2Q5uBT+0PZnz3mwOnWgWTefHYrfVbGHqt19pF
   AXdICxbL9frhcsS6cyVZ1OiAUvLuDV6bgOzxVMR/7OvFBofiWqU8c9DmJ
   KoIJqnMrHWZZurKLMuxvJjKnh8eY8lswWnvrLQBcOspvtSOMgYptOjsc0
   A==;
X-CSE-ConnectionGUID: OOH00GH+SyevV3CbBK88nw==
X-CSE-MsgGUID: 7DyxURgrTO+z510zCRXO+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="60024226"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="60024226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:33:44 -0800
X-CSE-ConnectionGUID: 6gqIuAp3Tv+diD4QE/nGeQ==
X-CSE-MsgGUID: BHEQMJamQzyxwTyrdESsuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="110795220"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2025 05:33:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYmTl-000TGB-2W;
	Fri, 17 Jan 2025 13:33:41 +0000
Date: Fri, 17 Jan 2025 21:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2709/2709] kernel/rcu/tree.o: warning: objtool:
 __call_rcu_nocb_wake()+0x75f: unreachable instruction
Message-ID: <202501172116.SQgEKk8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   08e54ea5e4a4948874ca30d91be3e5cca4ecbeec
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [2709/2709] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-161-20250117 (https://download.01.org/0day-ci/archive/20250117/202501172116.SQgEKk8j-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172116.SQgEKk8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172116.SQgEKk8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.o: warning: objtool: __call_rcu_nocb_wake()+0x75f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
