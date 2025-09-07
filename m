Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9F01E0B9C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757235704; cv=none; b=HQG5v+KIY0zDN2R5VI+6G38CSFN18cw4Cet9FQYifOihjh8jSghbbIhR9R/Sz37i+cIrHJG5F/s07PS04n1jDWQM1a4k4f+JbXGZWb2dWpjPlM8yNPlPV6UmGXqvSQJKr5hg0fFMZsVdx+9NNdcGJ6o30JScYZF16Dzec1hmmIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757235704; c=relaxed/simple;
	bh=lUoX2pWaBpYgucw2mJbKE23yh0p8LoU98EHmFvCwEmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJ+gDDOysJ+IiFvmECPBxR5n8jFe5nbYVZ4rG0jAT9QiMZYSg8KQWK/TFmh2DhU2K9e7E450cV/fVGeZwSSuCH8kUecm62KJE42tmHPVFAXupLZrvIAz85hXyg5I8fO2dmhGxHdZ0YXD49ERk9+dkYa1sQ2YPicsjd21JPxUcbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHP6dZwv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHP6dZwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757235702; x=1788771702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUoX2pWaBpYgucw2mJbKE23yh0p8LoU98EHmFvCwEmk=;
  b=HHP6dZwv5pqTzkej2QcZH6wTnLHWdDOcNpBAezbx32nHRHm+5Dl8VWC4
   Szw3FuxKjtS2CQHRQIuy6WshAdaRx+UutOJiSDRBv1p9AsU5a7uNxnwOo
   BJGfpn/VEg8kIdJIvZALUkfSb1kgVJH79YBgcNxDPsw/m2IkUGwUROb7G
   lACBnXMbAL8arCQXlcQzqtt/qN3/xNAY7gSt697LBE+XU3uqTFXHZLQ/D
   8TcRA6eoBjj2DFTNOhlbzXtRIBYCmsuKwireJlWUlGt5Wi+7aHTNzNKys
   AhCRxEfjVm+cnQ2TKFgSGpqpXEWww+b//Rm6k7v4XCNuc8Z3tXr0XdUHM
   g==;
X-CSE-ConnectionGUID: l/m+RSpoQUWQj5iiHPeuHA==
X-CSE-MsgGUID: iLFHg5DUTf+0qgQ+ULVfJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63347141"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63347141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 02:01:42 -0700
X-CSE-ConnectionGUID: 3VKQWvgpSrKuvv1KMtTYyA==
X-CSE-MsgGUID: siKaQUcWSvOK0qJUpy3qmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="176862668"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 07 Sep 2025 02:01:41 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvBHF-0004Ix-2f;
	Sun, 07 Sep 2025 09:01:37 +0000
Date: Sun, 7 Sep 2025 11:00:46 +0200
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:android16-6.12-desktop__release/core98-95 1/1]
 drivers/net/wireless/iwl7000/iwlwifi/pcie/gen1_2/trans.c: fw/api/tx.h is
 included more than once.
Message-ID: <202509071128.9pEbP9OD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git android16-6.12-desktop__release/core98-95
head:   9b124aabc795120a803333660f1ab01a2a3aacef
commit: 9b124aabc795120a803333660f1ab01a2a3aacef [1/1] ANDROID: release core 95
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509071128.9pEbP9OD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/iwl7000/iwlwifi/pcie/gen1_2/trans.c: fw/api/tx.h is included more than once.

vim +26 drivers/net/wireless/iwl7000/iwlwifi/pcie/gen1_2/trans.c

    17	
    18	#include "iwl-drv.h"
    19	#include "iwl-trans.h"
    20	#include "iwl-csr.h"
    21	#include "iwl-prph.h"
    22	#include "iwl-scd.h"
    23	#include "iwl-agn-hw.h"
    24	#include "fw/error-dump.h"
    25	#include "fw/dbg.h"
  > 26	#include "fw/api/tx.h"
    27	#include "fw/acpi.h"
  > 28	#include "fw/api/tx.h"
    29	#include "mei/iwl-mei.h"
    30	#include "internal.h"
    31	#include "iwl-fh.h"
    32	#include "pcie/iwl-context-info-v2.h"
    33	#include "pcie/utils.h"
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
