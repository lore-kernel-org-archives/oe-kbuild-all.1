Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE221598EE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177305; cv=none; b=A4Hfgy8XYaWDK17GJzvgQ2W1B7kQLvzjufLVMr2dcMTMgITxaxNr6zihy3lRoV+3Rjjls55NVlFAfrXgzKUUHctNcpvJnVPjyOLJX+tZdCMPUfgw3xdp91v20bSbLtlfTuu3ixZwnL5bpnbYd03HmICJiVfDhb/FkPcQpd6chQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177305; c=relaxed/simple;
	bh=uJAg6rFfEsQEjofWvkDA7pMMA1AJFyBVzVvxgmFYXYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLB22nMxHfrSPk4jQKmwgKcVMThohDYkDQh3kYRT32wNZitVbIuwwhWCGvDegca5sHnl21KVUzBbaN7xraBYjYWfUaJw+n10cVrfq9C+2udq6t3wAjODhVjsgkofl+BKEWp9xcQhyiywr61foccZOcjpnHH9jGIVw+rfe3rp97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Upr7HNUq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Upr7HNUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736177303; x=1767713303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uJAg6rFfEsQEjofWvkDA7pMMA1AJFyBVzVvxgmFYXYM=;
  b=Upr7HNUq75pvcT1SIkAznMP9z6lvOjh8Qy/GIm/osFiIO9h71UGLb0wn
   wIUrPGjod61r8EaXqGf0yaY6zvy+h9X1YjwGuuPxSKTlP1LuMxtkhAiHV
   VlJzcxOzCjRjlVi5GK99PV4O6yVwSUNp2ctfFaSCPjk3hN/9Ar15tt8D7
   FiEN243HNN+S2jK9bvh1CZxAEB4fDlMOOuxjFKWrEY/Pr7F365p7hRAPv
   z8QuOCvMBLAKA6mKAJb0nevIVlfPN4bWJgT8p86WmFlxJxBO7jk0QvLDc
   +yzehcVJDwVLGAsbRPJbpH9WAjJYjJiXGAVwAY7I9stBQhGLtYow5qyV8
   g==;
X-CSE-ConnectionGUID: PIcoK5JQRJm/h350Q4Xl4w==
X-CSE-MsgGUID: xqLZ6alOR8aJtbOOTXKNkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="23929451"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="23929451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 07:28:19 -0800
X-CSE-ConnectionGUID: HeiLMfL1SY264XG16LuhVA==
X-CSE-MsgGUID: qBP+2jzEQR2gEWVM7pea4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107102799"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jan 2025 07:28:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUp1c-000CrH-20;
	Mon, 06 Jan 2025 15:28:16 +0000
Date: Mon, 6 Jan 2025 23:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 17941/25291] dma-buf.c:undefined reference
 to `dev_get_by_name'
Message-ID: <202501062349.k9JrRCNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 9864ad538f275d7ca2aff5cc271460d6aeae66a8 [17941/25291] dmabuf: add ioctl that binds dmabuf pagepool to a netdevice
config: x86_64-buildonly-randconfig-003-20250106 (https://download.01.org/0day-ci/archive/20250106/202501062349.k9JrRCNM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062349.k9JrRCNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062349.k9JrRCNM-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/link-vmlinux.sh: 123: is_enabled: not found
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x52: call to on_thread_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x59: call to on_thread_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x52: call to on_thread_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x52: call to on_thread_stack() leaves .noinstr.text section
   ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_pages_ioctl':
>> dma-buf.c:(.text+0x1458): undefined reference to `dev_get_by_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
