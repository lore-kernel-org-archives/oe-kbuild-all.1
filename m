Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD8822EF4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724901224; cv=none; b=vEnTrjDdih2jZ2iGCAMbIzLHx2C9H6Ew3ZIo/OdSwGuJkOW+lNzZFPMz1ZC3G2HXgzPQ2t54OOowQ7l6NEAimkOGiPz6D6h+UV0rJZytl2kgtVT6jZ1N2iL8W756W4Qbe6kmV9guRwvlVzaJ6a2fYAqn+aXTnIMyflVKZtexOoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724901224; c=relaxed/simple;
	bh=Md9RZ6p07+u+PzMYE2OIib0LcA/2Gr6iZ6Gl+kXTEzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPM44h9x62026H8TDeBbALovfkdvC4i5E6PgCJPWTGqJuR9StHG8em0H9/ScBe4E/nLjF7zjQGfFOvwYEoTWQHnf0C0KQdQuWnIo9DXW3TEbvd746qtNKts8FF12Hohdu0cVB11EFnKQwyukFWjwbZ5oGUzMwP7P96LewB4VuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7UIkV5I; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7UIkV5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724901223; x=1756437223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Md9RZ6p07+u+PzMYE2OIib0LcA/2Gr6iZ6Gl+kXTEzg=;
  b=b7UIkV5IaQqQgrnIb0pJLb0B8id/PYueVTzuzhiY4w7ncgtbmr38ZVij
   JsgfJkXbP58zoe/4ZgvtS2jvVo+5HztpvzQcCAPEKSk71raC6CuOkwQKT
   YbMpuf45M/wakQ2y0JI2ckpbHVImWgfPaR6mSa93CC0ZCFls9lopO7Ba6
   n0n4m7a9fvSCP3xa3g97x0I1jbKz81gmDTt8x3TD+jMzSAO1n+kNYmnD4
   TGFsxZTeEE1aUlsUTYclK11xBOHjrmOmfvN62nvt2u8p/sstQTuEFILSi
   ZY7jB3g73tTLF9G03c8rOm5P2d/gC1bgLC0XCQRP3rwjRXdxVuf7fLoZ+
   g==;
X-CSE-ConnectionGUID: 73hUWZzQRfGdveqQAyhC7A==
X-CSE-MsgGUID: qEw1Adu/QWK+QZVoQhPtHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23613571"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23613571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 20:13:43 -0700
X-CSE-ConnectionGUID: ucLXKaTDRzmUM9xyKfLBUA==
X-CSE-MsgGUID: DgaB6XVlQMG6UoX4LqJm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63266225"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Aug 2024 20:13:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjVbO-000Lc0-39;
	Thu, 29 Aug 2024 03:13:38 +0000
Date: Thu, 29 Aug 2024 11:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Nan <linan122@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21953/23581] drivers/md/.tmp_dm.o:
 warning: objtool: dm_process_bio()+0x2f4: unreachable instruction
Message-ID: <202408291146.oKKBq2Iw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   46d28312ab3cc0cfe7e8dea2f41d22fe4ac35e67
commit: 3830dbeebc54a74b56b8253c33857b38fae427fb [21953/23581] dm: revert partial fix for redundant bio-based IO accounting
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240829/202408291146.oKKBq2Iw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291146.oKKBq2Iw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291146.oKKBq2Iw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm.c:8:
   In file included from drivers/md/dm-core.h:14:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/md/.tmp_dm.o: warning: objtool: dm_process_bio()+0x2f4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
