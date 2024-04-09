Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227DA657A3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712682780; cv=none; b=KkPQpx+ECX1UWwjMIJwav1MIuT9LNuoEOD8gbXGbbspr1LMFXtaiMY4igwbwyqRutCNB8DEm41Bn82AeE2nJ4YT2Rl+c5WyqRfwx2YHTHxuiQvy4KEIbNWPtIcL9TaZOly5IbrIY4fXf8/NlhWi9e556lxbxPOUFaD+JKeM2eK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712682780; c=relaxed/simple;
	bh=ODypmzS+R6ozWWv2CNpd7EBiNI2ApM1+WN9JLd+Y7XA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+ehdV8LzLR7+aiBkcAcMF7a3WapZG7OpsDocLjkiqz3Jg2aS8zIplbsZIjA8oe4+kdxb3Dy0FWprQjMw7RbfaJ6lFHCqDPrYwA3P3tuEZ7S3kTR6f8IYpKvQ1vrIWh+gyYzj/G6eo62hD0BusQhWRMcfp0X/UM9h4ZZSqadZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyJyjuod; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyJyjuod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712682778; x=1744218778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODypmzS+R6ozWWv2CNpd7EBiNI2ApM1+WN9JLd+Y7XA=;
  b=hyJyjuodKV/P7H04+r9q/VlrLfzzcTfp3iW2bvzRRzFIxfJ/f8FCgK98
   pmMxIrZsAcRvLGXMxvMotS/gbjaTG6RMAiEZ6qOWjBSGtSmoo9NOQ+OTS
   fpR7nWN+3YZ57+cMlh9xrFWAFXipx3uOsqfATfjJP1rJItZov1agqWVSm
   askeElv6MnQdZRddcpTa8BtdJQbmVy8R8so88j2K+RaGtfxsGlw8TfWZR
   u0vPT1WqwjtuHRg1NwJqu9I8uM39lNxjsJmA1cHWwxoohm3WHJ5wp/U8F
   Wju5FLPYdeq6szLcHIGTVVTUtYsBWw0ji7fkep8dZsb0vPkbIDbdSfy0k
   g==;
X-CSE-ConnectionGUID: qjxzrSoeTO+lk8ioHLiraw==
X-CSE-MsgGUID: ufxiXhopQjuweSHISkzQbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19392775"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19392775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 10:12:51 -0700
X-CSE-ConnectionGUID: BGmNr+bhTh+fJzcnSubFDw==
X-CSE-MsgGUID: lVE/EXlHTauQ5rUM+efnDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25027478"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Apr 2024 10:12:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruF1b-0006Ks-0t;
	Tue, 09 Apr 2024 17:12:47 +0000
Date: Wed, 10 Apr 2024 01:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-limits 21/23]
 drivers/scsi/mpi3mr/mpi3mr_os.c:2017:17: error: implicit declaration of
 function 'mpi3mr_refresh_tgtdevs'; did you mean 'mpi3mr_rfresh_tgtdevs'?
