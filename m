Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD83043BA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310174; cv=none; b=kMRf0AUn9bOL46BBIQS9JBKQvuFVfVa9wKjQetdYbQtOyBpFRr3ptVT3xQaOsv90vYIQwJvB70Lxt6BS6BrQiWMwEFJti7/3ruvt7/p5MDJ8K7QA+YAwAZq+dmuyCiP7C3RLs75iRfz03weaKNwuKsd24Wt2D9nrEPIdpcTnGzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310174; c=relaxed/simple;
	bh=RHA8qnMmPauco8sOchO+0rrUh9s9I1Lu0mO0nJzTWwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ul0wwTj/ADXgwFNM3ZomrbSG3lsmbnYPsbbtnHB1nkkWcLOYNYhynbBNNLVipEbocNy7NwZVCMlmXcNvYeFZa2lg+yDPCWExGXO2GBo/cPi8bANNTRzreh+v8nracY1HeKj7HuBFp7HMyR8yLyxXrWy2GldVjydZovbsw6v/eS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJ1hCRtC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJ1hCRtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765310173; x=1796846173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHA8qnMmPauco8sOchO+0rrUh9s9I1Lu0mO0nJzTWwM=;
  b=FJ1hCRtCaMvtCq5bA94xTNn2lwRRo6NgJF5xodJXEQqigMX+bCD0TPJ7
   BUBmF2XlbmEKmcLwgmkRiu5Vs/g3JTX4MBWTrJoay+ewb9SIVhif8OGmE
   y8ddBiORBFz6m5kW3OPE9epMIcKZC1gKpBc0kI2cVJnZrxBPA8lxsEEY/
   72rSsNm5kJeZRKBdXzutLd9mqcJnWD5YZz/z3j4oiTif4YoIRdrzj9IFp
   tvHUN6Ok3JGkGZzgXys4N3bbQpU9Rp9UZXFzXC553OoIa6fuelXekaqTo
   rqO4tjEw9hoY5EglAS6Q0JtTNbvUyP4OyLABoduUQ0odNXaohSpu/BIj4
   Q==;
X-CSE-ConnectionGUID: ZBixi4vaQU+pgW7r5chQOQ==
X-CSE-MsgGUID: Un0ya8/cRTyGgq76rYze5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67316232"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67316232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 11:56:13 -0800
X-CSE-ConnectionGUID: buWpG+BCRSOvRqFN6zc7xw==
X-CSE-MsgGUID: hw94ottoR7KQbVO2fP8E0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200799976"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2025 11:56:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT3oe-000000000M9-2xmo;
	Tue, 09 Dec 2025 19:56:08 +0000
Date: Tue, 9 Dec 2025 20:55:46 +0100
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_OF_PLATFORM when selected by ECONET
Message-ID: <202512092016.LIFZVpZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   7 months ago
config: mips-kismet-CONFIG_SERIAL_OF_PLATFORM-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20251209/202512092016.LIFZVpZP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092016.LIFZVpZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092016.LIFZVpZP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
