Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E40D15885D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713224019; cv=none; b=YD3/ObPDeUFCU2bRhqRzcdu+vhgFumncP9D07Q7bTqZ2mqW85djTB+mnAeKIfhcI/3L2Hda4/ppKeW+YLlvu5SM5oFpudOCz+mgXdiJgODG71BOtMQ/H9Jj+ZuA/sWLPLM2ij1L6ZACQOOiJh247TZ4pU9nakKC0B8/WU546Wlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713224019; c=relaxed/simple;
	bh=EcUQVruIgcsWZXULBK7McSc30NIFDjR8kqt0csF3+VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LR/DMbyfzv4aiboBctXS8dF+0SDAJSk3MbO7ZRfUGeGwzsxl9MP06wfI1uSCJbn5nOA1L2Xy9wLPB9TplViBuakI1UY+Xo0hUmza+RSuEzByEfP+cnhRi7Zd/jgLftSAeJeiHILBBEzNs4vnD4Bqa5HMQUd6rbqmtfkuj9fLzLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyMEoNdK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyMEoNdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713224018; x=1744760018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcUQVruIgcsWZXULBK7McSc30NIFDjR8kqt0csF3+VQ=;
  b=AyMEoNdK/R73lbhcyYuELvaNCHqfjPqq0jmSt+bugePW48mppxGWq+Ut
   BD5YJGJK58JWQ9Gv7sEGWFddEW7a9FKsc0QoibR1WRmADcJ0kqhk0JaHW
   E+8nl8Zk1HfKwWpQg0fquis8ZrlLBPWlrmLHaEnA/qoUFD9+6nCzBLXzq
   xdAunWqMbsToB+Igyg2GHBlwKUsBrjpWhfjiEU6YFWgJzMJDw1PX0ARWP
   SZZz9lvvhifcpXUDtBOOyJgA9RrwuoyQsHSilEHruHWiOlLaOQ+8n88f6
   DX5W2PZIsX6NuTmILxumoKnWWi+t5piHUIIVAVGZiUJBOHdRl2NsHCfBD
   Q==;
X-CSE-ConnectionGUID: QVQh4LZKRouUS/RTMEMyvw==
X-CSE-MsgGUID: z/nuR3/jS2y8BTH6c+jd5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12418344"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="12418344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 16:33:37 -0700
X-CSE-ConnectionGUID: Jbmbl62BT1uM/o5DUVDhAQ==
X-CSE-MsgGUID: OE8qImczT6qIr9o8PVQ+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26631223"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2024 16:33:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwVpN-0004iu-1h;
	Mon, 15 Apr 2024 23:33:33 +0000
Date: Tue, 16 Apr 2024 07:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] csky-linux-ld: clk-mpfs.c:undefined
 reference to `mpfs_reset_controller_register'
Message-ID: <202404160732.obVBxx20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   f0d71b869ebd6eb6727baa3949a515c961f8f0cd
commit: f0d71b869ebd6eb6727baa3949a515c961f8f0cd [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: csky-randconfig-002-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160732.obVBxx20-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160732.obVBxx20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160732.obVBxx20-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/clk/microchip/clk-mpfs.o: in function `mpfs_clk_probe':
   clk-mpfs.c:(.text+0x154): undefined reference to `mpfs_reset_controller_register'
>> csky-linux-ld: clk-mpfs.c:(.text+0x190): undefined reference to `mpfs_reset_controller_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
