Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2A56760
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 23:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712015944; cv=none; b=PsLXPie14qRbIWzJTQh9M9pal9mRxK0DNb7HF0fRss92TOVIdAYTGD5u6wrsVmq8rNru29k1h9PXW5eOX58XutCuxDGSJ5RAsW4pFLjJ3lmStli38Wd3QaDzJnP++D4FjNXU+WvDB2h6WNV6606i7GDqbxWr9mjQzclVbOqdlvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712015944; c=relaxed/simple;
	bh=uSK6Lea77F1/XmQU7myOfKmk1MHjc1j7pn1bR2jYbJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nH1NuJghchjwrbo5vj4T0d+LOPh0DGHpjRfD+aYrc3U+R8ttob8RsdFn7IpMYtY6Z6lBk3DmJV2ihG75IOaKjI+Y7wDicifQcP2Dq1Qxt4wNSjrczo3uR+cQJCDZHv3TgoJ4Ipv9OeToEXc/cLYFbVyXUL3y14gwziBVe7NbcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmFDj8mN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmFDj8mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712015943; x=1743551943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uSK6Lea77F1/XmQU7myOfKmk1MHjc1j7pn1bR2jYbJ0=;
  b=kmFDj8mNFy+olqDCgU+T9UrUPg/4489DAH5ddFc00HstNFwvLH0t1uc+
   vM8oHPET1xHSqq4FfKF/RY2MN5zot08a4F7JdJsXve4AYp/v1u+t0eE2d
   SvadmAAVRZsVWm8hbTxGBCwKXGCn085MtRE2Ffpl2aJNtZdA4N5JTnbxK
   7eMNbcH9CVDNnsTdSX1We9eHgTKZfJsy01dygD1DMlVFceR0fAUV6MFGP
   ybVBrujZ6Um1VS/9jMeb0zrjAyLNxkKf3bXxdhWLIzEUdzmeAmNoOoYFC
   IENsJeCTTId6hUmAAxNN6q0eQZq6UcS+AQ4Y9S1BVgaXX8fveux6bgXf3
   A==;
X-CSE-ConnectionGUID: 9S6nDjI7R/uGV1la/ze6pw==
X-CSE-MsgGUID: 564B0DQLRq+05HmI9W+sYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7001159"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7001159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 16:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="22556034"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Apr 2024 16:59:00 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrRYH-0000fl-2E;
	Mon, 01 Apr 2024 23:58:57 +0000
Date: Tue, 2 Apr 2024 07:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 256/382]
 drivers/misc/dma-buf-phys.c:61:1-6: WARNING: invalid free of devm_ allocated
 data
Message-ID: <202404020709.LpMGDH1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   01dbe4e64bacaa4c891c1997f2724c320698d61f
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [256/382] HACK: misc: Add dma-buf to physical address exporter
config: x86_64-randconfig-104-20240402 (https://download.01.org/0day-ci/archive/20240402/202404020709.LpMGDH1m-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020709.LpMGDH1m-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/dma-buf-phys.c:61:1-6: WARNING: invalid free of devm_ allocated data

vim +61 drivers/misc/dma-buf-phys.c

    49	
    50	static int dma_buf_phys_release(struct inode *inode, struct file *file)
    51	{
    52		struct dma_buf_phys_file *priv = file->private_data;
    53	
    54		if (priv->attachment && priv->sgt)
    55			dma_buf_unmap_attachment(priv->attachment, priv->sgt, DMA_BIDIRECTIONAL);
    56		if (priv->dma_buf && priv->attachment)
    57			dma_buf_detach(priv->dma_buf, priv->attachment);
    58		if (priv->dma_buf)
    59			dma_buf_put(priv->dma_buf);
    60	
  > 61		kfree(priv);
    62	
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
