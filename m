Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5F314D1F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 00:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901931; cv=none; b=Ad3/Ajw5Txtve+bqh71+ap3nTWb6oHrjfh8kSOD4FfwoeJozTe2VSc+AA+x3NiGUcKO6CkVVF+bYtkqDMVHKTdu8iDgMm64dNAEdCBAff4Ku+rUEu0Wsx2Gd6oyUF6TJS6aYGUEvcI5NwH+X8oMw+DwYoHiL2uUVSZjNyPEw1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901931; c=relaxed/simple;
	bh=mQObMuicUlhYWw1feU+uqvqfzBoDNgKF31vS02SLfzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mn7uV8aKvjg4CJWSfIUPZjt8TjWz/11rvYwDi1KUqRHJzJYzg2oXbIVzrGqR2ya06lB4LaSwPkKtX73D1sni/VqTePleOmbJ3i8Tvm6k9cXDsh8DxI8PnFvOY3YM1tmr9v1sgZQ80kgA9HTxJgAeokYicF8LqZHrGFak7jta8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGriXBJx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGriXBJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790901929; x=1822437929;
  h=date:from:to:cc:subject:message-id;
  bh=mQObMuicUlhYWw1feU+uqvqfzBoDNgKF31vS02SLfzQ=;
  b=dGriXBJx8GlmG+XiUKNvrBFX/mZDHf+YjJfiLsfqNkTKcjOnkNn1FGpW
   bi3G0oa47ui2wS++cGhKknnW4b7YfoqLTzDVs/j91oOAfkKf2DtnPb9/o
   WycE9Ipcbs+v3/58qh3R2gJzVhUG50uSardCoWBAcBW+TKbIeHFatfD42
   fJpCmBlz5SzCSzhjRYp+N2Ra0DVcklrb3SxGWDgMw40OCOn94fPXO2UBv
   q8f5dgq2yyjhG8voTeLSGfU4dz1YJkW+CZKVnmzFtIJ42NAFHXHv+9rQm
   K4C2zb4G3Ac4iZ7azDEqE81zG3sUZBx8fRIhxhYK1ISTYdx1VRlp7yP3H
   w==;
X-CSE-ConnectionGUID: Afej+8BbRY+sNtahRjJAXg==
X-CSE-MsgGUID: XY3J8ON8TS6vAcsWUyn2nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90575308"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90575308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 17:45:28 -0700
X-CSE-ConnectionGUID: prgQog1yTsCF2zYZU+CTjw==
X-CSE-MsgGUID: Bm9KO+kQR7OKoMQOOuANcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="314110916"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2026 17:45:27 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCROu-000000000JD-2MQD;
	Fri, 02 Oct 2026 00:45:24 +0000
Date: Fri, 02 Oct 2026 02:45:13 +0200
From: kernel test robot <lkp@intel.com>
To: Enze Li <lienze@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0425]: cannot find function `damon_set_target_pid` in
 crate `bindings`
Message-ID: <202610020212.9vL18fPN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Enze-Li/rust-add-bindings-for-linux-damon-h/20260927-152809
head:   b54b30247a4ba73c11361c6587ddc5d7c846aee6
commit: d565ea288f88d540e84887dd348c601db90f7b04 rust: damon: add basic DAMON abstractions
date:   5 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020212.9vL18fPN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020212.9vL18fPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020212.9vL18fPN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `damon_set_target_pid` in crate `bindings`
   --> rust/kernel/damon.rs:56:38
   |
   56 |         let ret = unsafe { bindings::damon_set_target_pid(self.target.as_ptr(), pid) };
   |                                      ^^^^^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:140204:5
   |
   140204 |     pub fn damon_new_target() -> *mut damon_target;
   |     ----------------------------------------------- similarly named function `damon_new_target` defined here
   |
   help: a function with a similar name exists
   |
   56 -         let ret = unsafe { bindings::damon_set_target_pid(self.target.as_ptr(), pid) };
   56 +         let ret = unsafe { bindings::damon_new_target(self.target.as_ptr(), pid) };
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
