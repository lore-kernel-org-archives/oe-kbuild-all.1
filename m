Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E63B42C1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071860; cv=none; b=TQcUbA1gLG4RoTMQOhMHMRUmdNZmhfaVhR7zytKgImhkPYk5OmV31wRtu7YT9orodvHFltLkOZh4y+vfiar1cJM2kK1sLShx8vbdC7HNu2Xrx28srIy0RF+NTU4K6dQlVLp6E2eQjur4CzZuo3Gktzr+JclbrIxUR1UzXb7Nn74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071860; c=relaxed/simple;
	bh=uOuSDXUycMGGEBp/ZXBAbwU5TCQoE+0TBwNH9RlHakI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qUHnc+d7378TRJm8ezr12yujhoq6KuY0IJLWT60qXLMsrqskOXCQSMfr3XIL/ygLye1P40FzogK+mwNTlb282BB+NbBI15bmQHGhJHnRlQq3+kQpp3w59pYaxoEfr6hVgrLKL987HsyfJWcVx+zMihHVMVq53IMaVhtToLBqFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaJ5Gsz0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaJ5Gsz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783071857; x=1814607857;
  h=date:from:to:cc:subject:message-id;
  bh=uOuSDXUycMGGEBp/ZXBAbwU5TCQoE+0TBwNH9RlHakI=;
  b=WaJ5Gsz0fc6Q3eBbqqLLeFyUMLwssxO4Mt+lrCsVUITemxigZ2pP6FNI
   neU9ZitmLk3bzX7ggA/VrvpoCuoM3IhEpL5gAckc/yE6ON7CIVHe8AHq+
   A1jC8HbaHxMRNPQgiGvpsPl2INo0aXI6PlchGp1YebRBx1xspLURezg62
   eWLT2mNYBm5bKqscJbHMPV72JKMOdzxDpnrfJAWoPh5pLM9PNnm9PFW/H
   utxKaOwCCCwjngQgKlPwOF2PdHAjeolsRRaJz7Dec0AVGAaYVUMdRuJe1
   +vDRbMyaObOI7OhokntcZF/3/yHoz/9SKf2KFYxcmt5l+f7aGao/TKw/c
   Q==;
X-CSE-ConnectionGUID: AhYhw+cJTSyEQo0EAyuumw==
X-CSE-MsgGUID: rxjndMp3Tqulgk4eoufk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83690586"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83690586"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:44:15 -0700
X-CSE-ConnectionGUID: gvnzFvICTmygXfiZ6+G3wg==
X-CSE-MsgGUID: Tq9ALc7mSb6stwLk8HIw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276277074"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2026 02:44:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfaRQ-00000000BwB-1UDz;
	Fri, 03 Jul 2026 09:44:12 +0000
Date: Fri, 03 Jul 2026 17:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: ld.lld: error: call to __compiletime_assert_196 marked
 "dontcall-error": BUILD_BUG_ON failed: !__builtin_constant_p(res)
Message-ID: <202607031732.MOO2Xnuy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   5 weeks ago
config: um-randconfig-r132-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031732.MOO2Xnuy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031732.MOO2Xnuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031732.MOO2Xnuy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_196 marked "dontcall-error": BUILD_BUG_ON failed: !__builtin_constant_p(res)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
