Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA8137923
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737185320; cv=none; b=l7yYTaCPvsnPd1zaorJ+fXaSiWYvUqYQQQGoe2lHUt8A6vIcy1stmpf3NamDyzmLv43tn13yxBRgHzv6AqrsANWUn2uMeVSn+lA+lIo9EABgUiM70KW45BhCg/v9yvH2p6h7OxFSxqVk0+zJTz2GrZ5mIHy+Oitp2kGiycQV9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737185320; c=relaxed/simple;
	bh=nMedckrMHxf0Cfa1aPfX4d3zsAgYezfDireEdwHsrmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxcOvVDF8CuoshcEhZJ0vcBj9dxDDUQD1hN16VpPx11Deo+w1dTpXhrIRdV40KtRH8Q8hLm8SGtv+BE6TSQfkyt6oxjbNoivFx0RYfrj/XoUwtGAqHzxSzVvoT3XIszASJ415tuVr6V9mdm8uXe9862EreCR3KA1Jr0M2+4gWV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+FQ+Nuc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+FQ+Nuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737185319; x=1768721319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nMedckrMHxf0Cfa1aPfX4d3zsAgYezfDireEdwHsrmU=;
  b=n+FQ+NucAdKEaq965t1URXq2wm87pyFg1PvDG3R8tlc8BZ193by3VdIL
   bKSreHl+hAfJNQj1xTdRhs56IrP8Wioed9PXI2hWL1APxMbEQneyVCQX+
   6tfdr0JJz4f1xTVpi00zTXib6qMRNJlbd/WssKEk3cfORSBIvomdaBl2e
   agwLcF7TpKnqfhxxTH2qYWtAiIHVfWx+OGtl1dZZm567wz3jsPU4s8EF7
   UH8IKsXBPNiI7LTRkxYSID2q8Qou01clacLEspvPkoZv0uFaMQeh8fcMw
   GG6jiECNDuQsRGSIC44i2+GVkt792WbVK5cpBExocJivI8FdlkftzdBMY
   Q==;
X-CSE-ConnectionGUID: Q3e3ZMJ6QVeKgccRfRZ5gw==
X-CSE-MsgGUID: z+qFHYnxRTau/Bv9DdwE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="40431390"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="40431390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 23:28:38 -0800
X-CSE-ConnectionGUID: Tw5L24E0QU+ihRpHNSy/2w==
X-CSE-MsgGUID: CiubsW0ZQV+JysFsJ5odFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129284283"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2025 23:28:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ3Fy-000UBn-1Q;
	Sat, 18 Jan 2025 07:28:34 +0000
Date: Sat, 18 Jan 2025 15:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: ucsi: return CCI and message from
 sync_control callback
