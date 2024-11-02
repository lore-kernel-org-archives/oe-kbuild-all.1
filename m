Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015B11F5F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730535689; cv=none; b=H5U5xi2NPj1H6+UAsuvUeRAlIVSNZ9BtQS8ncAEtCbm1XvFfMoeTG9YG/7qTd8ZBMyLr6NLB5urNVSb/CGKJrmkQSz2+FB3/9Nn25AMuVESNwsCW3Gq+/umjCPtq2IzgKq5bX/kc3axGiR4wsqmfrALmZ5KnmCqA1JYhoQrig2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730535689; c=relaxed/simple;
	bh=6FLFCD+ZAFHTtXW5038cT1sSZauqeUQunkBEUUI1QNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIMbAum9CtYcVaFdNx5b9RDtyHwNbR55AKW9BmceTv2d85nfvTRWIAFW6LGTvZlfgelhzs0B+dcZ3DkHsOO4kqKYEQBw5okDVt8lGRiZ/zi3mClvhBv0GqyrARbfRoMeoyUd/h7RupPFhIIK8/SCnDUSVkJpeqeUZY0miVcSbdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUg0YKTk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUg0YKTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730535687; x=1762071687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6FLFCD+ZAFHTtXW5038cT1sSZauqeUQunkBEUUI1QNc=;
  b=RUg0YKTkMZJnxIZjH9htApXGNqscu+J0er4SOb3U6KB0a5Yqbmr8UkNB
   JpGydUtQVGSGR8Pz49NX83CeL8ROLl7wHftmy4LRCZO+T5Lj3St/WLP44
   oMK/3q6dW4T0xd5yOg9p60ix7VfPf29l+5RizSEfsSkRYbHDZlVtwHqEs
   fTLe0UU8FN06sCG5yN6kTQ6IVl75u3/ZMPooAJ7wP5VoklyJSh+4pbe4Z
   I9DPRrwi6Zr7Yju2vF2HSrFiVuz5oz2HY/EgSLIFP2f6WyxxKkiF6ILiz
   7lMkIovJPrjw6I50xUlboFF91hF9cBEGQEdPqS5kfsQRnsKHs+KaXLYiG
   Q==;
X-CSE-ConnectionGUID: Lkdp4CdWTJibd1IzwU7tHQ==
X-CSE-MsgGUID: oS+a89QHSnWaFu70S+7CBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30410202"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="30410202"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 01:21:25 -0700
X-CSE-ConnectionGUID: 8bqbk5KVTwS9koh1liI5Bw==
X-CSE-MsgGUID: DvpZkA2CSROyoVAKTeWANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83999714"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2024 01:21:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t79Np-000ibH-0l;
	Sat, 02 Nov 2024 08:21:21 +0000
Date: Sat, 2 Nov 2024 16:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:smmuv3_nesting 3/39]
 drivers/iommu/iommufd/driver.c:6:24: error: redefinition of
 '_iommufd_object_alloc'
Message-ID: <202411021643.mkNwAYyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   23c28de51f2158aaebfd545a42cc2f015c98b8c4
commit: c6a74dd1148335a1f34b7a133bb08c7af3583715 [3/39] iommufd: Move _iommufd_object_alloc helper to a sharable file
config: i386-buildonly-randconfig-001-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021643.mkNwAYyo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021643.mkNwAYyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021643.mkNwAYyo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommufd/driver.c:6:24: error: redefinition of '_iommufd_object_alloc'
       6 | struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommufd/iommufd_private.h:8,
                    from drivers/iommu/iommufd/driver.c:4:
   include/linux/iommufd.h:142:1: note: previous definition of '_iommufd_object_alloc' with type 'struct iommufd_object *(struct iommufd_ctx *, size_t,  enum iommufd_object_type)' {aka 'struct iommufd_object *(struct iommufd_ctx *, unsigned int,  enum iommufd_object_type)'}
     142 | _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/_iommufd_object_alloc +6 drivers/iommu/iommufd/driver.c

     5	
   > 6	struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
     7						     size_t size,
     8						     enum iommufd_object_type type)
     9	{
    10		struct iommufd_object *obj;
    11		int rc;
    12	
    13		obj = kzalloc(size, GFP_KERNEL_ACCOUNT);
    14		if (!obj)
    15			return ERR_PTR(-ENOMEM);
    16		obj->type = type;
    17		/* Starts out bias'd by 1 until it is removed from the xarray */
    18		refcount_set(&obj->shortterm_users, 1);
    19		refcount_set(&obj->users, 1);
    20	
    21		/*
    22		 * Reserve an ID in the xarray but do not publish the pointer yet since
    23		 * the caller hasn't initialized it yet. Once the pointer is published
    24		 * in the xarray and visible to other threads we can't reliably destroy
    25		 * it anymore, so the caller must complete all errorable operations
    26		 * before calling iommufd_object_finalize().
    27		 */
    28		rc = xa_alloc(&ictx->objects, &obj->id, XA_ZERO_ENTRY, xa_limit_31b,
    29			      GFP_KERNEL_ACCOUNT);
    30		if (rc)
    31			goto out_free;
    32		return obj;
    33	out_free:
    34		kfree(obj);
    35		return ERR_PTR(rc);
    36	}
    37	EXPORT_SYMBOL_NS_GPL(_iommufd_object_alloc, IOMMUFD);
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
