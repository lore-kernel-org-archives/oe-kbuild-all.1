Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FDA15B10F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713433403; cv=none; b=jZyGe2MRvLGvFZ/VgeIq1G2ET2qsL4IdnxKCF8j3X95IphxGsS0CLx3Gamt8x2WBUsk9Y9zFIjGpd5MYgp0ca5pMD+X+KWVIgy1qhRrEJ7DhUE8zsUygUR3UQ7xhYJuLycpcBf/eesGaPqZ15dXmbUgsvYC79UD17Mgic9c9siM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713433403; c=relaxed/simple;
	bh=wt1cRjSn298hEid0FRJptzoNAfHkwpWcajYzPEiFDC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sS+Y+t8/Ucy49HyVim2oAoydDLvOJCTEaKXLuBFL5CoGzZKzdX6fXYxET0b3PfTkSrArNQnR0IdvvgpsIhVNwJuZP8DToVpYhhGrxQLr4YmsF7YzXeB/6XNtb/BbbNVSIP1oa6h1iByWfo+uFhaU3thZDICQwVCQ2kB5MYdvI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nw5RoDnH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nw5RoDnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713433401; x=1744969401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wt1cRjSn298hEid0FRJptzoNAfHkwpWcajYzPEiFDC4=;
  b=Nw5RoDnHOCJrPl7b3KUd8f2DqEQAqvLrvW+ZSFAhtWvZVftr2WMPMA6u
   bQ731GXM+04PcqfGFGqYmaqtPJ7bhyt2gOW7qveWjlfjRzfou4ahVqaoo
   olAnbWmWNXnUUYTB30wmW2Y7UF7fODrOoMD9Vnj+L8T4PI7+6rFunPG7/
   My6Pzt8Gnl5OC/QvpQxnrlswnpO7+HPgkSjCRO9tT5JKOS3/QqA8tbnua
   X9wQgTBbFyQx5SiVMXdf0DABW4FXqUnjmaCdco/lcUfzedwJuYRw2g8Xc
   foc3gISktaa3RwApF+awmUKbowV3Ku+/nnvBrZ6fA+rqG61qYHqkKTMFe
   w==;
X-CSE-ConnectionGUID: /f6YkmCKQuCNq/y7E7AiKA==
X-CSE-MsgGUID: BGjCDMCTS7ysQ5XSfyC+fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20362009"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="20362009"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 02:43:19 -0700
X-CSE-ConnectionGUID: ykK8UcvWQY6rhw8eMqBJVg==
X-CSE-MsgGUID: +C4xMBsvSwSTIRKQATnPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="27363958"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2024 02:43:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxOIW-0007To-0x;
	Thu, 18 Apr 2024 09:43:16 +0000
Date: Thu, 18 Apr 2024 17:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] clk-mpfs.c:(.text+0x28c): relocation
 truncated to fit: R_NIOS2_CALL26 against `mpfs_reset_controller_register'
Message-ID: <202404181718.l4sWegrf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   3254a09138e18fb96660d7ee7e9a0989666248fc
commit: 3254a09138e18fb96660d7ee7e9a0989666248fc [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: nios2-randconfig-001-20240418 (https://download.01.org/0day-ci/archive/20240418/202404181718.l4sWegrf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181718.l4sWegrf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181718.l4sWegrf-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/clk/microchip/clk-mpfs.o: in function `mpfs_clk_probe':
   clk-mpfs.c:(.text+0x28c): undefined reference to `mpfs_reset_controller_register'
>> clk-mpfs.c:(.text+0x28c): relocation truncated to fit: R_NIOS2_CALL26 against `mpfs_reset_controller_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
