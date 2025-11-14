Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9C2F60AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102889; cv=none; b=DWu/hAsEkdYl9yJGw8yGQNqWX4QMtza3B4dnWatj/YTCMq+KKPcTdGNqqRmoiU4ASBZ6FhKXhSXUCbxOYRM0fzjh5RGBI1fV1JAX3+pX1kLeC/8x8qQTxPYkezuCBpp4swTvYJO/Fvjoss9hP23zxGIHucIIRi1RMgMMCgTp+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102889; c=relaxed/simple;
	bh=cHeQKVAn/MryhiGUFNre2cMJkW545CsTby8uJN5Fljk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knmLtto0YLHSK4wQrYxMQAA3f6uSmNo7jo82G2L+FhqUfwh1rf/zWcptCYPE1HGtjKBxeiBXs3aT73ZKx/Je3dh4I1FPZOfbQC03IRLXLQnWYRw3MLQyojVd6/HMbwhePaNLgs3Pn5dELI552zDuun5K+btXt1vDbfg9hypvUEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLxAzU0A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLxAzU0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102887; x=1794638887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cHeQKVAn/MryhiGUFNre2cMJkW545CsTby8uJN5Fljk=;
  b=bLxAzU0ALth1yergh6IQGrxbfEJvYjFD9RKnC3F+ahcDvMSVw5dUYXKf
   qINmiVdWByh2I4clZVUqDaRGOChKCjWo7sAWEov0GMix07tBwnYx5Wb6n
   5UvV/c5TyiRR2J/DtTJ4LtQfSu3voMitLNtgh5Dx4l+3zSPPJVO+JchHT
   h0d4j4USn8dMZZ/XTaTetcnFjmDdwB5O+L3MzubIlEn04h087YSD93F+9
   eNhFRQv4jTll6gaMRjdQdNcxCkpSJVjBvwVKUdc8hRUmtVjRFcwiyrJMv
   Ael8BoFvDl7n/TGF6XlqqRd59s4SNqSu+D/dA3L4bTRoOmw+eFmGR9bca
   w==;
X-CSE-ConnectionGUID: 4FwLh+OKQYOFittfj0+WrA==
X-CSE-MsgGUID: FO8014fpQRu5QwA206NPuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65132785"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65132785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:03 -0800
X-CSE-ConnectionGUID: hoYGcGH2R52PLjr7HYWf8Q==
X-CSE-MsgGUID: XGlC3RI7QamZMk0mo008Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189554979"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 22:47:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006Fr-1N;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 5/6] vduse: add vq group asid support
Message-ID: <202511141421.cUqVScv2-lkp@intel.com>
References: <20251113115558.1277981-6-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113115558.1277981-6-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-add-v1-API-definition/20251113-200303
base:   linus/master
patch link:    https://lore.kernel.org/r/20251113115558.1277981-6-eperezma%40redhat.com
patch subject: [PATCH v9 5/6] vduse: add vq group asid support
config: i386-randconfig-062-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141421.cUqVScv2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141421.cUqVScv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141421.cUqVScv2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa_user/vduse_dev.c:462:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:462:9: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:462:9: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:919:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:919:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:919:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:938:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:938:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:938:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:959:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:959:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:959:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:980:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:980:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:980:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:1001:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:1001:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:1001:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:1025:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:1025:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:1025:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:1044:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:1044:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:1044:14: sparse:    struct vduse_as *
   drivers/vdpa/vdpa_user/vduse_dev.c:1071:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/vdpa/vdpa_user/vduse_dev.c:1071:14: sparse:    struct vduse_as [noderef] __rcu *
   drivers/vdpa/vdpa_user/vduse_dev.c:1071:14: sparse:    struct vduse_as *
>> drivers/vdpa/vdpa_user/vduse_dev.c:1074:23: sparse: sparse: dereference of noderef expression

vim +462 drivers/vdpa/vdpa_user/vduse_dev.c

   452	
   453	/* Force set the asid to a vq group without a message to the VDUSE device */
   454	static void vduse_set_group_asid_nomsg(struct vduse_dev *dev,
   455					       unsigned int group, unsigned int asid)
   456	{
   457		/*
   458		 * Two concurrent updates to this pointer are valid as they cannot
   459		 * point to an invalid region.  It is ok for them to race as long as
   460		 * the readers see a consistent state through RCU.
   461		 */
 > 462		rcu_assign_pointer(dev->groups[group].as, &dev->as[asid]);
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
