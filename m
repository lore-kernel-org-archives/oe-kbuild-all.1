Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD762AE7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647716; cv=none; b=A/UjFE3k7oERlOnDdI7ZK9sXn4IbNdpojaTRYnujZ1l6l9hNhspCa0jS+2v4kHhxegEw+tyS/dgFLzWTlYfMEUs0N34BYmYpm9wI1uB61LXKtScBYEz0Bv4NqxHODlkfR/n3xXD7nejbEb+JVYiKCl8K4bojyh7ne6Fx471EaxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647716; c=relaxed/simple;
	bh=v7xQ/Re8iiFGL2VsOCpaowK93Dd1mGi+UIMvLedXosE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJPB7NwyLv8gJI1C7myjemMjzRecfnh2zKnAJyQcHtHmLQHUrHs1HKSiz6kVYumqh5aZJ72Yzu5X+tdqMI1QfyUHar+0b9bzDiBTulWsoZLtpsmXDIh6JWWopwjPIt7IrC7/gq+Y8rlq8FrTxHmVl8ayWjoyh1p9ztfV+Q8Yan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gosrHXbG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gosrHXbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728647715; x=1760183715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v7xQ/Re8iiFGL2VsOCpaowK93Dd1mGi+UIMvLedXosE=;
  b=gosrHXbGAM4pJO4FtkprHaXiU0xTHrg3zu2KNPyBfyxKlPBrAR6CKRtq
   hF4UMIvgerpuotL8y/npeVTUc70sFib5wy/QG0QvKwaIodiK1R0JkBi1H
   /08s12GcV+3yLVaSzKqB57f0T0rLtkuXLmicWBdK4yA4mr5re6b+U0qD5
   9ObP6Z9KZB/zqFVzMAsNahNyTFdeXQ76waObXzlWFQSXxGoN/xVQR1kM+
   k/tO3YQvmHqtcnRUumb+JQGLNLRYdm5vA+89+Pa8S9+kKHH24z5DIlUBi
   1GzD44u0Ef78CnShiw/n11lSwdFnes3nlOO8yotaicEYYxD/THu3Lu39o
   Q==;
X-CSE-ConnectionGUID: rrnRYthfTBCiwwPunDsVCQ==
X-CSE-MsgGUID: Mscejff3RmCx38n9SQLWeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38626364"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="38626364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:55:14 -0700
X-CSE-ConnectionGUID: xcgcWg+dR06JS5YWYgx+bg==
X-CSE-MsgGUID: PGpnRjN+REq4iVAI+fdQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76516566"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Oct 2024 04:55:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szEEh-000CFn-1z;
	Fri, 11 Oct 2024 11:55:11 +0000
Date: Fri, 11 Oct 2024 19:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-dma 1/9] undefined reference to
 `iommu_dma_link_range'
Message-ID: <202410111952.1dCD2Qqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-dma
head:   d76f41fc7d0f68b85c90d0beb90a09f54b6aa219
commit: 4828642547fd5245380cc2c2a894043148f25dc2 [1/9] FOLD: simplify dma_can_use_iova
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410111952.1dCD2Qqf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111952.1dCD2Qqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111952.1dCD2Qqf-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: kernel/dma/mapping.o: in function `dma_link_range_attrs':
>> (.text+0x12ec): undefined reference to `iommu_dma_link_range'
>> alpha-linux-ld: (.text+0x12f0): undefined reference to `iommu_dma_link_range'
   alpha-linux-ld: kernel/dma/mapping.o: in function `dma_end_range':
>> (.text+0x158c): undefined reference to `iommu_dma_end_range'
>> alpha-linux-ld: (.text+0x1590): undefined reference to `iommu_dma_end_range'
   alpha-linux-ld: kernel/dma/mapping.o: in function `dma_start_range':
>> (.text+0x15d0): undefined reference to `iommu_dma_start_range'
   alpha-linux-ld: (.text+0x15d4): undefined reference to `iommu_dma_start_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
