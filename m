Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFD331A6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902936; cv=none; b=ib9hFTdOZa1yWJebbzeWit5JnTEhiy1LPcuNY/y3dU8Bcosrk9r26aW0jp4eGlrJpyhDLQ3rKVmZf7OR713Age7YxJlnJeG1qXGZmIyRmsvQlnz1WUW6Y1Y/4VcEWsnyfHLwP2eq88pVrLehPQv5SOW8q4VUUPlCdrIow2SOJH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902936; c=relaxed/simple;
	bh=pw69mlM69E7ePqUmg/tWTDUUyqbW+9jUHvzlBiBYVVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFQGWx7/7C8FyDMbkqStbJYK/lM3EY8YydYmbBifVKq7FBs65/42u2IO8MzUNRLJfik/9njiBV2qycOE0X8uydPv0Ie/Pf30zV00e1N6YNmSobzCO8OOGWmPHk/HoonkPFkAtr3MZzlIlbkzue5URFDDjX750DFZB77joOZT3D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fyp7Bq75; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fyp7Bq75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761902933; x=1793438933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pw69mlM69E7ePqUmg/tWTDUUyqbW+9jUHvzlBiBYVVA=;
  b=Fyp7Bq75QpMoVoC7h79pbdNjfEHN9znrxrNNG4Z/g2nBWQ1Yt2rkYQjv
   1j5wGEQq6x3mK4W+hya9Uz+DymwiI/EwGWKZ+PVKDmuTS3UCEfDNxxDe3
   +o8avtUH6dwlexzC+CCI9tVrCNmpL5IGGNgaQctBlxlKs1svCcmNC8FLo
   UFeDAZgq4pM0+JsBcDoK9uoTlz13KrPqLDBHcu7Ox5/FGEoM+d0n4Mhi4
   CQ46Gc7ME2LKbpaSAGvCm7dkB2LY4Yz6/WhAZ84JxYXPBgSNVsiAjlbzI
   wadMmaj6TJehkfUQMVBLEk0G9hFkNQLW+FVOvN2/jydiaDIje7VQAuoy6
   Q==;
X-CSE-ConnectionGUID: 6Ik6mROqRnOUzD/Ujrv8IA==
X-CSE-MsgGUID: fscK5sAlRGK5UD5QCRdkfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67899579"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67899579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:28:53 -0700
X-CSE-ConnectionGUID: u27EsdWNSjaC49T0vt4HOA==
X-CSE-MsgGUID: X3PADU+SRmSo+ELp6YGL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186310065"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 31 Oct 2025 02:28:51 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vElRA-000Mwm-3D;
	Fri, 31 Oct 2025 09:28:48 +0000
Date: Fri, 31 Oct 2025 17:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, sathya.prakash@broadcom.com,
	sumit.saxena@broadcom.com, chandrakanth.patil@broadcom.com,
	prayas.patel@broadcom.com, Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: Re: [PATCH v1 4/5] mpt3sas: Add firmware event requeue support for
 busy devices
Message-ID: <202510311720.NiDwRLwp-lkp@intel.com>
References: <20251029181058.39157-5-ranjan.kumar@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029181058.39157-5-ranjan.kumar@broadcom.com>

Hi Ranjan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ranjan-Kumar/mpt3sas-Added-no_turs-flag-to-device-unblock-logic/20251030-025730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20251029181058.39157-5-ranjan.kumar%40broadcom.com
patch subject: [PATCH v1 4/5] mpt3sas: Add firmware event requeue support for busy devices
config: i386-randconfig-054-20251030 (https://download.01.org/0day-ci/archive/20251031/202510311720.NiDwRLwp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311720.NiDwRLwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311720.NiDwRLwp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:276 struct member 'retries' not described in 'fw_event_work'
   Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:276 struct member 'delayed_work_active' not described in 'fw_event_work'
   Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:276 struct member 'delayed_work' not described in 'fw_event_work'
>> Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:3667 function parameter 'delay' not described in '_scsih_fw_event_requeue'
   Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:3920 function parameter 'no_turs' not described in '_scsih_ublock_io_all_device'
   Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:3956 function parameter 'sas_address' not described in '_scsih_ublock_io_device_wait'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
