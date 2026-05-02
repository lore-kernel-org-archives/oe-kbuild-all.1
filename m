Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC708241139
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 17:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777741951; cv=none; b=cEPOpjkLiRKYmyltQzr/L6MI24JuJrzl26T88iO7ntxT+f2N7iC2qPEvsdvsj04jCkb47A8vKTBK7gu3NRZq08ygHO5wOwCbSlnFqatImk/7ZRrFYvNqPxKL5Zba8sctB6j7+Ukgq5FAyIrWPF70vEm92c9941oF8/k0FXHAgaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777741951; c=relaxed/simple;
	bh=UFTCWqWYLlcZkBWKMO1VRa2QXVxrNnBqhtu6gTX3rlw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c9C2zu1+58twJ/yXUbB5v3xwhZkZKYYZsFI1WZm21xG1i52aOm4ckD1NGO7YmAl10fdbwOfsqTufE6DEUEXIJMpTZE2Wbd1rDh7/OtSD8y1OcebthtPRm/j3l6qRwzlhDyCzvD7OndQeNzP2WNwpdvOvM66VpgI8wWwFvCpYsXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJEwXULs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJEwXULs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777741950; x=1809277950;
  h=date:from:to:cc:subject:message-id;
  bh=UFTCWqWYLlcZkBWKMO1VRa2QXVxrNnBqhtu6gTX3rlw=;
  b=mJEwXULswEuOnTiTtvnzEGFVp2g4tdI5tjF2uz1f+vuxaHCsk+b+nU+l
   h7PMZjXTJEsnCOwRAPAz0mJh0CKu3sQg+s1lMesOx1L6eExnKxgbeKnEG
   dkySDbQ0OJg+mDZqzY0Ur7iN4e7gFPCed77FKVhyPw25Ui05UXSXMv/l2
   7L+grOmtNrkneIPBSBFSlWhIltGJHjtXjQbbXf9dNqN30EdwluElUtTGw
   7fvpkMWrFf1yg8Hr3Q0yR/5B/7UNCyfd7J4tHDSPDdcOML4NKJyN7kHlZ
   NcTTyhtbBPE5swDTILPd9EwPbIrUCCpdIn/ybyPUMXtxp+8xe3EL+qT9H
   A==;
X-CSE-ConnectionGUID: 42k/TJXDQDmUSUrFhMwf+A==
X-CSE-MsgGUID: 5SnEaz/FStejBY4UceLUoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="96097953"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="96097953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 10:12:29 -0700
X-CSE-ConnectionGUID: JSpce0juRw2uEpjcEVkxNg==
X-CSE-MsgGUID: XHHW8DHnR9qzLue7KU9eig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="235014839"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2026 10:12:28 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJDtB-000000001dr-2DZL;
	Sat, 02 May 2026 17:12:25 +0000
Date: Sun, 03 May 2026 01:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:2791: Error: register save offset not a
 multiple of 4
Message-ID: <202605030148.PAS4Jr9J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   3 weeks ago
config: m68k-randconfig-r053-20260502 (https://download.01.org/0day-ci/archive/20260503/202605030148.PAS4Jr9J-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030148.PAS4Jr9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030148.PAS4Jr9J-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:2791: Error: register save offset not a multiple of 4
   {standard input}:2792: Error: register save offset not a multiple of 4
   {standard input}:2793: Error: register save offset not a multiple of 4
   {standard input}:2794: Error: register save offset not a multiple of 4
   {standard input}:2795: Error: register save offset not a multiple of 4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
