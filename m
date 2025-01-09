Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00435220689
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439089; cv=none; b=QDINjsGgfK83JT7lyvlIx4qI5i0ooWq9rcYeTYPCmV8JieXV/Oqi0IbxkTMORYVJG594TEfmhk7UEopf0BmYuG35x0kCnGNYp/xkLwIx7mto5w8/x9mFY3uw4dBWmq3jHuKnExpXux4fe7KIZYdyTwrUo4ha2QDbpr4G9K6scfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439089; c=relaxed/simple;
	bh=4g9kAem5pxXiW36ntgW2Y2R69oEKqwCsbvaxmhdkX+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9gWsGJMfGUH3MFhRmXYY23RUjsle0wVSlnwX8nMe93dGJy6yJ1aMM4rlUsgNlAh38mUgIOpGtlzRX5Y7mc1dpQppovDF/mw8v7R8XV8aS/CLafwbYFduT1zvSCoFaPrExBxPprh4qp9h2mXdb414KtoWDAakZuKQ4KNpdtGIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAkaLvcn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAkaLvcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736439088; x=1767975088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4g9kAem5pxXiW36ntgW2Y2R69oEKqwCsbvaxmhdkX+U=;
  b=eAkaLvcnI5CRajEtrahBBNdBYKPHZRzYLvPolmji2zIsvp1OfGkUcBB1
   LxRej2K6N7Sh1MyVdcXJwAWKQVghfgwXnE6DCA/CFHW2ZRODnw05JNlcm
   uqdI3P8lhGUKWf6eZm+VGxdM7I2kWz+GdHmXyyj5LN5vLQqNsrPnyts+G
   dDn19Fjbo7HrgI76dYuvUxBkf2sGRd//3Qpgc7lQt9FgmzZnOmhUSxqLF
   xgZeZUWciKqRqcomQ4BQXqwf3vw4LzS4c+KNEUnZ6h6Rd9HHWIvjLZT6G
   tHeVC0SnLDdclT5I3GSHz8EAt/UlA9yuD397RhWIWj7ctfr/t677muUKL
   Q==;
X-CSE-ConnectionGUID: GFSJ2v6GQ7G/ebiXCduzeg==
X-CSE-MsgGUID: b8xV9sGuTbaN5bK2e1sJvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40388654"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40388654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:11:27 -0800
X-CSE-ConnectionGUID: IqtHXgF3TXOVupFk6WRq5g==
X-CSE-MsgGUID: vh9VmKmnRG2GyFk3r7sjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103328857"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2025 08:11:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVv80-000Hnn-0C;
	Thu, 09 Jan 2025 16:11:24 +0000
Date: Fri, 10 Jan 2025 00:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/bio-integrity.c:41:6:
 warning: no previous prototype for '__bio_integrity_free'
Message-ID: <202501100043.2OiyDpsd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: f9c4e7b09f7d51f9256fe51b9c40657cd7302530 [1402/1402] block: release bip in a right way in error path
config: x86_64-buildonly-randconfig-006-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100043.2OiyDpsd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100043.2OiyDpsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100043.2OiyDpsd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio-integrity.c:41:6: warning: no previous prototype for '__bio_integrity_free' [-Wmissing-prototypes]
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/__bio_integrity_free +41 block/bio-integrity.c

    40	
  > 41	void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
    42	{
    43		if (bs && mempool_initialized(&bs->bio_integrity_pool)) {
    44			if (bip->bip_vec)
    45				bvec_free(&bs->bvec_integrity_pool, bip->bip_vec,
    46					  bip->bip_slab);
    47			mempool_free(bip, &bs->bio_integrity_pool);
    48		} else {
    49			kfree(bip);
    50		}
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
