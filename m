Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742432C0F9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 00:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042495; cv=none; b=YewHOuO6UN7csJE5rTZmaTLLttYUfb3qzPHdWOgsIDbNf6Wo2Nhyi9nsqYNYii37kNoroJ48+w061/pOiyhqko/iGIiw0nNSL+1sJCVx7bNb43iLtvgVOP9XFMAXizt71cpWEWmQhDfxFGWAgmW5JFYh5Ga1PXc/NQ9ycFMYmQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042495; c=relaxed/simple;
	bh=JoLSkVyPJGJC21j7/jKZn/fjUKYaZSCjoWpmQsE3KZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mjt1gq2iygBNQwq6LxqPHW/Aa/589leGnHHptcdhQkIjQ71zTUPJWuTTnTqAOjEF6hbR0bcNt6TLdNQc55ArxHlXYnQ9cwJMZaMlGDlP4A6QMHPG0MhYfgHcT8/JBX6/PB3cgDiRNGc1oJe70jBbqRGqiBtcZe25lozSMlq/YgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8b+2itb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8b+2itb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769042493; x=1800578493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoLSkVyPJGJC21j7/jKZn/fjUKYaZSCjoWpmQsE3KZE=;
  b=l8b+2itbS1DsKFZwZT4L+Yp8fBdENfnyrPYPwtwi41h/JPe0j0rWdKJb
   LH2e39I7IaTRauvTB4Q5PvrwlE9TxCwD6BdCGKcOc302hjbFzQnepY2wR
   UxMs3y7zuUbNWqbsc0q0js2GJkXmA+CHtv+JWr6qhBN1Uasbq0QD89qfR
   attNMITT8auwZeAHSfLo3YX7cmBp2Z1aRIiXwdKxiWz4i2osVDtHBkqX7
   VuFunoVv6N+1filSp02xCV6FmpQ4Ux7KNRgo9uoEv34XKKuI1dOH6ZG6A
   x9SLFJND6QkJpmBKTLLeHoOPFrFTZCQ39MPJxOjrYoMm+ki0PwZUNOI5e
   Q==;
X-CSE-ConnectionGUID: K2bMZ74aQtG7h3p+I+a9EA==
X-CSE-MsgGUID: 8OUqPv0sQcyRg7EHCFc9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69477557"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="69477557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 16:41:32 -0800
X-CSE-ConnectionGUID: tkh/o0VbQjOd8ekTzE6qZg==
X-CSE-MsgGUID: tVQ8YN92ThKFF0+Z6PvAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211605536"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2026 16:41:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viilM-000000000PZ-497W;
	Thu, 22 Jan 2026 00:41:28 +0000
Date: Thu, 22 Jan 2026 01:41:23 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-selftest-cleanups 7/7]
 vdso_test_correctness.c:169:17: error: use of undeclared identifier
 '__NR_time'
Message-ID: <202601220154.FRT73s3d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-selftest-cleanups
head:   6a69e017e5556be67d9958d71b229d9c0345ba17
commit: 6a69e017e5556be67d9958d71b229d9c0345ba17 [7/7] selftests: vDSO: vdso_test_correctness: Add a test for time()
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601220154.FRT73s3d-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220154.FRT73s3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220154.FRT73s3d-lkp@intel.com/

Note: the thomas-weissschuh/b4/vdso-selftest-cleanups HEAD 6a69e017e5556be67d9958d71b229d9c0345ba17 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> vdso_test_correctness.c:169:17: error: use of undeclared identifier '__NR_time'
     169 |         return syscall(__NR_time, tloc);
         |                        ^~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
