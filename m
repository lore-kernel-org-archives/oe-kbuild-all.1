Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641145BEA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712673721; cv=none; b=Y4fGTbz2vTYcSSEwKcfWGWRj1lsGMjEDH6Zdy9tpmN1sU5jYZbnXg7KhX/eFqdqNkYUzMrSW3OJQcNx8bzWjyZtbzW54LVT4x3TgeLjVfA0K+2TvBDTR9dYd/7OInzybhWbCNgMRfhHb6EFd4PNsC3SVwDaqGNnA6if9x5t0who=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712673721; c=relaxed/simple;
	bh=FxlOZCgkDHN1etFk0gnZqDDdLaepaFXl4PuruuGQGmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGPrxIZNqjTsJyomQxYc65F72MWyrMxAiwWf3HjnOuaE5f9y59QLmT+JAZuXt0ya6QFUvEv+R5wqBKB2VS87QEfP8wTz4uGnQ3ECHkCKEOvqBFgRYx0OGnFR1yBHr1F52YZLr/1gzTt0BZLLi9US62VszQ1vFU/Z8Vn5ZRtYXBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8ObaEII; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8ObaEII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712673719; x=1744209719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxlOZCgkDHN1etFk0gnZqDDdLaepaFXl4PuruuGQGmk=;
  b=A8ObaEIIZiJScv5Z9u2R8tWQW0Z4M8OZIM2XIKBTxcpGSAeJhxnDnoOx
   WYGyNagxQJaKQm6pXs295GHCS5Jyxee6z1naf9j2vCtHFQkVtvZbgfx9E
   ARWSruJVuW/17K1Ga2rBp6wA4ItPwfEnnNIk+aGIQA8g+1g5eybHIo5Nw
   oCn/Or1xs2wRfv23UcAZhvkiS4NB/rk/0VhK2pK5Go+/gJ5eWALuXtEMx
   muXPtGky8u91+Aeb1494SxJLRwcJnlLadFkSBcxa9jp1ES+AXCoWS2/1e
   ZdBWX+wSN96yj2L4Ap9FhzLIPf6Hf/iK7HmOg3ofh1wQlJLK9bJZdOoxy
   w==;
X-CSE-ConnectionGUID: 5Q6lXXRxRPyJ+fqzF7etGA==
X-CSE-MsgGUID: WHLUsAd/TWqHQkVrrWAbiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8158948"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8158948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 07:36:35 -0700
X-CSE-ConnectionGUID: chRme1gUS6anVAwlKejaFw==
X-CSE-MsgGUID: Ur8l2585TaqB3rfgo3Mv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20807816"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Apr 2024 07:36:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruCaN-0006CS-2P;
	Tue, 09 Apr 2024 14:36:31 +0000
Date: Tue, 9 Apr 2024 22:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-limits 21/23]
 drivers/scsi/mpi3mr/mpi3mr_os.c:1046:13: warning: 'mpi3mr_rfresh_tgtdevs'
 defined but not used
