Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F000E363093
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483338; cv=none; b=rIa12JaTF7/eol7WeHj3fwJ3qR8blAUSQvtLpLE5eGJSO574Zw6LDrqz55lhQlawB6M2zNzTsDH960l/bi55I+3IYVjUHIHO5m23xpWmQf+LNlmPerhlU6PXBXUAnC6Ypx/FVXHF89XL2JdN3Sh/ktxMyqaaSbLfgj4Zxa68Z60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483338; c=relaxed/simple;
	bh=harmxWjcmiR9df8adEdSO2lNl+dfBJEPs/I8SAzEl/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4/NJGyVn603vCjxSxNjDocmLz78HlpH4P5je7WsNNajBcK1twXUM/qBjuItIjujfAPv9DGJR0/kwuh3BKOBOI3bWGXz4oSxLIB4Rs6ZrjSjKCxei07hHXZ4NlDod9wJ4q0mmi7NhJyX/tJN09XM94iO4A9JcCjA5NsVGdWgFhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kokQRe86; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kokQRe86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778483337; x=1810019337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=harmxWjcmiR9df8adEdSO2lNl+dfBJEPs/I8SAzEl/Y=;
  b=kokQRe86LEC+ZFLfvOkRkzFzhOCz0b8pbLH5ARL9t/K8rpUD/RbFgjjA
   qGAao3+fQlZzER3YK9DWjZ1sePQk1yG0b1K0FHjVlaVOB6Zvtg55PKFVz
   j+pInUHLhG1AeMoVTTTaJQ2jNh0iPwzJkZSvGuIyM0cU94Pl3NE8TyYn6
   0Uoto1nWPaLKrAu3/Pth5IhBspYThwLh9LYvq6lNGFuERvynrK/Fsi4aY
   V99hIfy4O20LqWSkqXorqFQdiP598gCTo8zyGBn3BNUsWrAXdNNKEiiJK
   VJCvQn8u+BHxYPbe9o2IyFJRlgtL+sOQ/AcLZyHAKkpOdJ0DpSQnFkxKI
   A==;
X-CSE-ConnectionGUID: tgF/zZpESG6blhbAtFkBog==
X-CSE-MsgGUID: 8VnvrEpSTSeoiL3fC0ghuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="89668559"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89668559"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 00:08:56 -0700
X-CSE-ConnectionGUID: xiajXNvyRsOzkJSysCM6UA==
X-CSE-MsgGUID: cTKms+4iSqy7RJE6IsG+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242340100"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 00:08:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMKl2-000000007uP-3a9n;
	Mon, 11 May 2026 07:08:52 +0000
Date: Mon, 11 May 2026 09:08:32 +0200
From: kernel test robot <lkp@intel.com>
To: Lucas Poupeau <lucasp.linux@gmail.com>, m32285159@gmail.com,
	richard.weiyang@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lucas Poupeau <lucasp.linux@gmail.com>
Subject: Re: [PATCH] tools: include: add proper strscpy() declaration
Message-ID: <202605110823.9YvAiXAD-lkp@intel.com>
References: <20260506163452.53067-1-lucasp.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506163452.53067-1-lucasp.linux@gmail.com>

Hi Lucas,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Poupeau/tools-include-add-proper-strscpy-declaration/20260511-103301
base:   linus/master
patch link:    https://lore.kernel.org/r/20260506163452.53067-1-lucasp.linux%40gmail.com
patch subject: [PATCH] tools: include: add proper strscpy() declaration
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260511/202605110823.9YvAiXAD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110823.9YvAiXAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110823.9YvAiXAD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from exec-cmd.c:3:
>> tools/include/linux/string.h:15:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
      15 | ssize_t strscpy(char *dest, const char *src, size_t count);
         | ^~~~~~~
         | size_t
   In file included from parse-options.c:3:
>> tools/include/linux/string.h:15:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
      15 | ssize_t strscpy(char *dest, const char *src, size_t count);
         | ^~~~~~~
         | size_t
   make[6]: *** [tools/build/Makefile.build:96: tools/objtool/libsubcmd/exec-cmd.o] Error 1
   make[6]: *** [tools/build/Makefile.build:95: tools/objtool/libsubcmd/parse-options.o] Error 1
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:78: tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
   make[5]: Target 'tools/objtool/libsubcmd/libsubcmd.a' not remade because of errors.
   make[4]: *** [Makefile:135: tools/objtool/libsubcmd/libsubcmd.a] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2
   make[2]: *** [Makefile:1557: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +15 tools/include/linux/string.h

    14	
  > 15	ssize_t strscpy(char *dest, const char *src, size_t count);
    16	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
