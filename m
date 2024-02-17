Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253821CD23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708161565; cv=none; b=GHLAy1SKa+9XKLiWcXfHvIDv/8LsTOmIEt4SNUZmrOTFDyXtgmqs9Yeo5Ga18A7pXK3L/vSuFKlqftBb/OkS+lTgygVR8R4R1eszD+RPApAZQvXsardfrOeAGpln4aec49mCxTqjj+cUO5Mnm8R2/+zodpClX7dWXdixTcutPsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708161565; c=relaxed/simple;
	bh=qJrbBO4q7O8G85zQS3wGQfe/qj0jzrFk8fExy9Ziewc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rCZwBbzxwQyH2hhJwmm0M1AAnbZdAW99/raIkOTXyixfcMnz1lzpt9+l5C2nCAc9o+Cezb3lwpBOMbVLOgXofR09t31C1DkoLYcFfVpgwjZICPLvQtQc3ZzbBRWHePxGzmGYsr1ZdRrb6D79ob/EOdNpjUHjr78BkT2+pWAfGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4LeIhyd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4LeIhyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708161560; x=1739697560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJrbBO4q7O8G85zQS3wGQfe/qj0jzrFk8fExy9Ziewc=;
  b=M4LeIhydup6n6gdpSnxJlJXTF89bHoSDujy035vKL2BYbFMJLm1DUEUi
   OMW8EIKVUjdrjoy6bJhrx51g8mNUonF89FHCaimOS22Ke6vL3LA2PgbIq
   hz1cQQKNeGlxpuF0LqHP3Z+QyFJnvo+Zz94nzui6gSy5hIIjQOvdN143a
   GoqAc86MXD9roeiN9mew5I0JxG6BKukSAmzbsqpB0d4lguYhFA2DY097O
   rMO1met0z9sEu8URSXyHR5+yML5wggUUSSGKGRV5sSSoeNKyKejltha2c
   4Q/VDBCCoaTq5WkVvQbwDFOSKGbJL2soMOHcsavpBi72Got1OlM8e3znC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6068396"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="6068396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 01:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="935975343"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="935975343"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2024 01:19:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbGqq-0001zk-0N;
	Sat, 17 Feb 2024 09:19:16 +0000
Date: Sat, 17 Feb 2024 17:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75'
 from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
Message-ID: <202402171724.TnJqaa6v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1ca10ceffbb289ed02feaf005bc9ee6095b4507
commit: 7a50f76674f8b6f4f30a1cec954179f10e20110c sched: Simplify yield_to()
date:   5 months ago
config: powerpc64-randconfig-r002-20220227 (https://download.01.org/0day-ci/archive/20240217/202402171724.TnJqaa6v-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171724.TnJqaa6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171724.TnJqaa6v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data43' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data43'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data43' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data43'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data43' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data43'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
