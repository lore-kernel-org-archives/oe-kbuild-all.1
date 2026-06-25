Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A73B42E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385617; cv=none; b=TZ6ZQgzJr38H44MKk1wZd8L5NTtHpK626fI0eEff2/HOBST5DfO3NRwJurayrlEAHxJquVYaNznF+hiPy1Tkam46ztxJH/7rTibDx2mbwk+fICN7pwJG5Av6p3K42ofjLXdNJNySkyo4gKwcNdOKm0Et2+LttSc+UWjfWKLrJzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385617; c=relaxed/simple;
	bh=GLX2mwx0XLLt1Z4UXmfkwEVNn8GSiF0VfkfetFxkdxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r+leUoC71oiIIL/v+k6MJZsfTPl+6XV/buUaQ+x0wMXOZh536d7deo2SS5fquJYOMGMJCd61/JPx3O78RJj4Y4lobh8DZ6XDFuJa2WF+rqXvok2piKLl8ikxxxj7nC0N4ue5+k1U/hJupe3lrfX6W2A8ANPqU7NxNnL5g8CuTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCGBFEqG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCGBFEqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782385616; x=1813921616;
  h=date:from:to:cc:subject:message-id;
  bh=GLX2mwx0XLLt1Z4UXmfkwEVNn8GSiF0VfkfetFxkdxw=;
  b=jCGBFEqGuMwij0hvhHL78yZmZJa+ZyCVtondEVap2X7J8nr26ueoT5Aj
   J4fKqXMJz2UxALQXEvRtGIeRXY9dltc7n/CBOFJayIRy/b6NwEbkRVhIV
   XjDm/VxvlA5xetK8Prt0YhP8NJCn/rT5Z6EEBFLlqd/x69KzULP7G00Xx
   wsb043hG76sZtR2OK7Wh5vlckFfwe6fe/DhoNQfaMjLlZ7lkKLxPIsB3r
   MZpq3wltuyXL+yo6a06NhedtWgKO/9IeptmdWwoxrgpjtRLl54oL0ck8x
   bPPFAAyaAnnM1nd84FfbVwTwbHXhXE+8qauECMKjq/HClj2hn0mTasl40
   g==;
X-CSE-ConnectionGUID: VbwkA69PSr6hC0lTiqCplw==
X-CSE-MsgGUID: dqswWGOKR3uN2moVxbPAig==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82144928"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82144928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 04:06:16 -0700
X-CSE-ConnectionGUID: +b227vLpQM+7+shhyS7zGw==
X-CSE-MsgGUID: yF0QXOqJQM2rwAFT2STQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="249131460"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2026 04:06:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wchuL-0000000046H-2vr8;
	Thu, 25 Jun 2026 11:06:10 +0000
Date: Thu, 25 Jun 2026 19:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.4.rebased 18/29] undefined reference to
 `bpf_handle_oom'
Message-ID: <202606251832.iOg1HRsA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.4.rebased
head:   702dfd9ab6849d59d3521f7c6542c1cf6aac217c
commit: f8f699c3c785a375e31b42825752cba88f18e1d8 [18/29] mm: introduce BPF OOM struct ops
config: x86_64-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20260625/202606251832.iOg1HRsA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251832.iOg1HRsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251832.iOg1HRsA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `out_of_memory':
>> (.text+0x23ae81): undefined reference to `bpf_handle_oom'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
