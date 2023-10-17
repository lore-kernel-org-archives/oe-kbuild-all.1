Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5410041AA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYuUitAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697542432; x=1729078432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h9A3mKj2jtoHt7fh8ZIgaeMZmTLds5fogEU6HQwc+KQ=;
  b=iYuUitAjO+6B9cSo5BMPkxv3Ow3Dp/dOBFYpHjSjPCkE6ZXqOBVtSjkQ
   yWgcxugBHDOD/mIUVueoRtdKQ58OQ8lkeKiPCCMim1FWH+zr1MFQk1rvm
   Ac4iJY9tO0uWPUhIWE1TyG2tBLE0f2MQYRIKOWcnh4NDXbD3KuHmo/F4U
   NQt6N6bV7tyI06p5QSDoaeXg1gZmiVaLb56w5lnCAM97LHF0StnDIynXA
   L4xgJg3NLGb3yFosQ2IDee+vtIbVj7FYfU19cPPc1QYvDZwBTzVqMmSWL
   +LQcJ4G+KzBaBxYH2m+Xmh6vCe62zl20BGaniK26xoORYvIeCu7aPw2Hy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389629859"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="389629859"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872529998"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="872529998"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2023 04:33:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsiKZ-0009WT-1D;
	Tue, 17 Oct 2023 11:33:47 +0000
Date: Tue, 17 Oct 2023 19:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/16] a1000u2w: do not rely on the command for
 inia100_device_reset()
Message-ID: <202310171946.OkdUtUP5-lkp@intel.com>
References: <20231017100729.123506-5-hare@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017100729.123506-5-hare@suse.de>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/zfcp-do-not-wait-for-rports-to-become-unblocked-after-host-reset/20231017-181107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231017100729.123506-5-hare%40suse.de
patch subject: [PATCH 04/16] a1000u2w: do not rely on the command for inia100_device_reset()
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171946.OkdUtUP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171946.OkdUtUP5-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#33: FILE: drivers/scsi/a100u2w.c:594:
+static int orc_device_reset(struct orc_host * host, struct scsi_device *sdev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
