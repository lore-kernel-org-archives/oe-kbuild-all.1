Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF11ACEDE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777838737; cv=none; b=VgrVd9AbnCP8DFdlre+i3jhcLQbBmZocA7wlGrHKYQThuVWqbl67JJearxy/8JRJ7fll6fjKUEg50iLAbAbNhBnb5evo3mTF9vaX9JZ7o4VZ0lo76LzxjthQ2QWj2JNI0LKJHW7HzP9S5qvOPHhhosLHBD/WP4/FpLfLtsoMeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777838737; c=relaxed/simple;
	bh=MmdMMtOFsntLnYN2guDY5pdqyaGF8JxRTuJAbsRWlyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i8/8s/ItvTNcZzd/v+3hKIHvy03QAUvW7gkhUr+qW1tE/NAb9U3QYHFbFqDHqkTRMi2QU+CVs6KK3OrqV/ZPP3gUQSv1U/0chrSjnGN47EeaXeTWoO1sxTm8y/lSg3uKKQsbS+rW/reyZWwZfnLuavTIosLw2PDn1LgH8uKVK3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkJaR+zS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkJaR+zS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777838736; x=1809374736;
  h=date:from:to:cc:subject:message-id;
  bh=MmdMMtOFsntLnYN2guDY5pdqyaGF8JxRTuJAbsRWlyc=;
  b=MkJaR+zSYL0dmhpZp6QMd6DnsboYeokueaiLEtkw6RY58kYM+s4izV4Q
   leYCnonof6LXI5DS6tRfDRjvE82tI9n3OY/GoA0FrwQH5FaHYnj+aDATt
   ongTZqKEJlwWwusRHh1og59y3soaSzBOsVuFI2reGBHj8NVYTZBXzxqyT
   DL3AAJs/sc/UVHKcv9xAwJXfKtI1FpnoVZ44W+8eIxI9DBXTg/CIbShxn
   fca7amPoAc/Cv7Oc4qznHd/Kxw8491h9eRDwMnNiDZcNmIah9+LF3Fq6Y
   +4NBzOoCDFqAexjjCywV24KgreyLSb551dHAilw0aoVmx1fKdf3DgloF9
   Q==;
X-CSE-ConnectionGUID: r1ZPVfHpRpaV8Ctcybgwww==
X-CSE-MsgGUID: sXjQNnh/SPuTbz5mj8FP3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="101377242"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="101377242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 13:05:35 -0700
X-CSE-ConnectionGUID: LtErNYKQTLu2+BHYXOf6wg==
X-CSE-MsgGUID: nGT/WvX+QgWed/oAm4u6ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="239662821"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2026 13:05:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJd46-000000002zb-0RhB;
	Sun, 03 May 2026 20:05:25 +0000
Date: Mon, 04 May 2026 04:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Harry Yoo (Oracle)" <harry@kernel.org>
Subject: [harry:kvfree-rcu-improvements-rfc-v1r1 6/7] Warning:
 mm/slab_common.c:1340 struct member 'llist_head' not described in
 'kfree_rcu_cpu'
Message-ID: <202605040420.h53oOkYP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v1r1
head:   51772323aadc1a7ab9654997f5398cff0e190bcf
commit: 38b523021a8b745d402010232cc6995f5ae30cd0 [6/7] mm/slab: introduce kfree_rcu_nolock()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260504/202605040420.h53oOkYP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040420.h53oOkYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040420.h53oOkYP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slab_common.c:1340 struct member 'llist_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'irq_work' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'sched_monitor_irq_work' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'llist_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'irq_work' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'sched_monitor_irq_work' not described in 'kfree_rcu_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
