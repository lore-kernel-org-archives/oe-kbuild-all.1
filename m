Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9E3033CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030346; cv=none; b=W+TT80awHvSWs2+5+n186H88SwpbL+UiuTjo5G4Kh+fEP97hk+84kJek/rElfAhwmCA/4s5ksQYxuKt7OQLZn7At0HiwAJT8OXXKdshunK9GdLInUKpErmud+amFvEokvtAxjpftHjiHR7HcPwhJiuvc3i2FVk+NuuIi8ejrUZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030346; c=relaxed/simple;
	bh=yVcj7mj+ZqayH04d1YOsOFjcXHIueBawLUDy4CtHBJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VtR4e3nbtgfkJptjBNpyC4Odg4Gi4pwAscfzzTpWJVhIf/UEqXxMteO4SDhCmZmRH06oZC9L6+xJ/DZ5SMDgt9tEh/s++gmYEjzyjwgHhXkdfF2Bqvx89cgdpY08fKKdxa5Dxf7QD97ZCde6lkChNJnS9vVdwdvUPk7CQ7JvkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNTXC9za; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNTXC9za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774030344; x=1805566344;
  h=date:from:to:cc:subject:message-id;
  bh=yVcj7mj+ZqayH04d1YOsOFjcXHIueBawLUDy4CtHBJc=;
  b=mNTXC9zaNqZTwtLWPKeXaG7Zj1LNaeaKG6ly8hX5aKDIpsTLeQpTwekR
   I+68PWEyt57QlOy/VV4fwXlRVtzQMZjYdgXHhGLCq2OL8Dw9IIijTV7em
   RJfsdm57jLzHq+dIkuLxOzJ3Yf4JnSSjuVJ7L60753wE+JdBtXSzTi2o9
   IAV60WBKrXYYpwcKNHwj/X1sW2iiCeRRnkwx5zDpkifP8lkFT70fgkZcv
   ONOmLfMYaQRMZvVWiLkr7iIeiP5lRaYRaT6pixLHvxrBMhdgJ/vYK0wct
   fDYdSISpsig0DFXGYbjjBspUEo7QCBPGh1/8SxIPqGdV6n3/sDH6AfTJ9
   A==;
X-CSE-ConnectionGUID: VPRKoeNES065lH5/trtnog==
X-CSE-MsgGUID: F3OaiDzDQVCYiP+1psnH1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86196669"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86196669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 11:12:24 -0700
X-CSE-ConnectionGUID: j1vkBHouTA+lwYCEoURdqA==
X-CSE-MsgGUID: u2vTkQFxSwaA7AWh0Y5Trw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228298019"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 11:12:19 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3eK6-0000000004b-0hUB;
	Fri, 20 Mar 2026 18:11:55 +0000
Date: Sat, 21 Mar 2026 02:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7602/7971] clang: error: optimization
 flag '-fno-inline-functions-called-once' is not supported
Message-ID: <202603210208.5TW7E8WX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: ed597c460186e314ddf85c37634f260eec4a3879 [7602/7971] kallsyms: add KUnit tests for lineinfo feature
config: sparc64-randconfig-r072-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210208.5TW7E8WX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210208.5TW7E8WX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210208.5TW7E8WX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: optimization flag '-fno-inline-functions-called-once' is not supported [-Werror,-Wignored-optimization-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
