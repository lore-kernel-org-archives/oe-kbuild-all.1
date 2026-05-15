Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A4830648A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879869; cv=none; b=BQH0rzdhOSCvJPzi14Bv3iCqjg/jipH+4tSiUocrNtWJM5x2P3Md+yeVNxNBLhJEA0REvcDN8XH64jmzqgqWmYFgmphLv6qjojA+xtRlTr8b0IJfdYAhjszxPLT+K3jEVaM7DyvuBbxXXLEh1GyQvWrYNWADcBms7CFpe1Vgdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879869; c=relaxed/simple;
	bh=QjPyC4qmnhftrkzQ986Y+Rhz+BpdQ6x/k4FN+lP1OsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX4eXp4muwu5fudD+u3aJhqjqL6h19t7hT0ipA1RGaEb8WtKTIvzuTMIR9o3NBHTqgiMzaqjebsUafQeTbr6+ZOXOlKaDr4dp+qZFARP76OwVHaUTFZnvTPrMQ7LvLzfClioNwIfqzptZlNsxsZ3Dk1RR4zVMlgVdGMyiXQ6ddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWxzysSm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWxzysSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778879867; x=1810415867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QjPyC4qmnhftrkzQ986Y+Rhz+BpdQ6x/k4FN+lP1OsA=;
  b=lWxzysSmlNSbnzWh5p3FhrELNtBagKKuHUfL5xVv8aZTgvSysNzo9muS
   71nrrFQwq+9MLxf5T96xSB8G3w74a9ispHRTdK9LGX1KzQYfhRuDYJCbk
   4PPQuHMQOclt3NKSAQcbtnFX7svdOQ/XQjc4CYRb+pjhfrgEyyAilw9c4
   /PXL6d5/MFZoMGhEx9vEJRYWMg+jcQerdFccL0uFvhG/Pt8LumNe2cFro
   WbCWBJuArC47rgGZ5RnBxU4Fh1voyNMddqfAXWeQIivcr3HG7LM4/3+gi
   30U8t+o1FnlS9yOguH7vIphENqSRoKXiQigm2JPP3++CqVm1veJliKU4N
   w==;
X-CSE-ConnectionGUID: u8YJrR3/SQai5Z90BXbTng==
X-CSE-MsgGUID: AgktugttQlOEI42UxF2wOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67369144"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="67369144"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 14:17:47 -0700
X-CSE-ConnectionGUID: z+k+SQx2QaiHCb0Jw0ILug==
X-CSE-MsgGUID: SzL4ii6cTYCrbQoalHVCVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="242798555"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2026 14:17:44 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNzuf-0000000004P-2TSD;
	Fri, 15 May 2026 21:17:41 +0000
Date: Sat, 16 May 2026 05:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hongling Zeng <zenghongling@kylinos.cn>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, dominik.karol.piatkowski@protonmail.com,
	adam.quandour@gmail.com, kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH] gpib: cb7210: Fix region leak when request_irq fails
Message-ID: <202605160539.Ztg2yanl-lkp@intel.com>
References: <20260515073952.54359-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515073952.54359-1-zenghongling@kylinos.cn>

Hi Hongling,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongling-Zeng/gpib-cb7210-Fix-region-leak-when-request_irq-fails/20260515-222229
base:   linus/master
patch link:    https://lore.kernel.org/r/20260515073952.54359-1-zenghongling%40kylinos.cn
patch subject: [PATCH] gpib: cb7210: Fix region leak when request_irq fails
config: x86_64-randconfig-071-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160539.Ztg2yanl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160539.Ztg2yanl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160539.Ztg2yanl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpib/cb7210/cb7210.c: In function 'cb_isa_attach':
>> drivers/gpib/cb7210/cb7210.c:1066:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    1066 |                 ret = -EBUSY;
         |                 ^~~
         |                 net
   drivers/gpib/cb7210/cb7210.c:1066:17: note: each undeclared identifier is reported only once for each function it appears in


vim +1066 drivers/gpib/cb7210/cb7210.c

  1035	
  1036	static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
  1037	{
  1038		int isr_flags = 0;
  1039		struct cb7210_priv *cb_priv;
  1040		struct nec7210_priv *nec_priv;
  1041		unsigned int bits;
  1042		int retval;
  1043	
  1044		retval = cb7210_generic_attach(board);
  1045		if (retval)
  1046			return retval;
  1047		cb_priv = board->private_data;
  1048		nec_priv = &cb_priv->nec7210_priv;
  1049		if (!request_region(config->ibbase, cb7210_iosize, DRV_NAME)) {
  1050			dev_err(board->gpib_dev, "ioports starting at 0x%x are already in use\n",
  1051				config->ibbase);
  1052			retval = -EBUSY;
  1053			goto err_release_region;
  1054		}
  1055		nec_priv->iobase = config->ibbase;
  1056		cb_priv->fifo_iobase = nec7210_iobase(cb_priv);
  1057	
  1058		bits = irq_bits(config->ibirq);
  1059		if (bits == 0)
  1060			dev_err(board->gpib_dev, "board incapable of using irq %i, try 2-5, 7, 10, or 11\n",
  1061				config->ibirq);
  1062	
  1063		// install interrupt handler
  1064		if (request_irq(config->ibirq, cb7210_interrupt, isr_flags, DRV_NAME, board)) {
  1065			dev_err(board->gpib_dev, "failed to obtain IRQ %d\n", config->ibirq);
> 1066			ret = -EBUSY;
  1067			goto err_release_region;
  1068		}
  1069		cb_priv->irq = config->ibirq;
  1070	
  1071		return cb7210_init(cb_priv, board);
  1072	
  1073	err_release_region:
  1074		release_region(nec7210_iobase(cb_priv), cb7210_iosize);
  1075		return retval;
  1076	}
  1077	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
