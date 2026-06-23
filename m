Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC53C4540
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782197943; cv=none; b=YZYGXWw8v+qqo1LGIcJIdac1pD3NefW8dPQgO/3EoQTbLH1i8jn8xyHc/rIWMcBfrtk0qQ3GxZGHX67k1rlSVwrQcn4XpEKf+G0LG8Ur422csihjJ9gxXBYJbILE6lwGdRF58jfTPg1XKPXVQtuOo4cTS90cI1TjS3xPj2X+RXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782197943; c=relaxed/simple;
	bh=7bXN5Zr3AbfD9rMxOSgoXl+nGtqbMvx0dvfoIaCJV4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dAiLH4HvxeLYHqHria4kM07IYuAQZOzCTpEA5DQV9yuhd4o7axgA4RcS/6+eg7qXDZtv/HjpLmQovawY/o2Qz9lNPh6eSNzeVcX0dJg0LbdSq1+3s5ArZ9mRKtzKM/bv60oa+50VPCowFnspVSyPgZvG8PPPSIco3Ttepp/9Yow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkO/lasa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkO/lasa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782197941; x=1813733941;
  h=date:from:to:cc:subject:message-id;
  bh=7bXN5Zr3AbfD9rMxOSgoXl+nGtqbMvx0dvfoIaCJV4k=;
  b=EkO/lasaEfzd/Mk57A9XWVw5bPhE4T5h8Dib2T+iWTMdBA95hh+EqHSC
   4OUkQBhXpU4ip0+uibm3GQjdgd3xwn7TIN6NCRyDMHYemqgrFlQxaXhqE
   CofsemYn4B7mdbzjU/EEdGjIQGqLYKPTHZdUXCdUzM5kgkglzvjk1KVhB
   qkGWiPjOMxElyJzT5TomQPt28W2IBExHypXWrWQ+ZPEbeC+X+N2IxqlOV
   hFDIPBFhYi6pb2FrXDS+VFuHD374VOMMTkTQpn+PJf9p118wxVtf6ut3Z
   F3iSjGZ9wkRSxqr3kdvWAu72ioc9AHuq5Xj5TDTPzwh9prtZ19jhyF92Q
   w==;
X-CSE-ConnectionGUID: CiFMpD1fSsaiULYWqwM3jQ==
X-CSE-MsgGUID: 9YhXLYeTR1Cq44xTtaMjqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93589401"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="93589401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 23:58:59 -0700
X-CSE-ConnectionGUID: TrmwpLJyQ4GwnnwgulLQBA==
X-CSE-MsgGUID: GLLzNFjxReGs5iFKu4vQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273498564"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 23:58:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbv60-000000006AX-3JRa;
	Tue, 23 Jun 2026 06:58:56 +0000
Date: Tue, 23 Jun 2026 08:58:56 +0200
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/g3s/my-i3c 6/9] htmldocs:
 Documentation/userspace-api/i3c/i3cdev.rst: WARNING: document isn't included
 in any toctree [toc.not_included]
Message-ID: <202606230835.j7SjFbMU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/my-i3c
head:   9323ea7e2324618ca83fa000855708b2a8068ed4
commit: c65d32bbdc12c4b6ce723fa94e4199a75212d994 [6/9] i3c: add i3cdev module to expose i3c dev in /dev
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260623/202606230835.j7SjFbMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230835.j7SjFbMU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/userspace-api/i3c/i3cdev.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
