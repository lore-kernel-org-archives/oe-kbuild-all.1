Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD04242D6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209500; cv=none; b=M9vgPK+Lcs+2WEjm5okoIrp6WktVAdccV7QnPNeVlBCtd0vtmE4NfY8wJwjizBxxCelnYFuNSftKvgz+SX0CU47zt7wLrJEIJPUR8jysDhyGskcyj3MBnH+bjiKz20F+T9O+bClrNilTB7s5wVmfS/YTaTiTFx3qpC2t0pCslzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209500; c=relaxed/simple;
	bh=pq1WI57WA0IYDbfSr7KXfVcN/VZucSqLozLa85BLgHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHF5DL1B5UplZlav2IIlEzt7gQd3POdFy932LY+MpIwVN9Wm00PxyujcyNJkCRAFTo0BCU14J2/0nSuLES8qMJCeJ3WR5bJjxmK0c/uSRlGtVD00IncBhOKYX8g4QmpMioXLcYkn2KXTNIjwM9KpyQV9cz0UDTyVIDO+4/2gXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIHj+58X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIHj+58X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764209498; x=1795745498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pq1WI57WA0IYDbfSr7KXfVcN/VZucSqLozLa85BLgHI=;
  b=iIHj+58X3zrlxM7SHVrVfeXHJ/tDtMMfOxGttFFrsd0+u4LMBQimTcgg
   tjY+HXjocXbdizhsCSV9K7510PhppYrzRBPYaC/vurBmRjRu8u8XEN8Qb
   5fx9Pvv9/Yz/P+zAR0sO9vYq4ck7gpgJFFR40AYHmqFf6DM7Kj8Sez+at
   MZSUzaJ+jWC/hqkmbScDlmM5LPtFgLPxrH4UQSMRK6jJI0rJuUKsBQiam
   zREv0FzRloJvm75mETrlNOIeOmnOk8FDNfBkEqF2z3UPo4QBPpKPypin5
   Xjr83LgDGjqJUBjt+aSFH3nt6K/jR/YtKJSBLFykkwX+6nTuJGxAcl8zk
   A==;
X-CSE-ConnectionGUID: KCNGy7bHScCPbcwdnfmY1Q==
X-CSE-MsgGUID: vEBY5Ui5QjC0SToV5HByOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65964923"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65964923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:11:36 -0800
X-CSE-ConnectionGUID: YgSQ+NaLQ3WdsgoD2OfM1g==
X-CSE-MsgGUID: 4KcICrGqQ02zfPOhoJQ9og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192232102"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 18:11:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORTp-000000003ZX-3IXW;
	Thu, 27 Nov 2025 02:11:33 +0000
Date: Thu, 27 Nov 2025 10:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
Message-ID: <202511270913.0RBYcBaq-lkp@intel.com>
References: <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>

Hi Pavel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.18-rc7 next-20251126]
[cannot apply to linux-nvme/for-next brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/file-add-callback-for-pre-mapping-dmabuf/20251124-065343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence%40gmail.com
patch subject: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
config: arm64-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270913.0RBYcBaq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270913.0RBYcBaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270913.0RBYcBaq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module nvme uses symbol dma_buf_unmap_attachment_unlocked from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module nvme uses symbol dma_buf_dynamic_attach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module nvme uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
ERROR: modpost: "blk_mq_dma_map_move_notify" [drivers/nvme/host/nvme.ko] undefined!
>> ERROR: modpost: module nvme uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
