Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236AE127E1F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179037; cv=none; b=fcK9UDktQZASvOkdR8fuYEAbFB0HNXaFQsxmeXmqOkKxH8ERh+zGC8ZnlNb98JBD+aVXAql8f0z2nNkj95/dnGfUPYBbaJKn4gPWni3DHp5YHvS/sgCqBxQy+3x+clYwcbEe5IyXo8Rrqz6ZpwqL3ZliQhUdi9S37Snl8iXQ9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179037; c=relaxed/simple;
	bh=hv+x8gFaISZZ1fmxLbjxjmqnS6fUWSn1wP6lxKh39Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhTWLpHrXlfRypy36cFHlUahMSAq0SNGtt/rnYA177XFEGh8vZpb3LSId+aVqiPusM/5OEr/Oe3W9YRkCYffwWAf94llqyUYrZiT4iiYgyhNf7xphwe3/BrSWlsHEIKKIt2rN+WV6jtU5nLbbOkpETOe7f4//xkMhQ4Qv/GobVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtdmLZkO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtdmLZkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715179036; x=1746715036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hv+x8gFaISZZ1fmxLbjxjmqnS6fUWSn1wP6lxKh39Q4=;
  b=RtdmLZkOlF5g0sEF9K/k3aO9nh+tNR+tQ5gU5IXIKszA85RYW3lWoSAe
   WmI9T//ElvFJkbAyaMI8b3UQOuQhuFU1iLqGYeelDlCxSp62o9wigQ99C
   +loxr2aWLYJ/CaooK31JkulQV6hxDT/hZyf9Bm788KEGYgrzBSnjh3mDr
   Aefx9tOJE0wqR6geyLsSELwpvTUQw1HfICNmZF7unQEPsCXvRxtGLdy5K
   vbLzZEvDSPUs/d9ug/VVsLta6t/uWAtTlOEU00ajMjpaUwlZpWE8E1bXu
   kZmDKsqYNCdqLMyKMT9dcXxRGTFDQW4oQ9Eq4s9C5TjV7a+DbQ8qY3wMc
   A==;
X-CSE-ConnectionGUID: WNDVxGIPRVm9NB8PspG9Qg==
X-CSE-MsgGUID: dmo602olS561LkEE8AQAUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10879733"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="10879733"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:37:16 -0700
X-CSE-ConnectionGUID: wjm6PRLvRRetf+/40T1kIQ==
X-CSE-MsgGUID: UJF9+rBgSreHczhXHhVoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="29001037"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2024 07:37:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4iPw-0003dH-0P;
	Wed, 08 May 2024 14:37:12 +0000
Date: Wed, 8 May 2024 22:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 11830/12060] arc-elf-ld: clk-mpfs.c:undefined
 reference to `mpfs_reset_controller_register'
Message-ID: <202405082200.tBrEs5CZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 098c290a490d0121e209617097ea563e5e607066 [11830/12060] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: arc-randconfig-r002-20230428 (https://download.01.org/0day-ci/archive/20240508/202405082200.tBrEs5CZ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082200.tBrEs5CZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082200.tBrEs5CZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/clk/microchip/clk-mpfs.o: in function `mpfs_clk_probe':
   clk-mpfs.c:(.text+0x20e): undefined reference to `mpfs_reset_controller_register'
>> arc-elf-ld: clk-mpfs.c:(.text+0x20e): undefined reference to `mpfs_reset_controller_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
