Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064AEADC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740241123; cv=none; b=GskjSUVrCpoAL6f2BJ21sni1MEUCdCEmToV4qFaYbT6xR9q5BENq4gRqPJ+oj6FFcEihgMq9Wq+GfpCZmdI0aDBkPPLPLqAtEvVnJB0Y1mciiNOshtvCXIoDJCbcnhl2FHHp1MruIsjTxVyEbHPoGErAidrknvRlvxzAtE/B9kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740241123; c=relaxed/simple;
	bh=glODHB2o2vQJjQwrdbrqTj80kSQBe/KyOrlT6bimpzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFlngvJMlujHOYzYYL6oWLaoeD7qamBawKPT+xV5P37fbI7UI8brZSoYRq/u1yIm4JGxtiDfp0dIC9IrM9E0AArxhP4R8W7vT8tnrzxIgDFyu1UDtakpjXUadF7VCzcqI7ADY7HryCA6djssdo43IY44Hs+2ACwuJ9mVEK8J6rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoY6juEN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoY6juEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740241121; x=1771777121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glODHB2o2vQJjQwrdbrqTj80kSQBe/KyOrlT6bimpzE=;
  b=MoY6juENcOmNWQoX0YIYEinIKn9Jop1g7K/B15EQ4qy0Z1U1PS+CcV/k
   0q4xlbEefI9e1IOa0iUgMmXmSTm0lGx/vo3UUm/ddptN9k5rlftOmYIYg
   /Hk0+zmUDY3o1ZjBBnFTNRtmWkP3C2Y9WpVry+UPjfqkAOAWSgGRO3k0R
   HyKz9QyNhnhRKmqxmPYbKboEnnY5IdTXo9xEKaiNbVTfr/nxx/hSUpqXg
   X9ltk8EKlHUM12Rdb6cbwDtImSl92qIITkkH37xEJ3zEsiuPX8HebCTne
   yjqS6EKcHQwTHmqrHmmA6QwtFb5x/LUhHD/YR7DT0vmifrFdc9qG9+rSP
   g==;
X-CSE-ConnectionGUID: +plu79mlRBGq7V1zdvIVmw==
X-CSE-MsgGUID: /WwVS7vqTwmx9AXYjR6Zog==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51672082"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51672082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 08:18:40 -0800
X-CSE-ConnectionGUID: n2KTo2FsSMu09tcr4jMATw==
X-CSE-MsgGUID: UTq7qhxrTG+drkzmgLvFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="146486193"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2025 08:18:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlsD6-0006hV-2i;
	Sat, 22 Feb 2025 16:18:36 +0000
Date: Sun, 23 Feb 2025 00:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2759/2759] cc1: warning:
 drivers/net/ethernet/bzwx/nce/ne6x_vf: No such file or directory
Message-ID: <202502230031.3Wt6JhSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4d88bf76198b8a462646f7be261586ebb2bbf5f3
commit: 5b3d89af9629848d7a4a4928fd911364e310cb06 [2759/2759] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-randconfig-101-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230031.3Wt6JhSy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230031.3Wt6JhSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230031.3Wt6JhSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/net/ethernet/bzwx/nce/ne6x_vf: No such file or directory [-Wmissing-include-dirs]
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:5:10: fatal error: ne6x_trace.h: No such file or directory
       5 | #include "ne6x_trace.h"
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/bzwx/nce/ne6x_vf: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:14:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:35:10: fatal error: reg.h: No such file or directory
      35 | #include "reg.h"
         |          ^~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
