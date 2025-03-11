Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E8B79CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 00:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741652467; cv=none; b=B01mTZnDQJXinx2lDGerxtS/hpiJ702HE5mo0tKPwDOUbE7b7V83gUyR/WSm+WfBwjDC8NjpD1FtmC2Plz/SiY55fprpMt7bLZ+uz4eOgmzv7O5Rlf+JywvZNW7EPCqanC8tM+KISN5p2Ljyr2tFUb3Hp72XP0TnoO+IBEGpvzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741652467; c=relaxed/simple;
	bh=dpaZIyauDtJJCEdc/pR2TJjQSlr/h8Z3wB3Q9Bv2AvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RthHl5FbrEy8bhokO7vUwytOHCAQAK8L9uf4+EgtzUE6N9xYcspLrB0n9zzg32ZJ1bEK3hkQn/IxpD3kHqNa6FSS0BTrJnpCPBXbpMAEUgx4MlUDxs/1/F9E0hyhORRC6SJgNByL94Ycah/iG3BbrOztXAOILXMtvPPtZhgp0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+9uYY2b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+9uYY2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741652464; x=1773188464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpaZIyauDtJJCEdc/pR2TJjQSlr/h8Z3wB3Q9Bv2AvY=;
  b=U+9uYY2b/5E8L8mG83g9I5vUhwFqlzvLemK1ngn/dbVMCL+nNxEN71s7
   hfWgeB+3i0eUqVzeJs8H/v6oF95NQjsHtkLOzTeQfXir04Hm+4cFluB+n
   g73K5j1IH0L1yELaUugM2pcLuq7v6p/W29LcRVZOMgXyHLQG9x31Ha32p
   LNBFyDdiJZmeMbQD1K43Fb1gWKxUeBwBhlw5Jw9sw3fBZMoWnQccm9SsR
   79BLgd2oKwonUf2FcWMWW5dhPCBvFlCtvm8Smad5z8v96pUYmm6i//G/s
   QAneEwzhREIweZqnPGAKzAKkLx0uLGWCnYjP2lVWmB/AkX7iNZvi6Lsuc
   w==;
X-CSE-ConnectionGUID: Rzn8eiH0S8eQna40QS3tyA==
X-CSE-MsgGUID: boNyeyJgTV+JJbjNV5DgKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46584451"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46584451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 17:21:03 -0700
X-CSE-ConnectionGUID: 4O3PwJEtR5q6E2yrbniepw==
X-CSE-MsgGUID: FM5lXTzLTR6CT0P7RTVlTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120110284"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2025 17:21:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trnMh-0006D6-2M;
	Tue, 11 Mar 2025 00:20:59 +0000
Date: Tue, 11 Mar 2025 08:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 20/71]
 sound/soc/sof/sof-client-probes-ipc4.c:211:29-35: ERROR: application of
 sizeof to pointer
Message-ID: <202503110822.q6TnCZ5H-lkp@intel.com>
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
commit: 1a8251ae4b1b72d8e3a8867de2652555c7fb034b [20/71] ASoC: SOF: sof-client-probes-ipc4: Implement ipc4_probes_points_info
config: powerpc-randconfig-r061-20250311 (https://download.01.org/0day-ci/archive/20250311/202503110822.q6TnCZ5H-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110822.q6TnCZ5H-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/sof-client-probes-ipc4.c:211:29-35: ERROR: application of sizeof to pointer

vim +211 sound/soc/sof/sof-client-probes-ipc4.c

   170	
   171	/**
   172	 * ipc4_probes_points_info - retrieve list of active probe points
   173	 * @cdev:	SOF client device
   174	 * @desc:	Returned list of active probes
   175	 * @num_desc:	Returned count of active probes
   176	 * @return:	0 on success, negative error code on error
   177	 */
   178	static int ipc4_probes_points_info(struct sof_client_dev *cdev,
   179					   struct sof_probe_point_desc **desc,
   180					   size_t *num_desc)
   181	{
   182		struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
   183		struct device *dev = &cdev->auxdev.dev;
   184		struct sof_ipc4_probe_info *info;
   185		struct sof_ipc4_msg msg;
   186		int i, ret;
   187	
   188		if (!mentry)
   189			return -ENODEV;
   190	
   191		msg.primary = mentry->id;
   192		msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
   193		msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
   194	
   195		msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_PROBE_POINTS);
   196	
   197		msg.data_size = cdev->sdev->ipc->max_payload_size;
   198		msg.data_ptr = kzalloc(msg.data_size, GFP_KERNEL);
   199		if (!msg.data_ptr)
   200			return -ENOMEM;
   201	
   202		ret = sof_client_ipc_set_get_data(cdev, &msg, false);
   203		if (ret) {
   204			kfree(msg.data_ptr);
   205			return ret;
   206		}
   207		info = msg.data_ptr;
   208		*num_desc = info->num_elems;
   209		dev_dbg(dev, "%s: got %zu probe points", __func__, *num_desc);
   210	
 > 211		*desc = kzalloc(*num_desc * sizeof(*desc), GFP_KERNEL);
   212		if (!*desc) {
   213			kfree(msg.data_ptr);
   214			return -ENOMEM;
   215		}
   216	
   217		for (i = 0; i < *num_desc; i++) {
   218			(*desc)[i].buffer_id = info->points[i].point_id;
   219			(*desc)[i].purpose = info->points[i].purpose;
   220			(*desc)[i].stream_tag = info->points[i].stream_tag;
   221		}
   222		kfree(msg.data_ptr);
   223	
   224		return 0;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
