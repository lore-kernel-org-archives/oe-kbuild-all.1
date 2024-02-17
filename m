Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D31CD18
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708157738; cv=none; b=G46CsVvBsFPbkzAQXY2qpx/jojieW63LWdZjwz0p5zsEppR6h5eN5wMts+1Rycw2atTbxKa2nySdbl28c2VadgmwLZV3Y2vOtiyhV7DHwbq2EVE6ZSlGdrhIgHNr3mIKGqmdBgCQTPaSdo3x9oEmm5YNiPw3y5xyjQZ8YkIjN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708157738; c=relaxed/simple;
	bh=D7Pcs/TMMaF7kAwegGNTjAgFCf2qRmyyJ93NOsbDskE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDVyvtqxzfSsXC7hD8h/6fbGx/CrUguVnkDZzUs2nVwfYXBL0jj24SkLWhnsT+oBx2/owv++dMvJJIvXzjGsTRh963eOkqtWmF1YaLb71flWn/xcWM7CRC+fg7jInNzUKrKCyqG4TVw4aGWSFBL2P/99xTkYAbIfBsQE8/wh0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKZK8BM+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKZK8BM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708157736; x=1739693736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7Pcs/TMMaF7kAwegGNTjAgFCf2qRmyyJ93NOsbDskE=;
  b=PKZK8BM+HwH/mVuHfQbsmw3VjyIkiqcFiwoMK7oRbErD9GIxbXU4vvCG
   PIv2PF1+edkEt0cdx6t5yhmvgJ1Ki6z2gE3nH6+QO4Qd7xnerKQ/l0PAQ
   iQhl1//jBeXVMycC6RvzS1D2XgIlJAQ5eD4FipkyMyA7xtj0TyngjDi0O
   xSTJ+8QajI506/joxxjeb9VXbZVssBB4JOeCB0yav19C1jxiziUOUis8e
   WAfBhmMgvegqe2YbbuMmaySRDKJci/IgZcBOavu+Jq+NegfMT8TJtAehW
   cRFubNNa9/IQe4u3iUxzMNpg16Mw/GJhqHeQCk8of7KL4OE1jG9kVVgE/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2702691"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2702691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 00:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="8735516"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2024 00:15:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbFr9-0001xE-2W;
	Sat, 17 Feb 2024 08:15:31 +0000
Date: Sat, 17 Feb 2024 16:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/anna 31/31] rcutorture.c:(.text+0x2f9c):
 relocation truncated to fit: R_NIOS2_CALL26 against `timers_dump_cpu'
Message-ID: <202402171632.b5j36SaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/anna
head:   95fabd0a7b41bc9964fa8486b31b17bdd309afa5
commit: 95fabd0a7b41bc9964fa8486b31b17bdd309afa5 [31/31] test
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20240217/202402171632.b5j36SaG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171632.b5j36SaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171632.b5j36SaG-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/rcu/rcutorture.o: in function `rcu_torture_stats_print':
   rcutorture.c:(.text+0x2f9c): undefined reference to `timers_dump_cpu'
>> rcutorture.c:(.text+0x2f9c): relocation truncated to fit: R_NIOS2_CALL26 against `timers_dump_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
