Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27591E86A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723563754; cv=none; b=enwioAx/KsxOZRq1Cx2K+MHLoePB03y8NaWhADkD0IAEQoGKJ+WeteBrlfDP1uEdgbz/riC7xA6wuSrybPSIH5saRQGdWXXYQzDNzdz/RZZeSqK4HR6MyqM5/PYJqfb4o3d/r0TcMnAeN+2a/wIWktXuA7+10/Hg3UVQJJMbTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723563754; c=relaxed/simple;
	bh=ZpWAqrXmnbJeLj15R47l8kt5GOI4Wk1PaKauaPMWj3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdCl7XK2zWCbcfoKOkkZdeyOKXHzMbCJNFkP014fnAsmg6vbFsh1U8ZrkvpeTCc9uen0Shgr9FgpqRGVO/wBn5PnK/zdgX9ZJr1OxQfv5XS53I5u6ElF8vzIi0YBAYC7yoyXvzbXnkWh6MaTTZ8C71eK+fwu1V1QelW08qAQ/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efRepFZY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efRepFZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723563752; x=1755099752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZpWAqrXmnbJeLj15R47l8kt5GOI4Wk1PaKauaPMWj3s=;
  b=efRepFZYQMCTGjp7xRGXmkVjik0sKqtlB2eo9Nu9HNUV5XSMw4Vas7iB
   A1cSGwOXMP7M1Pqm//3xGBSssw7PPElmAoZljBP94sLwGse9FSsv5gJqQ
   NJUxkG0whz8/CanhI8NWHn1L4ZtrLe1Vo4EeQaxocguMgt6lxG04jkii+
   1hGsf6xDpaaqbqp6dItObWDFNN9h7tuBYNwXOYtIdokax8LDfa55BIbj4
   xrxlFdpn9Es6wRAj2e13vK8RTnjCm9O3b+I0zW6S3ygGkJhSQUDnLs5bm
   CPdREnhOgcRaGwbBGtXXZWPfh+9lbHI+SBSsMlBeliiCZ2NEF0gnbA+vj
   Q==;
X-CSE-ConnectionGUID: DXMUTeftSQq3qqy7SbzHhg==
X-CSE-MsgGUID: pCBP8wojSMm+svdmKNW3Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25601313"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="25601313"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 08:42:31 -0700
X-CSE-ConnectionGUID: uq5zaN3ySrmBTLPgmEst8g==
X-CSE-MsgGUID: SvAyq4wQSWehB3gOX+HwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="58680508"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2024 08:42:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdtfI-0000YI-0S;
	Tue, 13 Aug 2024 15:42:28 +0000
Date: Tue, 13 Aug 2024 23:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16132/23490] fs/io-wq.o: warning:
 objtool: io_wq_create()+0x221: unreachable instruction
Message-ID: <202408132328.mUpBPGqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 3cad26766f962aaea098fe3b51863a44878af8d8 [16132/23490] io_uring/io-wq: forward submission ref to async
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240813/202408132328.mUpBPGqi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408132328.mUpBPGqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408132328.mUpBPGqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/io-wq.c:14:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:12:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/io-wq.o: warning: objtool: io_wq_create()+0x221: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
