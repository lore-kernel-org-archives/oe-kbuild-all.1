Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2F1B32D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645928; cv=none; b=tERoiah9rIHurjCj0UVTlFQNEbnwe8DlBdmOJU7usOu4BZE8vyf84x6mwJojh/Cqf7tixqi6WcFddl8UC61n8lHUMOAGYwwv2h17eG5fpAbKGutFxPRQ/WF+dI/2R7EH6g/6Ws+JAcKMYJcvPJevNERYxt+tMPt+GDjHeNW/hp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645928; c=relaxed/simple;
	bh=R5XcCDDRQV/Qri9d5Ij9q5YHvz28yUCOWnnm1F1tk2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZ+hlWNqS+UFCxs9fqTUtedQIiGXMZ3+5gPctymlyfKyJtOgVusNA+/I9Cc05IcRa4K8zQXNgFf2iym9PM0YvqumdaWbwPB8BHgtkeuxKPapJQk8PYfP3cL4Kzs4vmP4CCC7vNpwyiNz2QvUos64BQtiCdSSpcR0jSBir9vPTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZW3omspU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZW3omspU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723645924; x=1755181924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5XcCDDRQV/Qri9d5Ij9q5YHvz28yUCOWnnm1F1tk2E=;
  b=ZW3omspUGJ31JgKshKCPo6rz1WJKePAku6uPAilJHL9Ratdzm8Ggdc+1
   dGeynm435vy4w7my5J8wyLF0AZXJFUvxlHu0BnoXpePvhRn9RbJaVisp/
   qMUrBUFCHptTmUpC//80bGhUHFZxuAMn/AafxuBMRdYFcYgI1Jr8J4/au
   mi80HyqvrayZYZ4grpJZCydWiocYgewqZwp1QNq5TbASz0VLVCiLXR0ib
   1rpJZiBnRAlXBn6tcuhmbim2gNUMQiE9sTrYpkrnq/dpYGs3zw2VYdTNk
   dTGUmfuVZ44+S/+IFW5cJEr+jFLQYctTTDPpyvz4BcuY3tGHr6Cx88BSN
   Q==;
X-CSE-ConnectionGUID: JmWxJDrmSqqG/O0CNYQDDQ==
X-CSE-MsgGUID: o0PzSEdNQ2yXrEsp9xUHdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21995374"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21995374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:32:04 -0700
X-CSE-ConnectionGUID: a/nOy+CZSOqEUy6DRgmYCQ==
X-CSE-MsgGUID: +40r9qDCR5+CAyYi9ap0Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58671143"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Aug 2024 07:32:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seF2e-00021P-2Q;
	Wed, 14 Aug 2024 14:32:00 +0000
Date: Wed, 14 Aug 2024 22:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20512/23496] drivers/md/md.o: warning:
 objtool: md_seq_show()+0xf5e: unreachable instruction
Message-ID: <202408142254.VLmOI4f7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9d745528f7369e6da738f9b0cc978a61c6017e70
commit: a89f484219c9ea217d26908f16037d1ab55d4f17 [20512/23496] md: Ensure resync is reported after it starts
config: x86_64-randconfig-103-20240814 (https://download.01.org/0day-ci/archive/20240814/202408142254.VLmOI4f7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408142254.VLmOI4f7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408142254.VLmOI4f7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/md.c:49:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:320:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     320 |         int cpu;
         |             ^
   drivers/md/md.c:2231:24: warning: variable 'bi_rdev' set but not used [-Wunused-but-set-variable]
    2231 |         struct blk_integrity *bi_rdev;
         |                               ^
   3 warnings generated.
>> drivers/md/md.o: warning: objtool: md_seq_show()+0xf5e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
