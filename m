Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BB743F095
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192540; cv=none; b=HMysXEHfrd/tFhFl6YaopOTP2qVGzb2m0F6hEPAcKQk+xNhZBPiF+eCoDILjST4p3mL+UnIEn2cfN66/i2qsTVmBMxgEpA0Yrz3G8f68S7D8LgCZar3g8av3a/xlsBhdOWCUko0XYbSUueMdKLSSqAGDDdaIfBVt9EcYWr9pfCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192540; c=relaxed/simple;
	bh=9oH8G7bmdMITnHgpzlW5sLlECHe5DJDRa9egr9PgwZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlUqb9EoCZxlgrEqPWDPgv88VDDGeKWXkUk/uIUMUThqqDQtfde8J9AIVJKY6I5pme4ATFZwkYmid3AyLm3jcoTqlkXq5fEv+H850v26pQ3yzCEXJwzs8nZWuUtWd0qXlBLb/rFs/z7DZyPEvcLm1F3WR6DU0MTySh0VmsC77So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjDatmGO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjDatmGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192538; x=1815728538;
  h=date:from:to:cc:subject:message-id;
  bh=9oH8G7bmdMITnHgpzlW5sLlECHe5DJDRa9egr9PgwZA=;
  b=jjDatmGOY+h08E1LBHL9rmKs3Efy4FF/BDlWG/c0z0ofOSLoHaoVAuij
   TM57c5VVG5KYeLqu7gfAVFHliQpCwb4nbSmV8h1dkxTkEnJMOlLm6LX92
   U0tLnU0sI0RGZnurKw/FhbRSUED99YILuYsl8yX6l3NEsjIYwOMBoS3Ka
   wPqDdvvfxA+v2ooKCu+a878V5zsI3AixX8NvWiGzpd8dJ820RtRpYZp4F
   U6PXT+CeVBxA6AEbLWq0n4AcUh9Ew5cWOrJU6xUaOJ5ImeMyS3aRExUPH
   mIDQBp2RtgIozu9CWesOtqFZBk/IzK6Z4Ojujfz558zKXBFReFrHW0OcJ
   A==;
X-CSE-ConnectionGUID: 6RlZpgi2SZWdwSU8vZIyQw==
X-CSE-MsgGUID: 0AK3eu5xSPG7k6ZVpFsgag==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88748787"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88748787"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:02:13 -0700
X-CSE-ConnectionGUID: q1DLH8I7RLqXoDED3t8EkQ==
X-CSE-MsgGUID: vapPB1LiRtGu6ybK0G1HBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255305834"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2026 02:02:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHyq-00000000ObY-1yQl;
	Thu, 16 Jul 2026 09:02:08 +0000
Date: Thu, 16 Jul 2026 17:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/12] error[E0425]: cannot
 find function `kvfree_call_rcu` in crate `bindings`
Message-ID: <202607161620.OVvcRkv0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c6f9cfff7e5303d62cede4879db0c6a80745aefb
commit: c55604c2de635a7f7b35e6082ceb5506be3f8d49 [0/12] BACKPORT: FROMLIST: rust: poll: use kfree_rcu() for PollCondVar
config: x86_64-randconfig-014-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161620.OVvcRkv0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161620.OVvcRkv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161620.OVvcRkv0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `kvfree_call_rcu` in crate `bindings`
   --> rust/kernel/sync/poll.rs:177:28
   |
   177 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
   |                            ^^^^^^^^^^^^^^^ not found in `bindings`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
