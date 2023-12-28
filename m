Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0CA1872
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 05:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rp4sOmfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703740773; x=1735276773;
  h=date:from:cc:subject:message-id:mime-version;
  bh=e4BPcCIz99Sm20fKQwRCSWIV4nQkERnrynImYTNac9E=;
  b=Rp4sOmfEYcO9orAi/FNml0avL5bgZ4Ot9Wo6YMnPkglEaOzTSIXU5i6x
   h/ktg8M40nYAoXyxmhjuiksobx5Q10B4W5QFW+jTkUVUSU0TlCkpbmqRe
   eRYPsrwrvZWlEHo35NGbOz/rcXjQx6b0LOzyruos90ygx7Ld6twX6kVbt
   ffNsupx0oEWgbfRJv0AGz0qBWYoKDXwzBhgM+IHxZ4YJmGLPeuPOpLDDn
   XZEnTwKP8ZMneH2Ks910Cqjsfmdfmt1tOGekjkKlf9yqucisSPZgd4JXH
   uAQKFbJOtM5EPQz7Udn9fNCMQhotzAY9sko/raVBxyPHv4YkR/QFN/n0+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482692890"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="482692890"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 21:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754643981"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="754643981"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Dec 2023 21:19:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIinj-000G83-32
	for oe-kbuild-all@lists.linux.dev;
	Thu, 28 Dec 2023 05:19:23 +0000
Date: Thu, 28 Dec 2023 13:18:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 7961/30000] block/.tmp_keyslot-manager.o:
 warning: objtool: keyslot_manager_put_slot()+0xda: unreachable instruction
Message-ID: <202312281326.Xczstd9L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   2b69ccfcb3117ca97de0f8d4e752e4776133afb8
commit: b0a4fb22e5db016dd64e375d921345743e4b7ccd [7961/30000] BACKPORT: FROMLIST: block: Keyslot Manager for Inline Encryption
config: x86_64-buildonly-randconfig-003-20231227 (https://download.01.org/0day-ci/archive/20231228/202312281326.Xczstd9L-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281326.Xczstd9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281326.Xczstd9L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/keyslot-manager.c:233: warning: Function parameter or member 'ksm' not described in 'keyslot_manager_get_slot'
   block/keyslot-manager.c:233: warning: Function parameter or member 'slot' not described in 'keyslot_manager_get_slot'
   block/keyslot-manager.c:284: warning: Function parameter or member 'ksm' not described in 'keyslot_manager_crypto_mode_supported'
   block/keyslot-manager.c:284: warning: Function parameter or member 'crypto_mode' not described in 'keyslot_manager_crypto_mode_supported'
   block/keyslot-manager.c:284: warning: Function parameter or member 'data_unit_size' not described in 'keyslot_manager_crypto_mode_supported'
   block/keyslot-manager.c:320: warning: Function parameter or member 'ksm' not described in 'keyslot_manager_evict_key'
   block/keyslot-manager.c:320: warning: Function parameter or member 'key' not described in 'keyslot_manager_evict_key'
   block/keyslot-manager.c:320: warning: Function parameter or member 'crypto_mode' not described in 'keyslot_manager_evict_key'
   block/keyslot-manager.c:320: warning: Function parameter or member 'data_unit_size' not described in 'keyslot_manager_evict_key'
>> block/.tmp_keyslot-manager.o: warning: objtool: keyslot_manager_put_slot()+0xda: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
