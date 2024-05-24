Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1C383BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716581018; cv=none; b=LL7oJEzE7tCbVBUEI6g7AaOejxrzrurhoNH1PO1+Gw5YyB4RYkLLmk+cNSJX5Bcap3aWAlUCDX7RQvWM5zFV1n0SyQAgrBekNyyj5l5z7bQ762mj0bCPMM+i0Uqmz5+iQcGRwWYlFTyNEIDnJ4Pi8LxZerhH5uthiraN1yVebIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716581018; c=relaxed/simple;
	bh=Ji84Ywh/4aT/f//Xs/ecztGw1z9HU/Has8ikgYl/HQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bX9+96KOeKRYuOC7Nly2ejGDxFZRGAVhH5n8cw6Gsv/EijHD1PAaZAIriL/KOA5v2snyhVDoJuRgv2L3Bv3GqySpO40hJagRJ/1t7iRJg6BmhJV0py/orRGDAMa9tHnFvDdzKLhLwNLT6ffrZnvehQrN/9v1nioyxRyQMYl32lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9Np61v0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9Np61v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716581017; x=1748117017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ji84Ywh/4aT/f//Xs/ecztGw1z9HU/Has8ikgYl/HQM=;
  b=X9Np61v04JrqQtIJjpNJLTAugR+QOGR2C4j9YDcCI+f5h3Haq8lgPjVV
   8kDkKWC5X3qCav87nw+GyCJHYfZAmJ2dvNAX+0X6WWN+ctmUeSkzItajp
   msO884IoCW5KYMU4A3HR9gDgiLsZF1iXuEZu5uK+vSU1WMdGwEevP/cje
   AXeN6Toe8VLaxGwWjGutb2A0Qqki7BhFyQemytTarX71rwS/5M1DO982a
   eYZrgItZxR6Y81ZtYruSDTY/tlryZPYQYcFB8USo8gmVt8EDjskgfeolS
   WrDVNB8d32dfxdVA4bPTIXfCPtpjuwlX/K0MvwbsDqmxvDebIPlDUWHhe
   g==;
X-CSE-ConnectionGUID: gvkK0ugqRuGiKvAmJHZD6A==
X-CSE-MsgGUID: AkRcrE1XTuawtxbxXF6Syw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30491437"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="30491437"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 13:03:36 -0700
X-CSE-ConnectionGUID: LSY0YyIXQJiHDYwvKmstnA==
X-CSE-MsgGUID: dU/bs9snR8KaHVu4VRWIBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="65352367"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2024 13:03:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAb8G-0005rj-15;
	Fri, 24 May 2024 20:03:27 +0000
Date: Sat, 25 May 2024 04:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: [kleikamp-shaggy:folio 12/14] fs/jfs/jfs_metapage.o: warning:
 objtool: unexpected relocation symbol type in .rela.discard.unreachable
Message-ID: <202405250329.Sdnynncd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kleikamp/linux-shaggy folio
head:   e6c1a694e122286e3cafaeb2ecf62332675a5a54
commit: 6c32e3866b8ccabd0478ad08d24715cd71631009 [12/14] jfs: Change metapage->page to metapage->folio
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240525/202405250329.Sdnynncd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250329.Sdnynncd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250329.Sdnynncd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jfs/jfs_metapage.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
