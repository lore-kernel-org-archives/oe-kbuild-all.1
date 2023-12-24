Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDEA15C2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lL+aCWbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703408620; x=1734944620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbN9ejuoHlLE1Xp6A8NDfoBX07/n/xqQ3KA6bW8zZho=;
  b=lL+aCWbqDrD5jS6dmPsYBgl+ldaOnw3qU2LBfVFzS+q6Ktd+Pyh9KZEn
   nJJKZQwHHGBP520sQv6mT1zlZtVDYAMacrQxkgxokekx4UW9UNyjflsJD
   I8nL7iAjamwE2A/H/qjqQYtfUlU96/4Rb76p8v5Df4JG19FSQ+L/Sdx6f
   oTfAXCKeL/oTPCaVkZR0G7m+nbaHcT6/sMGjCwR/U7Lz0/3WVk/QNdq7H
   DGkUxdE3vMF/qmOLhJLscVAht7FXfj/ubJhIwSxmx+Kk9Siq5MxUpX62b
   F9iqlmIfzZSOLUrJ6lEtJOxWBvS2Ot1sDO8gT7EoJUE11MqBcHsAgsG8S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="3484690"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="3484690"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 01:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="727287868"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="727287868"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Dec 2023 01:03:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHKOR-000C1v-2f;
	Sun, 24 Dec 2023 09:03:32 +0000
Date: Sun, 24 Dec 2023 17:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 3585/10295] WARN: resolve_btfids: unresolved
 symbol bpf_get_file_xattr
Message-ID: <202312241609.w1nPmrz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: ac9c05e0e453cfcab2866f6d28f257590e4f66e5 [3585/10295] bpf: Add kfunc bpf_get_file_xattr
config: powerpc64-randconfig-r024-20220211 (https://download.01.org/0day-ci/archive/20231224/202312241609.w1nPmrz3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241609.w1nPmrz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241609.w1nPmrz3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol unix_sock
   WARN: resolve_btfids: unresolved symbol bpf_cpumask
   WARN: resolve_btfids: unresolved symbol bpf_verify_pkcs7_signature
   WARN: resolve_btfids: unresolved symbol bpf_lookup_user_key
   WARN: resolve_btfids: unresolved symbol bpf_lookup_system_key
   WARN: resolve_btfids: unresolved symbol bpf_key_put
>> WARN: resolve_btfids: unresolved symbol bpf_get_file_xattr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
