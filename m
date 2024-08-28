Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DFDF51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 00:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724805989; cv=none; b=faCgndNyE02hULZfhZzDhadzYTPmF/sbI9OA0IgUc8tAKVl/UKf79kZE+sjLoiT/Zj/gIx4j4VHRLE4u/iK2TtePGC9lAqvnTohprJQcgu1ybUeLUceWWmx3gP9sDqHaqowpFPdTdccHpr7H6MxbRoUOua+U04pXQBAIrRASkkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724805989; c=relaxed/simple;
	bh=qQw1kYJaAju4o0mPd7+6OboprZvys86ikJEJlMIyDtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdlZwoje5wKCCLopJpoe2xk+pGBy9gQp4wmdzWjpZd59CagtGz4QLhaTouFcLY4TS2/5oOm2dDdUrkTz3SAXWZlq73B88V7wNd0poLg13Hq2563kaQqF1/1apKEXff2knSusevbplVxr+7NIAYwLnbTnMfEgm9liE7RjIyucFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6VT4RpG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6VT4RpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724805988; x=1756341988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQw1kYJaAju4o0mPd7+6OboprZvys86ikJEJlMIyDtE=;
  b=T6VT4RpGcv6DUUxcRAbKTI0j0t+Z9lvu1dyFsa13Yyjie8povNluNf8h
   1dI3DuLJ9i74/0oQ5q4mqAaYAc2t/NSfpCrXBCDnZ457xHyQURRgI0qPF
   yr93R/dKSs1FV/cqlq2dcfv8Pi2ZmpWgtYqvSOrYT34DYh1zj1tWRFhVT
   UTiLVvM4TYYBnzIH5dmcUB+rYKls0l2WBU2lP0cU9kH8EzlGnb+hl3vl1
   XFweRnGCClL4MnZtNoIq+/R1uxk0/fyM82hnpARfk71fBju3MDijo1SIS
   njpjUXf1tYOVTyG6+Vrv1kjGXERWSSxKqSNAdggzkjJGbr2dAPtA/F/3D
   A==;
X-CSE-ConnectionGUID: AUCYxiVQT2uypprDJmFVtg==
X-CSE-MsgGUID: aimybiLTRSKb6zs3l9EzZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23474877"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23474877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 17:46:27 -0700
X-CSE-ConnectionGUID: xTkrwk1/TqiGOVjCA2HBOw==
X-CSE-MsgGUID: skwXSkwiTFG7AbH8LBKjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63010052"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2024 17:46:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj6pL-000KHG-32;
	Wed, 28 Aug 2024 00:46:23 +0000
Date: Wed, 28 Aug 2024 08:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17447/23564] block/.tmp_blk-mq.o:
 warning: objtool: blk_mq_unfreeze_queue()+0x75: unreachable instruction
Message-ID: <202408280826.MupKFjBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   73a86ad60aabf460a4c8a0f96a1b2ddb98522fd8
commit: cbd9fe6e727ed12c1e542f74514e6dd4419f1cf6 [17447/23564] blk-mq: fix hang caused by freeze/unfreeze sequence
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240828/202408280826.MupKFjBW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280826.MupKFjBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280826.MupKFjBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-mq.c:9:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:600:44: warning: passing 8-byte aligned argument to 32-byte aligned parameter 2 of 'smp_call_function_single_async' may result in an unaligned pointer access [-Walign-mismatch]
     600 |                 smp_call_function_single_async(ctx->cpu, &rq->csd);
         |                                                          ^
   2 warnings generated.
>> block/.tmp_blk-mq.o: warning: objtool: blk_mq_unfreeze_queue()+0x75: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
