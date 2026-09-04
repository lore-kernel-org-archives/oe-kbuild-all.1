Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9044A485A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561191; cv=none; b=L4My9HI3fg74sf5Fpb81+0JCp8lfbSEaW8156RybXm9KjBb6kQRySuoycuEpqcmOHZxWwjIhUfgzg7QxSFgWGW24NaEnEAXtr4htPAsJdLNvVs9/SzBCB3D2g0n9dB1GZJ9d+MpcmE0F20QAhpxPrNJdHlaEGZ6dcCh30fyEk/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561191; c=relaxed/simple;
	bh=VmuDvGGu5gYnC6uQaNYccGAJzm010w0N5hZH+dEWsE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MjOW1SLxnj7kXxZnSZq/u5Jbea6XWYO/LLxP+DXr2Vz8YsC8lUX4UmDmWJRVKtetDX8WnQbZcD/vg1GyT7uG8BzXRlTIS0wyv/hhkwXHKETqFD66wXtnMf/YN2qdQA2c+WjdkdlyGR2fiP2BjnqPTUdZ++bJanCWi6ROVNvH0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgrJqLQ4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgrJqLQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788561190; x=1820097190;
  h=date:from:to:cc:subject:message-id;
  bh=VmuDvGGu5gYnC6uQaNYccGAJzm010w0N5hZH+dEWsE4=;
  b=MgrJqLQ4sqIN1V7t9bvU4kFpZEmnczJBioB59eU9zfIrBKgU8n5FzEZ+
   cxlai4HGUhvUexlyVPx5UyD0IDP3LPNC+PqhxPRVQSyS7z1jPs0/Kxahd
   Xnk+Rc00cfJZ4xU2lKMQco43BwUg2JNGz1MwsNXmSZoMNBMJi6RzPex+v
   dCmGKrj0pNUR2jhiUljoRq0Ro9jg6CEa174LqMu6+LwSvJy76mAEE2JLi
   nW/VAtTk9nnUotBTln6jNuvkn2DebJIeaOxqbsYyc1yyN05LFUZs6BcZF
   qC5SQI/yAS1wZE9v0J1vYgtIag5J8bfKJtG4zPOkjs3bie8luKlMjlvNb
   A==;
X-CSE-ConnectionGUID: mOeKmiDhToKRmUE2l1rmGg==
X-CSE-MsgGUID: epWcaiz9TwS2jzqkwJRiBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106584641"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="106584641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:33:07 -0700
X-CSE-ConnectionGUID: LrHTzWPBQl6cMnrSigAXOw==
X-CSE-MsgGUID: 1SdEnM2xTwyPVLZOw10xAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270683256"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Sep 2026 15:33:06 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2cT0-00000000ADe-3wVC;
	Fri, 04 Sep 2026 22:33:02 +0000
Date: Sat, 05 Sep 2026 06:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org
Subject: [akpm-mm:mm-new 301/316] mm/memory_hotplug.c:1507:13:
 warning: 'node_is_memoryless' defined but not used
Message-ID: <202609050628.ywCLhOj5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   e3fc12b08aadde9cec7b3799ac0e0c9a1aa245c4
commit: 77a622e07892674da28eb3ad349ddd96df10aded [301/316] mm/memory_hotplug: factor out node_is_memoryless()
config: x86_64-randconfig-161-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050628.ywCLhOj5-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050628.ywCLhOj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050628.ywCLhOj5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:1507:13: warning: 'node_is_memoryless' defined but not used [-Wunused-function]
    1507 | static bool node_is_memoryless(int nid)
         |             ^~~~~~~~~~~~~~~~~~


vim +/node_is_memoryless +1507 mm/memory_hotplug.c

  1505	
  1506	/* Caller must hold the memory hotplug lock for this check. */
> 1507	static bool node_is_memoryless(int nid)
  1508	{
  1509		/*
  1510		 * A node still spanning pages (especially ZONE_DEVICE) is not
  1511		 * memoryless.  A node spans memory after move_pfn_range_to_zone(),
  1512		 * e.g. once a memory block has been onlined.
  1513		 */
  1514		if (node_spanned_pages(nid))
  1515			return false;
  1516		/*
  1517		 * Offline memory blocks may not be spanned by the node yet, but they
  1518		 * link to it in sysfs and can be onlined later, so the node is not
  1519		 * memoryless while any remain.
  1520		 */
  1521		return !for_each_memory_block(&nid, check_no_memblock_for_node_cb);
  1522	}
  1523	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