Message-ID: <202404100148.28cCRHE0-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100148.28cCRHE0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100148.28cCRHE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100148.28cCRHE0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_os.c: In function 'mpi3mr_fwevt_bh':
>> drivers/scsi/mpi3mr/mpi3mr_os.c:2017:17: error: implicit declaration of function 'mpi3mr_refresh_tgtdevs'; did you mean 'mpi3mr_rfresh_tgtdevs'? [-Werror=implicit-function-declaration]
    2017 |                 mpi3mr_refresh_tgtdevs(mrioc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 mpi3mr_rfresh_tgtdevs
   drivers/scsi/mpi3mr/mpi3mr_os.c: At top level:
   drivers/scsi/mpi3mr/mpi3mr_os.c:1046:13: warning: 'mpi3mr_rfresh_tgtdevs' defined but not used [-Wunused-function]
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


vim +2017 drivers/scsi/mpi3mr/mpi3mr_os.c

cf1ce8b715240e Sreekanth Reddy 2022-07-09  1901  
13ef29ea4aa065 Kashyap Desai   2021-05-20  1902  /**
13ef29ea4aa065 Kashyap Desai   2021-05-20  1903   * mpi3mr_fwevt_bh - Firmware event bottomhalf handler
13ef29ea4aa065 Kashyap Desai   2021-05-20  1904   * @mrioc: Adapter instance reference
13ef29ea4aa065 Kashyap Desai   2021-05-20  1905   * @fwevt: Firmware event reference
13ef29ea4aa065 Kashyap Desai   2021-05-20  1906   *
13ef29ea4aa065 Kashyap Desai   2021-05-20  1907   * Identifies the firmware event and calls corresponding bottomg
13ef29ea4aa065 Kashyap Desai   2021-05-20  1908   * half handler and sends event acknowledgment if required.
13ef29ea4aa065 Kashyap Desai   2021-05-20  1909   *
13ef29ea4aa065 Kashyap Desai   2021-05-20  1910   * Return: Nothing.
13ef29ea4aa065 Kashyap Desai   2021-05-20  1911   */
13ef29ea4aa065 Kashyap Desai   2021-05-20  1912  static void mpi3mr_fwevt_bh(struct mpi3mr_ioc *mrioc,
13ef29ea4aa065 Kashyap Desai   2021-05-20  1913  	struct mpi3mr_fwevt *fwevt)
13ef29ea4aa065 Kashyap Desai   2021-05-20  1914  {
c4723e68a0d816 Sreekanth Reddy 2022-08-04  1915  	struct mpi3_device_page0 *dev_pg0 = NULL;
e22bae30667a7e Sreekanth Reddy 2022-08-04  1916  	u16 perst_id, handle, dev_info;
e22bae30667a7e Sreekanth Reddy 2022-08-04  1917  	struct mpi3_device0_sas_sata_format *sasinf = NULL;
c4723e68a0d816 Sreekanth Reddy 2022-08-04  1918  
13ef29ea4aa065 Kashyap Desai   2021-05-20  1919  	mpi3mr_fwevt_del_from_list(mrioc, fwevt);
580e6742205efe Sreekanth Reddy 2022-02-10  1920  	mrioc->current_event = fwevt;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1921  
13ef29ea4aa065 Kashyap Desai   2021-05-20  1922  	if (mrioc->stop_drv_processing)
13ef29ea4aa065 Kashyap Desai   2021-05-20  1923  		goto out;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1924  
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1925  	if (mrioc->unrecoverable) {
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1926  		dprint_event_bh(mrioc,
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1927  		    "ignoring event(0x%02x) in bottom half handler due to unrecoverable controller\n",
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1928  		    fwevt->event_id);
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1929  		goto out;
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1930  	}
f2a79d2030ad90 Sreekanth Reddy 2022-09-12  1931  
13ef29ea4aa065 Kashyap Desai   2021-05-20  1932  	if (!fwevt->process_evt)
13ef29ea4aa065 Kashyap Desai   2021-05-20  1933  		goto evt_ack;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1934  
13ef29ea4aa065 Kashyap Desai   2021-05-20  1935  	switch (fwevt->event_id) {
13ef29ea4aa065 Kashyap Desai   2021-05-20  1936  	case MPI3_EVENT_DEVICE_ADDED:
13ef29ea4aa065 Kashyap Desai   2021-05-20  1937  	{
e22bae30667a7e Sreekanth Reddy 2022-08-04  1938  		dev_pg0 = (struct mpi3_device_page0 *)fwevt->event_data;
e22bae30667a7e Sreekanth Reddy 2022-08-04  1939  		perst_id = le16_to_cpu(dev_pg0->persistent_id);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1940  		handle = le16_to_cpu(dev_pg0->dev_handle);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1941  		if (perst_id != MPI3_DEVICE0_PERSISTENTID_INVALID)
e22bae30667a7e Sreekanth Reddy 2022-08-04  1942  			mpi3mr_report_tgtdev_to_host(mrioc, perst_id);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1943  		else if (mrioc->sas_transport_enabled &&
e22bae30667a7e Sreekanth Reddy 2022-08-04  1944  		    (dev_pg0->device_form == MPI3_DEVICE_DEVFORM_SAS_SATA)) {
e22bae30667a7e Sreekanth Reddy 2022-08-04  1945  			sasinf = &dev_pg0->device_specific.sas_sata_format;
e22bae30667a7e Sreekanth Reddy 2022-08-04  1946  			dev_info = le16_to_cpu(sasinf->device_info);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1947  			if (!mrioc->sas_hba.num_phys)
e22bae30667a7e Sreekanth Reddy 2022-08-04  1948  				mpi3mr_sas_host_add(mrioc);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1949  			else
e22bae30667a7e Sreekanth Reddy 2022-08-04  1950  				mpi3mr_sas_host_refresh(mrioc);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1951  
e22bae30667a7e Sreekanth Reddy 2022-08-04  1952  			if (mpi3mr_is_expander_device(dev_info))
e22bae30667a7e Sreekanth Reddy 2022-08-04  1953  				mpi3mr_expander_add(mrioc, handle);
e22bae30667a7e Sreekanth Reddy 2022-08-04  1954  		}
13ef29ea4aa065 Kashyap Desai   2021-05-20  1955  		break;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1956  	}
13ef29ea4aa065 Kashyap Desai   2021-05-20  1957  	case MPI3_EVENT_DEVICE_INFO_CHANGED:
13ef29ea4aa065 Kashyap Desai   2021-05-20  1958  	{
c4723e68a0d816 Sreekanth Reddy 2022-08-04  1959  		dev_pg0 = (struct mpi3_device_page0 *)fwevt->event_data;
c4723e68a0d816 Sreekanth Reddy 2022-08-04  1960  		perst_id = le16_to_cpu(dev_pg0->persistent_id);
c4723e68a0d816 Sreekanth Reddy 2022-08-04  1961  		if (perst_id != MPI3_DEVICE0_PERSISTENTID_INVALID)
c4723e68a0d816 Sreekanth Reddy 2022-08-04  1962  			mpi3mr_devinfochg_evt_bh(mrioc, dev_pg0);
13ef29ea4aa065 Kashyap Desai   2021-05-20  1963  		break;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1964  	}
13ef29ea4aa065 Kashyap Desai   2021-05-20  1965  	case MPI3_EVENT_DEVICE_STATUS_CHANGE:
13ef29ea4aa065 Kashyap Desai   2021-05-20  1966  	{
13ef29ea4aa065 Kashyap Desai   2021-05-20  1967  		mpi3mr_devstatuschg_evt_bh(mrioc, fwevt);
13ef29ea4aa065 Kashyap Desai   2021-05-20  1968  		break;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1969  	}
7188c03ff8849c Sreekanth Reddy 2022-08-04  1970  	case MPI3_EVENT_ENCL_DEVICE_ADDED:
7188c03ff8849c Sreekanth Reddy 2022-08-04  1971  	case MPI3_EVENT_ENCL_DEVICE_STATUS_CHANGE:
7188c03ff8849c Sreekanth Reddy 2022-08-04  1972  	{
7188c03ff8849c Sreekanth Reddy 2022-08-04  1973  		mpi3mr_encldev_add_chg_evt_bh(mrioc, fwevt);
7188c03ff8849c Sreekanth Reddy 2022-08-04  1974  		break;
7188c03ff8849c Sreekanth Reddy 2022-08-04  1975  	}
7188c03ff8849c Sreekanth Reddy 2022-08-04  1976  
13ef29ea4aa065 Kashyap Desai   2021-05-20  1977  	case MPI3_EVENT_SAS_TOPOLOGY_CHANGE_LIST:
13ef29ea4aa065 Kashyap Desai   2021-05-20  1978  	{
13ef29ea4aa065 Kashyap Desai   2021-05-20  1979  		mpi3mr_sastopochg_evt_bh(mrioc, fwevt);
13ef29ea4aa065 Kashyap Desai   2021-05-20  1980  		break;
13ef29ea4aa065 Kashyap Desai   2021-05-20  1981  	}
8e653455547a47 Kashyap Desai   2021-05-20  1982  	case MPI3_EVENT_PCIE_TOPOLOGY_CHANGE_LIST:
8e653455547a47 Kashyap Desai   2021-05-20  1983  	{
8e653455547a47 Kashyap Desai   2021-05-20  1984  		mpi3mr_pcietopochg_evt_bh(mrioc, fwevt);
8e653455547a47 Kashyap Desai   2021-05-20  1985  		break;
8e653455547a47 Kashyap Desai   2021-05-20  1986  	}
43ca110050988c Sumit Saxena    2022-04-29  1987  	case MPI3_EVENT_LOG_DATA:
43ca110050988c Sumit Saxena    2022-04-29  1988  	{
43ca110050988c Sumit Saxena    2022-04-29  1989  		mpi3mr_logdata_evt_bh(mrioc, fwevt);
43ca110050988c Sumit Saxena    2022-04-29  1990  		break;
43ca110050988c Sumit Saxena    2022-04-29  1991  	}
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1992  	case MPI3MR_DRIVER_EVENT_TG_QD_REDUCTION:
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1993  	{
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1994  		struct mpi3mr_throttle_group_info *tg;
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1995  
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1996  		tg = *(struct mpi3mr_throttle_group_info **)fwevt->event_data;
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1997  		dprint_event_bh(mrioc,
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1998  		    "qd reduction event processed for tg_id(%d) reduction_needed(%d)\n",
cf1ce8b715240e Sreekanth Reddy 2022-07-09  1999  		    tg->id, tg->need_qd_reduction);
cf1ce8b715240e Sreekanth Reddy 2022-07-09  2000  		if (tg->need_qd_reduction) {
cf1ce8b715240e Sreekanth Reddy 2022-07-09  2001  			mpi3mr_set_qd_for_all_vd_in_tg(mrioc, tg);
cf1ce8b715240e Sreekanth Reddy 2022-07-09  2002  			tg->need_qd_reduction = 0;
cf1ce8b715240e Sreekanth Reddy 2022-07-09  2003  		}
cf1ce8b715240e Sreekanth Reddy 2022-07-09  2004  		break;
cf1ce8b715240e Sreekanth Reddy 2022-07-09  2005  	}
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2006  	case MPI3_EVENT_WAIT_FOR_DEVICES_TO_REFRESH:
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2007  	{
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2008  		while (mrioc->device_refresh_on)
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2009  			msleep(500);
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2010  
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2011  		dprint_event_bh(mrioc,
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2012  		    "scan for non responding and newly added devices after soft reset started\n");
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2013  		if (mrioc->sas_transport_enabled) {
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2014  			mpi3mr_refresh_sas_ports(mrioc);
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2015  			mpi3mr_refresh_expanders(mrioc);
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2016  		}
dd896a6b0a0d39 Ranjan Kumar    2024-03-13 @2017  		mpi3mr_refresh_tgtdevs(mrioc);
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2018  		ioc_info(mrioc,
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2019  		    "scan for non responding and newly added devices after soft reset completed\n");
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2020  		break;
2745ce0e6d30e6 Sreekanth Reddy 2022-08-04  2021  	}
13ef29ea4aa065 Kashyap Desai   2021-05-20  2022  	default:
13ef29ea4aa065 Kashyap Desai   2021-05-20  2023  		break;
13ef29ea4aa065 Kashyap Desai   2021-05-20  2024  	}
13ef29ea4aa065 Kashyap Desai   2021-05-20  2025  
13ef29ea4aa065 Kashyap Desai   2021-05-20  2026  evt_ack:
13ef29ea4aa065 Kashyap Desai   2021-05-20  2027  	if (fwevt->send_ack)
c1af985d27da2d Sreekanth Reddy 2021-12-20  2028  		mpi3mr_process_event_ack(mrioc, fwevt->event_id,
13ef29ea4aa065 Kashyap Desai   2021-05-20  2029  		    fwevt->evt_ctx);
13ef29ea4aa065 Kashyap Desai   2021-05-20  2030  out:
13ef29ea4aa065 Kashyap Desai   2021-05-20  2031  	/* Put fwevt reference count to neutralize kref_init increment */
13ef29ea4aa065 Kashyap Desai   2021-05-20  2032  	mpi3mr_fwevt_put(fwevt);
13ef29ea4aa065 Kashyap Desai   2021-05-20  2033  	mrioc->current_event = NULL;
13ef29ea4aa065 Kashyap Desai   2021-05-20  2034  }
13ef29ea4aa065 Kashyap Desai   2021-05-20  2035  

:::::: The code at line 2017 was first introduced by commit
:::::: dd896a6b0a0d3939c1ba070f46bec42cbb7573eb scsi: mpi3mr: Block devices are not removed even when VDs are offlined

:::::: TO: Ranjan Kumar <ranjan.kumar@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
