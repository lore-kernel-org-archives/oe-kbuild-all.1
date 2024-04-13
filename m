Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19EA381B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713009875; cv=none; b=jtKvpIlc+faSgxZdEmCSowh5U4QML8NOAGnzoo+UGZt1nEFYdIghxyo82b1uzL4Et9ZqgZB8QWEfVtST7BLcdtMu3u8dyVxczbvEpHsYrfvB7KuRStRiElTDYmXTTC65wPxJZ/Q8B1lmpDnyBqqUMznRpsFzFXMRopnGHNJ9AHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713009875; c=relaxed/simple;
	bh=WBPuRB1SHk4o0G8jyF5rnmmcDWdQJCDmSEGTliDLWlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcvM5OF5lF0uTONzowX6TWt+U75lB1UN59uuFXuJwp9bbhRSalwbdcDpOK3KRSpb6q4VVFhXURjrMcTRQQMksl4TSigImQdwKgYKA1fgQ/5MpjcmmqznXlPNzYEn3iwtPaqmlM7I6mhwWI1ZGOxvMDFM5KDmuNpXcT7fhXi8Bq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBj5R5JO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBj5R5JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713009874; x=1744545874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WBPuRB1SHk4o0G8jyF5rnmmcDWdQJCDmSEGTliDLWlc=;
  b=EBj5R5JOHYwoubTW+jiiMVuYpSrld+uvrvGvKxJ+nY0qJ/4iS3d3Wt5R
   zzhzt2Ztv2MA9TVGOi/2Wqfb2Fmc+nB2QO+j/JO7SbRWfz4F3s7GA9npN
   /fyndqH/nYNzPPa38h+KlCsEeMOcgvENx0axdigEXoIlgRmaQ5kF7ciko
   VDRBapF9YuCeyzkjRp1vXzrb5tu2J53A8d+WjBrxxL+ljqKYbIMksM/96
   oK/+wOZzLVsCmiYId9DIcL8eQQyXYFCE+wT67+7Qup8vbDPfbVp/e6YTc
   /gzIjSXIXvKYa5PrSYIT3EcOqOovEKgs29W9JfY4drc1LZn9Gyw0T+9x3
   A==;
X-CSE-ConnectionGUID: cVc8BeCJTyinfVo0Ej6lNw==
X-CSE-MsgGUID: UjTitcPRSXS4K1bQdlaomA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19060956"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="19060956"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 05:04:33 -0700
X-CSE-ConnectionGUID: 3Ybe3A+8SfiL1M7pcbk0FA==
X-CSE-MsgGUID: fH7JdK6ESJe36ewoCeaZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="25906929"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Apr 2024 05:04:32 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvc7R-0002Tk-1r;
	Sat, 13 Apr 2024 12:04:29 +0000
Date: Sat, 13 Apr 2024 20:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Luis <miguel.luis@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] ACPI: processor: refactor acpi_processor_remove:
 isolate acpi_unmap_cpu under CONFIG_ACPI_HOTPLUG_CPU
Message-ID: <202404131936.uSjT5AhF-lkp@intel.com>
References: <20240409150536.9933-5-miguel.luis@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409150536.9933-5-miguel.luis@oracle.com>

Hi Miguel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.9-rc3 next-20240412]
[cannot apply to rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miguel-Luis/ACPI-processor-refactor-acpi_processor_get_info-evaluation-of-processor-declaration/20240409-231441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240409150536.9933-5-miguel.luis%40oracle.com
patch subject: [RFC PATCH 4/4] ACPI: processor: refactor acpi_processor_remove: isolate acpi_unmap_cpu under CONFIG_ACPI_HOTPLUG_CPU
config: i386-randconfig-004-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131936.uSjT5AhF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131936.uSjT5AhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131936.uSjT5AhF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_remove':
>> drivers/acpi/acpi_processor.c:534:(.text+0x5e): undefined reference to `arch_unregister_cpu'


vim +534 drivers/acpi/acpi_processor.c

e8d0d9a5afb50b Miguel Luis               2024-04-09  502  
c8deb1c2576237 Xiaofei Tan               2021-03-27  503  /* Removal */
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  504  static void acpi_processor_remove(struct acpi_device *device)
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  505  {
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  506  	struct acpi_processor *pr;
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  507  
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  508  	if (!device || !acpi_driver_data(device))
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  509  		return;
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  510  
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  511  	pr = acpi_driver_data(device);
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  512  	if (pr->id >= nr_cpu_ids)
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  513  		goto out;
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  514  
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  515  	/*
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  516  	 * The only reason why we ever get here is CPU hot-removal.  The CPU is
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  517  	 * already offline and the ACPI device removal locking prevents it from
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  518  	 * being put back online at this point.
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  519  	 *
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  520  	 * Unbind the driver from the processor device and detach it from the
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  521  	 * ACPI companion object.
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  522  	 */
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  523  	device_release_driver(pr->dev);
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  524  	acpi_unbind_one(pr->dev);
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  525  
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  526  	/* Clean up. */
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  527  	per_cpu(processor_device_array, pr->id) = NULL;
2e4f1db49d9722 Rafael J. Wysocki         2013-05-30  528  	per_cpu(processors, pr->id) = NULL;
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  529  
b9d10be7a8e88f Toshi Kani                2013-08-12  530  	cpu_maps_update_begin();
95ac706744de78 Sebastian Andrzej Siewior 2021-08-03  531  	cpus_write_lock();
b9d10be7a8e88f Toshi Kani                2013-08-12  532  
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  533  	/* Remove the CPU. */
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03 @534  	arch_unregister_cpu(pr->id);
e8d0d9a5afb50b Miguel Luis               2024-04-09  535  	acpi_processor_hotunplug_unmap_cpu(pr);
b9d10be7a8e88f Toshi Kani                2013-08-12  536  
95ac706744de78 Sebastian Andrzej Siewior 2021-08-03  537  	cpus_write_unlock();
b9d10be7a8e88f Toshi Kani                2013-08-12  538  	cpu_maps_update_done();
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  539  
1e385f6f97b8ab Yasuaki Ishimatsu         2013-08-06  540  	try_offline_node(cpu_to_node(pr->id));
1e385f6f97b8ab Yasuaki Ishimatsu         2013-08-06  541  
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  542   out:
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  543  	free_cpumask_var(pr->throttling.shared_cpu_map);
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  544  	kfree(pr);
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  545  }
ac212b6980d8d5 Rafael J. Wysocki         2013-05-03  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
