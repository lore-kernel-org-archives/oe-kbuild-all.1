Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8622A817
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778455611; cv=none; b=XHvNCekSJ8R4z4StuPxZCbCuLQlXqBq0iXPZkESZL/MqYyyy4qq+NmUnm2PdTGjV38GwVBv2fKo3v/R+yI+EAsH0/9FMABEJF4J6SuPengYPwWzeBoi/JAZ57tJ1Vf5rbMKQmcmsJjRP/Bv/VihKw7ZIlURnqg2p8gbY6jlueRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778455611; c=relaxed/simple;
	bh=cFUX4gT/loTTyQHa2YUEDG2zNnFyH/idtZCKMeSLQTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db29OGkCCtNDbx57N3ioi4fRRjpb3c3t8dICwHfnfQ+yXJsumiHr0DtmjE2vP1ZuxJG8QsK1r/36WHeBkZMNx7CvAOW9Qx5gxcr9bgBF41NK/sR5YTFiwRndDSQJvHkfEVdpJG3YYlbOuNYrcfbC70eKZuH/kxROJEC7ASw6RPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHahIQrp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHahIQrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778455609; x=1809991609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cFUX4gT/loTTyQHa2YUEDG2zNnFyH/idtZCKMeSLQTo=;
  b=NHahIQrpseYUvMZL3CRMIfgcr4VJ0IXnunrKyMNKK7xoMRaBcKYQI7t7
   wWIdQiVX7yC/lIHc5kXXH1DmOt3oQ407glSXDuLYiqjVMos4VVJ2LOCIe
   v9Z4TzYs4Br8e0uFMyAm+XE6f7CEiakSNWSyo4lScAbx1mk+RL2qDZThB
   864Yh6lI/sjUz14J35nLJBhWiC/fg4yegWQsyIy+lJQSaqguuUg6hi+bc
   oYat0frkp7Wniyhrkd6plTb6A3AeK+josp+znd6OhPAIin/yzVZLxRzTs
   0rTroE6udibeae+azjOakn2pxPctKo5WoJxPlM0p9J27+HEQK715l1nbb
   Q==;
X-CSE-ConnectionGUID: ukL9g0ElTnKkO+KFcag6WQ==
X-CSE-MsgGUID: m2gXTlKnSpmSzGA3kzeiZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="96909265"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="96909265"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 16:26:48 -0700
X-CSE-ConnectionGUID: JiJSE8vDSqS7EaHJnTn9sw==
X-CSE-MsgGUID: 4Rg3/cEATbGG1Qb2fGx6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="237245600"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 May 2026 16:26:46 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMDXj-000000002gD-3rwh;
	Sun, 10 May 2026 23:26:40 +0000
Date: Mon, 11 May 2026 07:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Poupeau <lucasp.linux@gmail.com>, jpoimboe@kernel.org,
	pmladek@suse.com
Cc: oe-kbuild-all@lists.linux.dev, m32285159@gmail.com,
	linux-kernel@vger.kernel.org,
	Lucas Poupeau <lucasp.linux@gmail.com>
Subject: Re: [PATCH] tools: include: add proper strscpy() declaration
Message-ID: <202605110734.1Vga6ipo-lkp@intel.com>
References: <20260504212301.63750-1-lucasp.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504212301.63750-1-lucasp.linux@gmail.com>

Hi Lucas,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Poupeau/tools-include-add-proper-strscpy-declaration/20260511-022707
base:   linus/master
patch link:    https://lore.kernel.org/r/20260504212301.63750-1-lucasp.linux%40gmail.com
patch subject: [PATCH] tools: include: add proper strscpy() declaration
config: x86_64-randconfig-012-20260511 (https://download.01.org/0day-ci/archive/20260511/202605110734.1Vga6ipo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110734.1Vga6ipo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110734.1Vga6ipo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from parse-options.c:3:
>> tools/include/linux/string.h:32:8: error: unknown type name 'ssize_t'; did you mean 'size_t'?
      32 | extern ssize_t strscpy(char *dest, const char *src, size_t count);
         |        ^~~~~~~
         |        size_t
>> tools/include/linux/string.h:36:7: error: redundant redeclaration of 'str_error_r' [-Werror=redundant-decls]
      36 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   tools/include/linux/string.h:34:7: note: previous declaration of 'str_error_r' with type 'char *(int,  char *, size_t)' {aka 'char *(int,  char *, long unsigned int)'}
      34 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   In file included from exec-cmd.c:3:
>> tools/include/linux/string.h:32:8: error: unknown type name 'ssize_t'; did you mean 'size_t'?
      32 | extern ssize_t strscpy(char *dest, const char *src, size_t count);
         |        ^~~~~~~
         |        size_t
>> tools/include/linux/string.h:36:7: error: redundant redeclaration of 'str_error_r' [-Werror=redundant-decls]
      36 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   tools/include/linux/string.h:34:7: note: previous declaration of 'str_error_r' with type 'char *(int,  char *, size_t)' {aka 'char *(int,  char *, long unsigned int)'}
      34 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   In file included from run-command.c:9:
>> tools/include/linux/string.h:36:7: error: redundant redeclaration of 'str_error_r' [-Werror=redundant-decls]
      36 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   tools/include/linux/string.h:34:7: note: previous declaration of 'str_error_r' with type 'char *(int,  char *, size_t)' {aka 'char *(int,  char *, long unsigned int)'}
      34 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   In file included from help.c:5:
>> tools/include/linux/string.h:36:7: error: redundant redeclaration of 'str_error_r' [-Werror=redundant-decls]
      36 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   tools/include/linux/string.h:34:7: note: previous declaration of 'str_error_r' with type 'char *(int,  char *, size_t)' {aka 'char *(int,  char *, long unsigned int)'}
      34 | char *str_error_r(int errnum, char *buf, size_t buflen);
         |       ^~~~~~~~~~~
   cc1: all warnings being treated as errors
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:95: tools/objtool/libsubcmd/exec-cmd.o] Error 1 shuffle=2681766322
   make[6]: *** [tools/build/Makefile.build:95: tools/objtool/libsubcmd/parse-options.o] Error 1 shuffle=2681766322
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:95: tools/objtool/libsubcmd/run-command.o] Error 1 shuffle=2681766322
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:95: tools/objtool/libsubcmd/help.o] Error 1 shuffle=2681766322
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:78: tools/objtool/libsubcmd/libsubcmd-in.o] Error 2 shuffle=2681766322
   make[5]: Target 'tools/objtool/libsubcmd/libsubcmd.a' not remade because of errors.
   make[4]: *** [Makefile:135: tools/objtool/libsubcmd/libsubcmd.a] Error 2 shuffle=2681766322
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2 shuffle=2681766322
   make[2]: *** [Makefile:1557: tools/objtool] Error 2 shuffle=2681766322
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2681766322
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2681766322
   make: Target 'prepare' not remade because of errors.


vim +32 tools/include/linux/string.h

    31	
  > 32	extern ssize_t strscpy(char *dest, const char *src, size_t count);
    33	
    34	char *str_error_r(int errnum, char *buf, size_t buflen);
    35	
  > 36	char *str_error_r(int errnum, char *buf, size_t buflen);
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
