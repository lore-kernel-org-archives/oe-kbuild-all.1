Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407BF2141BD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727896237; cv=none; b=LN5uWSnokbT6MU81Q4XvqgCBpC32OJSzNFOivY7s2fdLgxjhlYgTV7vs3vQ4lnJsGz9f6wPdWYRVTRZD82TgqBFQrOz+QCLUnzwgdIZSuU3jWcYIeVWXrF42B0gqTrhmO6Hx2pqLqT3VfCY5yP/TeDNiIj86W/fVObBE9o9aVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727896237; c=relaxed/simple;
	bh=CyiWLgA0MEL0WINkuSm6yKOLH95aTAw9xiVV/IZJBJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWU2DnnqhKbHGjcYRy4F3vgcegNP1W5NcSFVkWza62enjQ9hmPbOX0xlCFBVXJADVIX38bof0ibhyAtJFmpYyjujZfHmxUmvatAsfJR3rhXrq1bpxt7Jw4UzxZqj+nRQ85ietMIhRfO2qJ95PeXuNxCQ2dFtsuVlymZzD8jl4PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZuMFEJ3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZuMFEJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727896236; x=1759432236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CyiWLgA0MEL0WINkuSm6yKOLH95aTAw9xiVV/IZJBJ0=;
  b=fZuMFEJ3Ko08CcgbwIxBLj6ijE7ATNoYDPN2AcEf68gA4dxLciAyLs8L
   gGbEMX0ru90dpI7T1GNfS3SPMsiaEVJKcAkN6shcT3D5+jfjMBPfxnlaS
   ocCb3rVQ3W1M//dyeOqRoxRRdm/55z3RbEZyZMX7lckwpqaa34HBKP7uE
   R+ufQz1ljoxo1ibhJDfp+r+6/AItQbKg1QhcI/MK5ckOVTqIkksgwX1xx
   j8Vqu2xOETgHJjea0pJI1TPV+Yh7Eyk80/SBlIWPsd3uXSThvoy50OvWM
   PqvZnwKZV7v0rlo4Ls+gqWi1Cry0GGy9y+EMJ/1fY3l1ABz8cPVJr9wzm
   A==;
X-CSE-ConnectionGUID: n9D6Fzb/TwWOnsOmpDOeoQ==
X-CSE-MsgGUID: 6tVmGXrPTnC2q8KOHRa50w==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38211324"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="38211324"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 12:10:34 -0700
X-CSE-ConnectionGUID: /AhFOWPAScymD7+SCv/XUw==
X-CSE-MsgGUID: nk0/r93qSTqy13bWn04kyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="73778082"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2024 12:10:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw4k2-000USp-0T;
	Wed, 02 Oct 2024 19:10:30 +0000
Date: Thu, 3 Oct 2024 03:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 48/1001]
 drivers/of/configfs.c:134:9: warning: no previous prototype for
 'cfs_overlay_item_dtbo_read'
Message-ID: <202410030306.OPsH2Kee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 7e42c87c489b702795794e480fb5483897ff9e91 [48/1001] OF: DT-Overlay configfs interface (v8)
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410030306.OPsH2Kee-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030306.OPsH2Kee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030306.OPsH2Kee-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/configfs.c:134:9: warning: no previous prototype for 'cfs_overlay_item_dtbo_read' [-Wmissing-prototypes]
     134 | ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/of/configfs.c:156:9: warning: no previous prototype for 'cfs_overlay_item_dtbo_write' [-Wmissing-prototypes]
     156 | ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cfs_overlay_item_dtbo_read +134 drivers/of/configfs.c

   133	
 > 134	ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
   135					   void *buf, size_t max_count)
   136	{
   137		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   138	
   139		pr_debug("%s: buf=%p max_count=%zu\n", __func__, buf, max_count);
   140	
   141		if (!overlay->dtbo)
   142			return 0;
   143	
   144		/* copy if buffer provided */
   145		if (buf) {
   146			/* the buffer must be large enough */
   147			if (overlay->dtbo_size > max_count)
   148				return -ENOSPC;
   149	
   150			memcpy(buf, overlay->dtbo, overlay->dtbo_size);
   151		}
   152	
   153		return overlay->dtbo_size;
   154	}
   155	
 > 156	ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
   157					    const void *buf, size_t count)
   158	{
   159		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   160		int err;
   161	
   162		/* if it's set do not allow changes */
   163		if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
   164			return -EPERM;
   165	
   166		/* copy the contents */
   167		overlay->dtbo = kmemdup(buf, count, GFP_KERNEL);
   168		if (!overlay->dtbo)
   169			return -ENOMEM;
   170	
   171		overlay->dtbo_size = count;
   172	
   173		err = create_overlay(overlay, overlay->dtbo);
   174		if (err < 0)
   175			goto out_err;
   176	
   177		return count;
   178	
   179	out_err:
   180		kfree(overlay->dtbo);
   181		overlay->dtbo = NULL;
   182		overlay->dtbo_size = 0;
   183	
   184		return err;
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
