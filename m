Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6018BC3D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764667396; cv=none; b=EdPdV2y+XRtSs9kQbS38BxViGh/SCJmGPpXt7rT3USq/LK3wRY1lNfwjlNhKMU/xVoDKvhRbgOcrKMwJSFIotRO3ZyAKPam+DSKcDEoHD/aQyK+Jf/z2764Ce8qOCaSA1E7tqAsL3cRtoDUL5oPOHc7pLHDCebWnu3tV8Tbgn1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764667396; c=relaxed/simple;
	bh=0NfHAnTfpYhJxTzzwEk/LQA0ZVFpnjgmQ6ogs9ZSX7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPw+QiAoa/0BjqOfgkUdOH23TEF4F4Ik0SKtgpYkdz9gk8JrzU6wVZgvhMw9Gnc8ZVrzDZhzwq0ogONqFln0L40myWwr+P0GeMyJt4TZNDpA2Hjv21VI+rBpN3LCBXFJL5lpIidnksKyC9pArG52SbesN0Jpz7REowXFxuGu+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdEW/j2P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdEW/j2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764667394; x=1796203394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NfHAnTfpYhJxTzzwEk/LQA0ZVFpnjgmQ6ogs9ZSX7E=;
  b=hdEW/j2PmM9nICthzWiC1ryeNER+OQZPqmGwFIluGv85vUGt7HK0gvzS
   jfbtuUqYQAKsvt2CjTDvz9te3cv4fpwgDQYtQne6y6X80Gbmj7rfRPwOp
   L87511KAib1mQQKzyiHj5T+kQwHgdw9pncQLruMiFcNNrHdHxKhJcK5Q2
   xKvjaGe8EdhS3J3Flympva/9Bo6I1/xjWaricWnmeUDPKEzrLh+f4cA+Y
   PyU/UQ417Ql4TgDMQSx5jv2iQrKy3+AeoSNRQirneoVThjB5SgxZJbKG2
   eT23v+UF+Oy3YmIGl/JHpTOwNeYwf8fA/4H5PT6R3Ax4wF5p9D/1SSPty
   g==;
X-CSE-ConnectionGUID: Iz3/QPi6Sz6ySRZrSENZZg==
X-CSE-MsgGUID: +GAzAE69SYiHt9p++maLpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70243328"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70243328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 01:23:13 -0800
X-CSE-ConnectionGUID: Hwjw6cWGSAW6QZ+CVR5Pbg==
X-CSE-MsgGUID: Wlx1us0JRfKS2IHuFojHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="198703812"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 01:23:13 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQMbG-000000009dV-2g90;
	Tue, 02 Dec 2025 09:23:10 +0000
Date: Tue, 2 Dec 2025 17:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] mm/compaction.c:2761:31:
 warning: variable 'compact' set but not used
Message-ID: <202512021746.kc74uqbK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   fb3dc582fdefab0d6ab237b393b1e7e7f65dc78c
commit: 0e924a37aab0e90d37c76f5b1a88d66610e7c954 [0/1] anolis: mm: support light compaction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251202/202512021746.kc74uqbK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021746.kc74uqbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021746.kc74uqbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:2761:31: warning: variable 'compact' set but not used [-Wunused-but-set-variable]
    2761 |         char *p, *s, *compact_size, *compact;
         |                                      ^
   1 warning generated.


vim +/compact +2761 mm/compaction.c

  2752	
  2753	#if defined(CONFIG_SYSFS) && defined(CONFIG_NUMA)
  2754	static ssize_t sysfs_compact_node(struct device *dev,
  2755				struct device_attribute *attr,
  2756				const char *buf, size_t count)
  2757	{
  2758		unsigned long bytes;
  2759		unsigned int nr_pages;
  2760		int nid = dev->id;
> 2761		char *p, *s, *compact_size, *compact;
  2762	
  2763		if (nid >= 0 && nid < nr_node_ids && node_online(nid)) {
  2764			s = kstrdup(buf, GFP_KERNEL);
  2765			if (s == NULL)
  2766				return -ENOMEM;
  2767	
  2768			s = strstrip(s);
  2769			compact = strsep(&s, ",");
  2770			compact_size = strsep(&s, ",");
  2771			if (compact_size != NULL) {
  2772				bytes = memparse(compact_size, &p);
  2773				nr_pages = bytes / PAGE_SIZE;
  2774				if (nr_pages)
  2775					light_compact_node(nid, nr_pages);
  2776	
  2777				kfree(s);
  2778				return count;
  2779			}
  2780			kfree(s);
  2781			/* Flush pending updates to the LRU lists */
  2782			lru_add_drain_all();
  2783	
  2784			compact_node(nid);
  2785		}
  2786	
  2787		return count;
  2788	}
  2789	static DEVICE_ATTR(compact, 0200, NULL, sysfs_compact_node);
  2790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
