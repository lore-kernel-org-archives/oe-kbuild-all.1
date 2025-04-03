Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE146746E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743644835; cv=none; b=Y23kZ4BqBhxjm0LYa4g7HuXMSmxE3Wfn6JsWtF3u9pOljQnX51GMFsWBozjABKfarKkydbPUevu8b7HnNgg/dUmbduopkgc3i8B8uXwdsJ7uA94nfZhAyT/OoLSFCzHvgInHDr+Q0VQU71jTN/CYEHr7/0IaQq4v6HA16jopp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743644835; c=relaxed/simple;
	bh=zPyKvRdC+Wg96LQnISECXVBPMTCQ6Oa9/HHpbmxUofQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sb0VyAlOhLL+fCmGwKgW80aqo0/IF1nqnUzngjRTo8jLkNs4AoLxVPWtoy3bA3Qot6pVSHIK0BNRBIdFqmSmP9Z9Hs4W5MQzkEYc2jRY+8s0daFg5hvINZh2vl84EJzOL91HLYUsioYl1qlzB5CUVP+eZF+xHzlqklx3vOJoytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjccyVau; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjccyVau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743644833; x=1775180833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPyKvRdC+Wg96LQnISECXVBPMTCQ6Oa9/HHpbmxUofQ=;
  b=CjccyVauIAea6SAmBz/SrINv2tRPavObgxfpv/S1Lpw2DcEHVv/tL1vs
   Vnw/QbGvZ+f/MNdVvhxys1+4A8AIVcpWR8dZOwN/bZCXsKFgAJs28VA3Z
   po8eUIhS+8J6q+wWTvoz1UPJSpGFKJEpIL8dt8xggOztZMXx+uGJmIMxS
   lJkc9kz1r8XYvgWBZyeIWRFy/+0zXFJMneSmun2tyB8XUmvGb8k/Yf1T3
   K+NcK/QMMuMi+JyHkKpqUwjwOBMo+O2OKLtxrIkw2IMcvPL+NJEcECHH/
   QW8kNBFLksEh9WdbSRMqvoicWcBeJlo5Dy5AEF+77NCum6gmciJVKteTZ
   A==;
X-CSE-ConnectionGUID: ESuy9o+PQb2bcE9G0HqJzA==
X-CSE-MsgGUID: ufKMbVgmTjuK9deoV0FIww==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55231292"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="55231292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:47:12 -0700
X-CSE-ConnectionGUID: iyszcB7NRUWF1c34lR+fbg==
X-CSE-MsgGUID: mXvSn2c3Ti6sJlgILbdfbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="164099043"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2025 18:47:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u09fh-000B9i-0I;
	Thu, 03 Apr 2025 01:47:09 +0000
Date: Thu, 3 Apr 2025 09:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 5/18]
 drivers/nvme/host/core.c:4301:44: error: 'struct nvme_ctrl' has no member
 named 'ana_work'; did you mean 'ka_work'?
Message-ID: <202504030912.nTVRnBtz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git ns-migration
head:   1cd2ac8db713fdf42bc7bb10329d795f7aee4f1f
commit: 1da4a7cfb2913cf002749d15648b4026ebbe7eee [5/18] nvme: re-read ANA log page after ns scan completes
config: csky-randconfig-001-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030912.nTVRnBtz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030912.nTVRnBtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030912.nTVRnBtz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_scan_work':
>> drivers/nvme/host/core.c:4301:44: error: 'struct nvme_ctrl' has no member named 'ana_work'; did you mean 'ka_work'?
    4301 |                 queue_work(nvme_wq, &ctrl->ana_work);
         |                                            ^~~~~~~~
         |                                            ka_work


vim +4301 drivers/nvme/host/core.c

  4251	
  4252	static void nvme_scan_work(struct work_struct *work)
  4253	{
  4254		struct nvme_ctrl *ctrl =
  4255			container_of(work, struct nvme_ctrl, scan_work);
  4256		int ret;
  4257	
  4258		/* No tagset on a live ctrl means IO queues could not created */
  4259		if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE || !ctrl->tagset)
  4260			return;
  4261	
  4262		/*
  4263		 * Identify controller limits can change at controller reset due to
  4264		 * new firmware download, even though it is not common we cannot ignore
  4265		 * such scenario. Controller's non-mdts limits are reported in the unit
  4266		 * of logical blocks that is dependent on the format of attached
  4267		 * namespace. Hence re-read the limits at the time of ns allocation.
  4268		 */
  4269		ret = nvme_init_non_mdts_limits(ctrl);
  4270		if (ret < 0) {
  4271			dev_warn(ctrl->device,
  4272				"reading non-mdts-limits failed: %d\n", ret);
  4273			return;
  4274		}
  4275	
  4276		if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events)) {
  4277			dev_info(ctrl->device, "rescanning namespaces.\n");
  4278			nvme_clear_changed_ns_log(ctrl);
  4279		}
  4280	
  4281		mutex_lock(&ctrl->scan_lock);
  4282		if (!nvme_id_cns_ok(ctrl, NVME_ID_CNS_NS_ACTIVE_LIST)) {
  4283			nvme_scan_ns_sequential(ctrl);
  4284		} else {
  4285			/*
  4286			 * Fall back to sequential scan if DNR is set to handle broken
  4287			 * devices which should support Identify NS List (as per the VS
  4288			 * they report) but don't actually support it.
  4289			 */
  4290			ret = nvme_scan_ns_list(ctrl);
  4291			if (ret > 0 && ret & NVME_STATUS_DNR)
  4292				nvme_scan_ns_sequential(ctrl);
  4293		}
  4294		mutex_unlock(&ctrl->scan_lock);
  4295	
  4296		/* Requeue if we have missed AENs */
  4297		if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
  4298			nvme_queue_scan(ctrl);
  4299		else
  4300			/* Re-read the ANA log page to not miss updates */
> 4301			queue_work(nvme_wq, &ctrl->ana_work);
  4302	}
  4303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