Message-ID: <202404092226.t3tsAZ6e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-limits
head:   7766e44432bd05108493f24bc9765bc64568800d
commit: 1bfef6013cea9459ed7cc31d990822934cca6e63 [21/23] mpi3mr: switch to using ->device_configure
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240409/202404092226.t3tsAZ6e-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404092226.t3tsAZ6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404092226.t3tsAZ6e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_os.c: In function 'mpi3mr_fwevt_bh':
   drivers/scsi/mpi3mr/mpi3mr_os.c:2017:17: error: implicit declaration of function 'mpi3mr_refresh_tgtdevs'; did you mean 'mpi3mr_rfresh_tgtdevs'? [-Werror=implicit-function-declaration]
    2017 |                 mpi3mr_refresh_tgtdevs(mrioc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 mpi3mr_rfresh_tgtdevs
   drivers/scsi/mpi3mr/mpi3mr_os.c: At top level:
>> drivers/scsi/mpi3mr/mpi3mr_os.c:1046:13: warning: 'mpi3mr_rfresh_tgtdevs' defined but not used [-Wunused-function]
    1046 | static void mpi3mr_rfresh_tgtdevs(struct mpi3mr_ioc *mrioc)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c: In function 'mpi3mr_probe':
   drivers/scsi/mpi3mr/mpi3mr_os.c:5067:33: warning: '%d' directive writing between 1 and 3 bytes into a region of size between 1 and 64 [-Wformat-overflow=]
    5067 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                                 ^~
   drivers/scsi/mpi3mr/mpi3mr_os.c:5067:30: note: directive argument in the range [0, 255]
    5067 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                              ^~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:5067:9: note: 'sprintf' output between 2 and 67 bytes into a destination of size 64
    5067 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:5164:16: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
    5164 |             "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
         |                ^~
   drivers/scsi/mpi3mr/mpi3mr_os.c:5164:13: note: directive argument in the range [0, 255]
    5164 |             "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
         |             ^~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:5163:9: note: 'snprintf' output between 13 and 78 bytes into a destination of size 64
    5163 |         snprintf(mrioc->fwevt_worker_name, sizeof(mrioc->fwevt_worker_name),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5164 |             "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mpi3mr_rfresh_tgtdevs +1046 drivers/scsi/mpi3mr/mpi3mr_os.c

  1035	
  1036	/**
  1037	 * mpi3mr_refresh_tgtdevs - Refresh target device exposure
  1038	 * @mrioc: Adapter instance reference
  1039	 *
  1040	 * This is executed post controller reset to identify any
  1041	 * missing devices during reset and remove from the upper layers
  1042	 * or expose any newly detected device to the upper layers.
  1043	 *
  1044	 * Return: Nothing.
  1045	 */
> 1046	static void mpi3mr_rfresh_tgtdevs(struct mpi3mr_ioc *mrioc)
  1047	{
  1048		struct mpi3mr_tgt_dev *tgtdev, *tgtdev_next;
  1049		struct mpi3mr_stgt_priv_data *tgt_priv;
  1050	
  1051		dprint_reset(mrioc, "refresh target devices: check for removals\n");
  1052		list_for_each_entry_safe(tgtdev, tgtdev_next, &mrioc->tgtdev_list,
  1053		    list) {
  1054			if (((tgtdev->dev_handle == MPI3MR_INVALID_DEV_HANDLE) ||
  1055			     tgtdev->is_hidden) &&
  1056			     tgtdev->host_exposed && tgtdev->starget &&
  1057			     tgtdev->starget->hostdata) {
  1058				tgt_priv = tgtdev->starget->hostdata;
  1059				tgt_priv->dev_removed = 1;
  1060				atomic_set(&tgt_priv->block_io, 0);
  1061			}
  1062		}
  1063	
  1064		list_for_each_entry_safe(tgtdev, tgtdev_next, &mrioc->tgtdev_list,
  1065		    list) {
  1066			if (tgtdev->dev_handle == MPI3MR_INVALID_DEV_HANDLE) {
  1067				dprint_reset(mrioc, "removing target device with perst_id(%d)\n",
  1068				    tgtdev->perst_id);
  1069				if (tgtdev->host_exposed)
  1070					mpi3mr_remove_tgtdev_from_host(mrioc, tgtdev);
  1071				mpi3mr_tgtdev_del_from_list(mrioc, tgtdev, true);
  1072				mpi3mr_tgtdev_put(tgtdev);
  1073			} else if (tgtdev->is_hidden & tgtdev->host_exposed) {
  1074				dprint_reset(mrioc, "hiding target device with perst_id(%d)\n",
  1075					     tgtdev->perst_id);
  1076				mpi3mr_remove_tgtdev_from_host(mrioc, tgtdev);
  1077			}
  1078		}
  1079	
  1080		tgtdev = NULL;
  1081		list_for_each_entry(tgtdev, &mrioc->tgtdev_list, list) {
  1082			if ((tgtdev->dev_handle != MPI3MR_INVALID_DEV_HANDLE) &&
  1083			    !tgtdev->is_hidden) {
  1084				if (!tgtdev->host_exposed)
  1085					mpi3mr_report_tgtdev_to_host(mrioc,
  1086								     tgtdev->perst_id);
  1087				else if (tgtdev->starget)
  1088					starget_for_each_device(tgtdev->starget,
  1089								(void *)tgtdev, mpi3mr_update_sdev);
  1090		}
  1091		}
  1092	}
  1093	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
