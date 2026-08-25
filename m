Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56493C10A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684455; cv=none; b=LM8DHTBJTU/yohxTj4Kd3XfxXVh54O3n9SzcotW42irMFPJgH1M5dknMK7GEkpaDCDfFCHoDzjAX/Bq6BFMgOYes4IDZunZM9YQmxvFuQem4rwoiMdbBpaRNwU3ObMZ3E3Kf7r13b9mhviyKFoY1NP2q7WjXOJffP/Vax8Neqlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684455; c=relaxed/simple;
	bh=sqi+Sa4oDoA2zZnmTfcgodNmYBQjMGGQHYrDPwkslwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q5T/mZYUkKiZ17ko0fGLde9P6YQx9x+HBaXYcei/5j1AERVB50nFcEOXhIKrX+Xxe6nb+eb4jmpTqRAE3bafUQ6kOXIL159p9LgBv2suMbHwNfuM60e7T5jGuXtFND+qAFVlwRd6hPrzGWESMWtJtF/SfiotCQLSamR6x85wWLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPnSJ6ka; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPnSJ6ka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787684427; x=1819220427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqi+Sa4oDoA2zZnmTfcgodNmYBQjMGGQHYrDPwkslwU=;
  b=lPnSJ6kaDhVUJKoPo5/xMccbqPwYShUSj2fdfGRYMM81ARfnVE4z1mML
   VFuB2w88y4cfkcqgn1v+oZ5TqLtsCSQUS3Snn3wlntFJRhqbLa00Hnvq0
   h/1XHJuiKAbSzWKe9qefpA/WtN/os/ZfyFo1eff3AZFOkL+bLrPxo6O2s
   Kgay82ESt7rn+B3gFUTdLKUsL3CuEiitIRN66xuDPDGMdDGz4oj8d2OUv
   Lg4KKWwEl13SoS9cMLfQ7CBDG1HHGbrMATpZHA0dYTQCjGa9WeshFd5ji
   NIGMTRzShmqyVK2M1z3LDxsfoDt1gyOiinXmvIe7bgZEYw7QQPBekvN9P
   w==;
X-CSE-ConnectionGUID: dHuPW8ncT4GQktwMQNKLcg==
X-CSE-MsgGUID: zH7KHSgiRx6rG5uhFfmp1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="75699002"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="75699002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 12:00:26 -0700
X-CSE-ConnectionGUID: 5M8u6Tu8R8yXOqNMBgPn8g==
X-CSE-MsgGUID: NOe5ZzxlRou+1YJlPxNmug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="267938182"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 12:00:25 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wywNi-000000006GV-2QZ1;
	Tue, 25 Aug 2026 19:00:22 +0000
Date: Wed, 26 Aug 2026 03:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 14/14]
 arch/x86/net/bpf_jit_comp.c:28:1: sparse: sparse: symbol 'jit_ENABLE_KEY' was
 not declared. Should it be static?
Message-ID: <202608260258.V659aXDB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: 45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0 [14/14] bpf/x86: Route JIT compilation addrs and trampoline image to scratchpad
config: x86_64-randconfig-121-20260825 (https://download.01.org/0day-ci/archive/20260826/202608260258.V659aXDB-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608260258.V659aXDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608260258.V659aXDB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/net/bpf_jit_comp.c:28:1: sparse: sparse: symbol 'jit_ENABLE_KEY' was not declared. Should it be static?

vim +/jit_ENABLE_KEY +28 arch/x86/net/bpf_jit_comp.c

    27	
  > 28	DEFINE_SCRATCHPAD_PARAM(jit, "Toggle BPF x86 JIT compilation scratchpad");
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
