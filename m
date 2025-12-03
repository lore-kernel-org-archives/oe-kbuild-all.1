Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD662877CF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797018; cv=none; b=SgF17KMWcKtxV0h7epL74hp5raKaVwOcXhOdOz2Oac/K4zdjZJ7kbiDtJ0bJS65FlS/b62MKDtRMPRuSWzU+R0fIYMOCA57fIzcdtoPy15OWcB0qoQ7rxVJj6AVomnKkiPoG8EMtuYY9MYDQ834xvCOvS/YaLlb+ke343/e+M0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797018; c=relaxed/simple;
	bh=qXc6QCY87w130dUppA+7+wWR3RG5Kqq4dR7T1UIdDZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1uDjbw4ip0eAtWVr0LJ25BmMbwPNvlfwit82kiN/Pw9e99fmUAZyhtX3Ulv4NDmRl7qSZhlpN2/zjL0qbnf5sRx1BMVXhCmkPiEm31Dwq40oC1MOEmciZVD8ytD3Da/miKZIPc2gouRx0/N6o2VTMENMbUY4b+fhPETp3uVO2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE9j9qbF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE9j9qbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764797018; x=1796333018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXc6QCY87w130dUppA+7+wWR3RG5Kqq4dR7T1UIdDZg=;
  b=gE9j9qbFpcfG7Eg3M5+jHQnVjUnZ3IM4unzcowgo8pb+HLxAAIqWGluS
   kSYch4WL8yWlM3YGxSwi94NFrYSaRvF0qUgVFHSgINQ7sHIUfzifdeiOK
   X8ekD25ssbQilCPRqxuY4sZe6Xix3Rf4C86PGzRAIGLnayj/FlJN+Ke3U
   UGde1E9lzYQBrSs5U1Rt1/m0G6heSlLCz+O41uRbErrG+R2qLquJ5O+qU
   R04L41iPYne9JfSzk6+ptL8qiZNcSCeXukp/sH2mQPai3SIj1P5cFruII
   UqjTx4DAMDdDnM7JAyrI3GN2JTLk8fA+9DCF/hjIsy9QtOGmYfFFTVVJJ
   w==;
X-CSE-ConnectionGUID: QScbECznQnOclmLo5tSEKw==
X-CSE-MsgGUID: Pj4OH4/WRYaOO+Q/opVr4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66768726"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66768726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:23:37 -0800
X-CSE-ConnectionGUID: GGafXwo2S+STAhVPm4Z4Xw==
X-CSE-MsgGUID: ayEYhHM3SV+RrQguRZOdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194839768"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 13:23:36 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuJx-000000000YT-1DlN;
	Wed, 03 Dec 2025 21:23:33 +0000
Date: Wed, 3 Dec 2025 22:22:44 +0100
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 6955/13147]
 tools/testing/selftests/hid/tools/include/vmlinux.h:84754:2: error:
 declaration does not declare anything
Message-ID: <202512032214.6vUTkHrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b2c27842ba853508b0da00187a7508eb3a96c8f7
commit: 854e8df2ce6b02c8be40d6f26bd8aa700b375bb2 [6955/13147] fs/pipe: stop duplicating union pipe_index declaration
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512032214.6vUTkHrj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032214.6vUTkHrj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032214.6vUTkHrj-lkp@intel.com/

Note: the linux-next/master HEAD b2c27842ba853508b0da00187a7508eb3a96c8f7 builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   In file included from progs/hid_bpf_helpers.h:28:
>> tools/testing/selftests/hid/tools/include/vmlinux.h:84754:2: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
    84754 |         union pipe_index;
          |         ^~~~~~~~~~~~~~~~
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   2 errors generated.
--
   In file included from skeleton/pid_iter.bpf.c:3:
>> tools/testing/selftests/hid/tools/build/bpftool/vmlinux.h:84754:2: warning: declaration does not declare anything [-Wmissing-declarations]
    84754 |         union pipe_index;
          |         ^~~~~~~~~~~~~~~~
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
