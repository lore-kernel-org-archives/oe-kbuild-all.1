Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C9F13B2B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725086573; cv=none; b=H5KBBECvQMa4iwPx6DcTzTH1hpp8o2B7OLM8dYhgOzONA6yQz4LgF9PeNrv5lPU2eb1e3jHd9St7lWccQRToETaY+KcABasIC51dLNA6mBicKjwkCsveSbifZCYuVUCZ6Zv++LtYx6ekDZeAThF1D/tFbsSy5KaMjZ5mJirsJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725086573; c=relaxed/simple;
	bh=llduhge1l0ANB/1mABNX0h1q8Gx2qucioyS7uWT6JK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNVTNkQGBYgvRrQ2cRXghs89+5QuhQC7VARRD1n8N12eHcNgBVt7WP/kv5/SsSNzrVjqXBUv9c1tcXCSAq4F3R0jpNra0peoMOd92DC9jEGqlDu1om3yH9i9YSl14ombKD5WwBIBONaGJ3l3hwC7KY4MkJHa6jBpFll0CU6UTPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaQyz1aS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaQyz1aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725086572; x=1756622572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llduhge1l0ANB/1mABNX0h1q8Gx2qucioyS7uWT6JK8=;
  b=AaQyz1aSc3uPpuYIJucuytYcZodVQr81JnAs3l3v4qonrB2lfW474VZP
   gPlIo1OmzxDaS2P8rzQvtLtO/FhMXSg8taVaemkV2xuk/RvNzl6IgTF4j
   jM9I8FCVDQFamKigkdVo1/DEQWGmNvMov3IMR1fXtv44GUst0kBaG3zjv
   1YfhhQnvql0/sQwMTLA904MdiMeqjqz6Y0LJStEWhSjFctsxcEY8kY3fp
   IwdeJpAzDq9Zcew+1WttyL19TRSM85cZ6JMriiXOb3AYHcZ6oVoJSsN4M
   WaNoMiMtbWFBPP59OPNbWC1VgnFi5DAUJZpBfBtP4vifIjcs+Fls7smHq
   g==;
X-CSE-ConnectionGUID: tQby1CEESw6TBm3TMshjWg==
X-CSE-MsgGUID: rVjmINOeQFmCxlnZI0U+LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23250325"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23250325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 23:42:51 -0700
X-CSE-ConnectionGUID: eWO1MzdFRA6i4b1s4yGAew==
X-CSE-MsgGUID: ST6b6KtBT6ejfvrtRd1F1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="101583664"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2024 23:42:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skHot-0002P8-1A;
	Sat, 31 Aug 2024 06:42:47 +0000
Date: Sat, 31 Aug 2024 14:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240830-notest-yet 22/22]
 drivers/iommu/iommufd/pasid.c:66:48: warning: passing argument 2 of
 'iommufd_hwpt_replace_device' makes integer from pointer without a cast
