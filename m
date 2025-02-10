Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9B2586C2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206189; cv=none; b=uCROIC2tydke8b6ifL8MhYSOV0Ka+PjLQFSIHoVAbNAaeWklm4XeycLvlfCDpA/GBrbi13xNq8XdmOie5c2IVprwI4U/99MT+hepv6Kvnj2CXc4SqR0LFfL+R5Y3p0vP5R21XpHeJz1VUVvmYlySa42ktK2cTCtxcnvKVCbsRgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206189; c=relaxed/simple;
	bh=0OT77P9hluW+rHK4q+E2LsD2iJIO0NHBUGgBxZpnvBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHMmHd7owifz4+wGPcBm0LOjVH9GMYDtxle8WgYev7qlqGXsiFPI2gheLXaRUCPbM+GihpS3fYoVIiFxpYXpdt71ykm7INMz4G0LDPOY2kzE2NKrCZ3Y9rJU0vCeUHzgvSPnHI9CI6rZhf41kX1CmdrH6hkS52du28Lxxj8dLbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5xBlW6C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5xBlW6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739206188; x=1770742188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0OT77P9hluW+rHK4q+E2LsD2iJIO0NHBUGgBxZpnvBM=;
  b=A5xBlW6CllZPrKAaRPQqPusvRcU0ra0MZU8sm+B80kim0//MGQkdDHaJ
   VjWtIWJ8kuBHorNUyxU4sgw4olvRqyXVuteXn8QOoXWBteZWlGz33irYc
   XW2XqPVDqP8cIiqdzdNYBnXNFqOqAcey3UfIVVqLtSV9rykqgbBAoqRXc
   XwcHroEYT6JyAdDPD9f/Pw7lIJldwlRHKfXv1gBjbHFQqfykx4lNwVDYn
   PsahRe0iMPmuDeOoNu0nEF0CrnNM63JT7Z2GkK8+ebSL1qVNWuwRHqFky
   SV/KO4cAdlDFY90CzP2UcGh823FWxll8aCd7OJrDg+2b0a0muVyNw5Air
   A==;
X-CSE-ConnectionGUID: +UvZAIleRGCLnVjCeiW07g==
X-CSE-MsgGUID: tRaZPhKxQjS7n1PGCG8abA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39484040"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39484040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:49:47 -0800
X-CSE-ConnectionGUID: z6QtziKsSIOS+VAPRHgYVg==
X-CSE-MsgGUID: T/GNvgXZTOuhdRT+F5sg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="143114089"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 08:49:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thWye-00134z-0L;
	Mon, 10 Feb 2025 16:49:44 +0000
Date: Tue, 11 Feb 2025 00:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 27/33] sound/soc/starfive/pdm.h: linux/types.h is
 included more than once.
Message-ID: <202502110052.eujCZsQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   dcb5a245dbe2203ae35f6b1b5cb28929f758008c
commit: e8916d018c5219f3e996f1a11f11ed767dd727ff [27/33] ASoC: starfive: Add StarFive JH7100 audio drivers
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110052.eujCZsQ4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/starfive/pdm.h: linux/types.h is included more than once.
--
>> sound/soc/starfive/spdif.h: linux/types.h is included more than once.

vim +10 sound/soc/starfive/pdm.h

     7	
     8	#include <linux/clk.h>
     9	#include <linux/device.h>
  > 10	#include <linux/types.h>
    11	#include <sound/dmaengine_pcm.h>
    12	#include <sound/pcm.h>
    13	#include <linux/dmaengine.h>
  > 14	#include <linux/types.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
