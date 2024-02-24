Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD51BDC8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708770353; cv=none; b=C+buRGTDIeSG3hlsaESdzA7tobTlvQHo/qEVUuWWvy0L1IVtk0s9+PTTAAgxlJhJ1oFF/pG6axzEUlVsQj6PrMRWvLGnOQV8mAkBNfvIf7kdffhTFQtlpH7aV74Ra/gl9oNIWsOVKuyM7cBAgbAAHF0HhF6gmpDpdGma3ufAUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708770353; c=relaxed/simple;
	bh=2A19DI7nGITwOEZyXnpQIRkvA5ixMLjJTQeu9/8wkME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHIuBFHx8JusXtwDP7JxEUzgitOO1a3k4T+7eN3xMOeFBSCcNO1vcayn8aoFaHo+ejjRs6V0Sx7aJM5M6Aj65M4LkFq9vJytWdYycoPvvCoFH9KS4sI8Ei+hLEkM5kpS7Bp6WXoP9fCRqfDG2b/QJqf9vZ+cvZY2LAWRE8lYsII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8nqtc/3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8nqtc/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708770351; x=1740306351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2A19DI7nGITwOEZyXnpQIRkvA5ixMLjJTQeu9/8wkME=;
  b=H8nqtc/3wkmI/MbVugwL4MJKA//fmeI9MTWZQc1Ldtcyg+73eTF6ujwj
   CjP94qWSKoqooD9dWUFSmZoGv1iZ5zFrkvdroFQmoZhKXLeySegWPyZrd
   NYaN7sklaRGYlodw0pKqfNHYPVO8rFkZwkrT8jVaxJP4214qMXHXipN4w
   XAUkLc9G0tu8Ipg6YAD7tl5FJ7bhJibMlKlRW2D7hv9AqeyAVt9SOaRjx
   D+VdTZim65bUaouystwGaFmZXuoD40yL6X6yNUFJnFXmH3Mg/Qb9wHOS8
   oVW8Zby1lZr0vE5Pgt3kjW1BNmYliZqrCY9dgnVut5DRBukI0fVUNrqUV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20644843"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20644843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 02:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6153335"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2024 02:25:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdpE2-0008Sh-3A;
	Sat, 24 Feb 2024 10:25:46 +0000
Date: Sat, 24 Feb 2024 18:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:fixes 13/14] drivers/dma/fsl-qdma.c:170: warning:
 Function parameter or struct member '__reserved2' not described in
 'fsl_qdma_format'
Message-ID: <202402241829.UVRlhzY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
head:   df2515a17914ecfc2a0594509deaf7fcb8d191ac
commit: 1878840a0328dac1c85d29fee31456ec26fcc01c [13/14] dmaengine: fsl-qdma: add __iomem and struct in union to fix sparse warning
config: arm-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241829.UVRlhzY4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241829.UVRlhzY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241829.UVRlhzY4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/fsl-qdma.c:170: warning: Function parameter or struct member '__reserved2' not described in 'fsl_qdma_format'
>> drivers/dma/fsl-qdma.c:170: warning: Function parameter or struct member 'cmd' not described in 'fsl_qdma_format'


vim +170 drivers/dma/fsl-qdma.c

b092529e0aa098 Peng Ma   2018-10-30  135  
b092529e0aa098 Peng Ma   2018-10-30  136  #define FSL_QDMA_BLOCK_BASE_OFFSET(fsl_qdma_engine, x)			\
b092529e0aa098 Peng Ma   2018-10-30  137  	(((fsl_qdma_engine)->block_offset) * (x))
b092529e0aa098 Peng Ma   2018-10-30  138  
b092529e0aa098 Peng Ma   2018-10-30  139  /**
b092529e0aa098 Peng Ma   2018-10-30  140   * struct fsl_qdma_format - This is the struct holding describing compound
b092529e0aa098 Peng Ma   2018-10-30  141   *			    descriptor format with qDMA.
b092529e0aa098 Peng Ma   2018-10-30  142   * @status:		    Command status and enqueue status notification.
b092529e0aa098 Peng Ma   2018-10-30  143   * @cfg:		    Frame offset and frame format.
b092529e0aa098 Peng Ma   2018-10-30  144   * @addr_lo:		    Holding the compound descriptor of the lower
b092529e0aa098 Peng Ma   2018-10-30  145   *			    32-bits address in memory 40-bit address.
b092529e0aa098 Peng Ma   2018-10-30  146   * @addr_hi:		    Same as above member, but point high 8-bits in
b092529e0aa098 Peng Ma   2018-10-30  147   *			    memory 40-bit address.
b092529e0aa098 Peng Ma   2018-10-30  148   * @__reserved1:	    Reserved field.
b092529e0aa098 Peng Ma   2018-10-30  149   * @cfg8b_w1:		    Compound descriptor command queue origin produced
b092529e0aa098 Peng Ma   2018-10-30  150   *			    by qDMA and dynamic debug field.
041c4646003e23 Lee Jones 2020-07-14  151   * @data:		    Pointer to the memory 40-bit address, describes DMA
b092529e0aa098 Peng Ma   2018-10-30  152   *			    source information and DMA destination information.
b092529e0aa098 Peng Ma   2018-10-30  153   */
b092529e0aa098 Peng Ma   2018-10-30  154  struct fsl_qdma_format {
b092529e0aa098 Peng Ma   2018-10-30  155  	__le32 status;
b092529e0aa098 Peng Ma   2018-10-30  156  	__le32 cfg;
b092529e0aa098 Peng Ma   2018-10-30  157  	union {
b092529e0aa098 Peng Ma   2018-10-30  158  		struct {
b092529e0aa098 Peng Ma   2018-10-30  159  			__le32 addr_lo;
b092529e0aa098 Peng Ma   2018-10-30  160  			u8 addr_hi;
b092529e0aa098 Peng Ma   2018-10-30  161  			u8 __reserved1[2];
b092529e0aa098 Peng Ma   2018-10-30  162  			u8 cfg8b_w1;
b092529e0aa098 Peng Ma   2018-10-30  163  		} __packed;
1878840a0328da Frank Li  2024-02-19  164  		struct {
1878840a0328da Frank Li  2024-02-19  165  			__le32 __reserved2;
1878840a0328da Frank Li  2024-02-19  166  			__le32 cmd;
1878840a0328da Frank Li  2024-02-19  167  		} __packed;
b092529e0aa098 Peng Ma   2018-10-30  168  		__le64 data;
b092529e0aa098 Peng Ma   2018-10-30  169  	};
b092529e0aa098 Peng Ma   2018-10-30 @170  } __packed;
b092529e0aa098 Peng Ma   2018-10-30  171  

:::::: The code at line 170 was first introduced by commit
:::::: b092529e0aa09829a6404424ce167bf3ce3235e2 dmaengine: fsl-qdma: Add qDMA controller driver for Layerscape SoCs

:::::: TO: Peng Ma <peng.ma@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
