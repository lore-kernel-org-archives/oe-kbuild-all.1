Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634879C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278647; cv=none; b=rlNQCep3meh8UclZLe9iCZngAoNwMdMGrntrR2v+/bMh6EbQXI9sQQfvTuc1LPmdYNEfIehc0UXG7p5OOUqTwiuCOZyKsTHXH4wb4hqTuPGVWrEMcTZC0nYwoCS7HljrHfO76lacEaiggDGmHFPF8JNE4mYRfjeX1jbpjPSQTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278647; c=relaxed/simple;
	bh=nyxUOT32nBCHJG9DLidyRmX9eiPNDGU2C50Zxpaax1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bnn1HUXJF0AEqtxYcb/gEJnYaubxmLGtz7mXtat7pXrFCWVmZRS3lXd8aJ+qLJem8+YAVuGQNIEA7OQHHh3HcPwDz3rYc+Pp74WLKmXCuNpxeuVcdipS9wbYvNLjMGD11aFsQyJErR5kL+IGEKaolWzJRd9Q53moqr7eIxA3eR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpePTbAX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpePTbAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727278644; x=1758814644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyxUOT32nBCHJG9DLidyRmX9eiPNDGU2C50Zxpaax1o=;
  b=fpePTbAXAdoRGTK2lhOMwiVgyY5ZjvjVogwrsjO8E5KquAMMr4Oyzxnd
   bFN6yjYOYFlDMD5OBi7nrvpd+D7CqYaNpc0elGbRleTVCjT/8nHEGnRA6
   z1RpzaFz0gARvUt6IrY+d/TsOnlhWJB8PdTsKcj59oHDM2kx9S7zZcrW/
   7qRn+PEejipKedI+mwUdBfBdR498ShsDjrexwQ/EEytcoOt2gXSw0Zsyt
   gqPpWtM+v9pmy+yxBZhZ45kuv5Gc7bPaMi46P/lfbkymlIE8VGp+Sp/qk
   gTPxYGauY+iK5xLxfnoWZK/EQ5QA/kdTddBiG/sXnn5vl2eaPpEgX25Lc
   Q==;
X-CSE-ConnectionGUID: t3UuAnoQT2a43nFGzRoBXA==
X-CSE-MsgGUID: 4lbzmPfnR6OoO6oGo1ZU+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30222347"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="30222347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:37:24 -0700
X-CSE-ConnectionGUID: 8PHssu59RHmALzDSxyxOgA==
X-CSE-MsgGUID: l/TQhdc+QRSLLskaCA0w8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72269693"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2024 08:37:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stU4u-000JeX-1H;
	Wed, 25 Sep 2024 15:37:20 +0000
Date: Wed, 25 Sep 2024 23:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15191/23766] block/.tmp_genhd.o:
 warning: objtool: __device_add_disk()+0x387: unreachable instruction
Message-ID: <202409252335.Yggdg4Gw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ecca3ab84cbf3cf5ec32574bcec8a068e79d14df
commit: 8ce6cbc44f9ca78cac43506c84fcdd7beadee07f [15191/23766] block: fix use-after-free in disk_part_iter_next
config: x86_64-buildonly-randconfig-002-20240923 (https://download.01.org/0day-ci/archive/20240925/202409252335.Yggdg4Gw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252335.Yggdg4Gw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252335.Yggdg4Gw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/genhd.c:10:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   block/genhd.c:532: warning: Function parameter or member 'devt' not described in 'blk_invalidate_devt'
>> block/.tmp_genhd.o: warning: objtool: __device_add_disk()+0x387: unreachable instruction


objdump-func vmlinux.o __device_add_disk:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
