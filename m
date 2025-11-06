Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743830EF85
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762427826; cv=none; b=u8ACxhVXaGko+T6b8PmMSbjm1/tsTuyVL/2MM4sCODriEDYPbrZKPbqpQzFUqZiHSbNYP+TaQhOlmV1+pkAoPqn9VleLVh0seI3XC4BqQwyK9zpZ6dH1Ni2VdDtXk9vUm/k1MgxUe0NypZozewHM0J9QVYLnoU5CTEI+IWhATFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762427826; c=relaxed/simple;
	bh=G7mvza/+U8jigr33p24orzL7kcRYPAiApFm8ADW29Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzmVCFPS8HZoDgdHOBt8zwFbsi/sNh6xOUoYJ9IqNH8r/vLJL7z0MtVnTbftn1BVpWxBQWD4oKVqdsLD7QfydUPO2mnNzBQfrL0z5Vg2/G/gKDhNjvhl4Pjk2+mA8tN4F40B+H3pDyXPBFdjQjWKPP9HNE0GRF3mT4HyOrvhq2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAVV1i0r; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAVV1i0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762427824; x=1793963824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7mvza/+U8jigr33p24orzL7kcRYPAiApFm8ADW29Ss=;
  b=aAVV1i0rCgTsBBXIc3624VTbHvaExiOz+c7hU70Cwqk+9GUxuvfFMp2k
   Db5tkPuvvpELfqMePECIay9USWGSuk2PAs4Ly4bpou7IdiIfajwYCA+CN
   XpqQGF1B7EpFngHNpNBk/Gjd1h0w1LT4W3gaY6PTso6FGBj/l+eIZnUr2
   ICUJ1gPiNgLWP+svmenB7h8+fVZ3Syh+fWdv/qiUA7TrGnsovGwaJ2b5D
   L03sTbS0jryMuWDepgUJvZSULMPWwcCeHOWcbYoeljnjChmKKoFj0yGps
   H12j36f4rHDCd88Xj1+ppo9Oj1ImRux4FM1zzqx6C+UOfyIkI7FCQMh2X
   Q==;
X-CSE-ConnectionGUID: pnv1JlRKQOOa2cCHNg+0dg==
X-CSE-MsgGUID: 0ybZEkgIRfyNz756wpVVnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75676189"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75676189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:17:04 -0800
X-CSE-ConnectionGUID: J0zHqY3sSDCZvtL9OMIa+Q==
X-CSE-MsgGUID: eQAoLds4SXmdDrXEI3KsXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187677205"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 03:17:03 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGxzA-000000002wW-3Vv4;
	Thu, 06 Nov 2025 11:17:00 +0000
Date: Thu, 6 Nov 2025 12:16:10 +0100
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:master 11/25] vmlinux.o: warning: objtool:
 fred_exc_machine_check+0x185: call to __kasan_check_read() leaves
 .noinstr.text section
Message-ID: <202511061245.gdMzEtVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   8411fdb92360d0b4d3337492a25ee2de7fb6c425
commit: 8375dadb8d4c6de0dc916ea50b376d9d946ce544 [11/25] Merge branch into tip/master: 'perf/core'
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20251106/202511061245.gdMzEtVA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061245.gdMzEtVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061245.gdMzEtVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: exc_debug_user+0x1c9: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_int3+0x15e: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_machine_check+0x179: call to __kasan_check_read() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: fred_exc_machine_check+0x185: call to __kasan_check_read() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
