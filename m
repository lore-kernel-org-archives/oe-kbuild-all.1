Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED5136C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692685992; x=1724221992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qz7kyB3r11bGftiLWH+ITGgmYZ1Cnly+1G/e4aG26HI=;
  b=BMgC/4TbJGqGvvqkyjfBCAGORajDksu6uhsnaZ9IzbL66Ejj4g3b3ZZq
   Kn80RJZyXgUqoQcxX3FobvfaZrTwgPVy5ezZIYjxy1qkrGP/FsNfrmn+O
   BpWdMWQuBucUY/DdM60BUe7qTfsn4Wsm1zGg6VLaZCuxg8f0lpx6SZGsV
   oaZjwkoJ27cGEjB/wWXuvTaCn23j/NihUE52DwLe9q9tahS0znLY9eTby
   VLTRQydtgSVWeIKk+7N5KXcBz7mQXyJadBWGB8apw3vFlJwjFpBqrF9sl
   TETTFvLJrPNp9iSoUojKZm5yB9ifvqwb9Ib5tY/3ZGvEOLYH0qbo2SfxI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376526739"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="376526739"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 23:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909984797"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="909984797"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 23:32:54 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYKwF-0001SS-31;
	Tue, 22 Aug 2023 06:32:33 +0000
Date: Tue, 22 Aug 2023 14:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [linux-stable-rc:linux-5.15.y 9984/9999]
 arch/x86/lib/retpoline.S:209: Error: no such instruction: `annotate_noendbr'
Message-ID: <202308221425.ry7zC99R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   fc9952e796d10f995ee74ab63b7f990fec0d8eca
commit: 1ead5999d307fedf2c5ad91df10183221e7c35c6 [9984/9999] x86/cpu: Fix __x86_return_thunk symbol type
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230822/202308221425.ry7zC99R-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221425.ry7zC99R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221425.ry7zC99R-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/lib/retpoline.S: Assembler messages:
>> arch/x86/lib/retpoline.S:209: Error: no such instruction: `annotate_noendbr'


vim +209 arch/x86/lib/retpoline.S

   206	
   207	SYM_CODE_START(__x86_return_thunk)
   208		UNWIND_HINT_FUNC
 > 209		ANNOTATE_NOENDBR
   210		ALTERNATIVE_2 "jmp __ret", "call srso_safe_ret", X86_FEATURE_SRSO, \
   211				"call srso_safe_ret_alias", X86_FEATURE_SRSO_ALIAS
   212		int3
   213	SYM_CODE_END(__x86_return_thunk)
   214	EXPORT_SYMBOL(__x86_return_thunk)
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