Message-ID: <202408311451.s5HpbNeo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240830-notest-yet
head:   aa93c979a57a5a050175b1d62886d9eb31dc0a6c
commit: aa93c979a57a5a050175b1d62886d9eb31dc0a6c [22/22] iommufd: Support attach/replace hwpt per pasid
config: arc-randconfig-002-20240831 (https://download.01.org/0day-ci/archive/20240831/202408311451.s5HpbNeo-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311451.s5HpbNeo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311451.s5HpbNeo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/pasid.c:4:
   include/linux/iommufd.h:30:33: error: unknown type name 'ioasid_t'
      30 |                                 ioasid_t pasid, u32 *pt_id);
         |                                 ^~~~~~~~
   include/linux/iommufd.h:32:34: error: unknown type name 'ioasid_t'
      32 |                                  ioasid_t pasid, u32 *pt_id);
         |                                  ^~~~~~~~
   include/linux/iommufd.h:33:63: error: unknown type name 'ioasid_t'
      33 | void iommufd_device_pasid_detach(struct iommufd_device *idev, ioasid_t pasid);
         |                                                               ^~~~~~~~
   drivers/iommu/iommufd/pasid.c: In function 'iommufd_device_pasid_do_replace':
   drivers/iommu/iommufd/pasid.c:66:42: error: passing argument 1 of 'iommufd_hwpt_replace_device' from incompatible pointer type [-Werror=incompatible-pointer-types]
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |                                          ^~~~
         |                                          |
         |                                          struct iommufd_hw_pagetable *
   In file included from drivers/iommu/iommufd/pasid.c:8:
   drivers/iommu/iommufd/iommufd_private.h:592:70: note: expected 'struct iommufd_device *' but argument is of type 'struct iommufd_hw_pagetable *'
     592 | static inline int iommufd_hwpt_replace_device(struct iommufd_device *idev,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/iommu/iommufd/pasid.c:66:48: warning: passing argument 2 of 'iommufd_hwpt_replace_device' makes integer from pointer without a cast [-Wint-conversion]
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |                                                ^~~~
         |                                                |
         |                                                struct iommufd_device *
   drivers/iommu/iommufd/iommufd_private.h:593:56: note: expected 'ioasid_t' {aka 'unsigned int'} but argument is of type 'struct iommufd_device *'
     593 |                                               ioasid_t pasid,
         |                                               ~~~~~~~~~^~~~~
>> drivers/iommu/iommufd/pasid.c:66:54: warning: passing argument 3 of 'iommufd_hwpt_replace_device' makes pointer from integer without a cast [-Wint-conversion]
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |                                                      ^~~~~
         |                                                      |
         |                                                      ioasid_t {aka unsigned int}
   drivers/iommu/iommufd/iommufd_private.h:594:76: note: expected 'struct iommufd_hw_pagetable *' but argument is of type 'ioasid_t' {aka 'unsigned int'}
     594 |                                               struct iommufd_hw_pagetable *hwpt,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/iommu/iommufd/pasid.c:66:14: error: too many arguments to function 'iommufd_hwpt_replace_device'
      66 |         rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_private.h:592:19: note: declared here
     592 | static inline int iommufd_hwpt_replace_device(struct iommufd_device *idev,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pasid.c: At top level:
   drivers/iommu/iommufd/pasid.c:98:5: warning: no previous prototype for 'iommufd_device_pasid_attach' [-Wmissing-prototypes]
      98 | int iommufd_device_pasid_attach(struct iommufd_device *idev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pasid.c:126:5: warning: no previous prototype for 'iommufd_device_pasid_replace' [-Wmissing-prototypes]
     126 | int iommufd_device_pasid_replace(struct iommufd_device *idev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pasid.c:147:6: warning: no previous prototype for 'iommufd_device_pasid_detach' [-Wmissing-prototypes]
     147 | void iommufd_device_pasid_detach(struct iommufd_device *idev, ioasid_t pasid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iommufd_hwpt_replace_device +66 drivers/iommu/iommufd/pasid.c

    39	
    40	struct iommufd_hw_pagetable *
    41	iommufd_device_pasid_do_replace(struct iommufd_device *idev, ioasid_t pasid,
    42					struct iommufd_hw_pagetable *hwpt)
    43	{
    44		void *curr;
    45		int rc;
    46	
    47		refcount_inc(&hwpt->obj.users);
    48		curr = xa_store(&idev->pasid_hwpts, pasid, hwpt, GFP_KERNEL);
    49		rc = xa_err(curr);
    50		if (rc)
    51			goto out_put_hwpt;
    52	
    53		if (!curr) {
    54			xa_erase(&idev->pasid_hwpts, pasid);
    55			rc = -EINVAL;
    56			goto out_put_hwpt;
    57		}
    58	
    59		if (curr == hwpt)
    60			goto out_put_hwpt;
    61	
    62		/*
    63		 * After replacement, the reference on the old hwpt is retained
    64		 * in this thread as caller would free it.
    65		 */
  > 66		rc = iommufd_hwpt_replace_device(hwpt, idev, pasid, hwpt, curr);
    67		if (rc) {
    68			WARN_ON(xa_err(xa_store(&idev->pasid_hwpts, pasid,
    69						curr, GFP_KERNEL)));
    70			goto out_put_hwpt;
    71		}
    72	
    73		/* Caller must destroy old_hwpt */
    74		return curr;
    75	
    76	out_put_hwpt:
    77		refcount_dec(&hwpt->obj.users);
    78		return ERR_PTR(rc);
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
