Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D6193
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734220960; cv=none; b=O1wqLQObTSwPgV0l8yrX0FNPdBpG/AB/TiMJC9PZX9BkrizNWWFrDX1pVM6rLkpsEVFix8MaNrwWK+coHUk3v93OQcCXyo1QYsvxSxIJzwfQXem2+BTTZsyNmch9B8ef4HYNjZ0oxDvodSD+iDBgYY2NY9DH8OvYFa6ZJCFnNA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734220960; c=relaxed/simple;
	bh=WzhR7FiUxDtJDs/1OLHBiCSISb46DtVRPDZYbJBEf6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHfCWL0qBT4WlRnH6LrqAkabfe8Og4CcXPi3t116m6uvX2n/rT9G3Z57V/rFifxLZNRSzNQzeaFrxAb/W0i71rdft1lDSh5308Amyd+jlG+E8a0KpgG7PGy+beiBDVDQbPNM4n6HRUm/zL3rcGiz5BAIk2tLoWPUqVF7Amu1B+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTJfofpy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTJfofpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734220959; x=1765756959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzhR7FiUxDtJDs/1OLHBiCSISb46DtVRPDZYbJBEf6E=;
  b=cTJfofpyRvYAzuWGHQ5E8Y/5I8iT5+2vyCGRjmo5WZABY/9MZ2cWTD0M
   ZP5/mwyhgbcL5BE/AA598kk03zSjc8SksR/D09qMf82n1cLfe2p/K7MO6
   Euqr45CzHAlB5U6oBUd/V1nWFD1F/4eu40MljB9ZX5xHGEqexZjZi9WFj
   nRnu5l3mPoG/w8f4YS4sz4PaI3nMqEE3fWiQYL5G5q74IWWJrP2dM2Af0
   fXWD+awLc8S0YBmUxquMeJ8skayyJeG/lIrh8ommNE6Wn3eb7N2VY5OA9
   uLg19th7/TJ4rD6E3BxWDa+KoNSi+VHMbXthCOx1eud0AMhA/x3qjihef
   w==;
X-CSE-ConnectionGUID: WDFSwaVXTROCkLP+OXVoHQ==
X-CSE-MsgGUID: dSjy5F00QIaekHtQDAJKiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45332390"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45332390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 16:02:38 -0800
X-CSE-ConnectionGUID: ZUZ93t/xTDanaihcS7LsSw==
X-CSE-MsgGUID: +jmQ6o9NRKaWPx3EZ1PG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101952474"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2024 16:02:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMc5j-000DKY-0k;
	Sun, 15 Dec 2024 00:02:35 +0000
Date: Sun, 15 Dec 2024 08:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 23/28] drivers/cxl/features.c:60:24: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202412150758.GrkTezZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   c3c1ca00092765212f4eb49d2aaffb2003beb33b
commit: 7f7c30b7dbd79802299899bb011fe4e37a30c12c [23/28] cxl: Add support for fwctl RPC command to enable CXL feature commands
config: x86_64-randconfig-123-20241214 (https://download.01.org/0day-ci/archive/20241215/202412150758.GrkTezZ7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150758.GrkTezZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150758.GrkTezZ7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/features.c:60:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/cxl/features.c:64:24: sparse: sparse: Using plain integer as NULL pointer

vim +60 drivers/cxl/features.c

    51	
    52	static struct cxl_feat_entry *
    53	get_support_feature_info(struct cxl_features_state *cfs,
    54				 const struct fwctl_rpc_cxl *rpc_in)
    55	{
    56		struct cxl_feat_entry *feat;
    57		uuid_t uuid;
    58	
    59		if (rpc_in->op_size < sizeof(uuid))
  > 60			return false;
    61	
    62		if (copy_from_user(&uuid, u64_to_user_ptr(rpc_in->in_payload),
    63				   sizeof(uuid)))
    64			return false;
    65	
    66		for (int i = 0; i < cfs->num_features; i++) {
    67			feat = &cfs->entries[i];
    68			if (uuid_equal(&uuid, &feat->uuid))
    69				return feat;
    70		}
    71	
    72		return ERR_PTR(-ENOENT);
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
