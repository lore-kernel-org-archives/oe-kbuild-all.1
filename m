Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6014716A395
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765108904; cv=none; b=EtuvJd8+ajP73M9ULhraraRfmCSD5W5AEzbb9JgjpNQ8YQCUzKBCrWAiFbJHFOJ6vwTyUqntuIpwJHDj+V+bxzNQWyxago5W2x59TBOUoDRDe8opUaKcgQjxb8OS+yNGJtPIIfVGwe5U5NAIOj/UHsVMcKZNy0z5b1CmYd1egEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765108904; c=relaxed/simple;
	bh=C6cUCZO/y/QTLKM7gUEKc02TG9Ypg5braEV0bWqYRJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaCqa1Z309rBisGgo2nCUUh+R+JnVIB+ThKyfG/BZiOKn0KLEPPmOEucGr01i1+b4cawUM5BDf/j3LMGaj0P1jXWA2N8WBUzpcoNkNWvUxEiVkY4oqcRu3edlh6ia6LrLo45oKcQsgDPVUBovedCPVkzceYOslhW0SAzYfBI8SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrKvJZOC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrKvJZOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765108902; x=1796644902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6cUCZO/y/QTLKM7gUEKc02TG9Ypg5braEV0bWqYRJM=;
  b=DrKvJZOCL8sOc6hxwfkF3sPHIr8l3rV+BhntLitLSFKRxzWFO1PWohsz
   kfN5lQisPVZczesNLrfIzK1+WQehaZLug91Uu7EAYEJZeMueVPl55T7Ji
   6BQVy5j6fQKo8caDf21XjZByWDm6pEGTq2YmLLTqYMw8BWgR8Hk5pcNvO
   t3OlgDl/7v28/paRY6YE2uGsZUd6wruaSFVAqFjthskDJtCQH2akZxEiz
   OhQULpke/yii0bNHxj6gbJoN9/45mVU8iRZPr6p8dh/q85gmqNlUDOqii
   aaRJ6lMWA0wEWrgrdUncBG/z8NODMOu+Bzer6QYngst7bhSfCc6g8M/Wx
   Q==;
X-CSE-ConnectionGUID: LdKNC3YfS6O2631/2TDqpg==
X-CSE-MsgGUID: 0tO1Yss3Tg2Pnha86u75tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="70926655"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="70926655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 04:01:41 -0800
X-CSE-ConnectionGUID: slQhEb5bRQ+VtH1UjJ+oiQ==
X-CSE-MsgGUID: QKWRnXIdQaGam6k+ooWjiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="233062184"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2025 04:01:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSDSL-00000000JDV-2Hxc;
	Sun, 07 Dec 2025 12:01:37 +0000
Date: Sun, 7 Dec 2025 20:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 5/8] include/linux/annotate.h:32:1:
 warning: parameter names (without types) in function declaration
Message-ID: <202512071920.e9ofl8WK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   051df5c21cbf6d9ac396c22b3ab3c51d73c0def7
commit: 28e63e2c890661dc9bcdbe172eba06b26220d455 [5/8] objtool: Convert annotations to assembler macros
config: powerpc-randconfig-002-20251207 (https://download.01.org/0day-ci/archive/20251207/202512071920.e9ofl8WK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071920.e9ofl8WK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071920.e9ofl8WK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/objtool.h:6,
                    from kernel/bpf/core.c:28:
   include/linux/annotate.h:32:1: warning: data definition has no type or storage class
      32 | DEFINE_MACRO(__ANNOTATE);
         | ^~~~~~~~~~~~
   include/linux/annotate.h:32:1: error: type defaults to 'int' in declaration of 'DEFINE_MACRO' [-Werror=implicit-int]
>> include/linux/annotate.h:32:1: warning: parameter names (without types) in function declaration
   include/linux/annotate.h:33:14: error: unknown type name 'ANNOTATE'
      33 | DEFINE_MACRO(ANNOTATE(NOENDBR));
         |              ^~~~~~~~
   include/linux/annotate.h:34:14: error: unknown type name 'ANNOTATE'
      34 | DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
         |              ^~~~~~~~
   include/linux/annotate.h:35:14: error: unknown type name 'ANNOTATE'
      35 | DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
         |              ^~~~~~~~
   include/linux/annotate.h:36:14: error: unknown type name 'ANNOTATE'
      36 | DEFINE_MACRO(ANNOTATE(INSTR_END));
         |              ^~~~~~~~
   include/linux/annotate.h:37:14: error: unknown type name 'ANNOTATE'
      37 | DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
         |              ^~~~~~~~
   include/linux/annotate.h:38:14: error: unknown type name 'ANNOTATE'
      38 | DEFINE_MACRO(ANNOTATE(INTRA_FUNCTION_CALL));
         |              ^~~~~~~~
   include/linux/annotate.h:39:14: error: unknown type name 'ANNOTATE'
      39 | DEFINE_MACRO(ANNOTATE(UNRET_BEGIN));
         |              ^~~~~~~~
   include/linux/annotate.h:40:14: error: unknown type name 'ANNOTATE'
      40 | DEFINE_MACRO(ANNOTATE(REACHABLE));
         |              ^~~~~~~~
   include/linux/annotate.h:41:14: error: unknown type name 'ANNOTATE'
      41 | DEFINE_MACRO(ANNOTATE(NOCFI));
         |              ^~~~~~~~
   include/linux/annotate.h:42:14: error: unknown type name 'ANNOTATE_DATA'
      42 | DEFINE_MACRO(ANNOTATE_DATA(DATA_SPECIAL));
         |              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +32 include/linux/annotate.h

    31	
  > 32	DEFINE_MACRO(__ANNOTATE);
    33	DEFINE_MACRO(ANNOTATE(NOENDBR));
    34	DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
    35	DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
    36	DEFINE_MACRO(ANNOTATE(INSTR_END));
    37	DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
    38	DEFINE_MACRO(ANNOTATE(INTRA_FUNCTION_CALL));
    39	DEFINE_MACRO(ANNOTATE(UNRET_BEGIN));
    40	DEFINE_MACRO(ANNOTATE(REACHABLE));
    41	DEFINE_MACRO(ANNOTATE(NOCFI));
    42	DEFINE_MACRO(ANNOTATE_DATA(DATA_SPECIAL));
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
