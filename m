Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1C2DEA9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216172; cv=none; b=Jug2kPqjeDLA2M5aU99JJ7JE29zdqeO2QoN7AGgt8c35VyY3jvPZm9m2dhNWgY029c70vUxfc9psA93hu1bBgJdPaQGK1TfZoK5uk9OImFnS0E61l3ldwBWsiJqfnhtzZ+Tf7QSIF2KfHyWZaqFKf65m4mYuJ3lPSaDnubGgTuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216172; c=relaxed/simple;
	bh=/uoqD6D7Qxbf7DCHw7KenarLMND7mk+Kx+PiGuy2lVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZeFPmnD/WC2adkvcry944Hb83wauojz5s+vlHY2WUYRykKsZP/ouWbuAhclgHs6M8r1C8NWCUGGBkO8+nyUDZgIDpIpwr2tVPeR7IyxImNmTgVl+T6jf+HsCTCf+CeXNju8YiQOtFlSootLFeDw7ISpb44Dv7IRH/hCeTk9qwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcHHP22m; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcHHP22m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761216171; x=1792752171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/uoqD6D7Qxbf7DCHw7KenarLMND7mk+Kx+PiGuy2lVo=;
  b=lcHHP22mOSEd2mWORG19uvTvOK93iGuc3uanUfzQ6oEt+v/9NAJbdxk3
   aeBngyOQhBaWq36fhJp20sC14TvZl3w061zZyAqh6xAAQbxvUgdEb+/KP
   cveo+fLGQ+FF0+PFiQKUtI0D18nkPKVOOkPEUBBBkUBnO4wnOrD1khUfI
   c/19yRCsrohLYM+Uej4/sxtBwgg4F2VFWtfCTjdA4VhXX1Veu4wgbef/x
   emLdgJywD9w3hgjGyU4GNKfBATeKcBh8U+WMfGSj6sJfEvp3DF7hfg8je
   P/ZqQ55Si54iZfGcXM/l9O6v0xfjOmvY/A4U6qgrboe9JlKb4SWWjPhEr
   w==;
X-CSE-ConnectionGUID: 0ULaknNtRjKv3UXTFtehGg==
X-CSE-MsgGUID: Et7TUMWCSFCs5Xhn0gOIhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62411818"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62411818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:42:50 -0700
X-CSE-ConnectionGUID: oDJR2/7EQaejL7aPjvYPog==
X-CSE-MsgGUID: oN4W3GF3R4+QyCM1/IMKcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183728379"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2025 03:42:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBsmI-000DMr-2v;
	Thu, 23 Oct 2025 10:42:44 +0000
Date: Thu, 23 Oct 2025 18:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 3/9] include/linux/ftrace.h:563:5:
 warning: no previous declaration for 'update_ftrace_direct_del'
Message-ID: <202510231858.0ZYfilK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: 6fc33ce4c35edf7fb4fd8c760ad1bb2e472d82cb [3/9] ftrace: Add update_ftrace_direct_del function
config: i386-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231858.0ZYfilK5-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231858.0ZYfilK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231858.0ZYfilK5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kprobes.h:28,
                    from lib/tests/longest_symbol_kunit.c:13:
   include/linux/ftrace.h:558:5: warning: no previous declaration for 'update_ftrace_direct_add' [-Wmissing-declarations]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:563:5: warning: no previous declaration for 'update_ftrace_direct_del' [-Wmissing-declarations]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/update_ftrace_direct_del +563 include/linux/ftrace.h

   562	
 > 563	int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
