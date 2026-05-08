Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E61D5CD1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230920; cv=none; b=ulY0gBKLtBehm55lw2wLnBJOcHFNWV3zHY5hL/glLYfCiF6w3qXFyZGwZ3itiI5NXQUhi5hyx4/RmTlPTe7jYxYH7YeN3ERONf6n4zpM9JUBx2w+mMdgRfEsDUWoHYHo3nB4lJeJi/aV84p+iNpOcrUGiQw8P7tcF0er9bb/znw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230920; c=relaxed/simple;
	bh=Uh7efAGrK2VpENhLxVFT/erI/IVPeyg401GP3Ghvtwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RdQ6YX9pLCI5hfoIgwLpp0DN8wFJ9Yv+5ANP4r7uikoCVXoz2CEHLMKu0vX0aJ3l+Oca7XwQTrsieElrNY5o50/5VQa2thuMDhY3nyNjrJUTQtd2pTJojTYB3Ccp5QDT9ey3OJzPMZbGXKfdfXZTPkiEbU6V8yfbsoKz9vd+O34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG0nwo7l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG0nwo7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778230918; x=1809766918;
  h=date:from:to:cc:subject:message-id;
  bh=Uh7efAGrK2VpENhLxVFT/erI/IVPeyg401GP3Ghvtwg=;
  b=NG0nwo7lqg5CYOcazk8ruFqbNMiS65NOEqL+9iNvX/dZwJbHgjBK78d0
   WliaSTuBiVs5IcA0VBZqFjRQ5MqOD/zeOhzvS9J33GBNgq2nCkV1590m9
   TEZJ+r+niDK1ene+gwM/b/rP+EnfVMuILc2cLasebVO8qCHxI+Y9UL34U
   FsM3PcgZr0FQneqskhEbNs7Frx5QkvNrWyHQD7qiV5lD6OdhNLlQE2rP5
   TlBU8BLHmb4kBp0WBpzwbnSMud652Tb05bHxOFmnR1KpoJeu9lghQiOEj
   a5vzmubYWjcVGXN2VCJRVDVn+ja+Lzb5bcHfcS+6arwfEVPbjrPUeB/gD
   g==;
X-CSE-ConnectionGUID: gpTT2018ShStKJ0Q1EZ/QQ==
X-CSE-MsgGUID: Pbzi47XuTpG7SnQXJwJ1gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90575163"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="90575163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:01:58 -0700
X-CSE-ConnectionGUID: 5fssUKbJQZWXXNfQIGVxDA==
X-CSE-MsgGUID: OayV7bZLRkmd2k9AFThqNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="233660428"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2026 02:01:57 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLH5m-0000000004H-0yH7;
	Fri, 08 May 2026 09:01:54 +0000
Date: Fri, 08 May 2026 17:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.0/prjc 595/652] Warning: kernel/sched/alt_core.c:97
 cannot understand function prototype: 'int sched_yield_type __read_mostly =
 1;'
Message-ID: <202605081618.YUx9jB1C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.0/prjc
head:   780c86f87621fa2a613e0d012e4111c0a394253e
commit: abd49f8177741f3f316ebd691cd24a41a2d3e0f8 [595/652] sched/alt: [Sync] 653fda7ae73d sched/mmcid: Switch over to the new mechanism
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605081618.YUx9jB1C-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081618.YUx9jB1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081618.YUx9jB1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:97 cannot understand function prototype: 'int sched_yield_type __read_mostly = 1;'
>> Warning: kernel/sched/alt_core.c:3487 function parameter 'prev' not described in 'prepare_task_switch'
>> Warning: kernel/sched/alt_core.c:3487 function parameter 'prev' not described in 'prepare_task_switch'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
