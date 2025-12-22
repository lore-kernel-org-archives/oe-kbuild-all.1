Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964E31ED60
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766368514; cv=none; b=kM9E2aTDs+lOOlRl6H7e6GNcBIP5MUs6pNS/WzsFp88S2N8Wkm7BPBKvMTwYMhrXB69k4bNnVgbBjAorHTXzX7ngSAskufvQ+B/JOr1VjbWt5buCrhx97RCiCWyJ+4vHXZ0eoq9ikCwXy+eUteYOs0dN7GT9wiBSfih2uDkvDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766368514; c=relaxed/simple;
	bh=Fc/pquvTxQgEfzuKix1Zeok7hyE/QUPT0t5hq0R2Ef8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPkxAZvSE1ExwGFC5mUTNIBe8gHwQPQYVeMlBRtPNc87eQn/v/sIYXM0xktElleiQKiYDzej3iIFzyA6lJytlz/jFQlXFUbfpWQE77yPG1F/pO1xzEHcw2yx57qmeyiXt3pE//giRspI1vQxY1t6YNywe4YZOqtjaCysik+21N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6qaBq13; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6qaBq13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766368514; x=1797904514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fc/pquvTxQgEfzuKix1Zeok7hyE/QUPT0t5hq0R2Ef8=;
  b=K6qaBq133+O+liqJ+Ymm04kFGj0G1A3JjqhycXlRBfFAZtvJknxlWqV/
   RZMDLTjzTRgFz13ncCVxaBJb6s6ZFUK6XVrEdbVFMe9ixsA4IhYvt0Zaf
   2e4SCt2UIm0QR1FWt3uPw4NgS07yj0Bx3GM5jpkNwjI0XQxJ2aE+zGesO
   wMBQ81Vo4nLdzHcU8fJEOYArbez1OUoVzjS1QyuVa/Vr3RJvWSy9ZiKxQ
   Tqc+D3FIFE1GeEN5Z50ehc6GpAw3qUpv6xVerMzmcBah4JvKmY9VamFxN
   tFbfoLs+OJ1+bcLif2h651Y8cfhJrqHH+N5Qiel0jUlbFOWrfH+IDeqbW
   Q==;
X-CSE-ConnectionGUID: KFPo8Gv3R3ufjoC7d06adA==
X-CSE-MsgGUID: u4HfZK7jQMaKU+Nk20faEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78546509"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78546509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:55:13 -0800
X-CSE-ConnectionGUID: Nb8ezDC3SPmyJ70KlCCJnQ==
X-CSE-MsgGUID: s+AkFm0NT+W3AkQC+3TG3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199370083"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 17:55:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXV8f-000000005KG-3ITI;
	Mon, 22 Dec 2025 01:55:09 +0000
Date: Mon, 22 Dec 2025 02:54:24 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 34/106]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202512220256.DU6lSQtS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 100b39503458bc2608bd484b9e24c9f8dad7636f [34/106] firmware: add r3mini phy firmware
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251222/202512220256.DU6lSQtS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220256.DU6lSQtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220256.DU6lSQtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
