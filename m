Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E01F5FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347545; cv=none; b=IBvmwvg5dTobQgiSnPATO8u4Fqp0sYeqLM9x54grFpnSODT0TBLoy+PbrFNK42Q1/8Z6gLThR53aF7bXIZ8WxYlU+fWDyx6e4w0rqgyL3+Suhs/udu1vLOgY4EJqxvAuSogN+3SuXmXpI0xAOaswRTyhRqzWhh10ppqy82mrymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347545; c=relaxed/simple;
	bh=wxMX1JJfUzfsZjN5mtJ76RwtsBnZgQe/mQ9ZirwUZ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJY9B4U/4dXnvSWqSuL54NDiofRigRg7wqt5uwycsW/XzJSC78C8bVFNxxSJLhMWgx+V0iW4bw+VaE2YG+Wd4NpDDivSN4WiIx4BnDqID1HaRGshwBK5DXN4pMM7vw4Io1wJeRaz559hdpaxQ5yWvK0HR7QfJgfvHHVTc7fr3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJXFACnq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJXFACnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718347543; x=1749883543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxMX1JJfUzfsZjN5mtJ76RwtsBnZgQe/mQ9ZirwUZ4o=;
  b=jJXFACnqL4yd6TB2IC4G+8mDeN77LvE9cKIseeCGBjF4skuDDnVZcmgo
   pW7bxN6WjUK797qRuV2xTqKYSUCVzps9zApZ0SIH1Zzz+mcHOUZOLwtTV
   NkiQ+gMASt1EBd/CYOp4a24EZ1MzL66KpRdLyHFBTkqghLviNYh4g2h0/
   ypLuSR0+BLvbVt4XoTgLfmfhFvkMFM7Q9SUIw62gqn1CopE86KBGqVmtG
   8wEft03ho7irHsvx5ks0hxd9SsndQHT2ZH2D8MBFq3BXUiBbqOKsbwNi8
   WISGkzELLWt1BNDa4E5O8G6FWxwsg1U1fF524F6U0b6XOXZG8zs33mfls
   g==;
X-CSE-ConnectionGUID: PisQsZxPSOGHotq90fEzQw==
X-CSE-MsgGUID: jslcMP1ZQFy8KTmPc5KAVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15048099"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15048099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 23:45:43 -0700
X-CSE-ConnectionGUID: rJLcpSzbSTKIYQY6XreCuQ==
X-CSE-MsgGUID: byLBashpScW6XYCng18gCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71610848"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2024 23:45:40 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI0gt-0000wU-1S;
	Fri, 14 Jun 2024 06:45:39 +0000
Date: Fri, 14 Jun 2024 14:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14221/22914] fs/ext4/.tmp_mballoc.o:
 warning: objtool: ext4_mb_complex_scan_group()+0xb0f: unreachable
 instruction
Message-ID: <202406141455.MPvgmjIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   efdd263f4cc3df5dcccb45402615eb6d2d8f55c5
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [14221/22914] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-buildonly-randconfig-006-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141455.MPvgmjIK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141455.MPvgmjIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141455.MPvgmjIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ext4/mballoc.c:12:
   In file included from fs/ext4/ext4_jbd2.h:16:
   In file included from include/linux/jbd2.h:26:
   In file included from include/linux/buffer_head.h:14:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   fs/ext4/mballoc.c:4734: warning: Function parameter or member 'bh' not described in 'ext4_free_blocks'
>> fs/ext4/.tmp_mballoc.o: warning: objtool: ext4_mb_complex_scan_group()+0xb0f: unreachable instruction
   fs/ext4/.tmp_mballoc.o: warning: objtool: missing symbol for section .init.text


objdump-func vmlinux.o ext4_mb_complex_scan_group:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
