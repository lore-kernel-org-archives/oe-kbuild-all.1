Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4255423A563
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 06:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143241; cv=none; b=o1FLKyfxitbkCrIy0grZAuoTQu1op6mr4EqBRuVUtANONM/9MikEhzZo7uR8aIQiki5pXW9YpYMJ0n6HtYeMQw2dLlTEnkfUh8Nphd0JWh6WFPYAfpR5rR8uCjsPb5VbqCwB/X48hlOBpq4pxMR3EEY2utsyPMXGIhhDuZqh28s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143241; c=relaxed/simple;
	bh=FnatwT6ED23n6DpmItCJZqHim7D0569k5cZHekSjaQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dn8mDEd1Kuz2VPZL42vmb+eGZYRCGbLFeLs8XNGaG44AiYJbA1HxQiR9musyss0vpkcTaZaxrnEg5XhM88OgO5ifJD+AXawKBja4eHM3QeKj/CIcwmugWqzU6+xe5wvP+YkIOaatzDHefyF1F3+ArD/tN9oQ7IYAfJlN7YHxWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNCCfZW8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNCCfZW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750143237; x=1781679237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnatwT6ED23n6DpmItCJZqHim7D0569k5cZHekSjaQY=;
  b=QNCCfZW8/a9EASOV4s+A+IeDe/8+WEwUcG2MP2RvcnvZ9NEvdfrdibeQ
   LPskqcQvzdkVXcKdsW0LxC6U/y54PyWJ/nkFWSq+Aui87AJ7/cr74jjlz
   jyqBHQEo6mP5MzUG/mbX3/Q7ptNHxO+Uu2B1PzKkmMfskIU9hiq+MZnrR
   TF8csZOuqYEx4cHCVbkEiYnfG0RcENHcrsosDnJKAG7E87J3k0HDxX9N/
   0b+9Ly0ChFGAOFFnkcA/cjWvpA0WLx4ViR0TsYKyKJko1fIWx+WgLAVgq
   L+CsD1aD+PelVW6W8ry6yvIlBXtVXiTDsC59nrvg15LlJQ+hTJAclKgKY
   Q==;
X-CSE-ConnectionGUID: wqVm+DiUR06q2yaxBzQdBw==
X-CSE-MsgGUID: q7mJB6FDS0CaKs4NzkTdmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62957230"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62957230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 23:53:57 -0700
X-CSE-ConnectionGUID: a/j7EXzRS+CXczddvRjq+A==
X-CSE-MsgGUID: qcVXvJo3Q2ec573+VYgJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="152540074"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2025 23:53:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRQCf-000Fh2-1k;
	Tue, 17 Jun 2025 06:53:53 +0000
Date: Tue, 17 Jun 2025 14:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2402/2402]
 drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid
 bitfield specifier for type restricted __le64.
Message-ID: <202506171436.GvQa5C6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   852df0842f6ca5e0b4808eb4b1368aed4b492917
commit: 6da1ac3422090c928e2aa5ea5538884a316d3d4e [2402/2402] drivers: fix compiling problem in bzwx N5/N6 series NIC drivers
config: arm64-randconfig-r133-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171436.GvQa5C6x-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171436.GvQa5C6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171436.GvQa5C6x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_arfs.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_txrx.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_procfs.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_netlink.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_virtchnl.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_txrx.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/comm/txrx.c: note: in included file:
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c: note: in included file (through drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h):
>> drivers/net/ethernet/bzwx/nce/comm/txrx.h:122:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:123:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:124:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:125:24: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:144:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:145:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/bzwx/nce/comm/txrx.h:146:28: sparse: sparse: invalid bitfield specifier for type restricted __le64.

vim +122 drivers/net/ethernet/bzwx/nce/comm/txrx.h

08f4280700700f xiaohuihui-bzwx-kj 2024-04-11   96  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11   97  struct ne6x_tx_desc {
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11   98  	union {
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11   99  		/* Hardware write back*/
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  100  		struct ne6x_tx_desc_status flags;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  101  		u8                        val;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  102  	} u;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  103  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  104  	u8 rsv0          : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  105  	u8 vp            : 7;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  106  	u8 event_trigger : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  107  	u8 chain         : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  108  	u8 transmit_type : 2;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  109  	u8 sop_valid     : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  110  	u8 eop_valid     : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  111  	u8 tso           : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  112  	u8 rsv1          : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  113  	u8 rsv2;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  114  	u8 rsv3;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  115  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  116  	u8 l3_csum : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  117  	u8 l3_ofst : 7;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  118  	u8 l4_csum : 1;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  119  	u8 l4_ofst : 7;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  120  	u8 pld_ofst;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  121  
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11 @122  	__le64 mop_cnt : 24;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  123  	__le64 sop_cnt : 16;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  124  	__le64 rsv4    : 8;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  125  	__le64 mss     : 16;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  126  	__le64 buffer_mop_addr;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  127  	__le64 buffer_sop_addr;
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  128  };
08f4280700700f xiaohuihui-bzwx-kj 2024-04-11  129  

:::::: The code at line 122 was first introduced by commit
:::::: 08f4280700700faaa2393cbf9a402d4f51d3a8a8 drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver

:::::: TO: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
:::::: CC: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
