Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E9846A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781449777; cv=none; b=Y9LTebL/9cXUr+cwQ69+9nSi3xKTGEJyeHZr8Ud1twao9/hf8VAxA9PvJjR/ootD6td0VYvds09qQGKHzuxZUNEF/LFGD5aY0LGkH3uywu9U7Gzmbv1ZQcuxOZa62GSFM+2EEKQFKrGoq4mGJkRBgxa+z3DNrrX8r/ABMWCOdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781449777; c=relaxed/simple;
	bh=qdz7OfFoA4BGbBggknz45TGEj5kNcinTkk/TTKCFqVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VVZ4mH5WCKO8W8niYMlFyCFFU7nsjB/zgrrJMYes3WfwDzHteSkq/iLB3fHvCYe58+c45hffLZ7U/8Nyg7IGz4aueZdyNL1pURDEqE/db5dwi15ukxlh6zMPnsy5y78gwZ95oR6VIslcQJ5G6oLA8SiM50TTu6M3GAlUDxDBgUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaCPKhuW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaCPKhuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781449776; x=1812985776;
  h=date:from:to:cc:subject:message-id;
  bh=qdz7OfFoA4BGbBggknz45TGEj5kNcinTkk/TTKCFqVc=;
  b=TaCPKhuW8Pwjkc1Bna+KxfOtREvsi2IaWr+S8xrL4rugtjUthaKKLDqn
   LCHsB7eU0on9HWEiABsca5WuEP/rnta5Fdi5h62H/rf6NaUFrdFHZOdBu
   zxNqgXAx6TsPOVJOEUw/aZUbPRN9UcLliA4B/n9zSxot+hBHuzjhaiV0H
   Nk5FLR1uNMwV/XbnoiLEGNnqLWKzJVHmPAtArTowcjJuFzL+zXWJnQbAA
   vda5YxZbb5lrvBXrFKRi1KpYAk0XfYjzNzf7DXzfPmiHoquDZ4M7ZV3ho
   hABCFvBieMZ0pXt5oY4o8I8mZeDHPjeXbbhS5o7MChEBj8PDfLsAXV8Wd
   A==;
X-CSE-ConnectionGUID: nQ12LmDGRi6QD2k4I8Wl0w==
X-CSE-MsgGUID: 3Vyjfp47THuCRy5aRREfQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="85840933"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="85840933"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 08:09:36 -0700
X-CSE-ConnectionGUID: BFtXK/DBT4Wg/H4ul0kf+A==
X-CSE-MsgGUID: ulP/VSzvQRyqoR9Jhc6QKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="251534508"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2026 08:09:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYmSp-000000004hN-0FHP;
	Sun, 14 Jun 2026 15:09:31 +0000
Date: Sun, 14 Jun 2026 17:09:13 +0200
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: Warning:
 drivers/net/ethernet/broadcom/bnxt/bnxt_crypto.c:320 expecting prototype for
 bnxt_free_one_ctx(). Prototype was for bnxt_free_one_kctx() instead
Message-ID: <202606141747.3ZqZo2ah-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michael-Chan/bnxt_en-Add-Midpath-channel-information/20260614-153302
head:   e407d35b9928aa3878a575a8ceeddff2537b1b69
commit: c027b01c4ffa0df78c1986f6994a778dcf814d19 bnxt_en: Add infrastructure for crypto key context IDs
date:   8 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260614/202606141747.3ZqZo2ah-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141747.3ZqZo2ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141747.3ZqZo2ah-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/broadcom/bnxt/bnxt_crypto.c:320 expecting prototype for bnxt_free_one_ctx(). Prototype was for bnxt_free_one_kctx() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
