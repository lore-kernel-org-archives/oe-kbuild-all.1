Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3D329E67
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810498; cv=none; b=Ck5TUW+PkZVmMyZNMSZljhF7iZGoGyv0Rb6jJeaGBLY+WwG8zuIzrQZL5coFH08XZ97F1FnN51jBtP7WnPizTt4MApJ7GNZPCih6iMGK1c9pjqKiJfRHt0irBaicAPzVtfquehL/urLf76Xvf/VgmMufQ7B9o9GlHXYepbGi3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810498; c=relaxed/simple;
	bh=MCt1p7xz6n+PdDEuqerHWtOx+BqEoOhEHvMSu/ME+LE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dhWBy7hcBgYXvvEqd+LDGai8aENnYN/fxuK64BfmUmYZTmgYVBLN6f5hskqdUPbb1ZvjsaE+upezsH81SzbpwhIDS9NcRyMklEFSdytnxXBMRgY5lr0Vrc1k+aGgApML9cmWUihQBYnqJE8Wc7v7023pluTF0LumNAwASGoLZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFBwnXa/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFBwnXa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769810495; x=1801346495;
  h=date:from:to:cc:subject:message-id;
  bh=MCt1p7xz6n+PdDEuqerHWtOx+BqEoOhEHvMSu/ME+LE=;
  b=iFBwnXa/PHFNlsvKY5c5KzR5t7aD/fM2vN4MfcIVAPHxwvZFjTbsdsEB
   n3m6CJNeICOMBUYi1N+H/tb6hKTZMUW8bTYibqQ4KW+LUpijd6kBDkpa3
   G5I6cp5iZAh64Tw+lf5RG9hm1ff/ZqKpnyAwavPDaG2E7ArRf7vFnZZg2
   U5FUkyyNoMITGOhTSsmVVhRlTlL4dROwDsHHVFvCXV3oNFE0AmJfylfl5
   QKQb5NOUhUKciVcFCfY+AY2N8bOO9CY5W2SQN+LsL7Rn64aiXgiW1SwWA
   ugCV6W+9+19QXEPgSuCO14mdCUmJMF12WRjox/ZftS0W4j7pXr4XVb6SJ
   A==;
X-CSE-ConnectionGUID: uM0XSbLJR1i7UHla+LB0YQ==
X-CSE-MsgGUID: GSycKB30RFOVgD82jEMBtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70967293"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="70967293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 14:01:34 -0800
X-CSE-ConnectionGUID: hgnDjy2VSnK7gG3rpObgUA==
X-CSE-MsgGUID: 04hLnFfGTNaF63exWBhy5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208212255"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2026 14:01:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlwYU-00000000dOi-2A1t;
	Fri, 30 Jan 2026 22:01:30 +0000
Date: Sat, 31 Jan 2026 06:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/22] kernel/bpf/core.o: warning:
 objtool: ___bpf_prog_run+0x9: ignoring unreachables due to jump table quirk
Message-ID: <202601310520.v5Ae5q9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   1857f672aab1ce60b60db9458e7120522a7b5056
commit: e39422f07828f74b30c30d03632f70a364cb25f0 [8/22] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-015-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310520.v5Ae5q9k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310520.v5Ae5q9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310520.v5Ae5q9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x9: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
