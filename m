Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FEC524A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705995209; cv=none; b=aWYWO5tsS4DLRZdjlgdrr6vPQIV+zpesAF2nTzJzBUpeXdfCGQtOcxapyng1PN/rcfat+3xb3An1GJsytjgDLtFUY5XilQuqKut+7DPbiX5VlvrUlbOOSIbVtNeXIp+q9sLwKPBG9l2BPMjrOcre4oAhEfjDEOsvkaqe535jyww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705995209; c=relaxed/simple;
	bh=6TunoJqQiP+6aV79ukHpR+iUg3LA/raE0jHgfmwmlXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=as6U5YFsxpfZsnQYT8uHH3xKKdX/LygSWiQyqT21DascVzCQrIY2wbqpo8JsB1spzx8BDKmChsIpTKfmnfuunfg9foTQGO4FDJV3YF99vVKx4BszuATEuOvxm9mGvceCNqzR3H7VmLrn5bpUSgBd8f1DYYy79kIQqCuOnT2bYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmMKywWX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmMKywWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705995207; x=1737531207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TunoJqQiP+6aV79ukHpR+iUg3LA/raE0jHgfmwmlXs=;
  b=QmMKywWX66Kej3acM6Xr5QKwdNjUr27OFhOSslu+tAGSzu0fOztpsISP
   lRLE23g9DR3H5+dy17P5lO5QEZ+hR0iR56N6stp/fgHXxc6RprQdhk9gL
   ZxVdszB0JvE1Spgmoqlha8fjiP9yjghR0QUdF6ktgusxR2G/t+AZXZfZg
   tR+Po17W13oiB/DjbPGqGOhy8JSkUbzgk8UcFQs7sRsJpUUhhPjfUvJq2
   9khhh5L6kDSAO/WAazpJS5mdZctjJdDgcGLq/2lqqWiao/13cli980+pW
   clJf6MtNShQLMz1vsqNUsMfSEp2gZkUldgbjJqBB+Euv4Qhq9QCdhZker
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1333856"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1333856"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 23:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909209180"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="909209180"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jan 2024 23:33:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSBHe-0007Fv-1i;
	Tue, 23 Jan 2024 07:33:22 +0000
Date: Tue, 23 Jan 2024 15:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 939/1400] drivers/dma/at_hdmac.c:255: warning:
 Enum value 'ATC_IS_PAUSED' not described in enum 'atc_status'
Message-ID: <202401231518.8q9LD8n7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   774551425799cb5bbac94e1768fd69eec4f78dd4
commit: e4cec073b7755a78030f30cf627141c759035b50 [939/1400] dmaengine: at_hdmac: fix some kernel-doc warnings
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20240123/202401231518.8q9LD8n7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401231518.8q9LD8n7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401231518.8q9LD8n7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/at_hdmac.c:243: warning: Function parameter or struct member 'boundary' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or struct member 'dst_hole' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or struct member 'src_hole' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or struct member 'memset_buffer' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or struct member 'memset_paddr' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or struct member 'memset_vaddr' not described in 'at_desc'
>> drivers/dma/at_hdmac.c:255: warning: Enum value 'ATC_IS_PAUSED' not described in enum 'atc_status'
>> drivers/dma/at_hdmac.c:255: warning: Enum value 'ATC_IS_CYCLIC' not described in enum 'atc_status'
   drivers/dma/at_hdmac.c:287: warning: Function parameter or struct member 'cyclic' not described in 'at_dma_chan'
   drivers/dma/at_hdmac.c:350: warning: Function parameter or struct member 'memset_pool' not described in 'at_dma'


vim +255 drivers/dma/at_hdmac.c

ac803b56860f65 Tudor Ambarus 2022-10-25  219  
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  220  /**
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  221   * struct at_desc - software descriptor
ac803b56860f65 Tudor Ambarus 2022-10-25  222   * @vd: pointer to the virtual dma descriptor.
ac803b56860f65 Tudor Ambarus 2022-10-25  223   * @atchan: pointer to the atmel dma channel.
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  224   * @total_len: total transaction byte count
e4cec073b7755a Randy Dunlap  2024-01-20  225   * @sglen: number of sg entries.
ac803b56860f65 Tudor Ambarus 2022-10-25  226   * @sg: array of sgs.
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  227   */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  228  struct at_desc {
ac803b56860f65 Tudor Ambarus 2022-10-25  229  	struct				virt_dma_desc vd;
ac803b56860f65 Tudor Ambarus 2022-10-25  230  	struct				at_dma_chan *atchan;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  231  	size_t				total_len;
ac803b56860f65 Tudor Ambarus 2022-10-25  232  	unsigned int			sglen;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  233  	/* Interleaved data */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  234  	size_t				boundary;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  235  	size_t				dst_hole;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  236  	size_t				src_hole;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  237  
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  238  	/* Memset temporary buffer */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  239  	bool				memset_buffer;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  240  	dma_addr_t			memset_paddr;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  241  	int				*memset_vaddr;
81cd3cb3b3dd37 Kees Cook     2023-08-17  242  	struct atdma_sg			sg[] __counted_by(sglen);
5cecadc3e2a4fb Tudor Ambarus 2022-10-25 @243  };
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  244  
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  245  /*--  Channels  --------------------------------------------------------*/
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  246  
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  247  /**
e4cec073b7755a Randy Dunlap  2024-01-20  248   * enum atc_status - information bits stored in channel status flag
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  249   *
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  250   * Manipulated with atomic operations.
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  251   */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  252  enum atc_status {
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  253  	ATC_IS_PAUSED = 1,
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  254  	ATC_IS_CYCLIC = 24,
5cecadc3e2a4fb Tudor Ambarus 2022-10-25 @255  };
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  256  

:::::: The code at line 255 was first introduced by commit
:::::: 5cecadc3e2a4fb72ab37d9420df0a9e1179b8a3e dmaengine: at_hdmac: Keep register definitions and structures private to at_hdmac.c

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
