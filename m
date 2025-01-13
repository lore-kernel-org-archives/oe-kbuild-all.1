Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107702343AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773307; cv=none; b=lZxgVpvnFvxydRUFq0U5HLorP/7jIZGUKMP1lTeRjvhtMbcjcHu+xLXffsz9X+tA+rxWoKyrSRariJe/LOI3AUlKIhULQ0U7SrVXVvIO0H5RWWWZAPCBpHZreBJ+WAP9gTI/Mkz4W9uY+PxS90hglN6qpSh3/KlR736wG4vxR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773307; c=relaxed/simple;
	bh=RHvuMsC/NNO3g7Qc/xvFQGO/kkWmhqhlEIiZtmfRi3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBOeGz08tcUIhCyqyf5kcXmYJ0atD6Ykvd8GDMC5XijDXELIrQ8o6MZeKXPIAxjQKECb1zmjiVB3SA7NF7opYPoo32hiL+YgeBRVBnFc4FuvQLioYVloDRnyjMTK9QpqyteiMNG9fe7f26nifx5t9E+104tjuc8gsZNoJO0rSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBMK3nk8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBMK3nk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736773306; x=1768309306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHvuMsC/NNO3g7Qc/xvFQGO/kkWmhqhlEIiZtmfRi3A=;
  b=fBMK3nk8pOeSV9wm3eoXQZwDw8SSZ4FCVL1goBjTcX6wOiV7YYdCAxmP
   u42l/TLCgHhLj1gVm3Fd+d2KjRfPdlq2b2LQ+ASLnVe2nARULR8Ho+z54
   O74kMcBotc0wVdvUXqE8rxHhETsMMoi2gJPSiDOV9sD4/ms2mxRbCcnId
   ZC6QUbjVKtObns42WphJ+VXT0lWCSrvvoLNhJOIlmYWINF/DCptKOD4XN
   Fym1SOI33RiPuWd/tsAGXtaj0IMgq2z2rwZbiyUzpQDO6h4ymq6ZsMF2z
   swvcGgXtrVctxBE6MtSmKO47aKRhdUmYH88rH1vajLtcQM1LAnKOnd4vm
   w==;
X-CSE-ConnectionGUID: 5hYVRKsdQzaLpkCoHoieTg==
X-CSE-MsgGUID: 2BnFTlltRb2tdDHfTQG9HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36322106"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36322106"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 05:01:45 -0800
X-CSE-ConnectionGUID: laxAtHjLStSVDGKNNy3B1Q==
X-CSE-MsgGUID: otmLspl5Qxmx0j+7qRGHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104356796"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2025 05:01:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXK4a-000NAl-2w;
	Mon, 13 Jan 2025 13:01:40 +0000
Date: Mon, 13 Jan 2025 21:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	Boqun Feng <boqun.feng@gmail.com>, Wei Liu <wei.liu@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drivers/hv: introduce vmbus_channel_set_cpu()
Message-ID: <202501132015.M5PAMVtb-lkp@intel.com>
References: <20250110215951.175514-1-hamzamahfooz@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110215951.175514-1-hamzamahfooz@linux.microsoft.com>

Hi Hamza,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc7 next-20250113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drivers-hv-add-CPU-offlining-support/20250111-060127
base:   linus/master
patch link:    https://lore.kernel.org/r/20250110215951.175514-1-hamzamahfooz%40linux.microsoft.com
patch subject: [PATCH v2 1/2] drivers/hv: introduce vmbus_channel_set_cpu()
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501132015.M5PAMVtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501132015.M5PAMVtb-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d527 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d527 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d527 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d527 Masahiro Yamada 2019-02-22  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
