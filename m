Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4FF153BE9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769399838; cv=none; b=FSfnXamPRRVvwJRc8DQyZnH5npYYzjoBQkiwAZU0jYJSg1HTv0oDI60Ax1sO6xAyxjgOStwlHoI2V1Kvivgt+RMZ41MueWKB+Yy+8iGLRnaepW7/EhnnoCWaKXsdlQdA0UNQi0qjafUJn4EhLrTqIGg0fwxXqX6POzCRz4YiEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769399838; c=relaxed/simple;
	bh=66dVc8tb25sybWUQLlanf7Qvz54P0zNDru+FKIrDUXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lwPNzHdUyjUKirQYj20klXB09F6oPgf580/R4WFwBTWFGxty7rmfSS7oInd5Cv01NNd9GtZhhpAA7XqI+DDpmtr1PDoOGtxCa7zvPSddNuo9Ubr0zZf8nqN0WZPTo/iXTze7m0BjfcEbNlL8NPU1bcbLDrSqLyl2UzIcrjrINEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAZF+SeF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAZF+SeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769399836; x=1800935836;
  h=date:from:to:cc:subject:message-id;
  bh=66dVc8tb25sybWUQLlanf7Qvz54P0zNDru+FKIrDUXM=;
  b=ZAZF+SeFNBBHSkGxRJOVCZxaMDnYyL3JIYkFzw01qMczFSeHcQmEku2T
   n9cm1Bupxf7UEgAelcAgkimm73/jIjWGefFwdZiX8NtXTuSzImOLHD74D
   2W2aMlbWcQqjD7NC8raL6h3847Ba/U8g8mtK4W2XmmjdaEEEYlOfbEs17
   BxWsOu7nGxBVns/AkcWS/PJBeke5R/D3GgNdmNWKvdnErl4DFxIHVacGM
   60KqtUqPcDtZ8kYFBzq7cjqzKao5l1zi27caB/OCEXJwVH0LavFz4/iFH
   KTjfC4IpKqRa5BIno34lKf8DSyyJPe/fdb51jSdpKxYk081y5jhzeWGjW
   g==;
X-CSE-ConnectionGUID: 2VR2TzAZR0W1oM8n4gy2Fw==
X-CSE-MsgGUID: jlsFV+RBQFeoV4/9TSaV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="80879558"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="80879558"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 19:57:15 -0800
X-CSE-ConnectionGUID: MsamXLVTRKWYQp0HcANbng==
X-CSE-MsgGUID: BST/sSopQ2uX46c8voELdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207834455"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jan 2026 19:57:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkDiw-00000000Wry-38ON;
	Mon, 26 Jan 2026 03:57:10 +0000
Date: Mon, 26 Jan 2026 11:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 5773/9539] Warning:
 fs/iomap/buffered-io.c:624 function parameter 'private' not described in
 'iomap_readahead'
Message-ID: <202601261111.vIL9rhgD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 8806f279244bf300dca2c99735d5a51cd24b86df [5773/9539] iomap: stash iomap read ctx in the private field of iomap_iter
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260126/202601261111.vIL9rhgD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261111.vIL9rhgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261111.vIL9rhgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/iomap/buffered-io.c:624 function parameter 'private' not described in 'iomap_readahead'
>> Warning: fs/iomap/buffered-io.c:624 function parameter 'private' not described in 'iomap_readahead'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
