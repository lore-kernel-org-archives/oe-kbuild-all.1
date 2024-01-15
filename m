Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55417CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 01:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQLFKVm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705283587; x=1736819587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9SvcrbxXb3u0OspWlNjKs8OlH+/86p9b+GO/LAVq/A=;
  b=bQLFKVm4xN6HicJi3Qei7hqRxC9gEyPs0A2iZbQkyDWtA0zJbQ/CWgY3
   afONskhW38qFjAz44NEa3nUk+HPxvCQwxBIOmG/1qwi0wLob907tqNfHc
   su5suUhhwo7wLoQ8T9YqayGL7wLTNdRnw+J89H6xMrHAUGZdPIV8s5ryn
   R5yQLNMAKfpqO7YslTSNpms0XEqQkOwQpHRgpdXyA5ZY7IEcVf8J6iDTs
   J5jcM/b9aCRRiUJfw/iQbOMjJO31gyKIwmfdPNag+sq68xoCKahmMlQh9
   8gmUoTuvqfZs710pLX7/RAnQzgEW6ZIJbMM31jChMd0S95t9N0B804uA4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6234632"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6234632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 17:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="956690707"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="956690707"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2024 17:53:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPC9o-000Bzy-2Y;
	Mon, 15 Jan 2024 01:52:59 +0000
Date: Mon, 15 Jan 2024 09:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v9-devel-v2 21/26]
 security/integrity/ima/ima_main.c:925:12: warning:
 'ima_kernel_module_request' defined but not used
Message-ID: <202401150908.EjMwAzKt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v9-devel-v2
head:   cecbad8f6b7bd792ef6800d84542b15b5901ed57
commit: 255b2931b1b6cbe340c9ca968872f9d4fc7e4891 [21/26] ima: Move to LSM infrastructure
config: i386-randconfig-003-20240115 (https://download.01.org/0day-ci/archive/20240115/202401150908.EjMwAzKt-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150908.EjMwAzKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150908.EjMwAzKt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:925:12: warning: 'ima_kernel_module_request' defined but not used [-Wunused-function]
     925 | static int ima_kernel_module_request(char *kmod_name)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ima_kernel_module_request +925 security/integrity/ima/ima_main.c

   909	
   910	/**
   911	 * ima_kernel_module_request - prevent crypto-pkcs1pad(rsa,*) requests
   912	 * @kmod_name: kernel module name
   913	 *
   914	 * We have situation, when public_key_verify_signature() in case of RSA
   915	 * algorithm use alg_name to store internal information in order to
   916	 * construct an algorithm on the fly, but crypto_larval_lookup() will try
   917	 * to use alg_name in order to load kernel module with same name.
   918	 * Since we don't have any real "crypto-pkcs1pad(rsa,*)" kernel modules,
   919	 * we are safe to fail such module request from crypto_larval_lookup().
   920	 *
   921	 * In this way we prevent modprobe execution during digsig verification
   922	 * and avoid possible deadlock if modprobe and/or it's dependencies
   923	 * also signed with digsig.
   924	 */
 > 925	static int ima_kernel_module_request(char *kmod_name)
   926	{
   927		if (strncmp(kmod_name, "crypto-pkcs1pad(rsa,", 20) == 0)
   928			return -EINVAL;
   929	
   930		return 0;
   931	}
   932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
