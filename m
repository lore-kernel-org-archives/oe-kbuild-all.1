Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915033AC39
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764489652; cv=none; b=Dqtpn4JrqUrFIC6egiBjpZ80N5Vem6IkV19fL2bi7542UK/VW2acE6XJ73nKzOMna9WRsIK6ux9vErRHzinBtYlCafPGGUJrrzjdV4Vuf4GOk46ZNFkQ7diHI4NIhUjh8Ki0SLhI+5BN7MZHBJk6UxNo8GYkwHGcfPky6nQFxwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764489652; c=relaxed/simple;
	bh=Rqcwi5cC2d8pm+MX5l5F5PQiOXgcDemBR4lwqysYKaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qknQSjXxR8QcofAyRJFEtZMPaHbPqiKKbN0C4KL2QX5KNN1bk41xIowiLprvfpgsEa6dOyu+OYvXOMff95a+T5eh5GUa9wgz7NGIi2YLr9In/NrOQNrT8E9zcHtKQvzQyyC/NP7GYzDNnCms+FUKvHMhc/eCT5QM5bOXcpAL0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvnXWnty; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvnXWnty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764489649; x=1796025649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rqcwi5cC2d8pm+MX5l5F5PQiOXgcDemBR4lwqysYKaA=;
  b=PvnXWntyZaEnWXhzzTz5s70i9hTQInz9y15zomkiUsbHyfXNmKyZpVcG
   JDRl1FcVyeGElz1FGnJVDPGAEr7iJkYuniAkkCO0/scz5RDvb3QwNBP/I
   EFB3Kxuc0Zl5yyRUsm3ihvB75bPVnWbEMMBDeNh2KGz+NZvJuUEvanimD
   kbVxhdOHkzLrx96FoHj97ab2WhmJ0hUXaXVDm/NRI9XzloMepQsc9Y1TM
   1q6fqTHev4JHBgwB34krCbHrSm3a4pbFKnRiEmySdwPKkqUi6ZiIt1Nyt
   XSPM9lms7KRjmEeIERYN3u/dalEwYAa8PdwHpMSxnEs7WT4Vl7FwHo7Sc
   A==;
X-CSE-ConnectionGUID: ZfZ4iFt8Q/uIRaT3j7i+gQ==
X-CSE-MsgGUID: i3wlL+pvQZOuprpUvvtTCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="76771908"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="76771908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 00:00:49 -0800
X-CSE-ConnectionGUID: 9AudlUGyS8ipXjt5rElnvg==
X-CSE-MsgGUID: /AkG5PjMQP+TNHoxgXT6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="198272164"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2025 00:00:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPcMP-000000007qt-0WKe;
	Sun, 30 Nov 2025 08:00:45 +0000
Date: Sun, 30 Nov 2025 16:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: m68k-linux-ld: drivers/net/phy/air_en8811h.o:(.debug_addr+0x38):
 undefined reference to `clk_save_context'
Message-ID: <202511301553.eaEz1nEW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
commit: 6b9c9def95cb402374730d51a1f44927f467b774 net: phy: air_en8811h: Introduce resume/suspend and clk_restore_context to ensure correct CKO settings after network interface reinitialization.
date:   5 months ago
config: m68k-randconfig-r061-20251130 (https://download.01.org/0day-ci/archive/20251130/202511301553.eaEz1nEW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301553.eaEz1nEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301553.eaEz1nEW-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
   drivers/net/phy/air_en8811h.c:1175: undefined reference to `clk_restore_context'
   m68k-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
   drivers/net/phy/air_en8811h.c:1182: undefined reference to `clk_save_context'
>> m68k-linux-ld: drivers/net/phy/air_en8811h.o:(.debug_addr+0x38): undefined reference to `clk_save_context'
>> m68k-linux-ld: drivers/net/phy/air_en8811h.o:(.debug_addr+0x760): undefined reference to `clk_restore_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
