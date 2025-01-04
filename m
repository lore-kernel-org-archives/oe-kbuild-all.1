Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A2184524
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735979972; cv=none; b=mhStzlR238fYpzEIiO+lnN5BSTReQFd7x885eqCeNGKxBtx2vCidFhodYZqdl87Yvow4BeoI4x/voD32eqVnEdonyCnOaJgnITpcLKR3bFxtyC/wlhfa0ZyUUXuA8KiikiXm32vbO6Lr9NP+tJMGJD0VyXRXcZPb14NcjSEpA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735979972; c=relaxed/simple;
	bh=kJW4mmfxwYbKzwz7fycwVQidk0kigc5zv/cgoMYeGh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S06jCBNjSVCQTonsR9efm7iMPo/yti8itK7gB7p+1vGnFQHaTeE8MYz1WBQwlf7R6q65fbBfFNR4eS8vCJ6uVAc0GFIo0g5D9WROMz6JGlgV3BmK3rEmbma64n98qu3BBlyael0TsDTN+3NQmqQGT4ter7lAEPAOxLlbMH+DnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdKPiLCI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdKPiLCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735979971; x=1767515971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJW4mmfxwYbKzwz7fycwVQidk0kigc5zv/cgoMYeGh0=;
  b=KdKPiLCIBJIL23OqbHpJodagkoBNqFEDOE7GFraTrPQo7dFI7N/Whdjr
   Y6ch/txgtyV70/9VYWBWSMsQoTADRhGqAP+e0+aJywCHjsCd5WX1LBu2A
   ES/EUd3/UxTZ4pXbROhRTg/D9r9psZkOy6wK8luCifsVmdtG0F2dTfmoq
   CYZ2dyfzL/h4cB8XgSzY0wNrFxQXcDuDqaSv3Bcu0c7Zy35w1i4B/SMYT
   ST1aPUyVdVFFhK/xQ67E7eZOQYjFBSqrjykV38TMWD2UAiQ1p9yW3o8wG
   VEc/tviPstk9jgj5AqZDbIUS46hf9P5mmNgIkqOYbuVfrfcOKQuBzdV0X
   g==;
X-CSE-ConnectionGUID: 7Dk1WHOiSIq07cvunzp18g==
X-CSE-MsgGUID: 26P5/gWvTM2IEfHxW+Clpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47622205"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="47622205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 00:39:20 -0800
X-CSE-ConnectionGUID: kdsOhhIhTm6AangYxAM3jg==
X-CSE-MsgGUID: CNysNZdxTpiO/EnwUVsXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="102452130"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jan 2025 00:39:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTzgi-000Am1-0p;
	Sat, 04 Jan 2025 08:39:16 +0000
Date: Sat, 4 Jan 2025 16:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Subject: scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts
Message-ID: <202501041653.ehAbBy13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 1e860048c53ee77ee9870dcce94847a28544b753 gcc-plugins: simplify GCC plugin-dev capability test
date:   4 years, 1 month ago
config: i386-randconfig-002-20240720 (https://download.01.org/0day-ci/archive/20250104/202501041653.ehAbBy13-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041653.ehAbBy13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041653.ehAbBy13-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
>> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
--
>> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
>> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   scripts/extract-cert.c: In function 'display_openssl_errors':
   scripts/extract-cert.c:46:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |         ^~~~~
   In file included from scripts/extract-cert.c:23:
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'drain_openssl_errors':
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |         ^~~~~
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'main':
   scripts/extract-cert.c:124:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from scripts/extract-cert.c:24:
   /usr/include/openssl/engine.h:358:28: note: declared here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:126:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                 ^
   /usr/include/openssl/engine.h:336:31: note: declared here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         |                               ^~~~~~~~~~~~
   scripts/extract-cert.c:128:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                 ^~
   /usr/include/openssl/engine.h:620:27: note: declared here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         |                           ^~~~~~~~~~~
   scripts/extract-cert.c:133:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                         ^~~
   /usr/include/openssl/engine.h:479:5: note: declared here
     479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:134:17: warning: 'ENGINE_ctrl_cmd' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^~~~~~~~~~~~~~~
   /usr/include/openssl/engine.h:450:27: note: declared here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         |                           ^~~~~~~~~~~~~~~
   scripts/sign-file.c: In function 'display_openssl_errors':
   scripts/sign-file.c:89:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      89 |         while ((e = ERR_get_error_line(&file, &line))) {
         |         ^~~~~
   In file included from scripts/sign-file.c:29:
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/sign-file.c: In function 'drain_openssl_errors':
   scripts/sign-file.c:102:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     102 |         while (ERR_get_error_line(&file, &line)) {}
         |         ^~~~~
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/sign-file.c: In function 'read_private_key':
   scripts/sign-file.c:142:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     142 |                 ENGINE_load_builtin_engines();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from scripts/sign-file.c:30:
   /usr/include/openssl/engine.h:358:28: note: declared here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   scripts/sign-file.c:144:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     144 |                 e = ENGINE_by_id("pkcs11");
         |                 ^
   /usr/include/openssl/engine.h:336:31: note: declared here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         |                               ^~~~~~~~~~~~
   scripts/sign-file.c:146:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     146 |                 if (ENGINE_init(e))
         |                 ^~
   /usr/include/openssl/engine.h:620:27: note: declared here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         |                           ^~~~~~~~~~~
   scripts/sign-file.c:151:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     151 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
         |                         ^~~
   /usr/include/openssl/engine.h:479:5: note: declared here
     479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
         |                 ^~~~~~~~~~~
   /usr/include/openssl/engine.h:638:11: note: declared here
     638 | EVP_PKEY *ENGINE_load_private_key(ENGINE *e, const char *key_id,
         |           ^~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