Message-ID: <202501181516.o8Ibdo7z-lkp@intel.com>
References: <20250117-ucsi-merge-commands-v1-1-e20c19934d59@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-ucsi-merge-commands-v1-1-e20c19934d59@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on e7bb221a638962d487231ac45a6699fb9bb8f9fa]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/usb-typec-ucsi-return-CCI-and-message-from-sync_control-callback/20250117-185213
base:   e7bb221a638962d487231ac45a6699fb9bb8f9fa
patch link:    https://lore.kernel.org/r/20250117-ucsi-merge-commands-v1-1-e20c19934d59%40linaro.org
patch subject: [PATCH 1/3] usb: typec: ucsi: return CCI and message from sync_control callback
config: i386-buildonly-randconfig-004-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181516.o8Ibdo7z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181516.o8Ibdo7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181516.o8Ibdo7z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/ucsi/cros_ec_ucsi.c: In function 'cros_ucsi_sync_control':
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:113:15: error: too few arguments to function 'ucsi_sync_control_common'
     113 |         ret = ucsi_sync_control_common(ucsi, cmd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/typec/ucsi/cros_ec_ucsi.c:20:
   drivers/usb/typec/ucsi/ucsi.h:532:5: note: declared here
     532 | int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/ucsi/cros_ec_ucsi.c: At top level:
>> drivers/usb/typec/ucsi/cros_ec_ucsi.c:141:25: error: initialization of 'int (*)(struct ucsi *, u64,  u32 *, void *, size_t)' {aka 'int (*)(struct ucsi *, long long unsigned int,  unsigned int *, void *, unsigned int)'} from incompatible pointer type 'int (*)(struct ucsi *, u64)' {aka 'int (*)(struct ucsi *, long long unsigned int)'} [-Werror=incompatible-pointer-types]
     141 |         .sync_control = cros_ucsi_sync_control,
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/ucsi/cros_ec_ucsi.c:141:25: note: (near initialization for 'cros_ucsi_ops.sync_control')
   cc1: some warnings being treated as errors


vim +/ucsi_sync_control_common +113 drivers/usb/typec/ucsi/cros_ec_ucsi.c

f1a2241778d962 Pavan Holla  2024-12-31  107  
f1a2241778d962 Pavan Holla  2024-12-31  108  static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
f1a2241778d962 Pavan Holla  2024-12-31  109  {
f1a2241778d962 Pavan Holla  2024-12-31  110  	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
f1a2241778d962 Pavan Holla  2024-12-31  111  	int ret;
f1a2241778d962 Pavan Holla  2024-12-31  112  
f1a2241778d962 Pavan Holla  2024-12-31 @113  	ret = ucsi_sync_control_common(ucsi, cmd);
f1a2241778d962 Pavan Holla  2024-12-31  114  	switch (ret) {
f1a2241778d962 Pavan Holla  2024-12-31  115  	case -EBUSY:
f1a2241778d962 Pavan Holla  2024-12-31  116  		/* EC may return -EBUSY if CCI.busy is set.
f1a2241778d962 Pavan Holla  2024-12-31  117  		 * Convert this to a timeout.
f1a2241778d962 Pavan Holla  2024-12-31  118  		 */
f1a2241778d962 Pavan Holla  2024-12-31  119  	case -ETIMEDOUT:
f1a2241778d962 Pavan Holla  2024-12-31  120  		/* Schedule recovery attempt when we timeout
f1a2241778d962 Pavan Holla  2024-12-31  121  		 * or tried to send a command while still busy.
f1a2241778d962 Pavan Holla  2024-12-31  122  		 */
f1a2241778d962 Pavan Holla  2024-12-31  123  		cancel_delayed_work_sync(&udata->write_tmo);
f1a2241778d962 Pavan Holla  2024-12-31  124  		schedule_delayed_work(&udata->write_tmo,
f1a2241778d962 Pavan Holla  2024-12-31  125  				      msecs_to_jiffies(WRITE_TMO_MS));
f1a2241778d962 Pavan Holla  2024-12-31  126  		break;
f1a2241778d962 Pavan Holla  2024-12-31  127  	case 0:
f1a2241778d962 Pavan Holla  2024-12-31  128  		/* Successful write. Cancel any pending recovery work. */
f1a2241778d962 Pavan Holla  2024-12-31  129  		cancel_delayed_work_sync(&udata->write_tmo);
f1a2241778d962 Pavan Holla  2024-12-31  130  		break;
f1a2241778d962 Pavan Holla  2024-12-31  131  	}
f1a2241778d962 Pavan Holla  2024-12-31  132  
f1a2241778d962 Pavan Holla  2024-12-31  133  	return ret;
f1a2241778d962 Pavan Holla  2024-12-31  134  }
f1a2241778d962 Pavan Holla  2024-12-31  135  
a181c8ef0b745c Stephen Boyd 2025-01-09  136  static const struct ucsi_operations cros_ucsi_ops = {
f1a2241778d962 Pavan Holla  2024-12-31  137  	.read_version = cros_ucsi_read_version,
f1a2241778d962 Pavan Holla  2024-12-31  138  	.read_cci = cros_ucsi_read_cci,
f1a2241778d962 Pavan Holla  2024-12-31  139  	.read_message_in = cros_ucsi_read_message_in,
f1a2241778d962 Pavan Holla  2024-12-31  140  	.async_control = cros_ucsi_async_control,
f1a2241778d962 Pavan Holla  2024-12-31 @141  	.sync_control = cros_ucsi_sync_control,
f1a2241778d962 Pavan Holla  2024-12-31  142  };
f1a2241778d962 Pavan Holla  2024-12-31  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
