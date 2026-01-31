Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB82AD0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844357; cv=none; b=qy2D9X3dmqw5pXq5wHvWXypFlVaKDlN/ct0sgmfGgj2UkQ+4DEBJiuvjCaCuNLU3YXjZewHyE95cP3lzhrPTZGLhUr3uGDbZcQYyUzWsVB6h+MOpipOSTsxZIqpFMu/EhlTVwAMvXfRZv9qu7fFq8htAD0V5hQBrKDNjT56e3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844357; c=relaxed/simple;
	bh=bndOyDWKc0fpw1VCzUf6Wn5uGPtJJrzJ5orETXoNcmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZoIVyZC9mxdcdQUFNfhXPTx02S+dViWgmTR3QUK7kfVwDNIgRH9/KaTl+lVIVUopj0i8iIOLRY03KBptbWqbsYKJKUex/3C3ZM7fgOMRxcu0kNEEC58UUJwsl431mBL5VXCg9Nkn84kx1wkSQ33mo6wPdVF/R0IAU70D1s/LyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7Skw+6z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7Skw+6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769844355; x=1801380355;
  h=date:from:to:cc:subject:message-id;
  bh=bndOyDWKc0fpw1VCzUf6Wn5uGPtJJrzJ5orETXoNcmU=;
  b=S7Skw+6zU5UVdLMLH059u7XNJNIdgr1DILCz2J87b0m7jgqf5bQrhjSk
   Eyx7cPLevpFhHMnaduKg1ax5NsHQ8bSyMpkOu5JVH7ymiil1ffQX3/85M
   /RQhm4gkE2WsG70uuNfDV7c0vGQBouJ0AQGBAAGjmYkXLcyHlgF2wSVpJ
   HyRdONFsi2V4kjRBdJa6bvQPy+h551Y17UJICm8yzs53oyPY9bhJGENwX
   NVX0xS088ht9szyS//QmZKsdfy5iPrdkL6Lpmfja4dmjei7mjMQYY9n0e
   lKV6QNygCzPOAyDTqcKmQXq24GfpIbfuqr+bph3Rj9bvAjqI4wCKOEzs5
   g==;
X-CSE-ConnectionGUID: cSsEeCVkS/SxQBW2rvF7ZA==
X-CSE-MsgGUID: TUfY77HGQnegLxzpmL2TgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71141005"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71141005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 23:25:54 -0800
X-CSE-ConnectionGUID: E3iWc9K2S2C1WKm25qCd9w==
X-CSE-MsgGUID: KfPENx46QZagq+cjc64J6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213124115"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2026 23:25:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm5Mc-00000000dlg-3iEY;
	Sat, 31 Jan 2026 07:25:50 +0000
Date: Sat, 31 Jan 2026 15:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo-extcon:extcon-testing 9/9]
 drivers/extcon/extcon-s2m.c:15:10: fatal error: linux/mfd/samsung/s2mu005.h:
 No such file or directory
Message-ID: <202601311554.058WiZ2V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-testing
head:   67ceff534b7c9352aaa66c7e7d6345d13e5d763f
commit: 67ceff534b7c9352aaa66c7e7d6345d13e5d763f [9/9] extcon: add support for Samsung S2M series PMIC extcon devices
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260131/202601311554.058WiZ2V-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311554.058WiZ2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311554.058WiZ2V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-s2m.c:15:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
      15 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 drivers/extcon/extcon-s2m.c

  > 15	#include <linux/mfd/samsung/s2mu005.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/power_supply.h>
    19	#include <linux/regmap.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
