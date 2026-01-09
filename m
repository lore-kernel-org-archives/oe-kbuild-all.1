Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A42223322
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767990765; cv=none; b=QqPj1WEwV8Pe0deBsYgdf+MyEiyXK2t4WhSuxMpnCTmlkcn64WIUNOQHuJgPTcOm3jL0TyhNZ8wAIDQ0lbWH9AuHiUmCRTo4oFaNlc5SVgvXvIBP0HoHr6Rno5nbKarmA3G7bOj1K/q4+njxW13GB1GgtaGQrovyoeihs5iOW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767990765; c=relaxed/simple;
	bh=HIh9hC3Nq0kRGet8Lvmo+JXSLcR5kk8mAija5v1wy/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uHFB3jWu+kv2/xlz6Zd/vS1asTfXWq48vBIbHPNfghWW5ZtOEVNcokexkhMW8IbuZty2peRUW+Tve8kuZBYH6eOb/FZQ6uvQJ9J8ScR9aMTOjky9DiKSGcjT+lal4q2WA00o/EYFg31xQLsq3hHnOCgoVwT9iikrLduVwGouwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axGTeAYQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axGTeAYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767990764; x=1799526764;
  h=date:from:to:cc:subject:message-id;
  bh=HIh9hC3Nq0kRGet8Lvmo+JXSLcR5kk8mAija5v1wy/M=;
  b=axGTeAYQDEC5o3Pj8/CvyG75lKod+l535+l67eDL6CbqntSs2oeOjV91
   uKsHc8lC2lpjoxqoQ+AMQ5HSRY3tplGKOVwX2pQUoG2YBK0bahSnbgqaL
   ubQJxlYO2hP4cs5OXtJLz0buBrVjxBkPhwk6vhv7vWB5LnQ18LYhCjncC
   qdpxCn3cL6Yv0Y5kPmBIlWPaod1/9nv3oLKAZbp2zH/IZlZFSQmLiqCtC
   JRBC0X/e7eJ9WRovszC24m3s3Z/1zr+zDfkuLn3gfRYjCcue7Zd6KsLI8
   GEUY/odiAOYUFErJHCVC6nCDh2BOk6kqE6BeaQ21POD26BOcBKDZDXa1U
   g==;
X-CSE-ConnectionGUID: yIw59/CQSEy6AyZsbDLKdQ==
X-CSE-MsgGUID: ogzrNfe8RemfAXOq7dgNpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86794152"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="86794152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:32:44 -0800
X-CSE-ConnectionGUID: 2y5tVHoVQu6V31dlZebxSg==
X-CSE-MsgGUID: jQ9ywTWzTnG4jMq+zKWOHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="241059783"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 12:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veJ9z-000000007ha-2hYL;
	Fri, 09 Jan 2026 20:32:39 +0000
Date: Sat, 10 Jan 2026 04:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260109 6/17]
 ./usr/include/linux/kvm.h:17:10: fatal error: stddef.h: No such file or
 directory
Message-ID: <202601100417.OWiOCTEs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260109
head:   4d8c567a107d0f07e6fa7f8f7b6ce4a444c69b4d
commit: daeef1578407256a91890a91ad3ba9f144098215 [6/17] KVM: Avoid a few dozen -Wflex-array-member-not-at-end warnings
config: x86_64-buildonly-randconfig-003-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100417.OWiOCTEs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100417.OWiOCTEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100417.OWiOCTEs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/kvm.h:17:10: fatal error: stddef.h: No such file or directory
      17 | #include <stddef.h>             /* for offsetof */
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
