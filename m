Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF69E28FFDE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 16:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754498416; cv=none; b=EK0a7dvP2QWAiuATg3rU1/Cv7PFiI/GBREH1DY+u3W7So0yf2qUOF1Q+kh9j81I2/fboSJ4Vzc8zPj+6vC7jRUDLqJfOG3yi/8sX+ESttQAdhfYCel9khmW7ub+qxRNGpdkaKWrq/XhBmv+6Xk6UvPE1sS6bIgnNrwXOtPJEcIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754498416; c=relaxed/simple;
	bh=vGdWilTh+J8nzvgixn41GjVBeQB+5v10yjSmoEx5DO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUuie5SUamZ+JYNM04exOizoUJxADRnvw2a2cfdvfOk96N4TeOoq/wagY1i2mLq6zihHFTnpqhWvaALQbz+0xsrFHpA/z8wfmjsKUn24IQOUz8bCYpKa0tVhPEN1oGWZ5N0C7iXYBAXZxUwoDPG1N4uERpxi/ltj1ofnOic1r8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9O0DZmF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9O0DZmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754498413; x=1786034413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vGdWilTh+J8nzvgixn41GjVBeQB+5v10yjSmoEx5DO4=;
  b=G9O0DZmFKfjxVt4U56qUF+0qL0/y2cddFUSUEYdM28z3HbSp/OeK9G+X
   AX//fOeRvejDU+p2B42gsFNE1dCDpSkKGX5pUaWMapyXuiIunJvZ4U67D
   JG9ccAV4aIzqj5NVYlj2U3EPOhsH5AeLN0j3m11bztOwaWxcI08QoRhYS
   58Q5d1WXVUg4HRwmhwrCmLRZcUcSpJUPzX6jUmzlFsPb31jtqSV5+r0RR
   7JRrLfK9w2rdyXDikZ8m9L8tmyud1QLLJeS+hjtefgoG3ex543opf0W3z
   xMK78heapInBaGh+565044lr4TwEXLKB7R4DDS+gaoA/tEUXJKRybj/4a
   Q==;
X-CSE-ConnectionGUID: EpZHSm/4Tn6epVx2O66EzQ==
X-CSE-MsgGUID: eJyOs37DQ4+wKZm6AJGofA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60453976"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="60453976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 09:40:12 -0700
X-CSE-ConnectionGUID: eT3qLjqlReyAjA2t1fB4qg==
X-CSE-MsgGUID: p+8IOg2RRaiHFztd3qbnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="165160350"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 09:40:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujhBQ-0002Dz-1C;
	Wed, 06 Aug 2025 16:40:08 +0000
Date: Wed, 6 Aug 2025 18:39:55 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] net/can/j1939/main.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202508061835.mLI2S5GX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   464c0bf980f96a307759f809825ab0a3b59f8b70
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [1743/1743] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-2001-20250802 (https://download.01.org/0day-ci/archive/20250806/202508061835.mLI2S5GX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061835.mLI2S5GX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061835.mLI2S5GX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/main.o: warning: objtool: missing symbol for section .init.text
--
   scripts/sign-file.c:89:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      89 |         while ((e = ERR_get_error_line(&file, &line))) {
         |                     ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:102:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
     102 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:46:14scripts/sign-file.c:142:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     142 |                 ENGINE_load_builtin_engines();
         |                 ^
   : warning: /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
   scripts/sign-file.c:144:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     144 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
      46 |         while (scripts/sign-file.c:146:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     146 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> (e = ERR_get_errscripts/sign-file.c:151:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     151 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   or_liscripts/sign-file.cne(&file, &line))) {
         |                     ^
   /usr/include/openssl/err.h:153:17: warning: 'ENGINE_load_private_key' is deprecated [-Wdeprecated-declarations]
     153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
         |                               ^
   /usr/include/openssl/engine.h:637:1: note: 'ENGINE_load_private_key' has been explicitly marked deprecated here
     637 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   :422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:124:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:126:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:128:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:133:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:134:3: warning: 'ENGINE_ctrl_cmd' is deprecated [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^
   /usr/include/openssl/engine.h:450:1: note: 'ENGINE_ctrl_cmd' has been explicitly marked deprecated here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         | ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
