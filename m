Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAF5FDC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842949; cv=none; b=kwOV+vfG6jBniyZgeWOnsahKx9gLKR86UOlOHuqW9Ey+qSBTzNtfF75JS/YwdQL+6AO6oy4ZlCQHRtOZz9Uy0zwxLUD9GrqPgU4lEGk/J9hD2BN3BOynO7o7DDMjTHxb1TrlDUtLYwNQTLkwztBdJDbm5nbx0rvrKbwa5mZnGO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842949; c=relaxed/simple;
	bh=NbqgXh7vf6KWTeT+Pz2LvjivSmBrnTWooCN9x9SRm+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pk0pZNG7vPKnbjmxSfTsj4i+c7IpS0v+cU6wyRUeD/oEus08QgUXaMTk6WzdGQyxPAzVxlD7yNACT7g1qoabeJf76p2/5QntGqFIiA+b7uArUSr1UaCBiYFRjB44MecQ8+ka/4P96OCtfk0Yb30ITZSgfCz0dR+sURGFyyPw5mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfLIttA2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfLIttA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707842947; x=1739378947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NbqgXh7vf6KWTeT+Pz2LvjivSmBrnTWooCN9x9SRm+w=;
  b=cfLIttA2v10iHOFtWHr2Ezos1sTfhnOLpkN59ZsdfV0av7RqzKZ3D5w4
   Jx8L6elyQcJbveTjtIrJb6nNHrJCqwSVKdN5hcQhmE7bWdO8eaPCT0ZYk
   Bpr5X991XKq/sre/MuoEKIcBDWoI+CNDoWtEn0obnEvvJKh7/P2UzgUio
   aKuoqL4bplPsxz+O+xqHrpGWw5tOf4En6RvgXZNaNL7RVfy2YXZG2Ww8g
   rLUGnyw+YwHJmpiw4h3pRLz3eoPHN1DATcOosDokh2/ori1HlD2/uDcxd
   kD2yNAUkN0gXlPa/Qt0acqLAnG7IZUuw8V8WTpTT59YwXmyyRbAQbD7yz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="4827379"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="4827379"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 08:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="911833541"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="911833541"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2024 08:49:01 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZvxt-0007uQ-29;
	Tue, 13 Feb 2024 16:49:01 +0000
Date: Wed, 14 Feb 2024 00:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5469/6424] loongarch64-linux-ld:
 drivers/md/dm.c:2132:undefined reference to `set_dax_nomc'
Message-ID: <202402140037.wGfA1kqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
commit: 9af4599a77df42dba7f32c76a97a19f5703f44b7 [5469/6424] dm: cleanup alloc_dax() error handling
config: loongarch-randconfig-s053-20221018 (https://download.01.org/0day-ci/archive/20240214/202402140037.wGfA1kqX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140037.wGfA1kqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140037.wGfA1kqX-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/md/dm.o: in function `.LBE7196':
   drivers/md/dm.c:2131:(.text+0x7670): undefined reference to `set_dax_nocache'
>> loongarch64-linux-ld: drivers/md/dm.c:2132:(.text+0x7678): undefined reference to `set_dax_nomc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
