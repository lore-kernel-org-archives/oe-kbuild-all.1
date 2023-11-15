Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF3DF51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPFhQJvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700044654; x=1731580654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pASj3ynWAqrCC1Zge9+9eZpkrLPAlWqt+3s/Z4yMYFw=;
  b=IPFhQJvhO2xRQFmnonvjOKMmkE+XhcIb936u+ntxgYFND7sLTx8Hz0uy
   SMSwBisaFJIG7843WU92zeTWPRPb8Zp8zpfITa1dQHM8RKFt8Ujm1yRle
   W+oAc7iXCuJFNuo5Z3LTRmAKyItFJLZjJXZ2sFXuMXxn6QFr8g7skKl+W
   mzwklPGqwqsXKtrLmIeBKIYMiF2+qP2iGs8UHUc6WXh+ffsAwHSfIRSuo
   nj+9wWbafGwoJxOvU9I0WAmVJccZXSVwR+UXxkQjxx8WWCXJ56zemKgrK
   EVqnr0ombOHHEC047XAuGCUB2OrklJHVEiH1mj/P6+zjpROpeQvE0PS4u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="477074238"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="477074238"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 02:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="830915908"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="830915908"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2023 02:37:32 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3DGv-0000Fc-0R;
	Wed, 15 Nov 2023 10:37:26 +0000
Date: Wed, 15 Nov 2023 18:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: /tmp/ccDME0uz.s:1274: Error: unrecognized opcode: `ldbrx'
Message-ID: <202311151805.cYO3x9wy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: f5df87b855fd835ff0f4928575adbf4f5302bb40 powerpc/build: Remove -pipe from compilation flags
date:   5 months ago
config: powerpc-cell_defconfig (https://download.01.org/0day-ci/archive/20231115/202311151805.cYO3x9wy-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311151805.cYO3x9wy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311151805.cYO3x9wy-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccDME0uz.s: Assembler messages:
>> /tmp/ccDME0uz.s:1274: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:1276: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:1278: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:1279: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:2033: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:2039: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:2040: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:7758: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:8366: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:8493: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:8495: Error: unrecognized opcode: `ldbrx'
   /tmp/ccDME0uz.s:8502: Error: unrecognized opcode: `ldbrx'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
