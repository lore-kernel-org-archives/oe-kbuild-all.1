Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EAD1B393D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730736507; cv=none; b=e0PypCqMgyOKgLpeJfZ5/lcTofLM/Fl7Y27JzblhDReJoOz0oipPuQgm15GMKFnBbegKIZbvyVoHwv65euFYOYl77S6VVl4J9LibttCl9EdU1JM107KnTwO471cMNorPdfjXrvV5lP4Y0eXI5vlmfhI+wDER8yBVaEPqZAaU9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730736507; c=relaxed/simple;
	bh=K0KJYsPVjYl4xT+OmKaWDOnN6KDrGApbJCqZzZxFNt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Svc1UoULuCbPyjCn7z8S7pT8ofBxZgaMYZ5gyBnjCtoNGDQi24hDjOjVyw0SRkgZOKUdN6nYKA9JU6SSSInf2okNG7XKaCqWahaJOISCwBTAIdjvL/qyoRtCCTCnMrxb7+/osVhhJeu+z8HwloHtVIty+w6t9cZ/++97IzVuPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpz9HS3P; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpz9HS3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730736505; x=1762272505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0KJYsPVjYl4xT+OmKaWDOnN6KDrGApbJCqZzZxFNt4=;
  b=lpz9HS3PkwYCp/+EGNHONNYEl9JobrJoTFasgSZ71tQNGvjsLfFmfdKx
   Cg0fR8/ph5K/bi47TBo4ep86nx06dMC08juAEgVJ8RuyOpJb0ZthKM5CD
   4wJZTAhL5g8NIjO1uT7yzoq5DA2eesLxeDHaCFCej2W9NW4Z1FinYH5fE
   eM0jvBnQ6IH27oltGJeWuZ3PYoQUEWNe4xhji/36/1U3zQ0+tMka5ZU//
   jKGyGw/Y6KbIUyC061gKu1hmArAko8kzpGdNNGVPxm439O3A9vzFLa8/S
   /oQc5bEuCg31o5yRwZudlJQjoFG76V1enFJF95A3OnF2P4uVLyLlA+U+5
   A==;
X-CSE-ConnectionGUID: sMlgdjsYTaOOnOVv2DUOFg==
X-CSE-MsgGUID: eVs0JQytRgSw02IAvElSCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53010577"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53010577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 08:08:24 -0800
X-CSE-ConnectionGUID: TYAP5CN9TBSLMMhtXEltDA==
X-CSE-MsgGUID: K8xDFX3dRyOlMB1aeaTLTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83812115"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2024 08:08:23 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7zcq-000l0N-2P;
	Mon, 04 Nov 2024 16:08:20 +0000
Date: Tue, 5 Nov 2024 00:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1219/1219] kernel/bpf/local_storage.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202411050225.MXLzE2ZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roman,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: de9cbbaadba5adf88a19e46df61f7054000838f6 [1219/1219] bpf: introduce cgroup storage maps
config: x86_64-buildonly-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241105/202411050225.MXLzE2ZJ-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050225.MXLzE2ZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050225.MXLzE2ZJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/local_storage.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
