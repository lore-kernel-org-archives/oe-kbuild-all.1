Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17A277CBD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011979; cv=none; b=GdxYkH2DxVoFEZsX2TKxVuvt0eczhwvMTbAcxjg/ZjrnrVVeasGPfKvuY8t3pg2I7+VOPFpcC28HTs5qNOvlopgTxvKfFs8+FoBAnT46XyycgvAK9wf1eoj1e/bKIq/ArbPAhxKiauh5cIgex6o+l+6tOVgkQ9Gde/F4P1+MdBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011979; c=relaxed/simple;
	bh=A40ACPpV9VS7fdEmgln1LJ+oy/YlK1yHCgs/y27JgCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYxleaJ0hul36Ec8Ie4c+L9zdDlRzbT1VVyug5wzyLenj61nfa3rq+3c7FIxJFRiucBby8BtGZJRTLOc5m5j3aUKeb2vne0vtQNvrUH/iYWsMRjTP1FXuiQWMz18Kcuz+N4bVoW7thsA1DZRecNTI2JV2gwRGmBBsXVidKvkQz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuOZwlrV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuOZwlrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758011978; x=1789547978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A40ACPpV9VS7fdEmgln1LJ+oy/YlK1yHCgs/y27JgCQ=;
  b=GuOZwlrVKVsbcdZDWnPegaAJYbDqcxWDMxODQHMIYintqAaNeqYM8Doh
   hcjN8zhqvAi68BDVhhwTSC2v/992X5cyzHjt6rizU4VRatgk+JNZlBqly
   U10ItBISvqZUWLrOBmkFgOg8/qa8CfbjUwFCm9eUNmXEhetjzmr9IXIJs
   nOfRLjainLl8qZdi7OmXt+1X6PsPv8PsK/Pe5rC5IZ1rI1ALeSnRiv3KB
   IV73AqGbPTc28Z7cmFHSjnXZY6t1Myte2SNP7tIeIZUCxKzNpJj5rs4er
   kr6lRD3c/WjCRixEz+VQS7n0/bDzHRSKHpk8TexA+O8HNWKsBQ+VoRTJi
   w==;
X-CSE-ConnectionGUID: VLMtfGwDROqtcrnGdQOS1g==
X-CSE-MsgGUID: ajrnBTEwRam58tl9LuxfrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64090445"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64090445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:39:37 -0700
X-CSE-ConnectionGUID: l1UTrP/9Shaa9HnhAS4Ftw==
X-CSE-MsgGUID: LakhMgNbT/SHSjd9/B9VOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="180130049"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2025 01:39:36 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyRDp-00006v-3D;
	Tue, 16 Sep 2025 08:39:34 +0000
Date: Tue, 16 Sep 2025 16:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 47/63] include/linux/annotate.h:116:41: error:
 expected ':' or ')' before 'ASM_ANNOTATE_DATA'
Message-ID: <202509161602.PBvzz48S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   2593505eb2ab279f15bb41f68fc71e07e88c48d1
commit: b7bac878d42c246802d0371ba54de9923e9dc954 [47/63] x86,objtool: Annotate special section entries
config: um-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161602.PBvzz48S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161602.PBvzz48S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161602.PBvzz48S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/objtool.h:6,
                    from arch/x86/include/asm/alternative.h:7,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:257,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:65,
                    from lib/string.c:25:
   arch/x86/include/asm/word-at-a-time.h: In function 'load_unaligned_zeropad':
>> include/linux/annotate.h:116:41: error: expected ':' or ')' before 'ASM_ANNOTATE_DATA'
     116 | #define ANNOTATE_DATA_SPECIAL           ASM_ANNOTATE_DATA(ANNOTYPE_DATA_SPECIAL)
         |                                         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/asm.h:197:9: note: in expansion of macro 'ANNOTATE_DATA_SPECIAL'
     197 |         ANNOTATE_DATA_SPECIAL                                   \
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/word-at-a-time.h:77:17: note: in expansion of macro '_ASM_EXTABLE_TYPE'
      77 |                 _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_ZEROPAD)
         |                 ^~~~~~~~~~~~~~~~~


vim +116 include/linux/annotate.h

1a6f9c365a6ccf Josh Poimboeuf 2025-09-15  111  
1a6f9c365a6ccf Josh Poimboeuf 2025-09-15  112  /*
1a6f9c365a6ccf Josh Poimboeuf 2025-09-15  113   * Annotate a special section entry.  This emables livepatch module generation
1a6f9c365a6ccf Josh Poimboeuf 2025-09-15  114   * to find and extract individual special section entries as needed.
1a6f9c365a6ccf Josh Poimboeuf 2025-09-15  115   */
1a6f9c365a6ccf Josh Poimboeuf 2025-09-15 @116  #define ANNOTATE_DATA_SPECIAL		ASM_ANNOTATE_DATA(ANNOTYPE_DATA_SPECIAL)
bbbacd28eeda68 Josh Poimboeuf 2025-09-15  117  

:::::: The code at line 116 was first introduced by commit
:::::: 1a6f9c365a6ccf43552a506bcf08caed21cfd8cc objtool: Add ANNOTATE_DATA_SPECIAL

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
