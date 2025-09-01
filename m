Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24A02E6CDF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756748419; cv=none; b=cxVfcznVo4bc4QcOxKekTtDSxtjsWAJG9/i1o+SNf294c+jxQbAvtgEIkeH8XoF9PVJxsoB/7dP596kbbRFltmJG2fgBoavncw6PS7qhblICE/uqN/mwdp7ijUe2I+hNxdV7SwwYy5g5CZT9XdxbAjdKHC4LEAj+WgAcNGOoMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756748419; c=relaxed/simple;
	bh=lo7vaZ/h6EoqTrrbjaLS+nrv/HMaoUR5uMoJ0lLoe34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMgrh1DiylSBNXWs0QIOmadyT5WCmNH+HprwH/HoJRUVINg7RraXz681CtjeIB4nglP3bMefkeODlwfkiRtJK7NariUOaStVYaPXHqKHDO5LiFFF4Ec1Eqq7+tsp/C458hDNLabDJbj3/yZXYk7Kg30Hk2uMYXUeszq1dBgrYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Recc9NDa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Recc9NDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756748418; x=1788284418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lo7vaZ/h6EoqTrrbjaLS+nrv/HMaoUR5uMoJ0lLoe34=;
  b=Recc9NDa4sxs/w1QDR5WxeEQRupClR2ivG7iiCC0bXiFrqp2KGd1R22v
   dcHGAU1tlkyETRYUy1HtNCwGZZpIpVfqozL3q7Cj05PDqRQzJHYLuGkdC
   A+eiUERe7dbbfIJW8es8D8T8yf0ZBt0dPpbdMb9yGff7Tdbody4Fl0bvi
   KdKEA+62bsf2Z1hUH/UxIjogObQx+YV10CNh4CHACvswDiE4vimTR2LIp
   GCvqGdHBUyNDPENwe7CRcZZtRk1F6MmE8V4ljfiy7NhUcYSS5fVcAPhPB
   +gClhE1zxOAr+S9v8a+JxjQJnii1teB/cso4iQ6O6YW5+M+yOuQHp5dNW
   A==;
X-CSE-ConnectionGUID: iPaQj0QRTKGBCA7EpEbSmA==
X-CSE-MsgGUID: b+VK0RJpQiyhJ2JhYxgY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76607765"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76607765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 10:40:17 -0700
X-CSE-ConnectionGUID: 4dB3V1eETZq3jKvg0oIV1A==
X-CSE-MsgGUID: 2Dlqk+IVQ4qEsjYj8lbOhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="208273730"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Sep 2025 10:40:16 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut8VL-0000sl-1X;
	Mon, 01 Sep 2025 17:39:54 +0000
Date: Tue, 2 Sep 2025 01:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/11]
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c:11:10: fatal error:
 'sof-function-topology-lib.h' file not found
Message-ID: <202509020100.u2OUMlph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e4f3062f2a5f422bb6d8212faba593c27703de49
commit: ec27c378ed0e8087a62815e857c2c047d4835641 [0/11] UPSTREAM: ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250902/202509020100.u2OUMlph-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020100.u2OUMlph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020100.u2OUMlph-lkp@intel.com/

Note: the android-common/android16-6.12-desktop HEAD e4f3062f2a5f422bb6d8212faba593c27703de49 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-ptl-match.c:11:10: fatal error: 'sof-function-topology-lib.h' file not found
      11 | #include "sof-function-topology-lib.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +11 sound/soc/intel/common/soc-acpi-intel-ptl-match.c

  > 11	#include "sof-function-topology-lib.h"
    12	#include "soc-acpi-intel-sdca-quirks.h"
    13	#include "soc-acpi-intel-sdw-mockup-match.h"
    14	#include <sound/soc-acpi-intel-ssp-common.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
