Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D05258
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741656791; cv=none; b=ArnYbpBXq3bIcdkexJrBQ3hKqHY+4xEMVmNLEwFEURmpcxjAisDOxW2ggjjJrmirGYLmb4jH9jJ5Rgh7K8zis+hEZUwo79oG9AR1TwyW2/lpyARA2teTWc9Ul/e0dEia3yblqubhFe1SdhXnMKpWFVTE6BJ4MjGNULdLzzX+dsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741656791; c=relaxed/simple;
	bh=EVNN3ljEpfJV/uJO8/Tm4VvkLB0Z6YO0rnrYJIsygHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnQvV3JhBUi0KXExdJCKL6fGdPbayQNTP90MCnHTtpIXE5SgBKBVhvLldQcFhsxUd2GLIyTlYA9Ho598S85Fdc1gthsnTQFpcWEm6KX1l691v1ZFhGgKxEW8rpeoERgzrVA2Crfcju06fIn9JJklZHYz86V4X/PtPPxpyciva3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1iy9YPp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1iy9YPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741656790; x=1773192790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVNN3ljEpfJV/uJO8/Tm4VvkLB0Z6YO0rnrYJIsygHU=;
  b=a1iy9YPpNJWbDSDHuGDk0qpG77HisDCxNZQfC38RgASUXY2+u9hYfwiG
   g50wT/aeyh19KVUGYq9HRpX+PJu5XZ2QThkjpHvUMtdpXQazevZHGGcUY
   LPhnUxopEDXH+mrCF3h0Wi5L5z8c3Zxu4Mx7dEsusGUropkCx+pK4bXd4
   X37AorBr5gmja1E0eLzRrnh7bBqKUOmrHKNggKu0d+1iey3SFWiF/IOzS
   b94HuBfpUdL+RJQNsCRPtqLBCguMA5NaDy5EG/rm2kBP2qtEwg0FcQAwk
   kMbo09Q2iYVagspMQQKDjDpUOiLZrOrM53bScGV+qCuTJgp2yoGpYbWIa
   w==;
X-CSE-ConnectionGUID: m22GxrMATXCoiOJ8DFG+6Q==
X-CSE-MsgGUID: F7xcQXmzQ+mZ3ye8PUPcuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42588924"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="42588924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 18:33:10 -0700
X-CSE-ConnectionGUID: UvbbAhM0T1WYN9L0qXXs/A==
X-CSE-MsgGUID: ET1a7ATKT1CyeZ3szHiffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="125372096"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2025 18:33:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1troUT-0006FK-1Q;
	Tue, 11 Mar 2025 01:33:05 +0000
Date: Tue, 11 Mar 2025 09:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 24/71]
 sound/soc/sof/sof-client-probes-ipc4.c:233:2-3: Unneeded semicolon
Message-ID: <202503110952.KPetXI1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   30b59334e68e51d0c94309ee1fdb85aaf7a1c6c9
commit: 9f3b3e77a5779cbe209210cfc2b28b9b80e0075f [24/71] ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only
config: powerpc-randconfig-r061-20250311 (https://download.01.org/0day-ci/archive/20250311/202503110952.KPetXI1h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110952.KPetXI1h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/sof-client-probes-ipc4.c:233:2-3: Unneeded semicolon

vim +233 sound/soc/sof/sof-client-probes-ipc4.c

   195	
   196	/**
   197	 * ipc4_probes_points_info - retrieve list of probe points
   198	 * @cdev:	SOF client device
   199	 * @desc:	Returned list of active probes
   200	 * @num_desc:	Returned count of active probes
   201	 * @type:	Either PROBES_INFO_ACTIVE_PROBES or PROBES_INFO_AVAILABE_PROBES
   202	 * @return:	0 on success, negative error code on error
   203	 *
   204	 * Returns list if active probe points if type is
   205	 * PROBES_INFO_ACTIVE_PROBES, or list of all available probe points if
   206	 * type is PROBES_INFO_AVAILABE_PROBES.
   207	 */
   208	static int ipc4_probes_points_info(struct sof_client_dev *cdev,
   209					   struct sof_probe_point_desc **desc,
   210					   size_t *num_desc,
   211					   enum sof_probe_info_type type)
   212	{
   213		struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
   214		struct device *dev = &cdev->auxdev.dev;
   215		struct sof_ipc4_probe_info *info;
   216		struct sof_ipc4_msg msg;
   217		u32 param_id;
   218		int i, ret;
   219	
   220		if (!mentry)
   221			return -ENODEV;
   222	
   223		switch (type) {
   224		case PROBES_INFO_ACTIVE_PROBES:
   225			param_id = SOF_IPC4_PROBE_POINTS;
   226			break;
   227		case PROBES_INFO_AVAILABE_PROBES:
   228			param_id = SOF_IPC4_PROBE_POINTS_AVAILABLE;
   229			break;
   230		default:
   231			dev_err(dev, "%s: info type %u not supported", __func__, type);
   232			return -EOPNOTSUPP;
 > 233		};
   234	
   235		msg.primary = mentry->id;
   236		msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
   237		msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
   238	
   239		msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(param_id);
   240	
   241		msg.data_size = cdev->sdev->ipc->max_payload_size;
   242		msg.data_ptr = kzalloc(msg.data_size, GFP_KERNEL);
   243		if (!msg.data_ptr)
   244			return -ENOMEM;
   245	
   246		ret = sof_client_ipc_set_get_data(cdev, &msg, false);
   247		if (ret) {
   248			kfree(msg.data_ptr);
   249			return ret;
   250		}
   251		info = msg.data_ptr;
   252		*num_desc = info->num_elems;
   253		dev_dbg(dev, "%s: got %zu probe points", __func__, *num_desc);
   254	
   255		*desc = kzalloc(*num_desc * sizeof(*desc), GFP_KERNEL);
   256		if (!*desc) {
   257			kfree(msg.data_ptr);
   258			return -ENOMEM;
   259		}
   260	
   261		for (i = 0; i < *num_desc; i++) {
   262			(*desc)[i].buffer_id = info->points[i].point_id;
   263			(*desc)[i].purpose = info->points[i].purpose;
   264			(*desc)[i].stream_tag = info->points[i].stream_tag;
   265		}
   266		kfree(msg.data_ptr);
   267	
   268		return 0;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
