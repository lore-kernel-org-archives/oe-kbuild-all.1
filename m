Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1052AE68
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739501238; cv=none; b=tE4jBcGRGUhjTI+BewE0TVyjO+n92xmx+OsMcLoPJij06uwi2iuUjRUQPqTGXUI5T3ljnzGteHRsQ0Rpc4ymj0oXXpIwTT5yDgMhD+c0snaqPv7dXv+X6q03JZlkr8XYBuN8//Gb7Sddt02FXR7rksLLfdLlNIgNB5kbIMMRMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739501238; c=relaxed/simple;
	bh=OBDOMbCu/54QoG/82en1R6lfwoODk1RsBgQAU745tNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMVI9QTXtgDS4DHd0j53zP1TkRR5W7rq5/U7wqmd3jEfTTVndz+I6uAwBSvUfVbFtdtIfxHH3VKIIDbnjD6H3Qk2rH3WUa9wYV6T/IXPUT8LqfRG4t2fXz3AYuKYhbZLe0xsZ0fPoCxxhaZqOSFQA6kaqZRPBXtDagAS2okp6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIn2XUVB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIn2XUVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739501236; x=1771037236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBDOMbCu/54QoG/82en1R6lfwoODk1RsBgQAU745tNg=;
  b=LIn2XUVBtdb9qkxlg7HdI9u5RGf2cUIJPOvq4kDFV+TvD0R9yFLq1lV1
   DdxlIW6+q9m3s/fW8CHOXwM8Byj9ptAHruxU+k9WAuUZzRLN4btKB5Tit
   bmVkusHQW0tKL5ZllTeMLV6sYb/LTsD77MAcj8ubhGIsAxvHELFZMlzaQ
   sN/fY8LC0I6HY4Q5Ipzn5tfUhSPQ8g4u9frYH6GsaWcKuJOy+c/Ln2L0C
   nsb4Wh1zqWBLaonW/+idy6NkWc5Q7YBcOoF5SzdMBB0SG1cj1CuWHvfFu
   gngaBbBKJEATSQu/zJZk7HRaOjHX65DkVObMJ1AD51wMDgebcpzTxFJ3p
   g==;
X-CSE-ConnectionGUID: XgESVpYXSLK5xvdOLir21Q==
X-CSE-MsgGUID: PvQd02OiRquPKQTC53+7NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40386790"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="40386790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 18:47:15 -0800
X-CSE-ConnectionGUID: rIF8BeCIQQKZqDbCSuTZdg==
X-CSE-MsgGUID: HOpTxSljQwCD9pY4XIjBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113320191"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 18:45:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tilhN-0018zJ-0C;
	Fri, 14 Feb 2025 02:45:01 +0000
Date: Fri, 14 Feb 2025 10:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <dchinner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chandan Babu R <chandanbabu@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: fs/xfs/xfs_linux.h:280 kmem_to_page() warn: unsigned '_x' is never
 less than zero.
Message-ID: <202502141023.Rdalsdag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   68763b29e0a6441f57f9ee652bbf8e7bc59183e5
commit: afdc115559c57a48ad697219cec1d16962ad9e30 xfs: move kmem_to_page()
date:   1 year ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250214/202502141023.Rdalsdag-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141023.Rdalsdag-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_linux.h:280 kmem_to_page() warn: unsigned '_x' is never less than zero.
fs/xfs/xfs_linux.h:280 kmem_to_page() warn: unsigned '_x' is never less than zero.
fs/xfs/xfs_linux.h:280 kmem_to_page() warn: unsigned '_x' is never less than zero.

Old smatch warnings:
fs/xfs/xfs_buf.c:724 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 707)
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/_x +280 fs/xfs/xfs_linux.h

   271	
   272	/*
   273	 * Helper for IO routines to grab backing pages from allocated kernel memory.
   274	 */
   275	static inline struct page *
   276	kmem_to_page(void *addr)
   277	{
   278		if (is_vmalloc_addr(addr))
   279			return vmalloc_to_page(addr);
 > 280		return virt_to_page(addr);
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
