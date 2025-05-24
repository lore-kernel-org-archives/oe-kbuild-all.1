Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36343594A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748106681; cv=none; b=XfIq0VcNWyKqCKXmrrL/pf2Mtf4wnrNn/9uzOnaNIlN7PglnwDh9ihAVEnOpGwKbRAW3cdmVP/MUSMqEdhk4xaDFY0AfYbWvwX9Ccab8UWRZGEw32HI9zzkODXcPUc2pJm2m4mdjUkikBxDncWcXGbJBDWcecDR8enQ36uqWqW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748106681; c=relaxed/simple;
	bh=V+/9T9e/5XO4CLWl5Tu69MQbDptXcH1RbunM9um+AFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJkwwPWdfvAvaImgYXbRzp/mxIEvQWznGgS0JjqmbGlxtFwyZSXbd3+wVwoE26oIKpNpZT9AoSLALTGK6lZ83E/2SBcgqPN08ZKguO5AR0AglfayP5+rn3kgvWYuvwD1+6PLTHQwfYIExTxiXx9N/L/ww7P1DnLrs+SqjXQDRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjWWXIMg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjWWXIMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748106679; x=1779642679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+/9T9e/5XO4CLWl5Tu69MQbDptXcH1RbunM9um+AFE=;
  b=TjWWXIMgMWsPt+zEuiXecCM+kJz8d8+SJau6DFUi2wWTGbWMy5S5gUHf
   ze2VpbfuMmYva9Aw17Cc7b3c5GMVKILPxzbv1A4BUb6hvRhiWqggetjol
   C19RY0yKoF11YiwSOC7/qC0HXaRatB7s56ph3sgVpe//0iZNj8FqoMJZt
   mwptPNRc8c/Jqdc0q9np+Aivb87xNidctSxtf7DEcSM6Y6JxKrIaGyPp9
   9xYN3eR+oSqrXjOU/GHvFiusbYmucVUULpRorQxBwQaS/MkB71lXdFikU
   geYk68wPDMYrbt2BcMuiyzX2gvq0+uzpPlplO+1p5+q8XjCOmKMnE8O0v
   g==;
X-CSE-ConnectionGUID: ns9YSi5lQQa6eCB/6ML17Q==
X-CSE-MsgGUID: Vi74FwnISuiKfnEjvmaAqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53794722"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="53794722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 10:11:19 -0700
X-CSE-ConnectionGUID: TehxYE+tSaKpicSEM62FrQ==
X-CSE-MsgGUID: kR1D584/Tpy8vabnJrHE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146481721"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 May 2025 10:11:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIsOx-000RLp-0I;
	Sat, 24 May 2025 17:11:15 +0000
Date: Sun, 25 May 2025 01:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Libo Chen <libo.chen@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Mark Nicholson <mark.j.nicholson@oracle.com>
Subject: [jlayton:uek-localio 2158/2262] fair.c:undefined reference to
 `on_exadata'
Message-ID: <202505250117.4azwjr6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 538684bbeab42417df4d310aa0223a4407f48fe9 [2158/2262] Feature: Add cmdline param sched_uek=[preempt,wakeidle]
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250525/202505250117.4azwjr6I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250117.4azwjr6I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250117.4azwjr6I-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/char/random.o: in function `get_random_bytes_user.constprop.0':
   random.c:(.text+0x1b80): undefined reference to `crypto_alloc_rng'
   aarch64-linux-ld: random.c:(.text+0x1b98): undefined reference to `crypto_rng_reset'
   aarch64-linux-ld: random.c:(.text+0x1bb4): undefined reference to `crypto_destroy_tfm'
   aarch64-linux-ld: kernel/sched/fair.o: in function `wake_affine':
>> fair.c:(.text+0x164): undefined reference to `on_exadata'
   aarch64-linux-ld: kernel/sched/fair.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `on_exadata' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> fair.c:(.text+0x164): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: fair.c:(.text+0x168): undefined reference to `on_exadata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
