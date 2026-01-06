Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713014A60C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677812; cv=none; b=tyEYGuLZVNVFRlOHLGdtX3rEG3XMclerOWxDTg+okYiz1z095IT9qdDlO4bqDG9CYw2exW3+YsxhUqiiDO8cyV862gtgLdldaoP+p+qI6ibvMn2s1ievJukrYAOX7Qzdb7xdlJhM8FDJeH0krxYxmgf6cMP8vno/Kdza29mW8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677812; c=relaxed/simple;
	bh=Zf0EK5P1CO2balILr0DZxOy+lSKnOLVYELBJt+ZfuUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CGuLaxLFZcaGc3fcoJrgoDHIF9AMy9Z+rFYVRPI8WtNpbaxVDKdgd+KvHQyHqkqU3+1XF8e9aDj/tojnNrh8m+BYe7FNKKQCKbUAowUH9r7wMiPA9YeY51ZMhZm6ssIetilL7UwaadqwIyWcVSEXquQWELb0wO4tgnmVSeiLtuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/qHJ2c5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/qHJ2c5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767677811; x=1799213811;
  h=date:from:to:cc:subject:message-id;
  bh=Zf0EK5P1CO2balILr0DZxOy+lSKnOLVYELBJt+ZfuUM=;
  b=W/qHJ2c5M0SpDaLPHt1f2bQi0BOHsghHmCapRVfmpSRGxB/vy6jmklaH
   JYbe7zAQB9FZYFeKSYGMVvqdyfChe9mdOUwXlUqIWA+f/C9WVfAixI7A3
   QynAQhtqRh4+YdIesv8iCs8idhYqbxwNduICNcKTDjYF2nZgCelb5v4Xv
   vVLsPDDxFedj/CM+Bu4d4fbw+enxqWCKZSwhWtfiSSYXLr7Fl5PcHZcnn
   4H8aXRRcIE4FIJewOj4DFav3sr1haTB5LDlmN889KkL4gI3d98RqkZuXX
   TRzkPPXKC1ypvo7WPsL8AlIDX+5r+JDwT31zu54CukF7bjyvYjUE+v/SC
   g==;
X-CSE-ConnectionGUID: 1mdg+GjbTOij0cdWEYp3UQ==
X-CSE-MsgGUID: V598Kd47TNmL1M2vRj9kXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79764112"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="79764112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 21:36:47 -0800
X-CSE-ConnectionGUID: J9Hv301RRwqlH7HBRbGrhQ==
X-CSE-MsgGUID: 2OgN4V9hRIGcca3mVWFLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203540934"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2026 21:36:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vczkJ-000000001gr-2gTI;
	Tue, 06 Jan 2026 05:36:43 +0000
Date: Tue, 06 Jan 2026 13:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 190/190]
 mm/swapfile.c:102:26: warning: no previous prototype for
 'swap_type_to_swap_info'
Message-ID: <202601061307.VydB8L45-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d85d8be2b179c3b236531ede2d3273facf436d8a
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [190/190] ANDROID: mm: export swap_type_to_swap_info
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260106/202601061307.VydB8L45-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061307.VydB8L45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061307.VydB8L45-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous prototype for 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^~~~~~~~~~~~~~~~~~~~~~


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
