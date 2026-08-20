Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204D272E53
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243586; cv=none; b=GFsFOTkypomECR2/dVCvemWoYKPR2cX8MIMiNxpW9GG5LXR88FsiZp7tJ9/NgSaD2IrPj041xwYitGmxAXz8O1Nn4+EQzp/CjA5WyXzD0dazr3VTZmUDXGrosXzhGQAhYFwwNNkVUcYYk3PuKG61X1C6RavJRhVRWKc6cexNRKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243586; c=relaxed/simple;
	bh=6T0vZbbmlh0LpFNGvUUWkQgGbolFKoudYi/G35FVVus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fb3ji+IZ5Kdsu0MXtLyxSr6tF8Wr9GIERJ4oBAIovrlIW90NDPcX2NsYwBw3jrRVnt72TD8I3cuzMvvSYsL9k2v9XFYPKtNUfMwoJwTtK55xJ3vqR1yFCmtwd06EI7Ba9VssjZjnGE4iKKVEc1HbZNhvdQfM4voGtN9awwGGP8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM6E+Mqd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM6E+Mqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787243584; x=1818779584;
  h=date:from:to:cc:subject:message-id;
  bh=6T0vZbbmlh0LpFNGvUUWkQgGbolFKoudYi/G35FVVus=;
  b=aM6E+Mqd8F3qsZE4itvpe5802R8XDO8pizAZyTJh9mIU+mXt+3pMRfp+
   PF332h92lLvwBaq3QDg9bseFjJwnB92i3/odHxV8mZ9tZ2+gqMDCVQ4Sz
   1Fk4wT8Gb+QSEv4Z8xTJxNrNQhfW1v+aTeMvjHH8VJpQL93STdy5ZIawk
   194ph5hWL4iEi4iyWUI2doJA12emkLWotyW5HO7byJG4J8agJ4FVf0+PN
   1qaGpBsy8yVYisQqo3ku4Z4evWmLh1Nxi7ZcoVRHlj9Xa6LjmxqH1MSAC
   UIKeLGtn6c8vtyFMnY03B/KtWzqimKZF/F6wa83LnWPvz0ipUErPanxMX
   g==;
X-CSE-ConnectionGUID: zxMdsC6+Q7S3mjUj1TKtEA==
X-CSE-MsgGUID: YcACLrNcTJqj4jJMIVZ3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87548083"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87548083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:33:04 -0700
X-CSE-ConnectionGUID: kTACWQgoSiGrH8k+AAlDfA==
X-CSE-MsgGUID: 6MbNy0AKTaqWxVXjLDjD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="270324327"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2026 09:32:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx5hH-00000000mpN-3ZNN;
	Thu, 20 Aug 2026 16:32:55 +0000
Date: Fri, 21 Aug 2026 00:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Alexey Gladkov <legion@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: xtensa-linux-objcopy: stEEdSXu: warning: allocated section
 `.DebugInterruptVector.text' not in segment
Message-ID: <202608210039.TtmKqQvN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 3e86e4d74c0490e5fc5a7f8de8f29e7579c9ffe5 kbuild: keep .modinfo section in vmlinux.unstripped
date:   11 months ago
config: xtensa-randconfig-002-20260820 (https://download.01.org/0day-ci/archive/20260821/202608210039.TtmKqQvN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210039.TtmKqQvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210039.TtmKqQvN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   xtensa-linux-objcopy: vmlinux: section `.WindowVectors.text' can't be allocated in segment 1
   LOAD: .rodata __ksymtab __ksymtab_gpl __ksymtab_strings __param __ex_table .notes .data .init.text .init.data .init.rodata .data..percpu .dummy .WindowVectors.text
   xtensa-linux-objcopy: vmlinux: section `.DebugInterruptVector.text' can't be allocated in segment 3
   LOAD: .WindowVectors.text .DebugInterruptVector.text
>> xtensa-linux-objcopy: stEEdSXu: warning: allocated section `.DebugInterruptVector.text' not in segment

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
