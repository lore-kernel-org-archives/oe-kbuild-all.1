Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA5182DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718167529; cv=none; b=UgSOmVaSZ493LQj1trVvM7iYjcP9giuzoVuwrPTXffeJdYq4QOXdQdvt0FAaU5Evqzlru7Yw2TpbMqhkyC2uhs3y9ZNbeYHRu5mR1L5uZmm5+7KJuxw70juGFqFXZhYkNeD/2mcvymmAXI3wXvr/PdR7Jo4N0aXo27MYP5EBcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718167529; c=relaxed/simple;
	bh=yhmxsTTreCsCgk28aCrWh9NgtnsIkN8CIQ90eCIv+N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pkof30zQNX1Q/1gssdqoiKcpc9y6wqP79Cz+RxIGHjVaNXjoJ5Wfj4357Sc5EK8DM2wYmXLG/p63Ie3jMBGcACUsR9L3ZQHKmW4Oue58of6N69d62/MqJAFrTgU/WD0gHloux6nnLnxYc2+hkwrZ770p1kg3UFsC2BwJxj5X+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9JK7Waf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9JK7Waf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718167529; x=1749703529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhmxsTTreCsCgk28aCrWh9NgtnsIkN8CIQ90eCIv+N8=;
  b=g9JK7Waft24+hhY+pvq2Sx7YMkvHbnKstbYFeTWBPXI6oSVfj5ZxaTcm
   ecOyjvcG5CfBui1s/3OPVN4mMzKa7iukZqCtk1rBh4c8hIfEg75bte8gQ
   dibwe7cgmqzrCyvymuNjH52qd4gvB/qfQwRfgc6c3oodnxqRP+HQ2ottf
   2xCYWZJ+QqheaKuTLlLQZnUvucdOn3W49akwFYBqNtpqedxFmTYIKDqjX
   3fRRmtScmMqjVpOfPyCUYeo01PEYovJlA5sfDwZQcIyuOsQMESNCTo8q1
   q6bal+aETkyUXFYhQq+t3/Ei2MSCA/LkockyMNno/lEA4GhfzRwQ5ws6+
   A==;
X-CSE-ConnectionGUID: zyddO4+sROSCl8glGHlYMg==
X-CSE-MsgGUID: +fG3u4+sSyuHdIj2IgBqOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15080781"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="15080781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 21:45:28 -0700
X-CSE-ConnectionGUID: TM5eaeFWQ0Cf50ACxEEeGg==
X-CSE-MsgGUID: aErfhKgvQCO5xQyacOBxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="39550355"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2024 21:45:27 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHFrR-0001DE-0V;
	Wed, 12 Jun 2024 04:45:25 +0000
Date: Wed, 12 Jun 2024 12:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 22/22] drivers/ptp/ptp_vmclock.c:229:43: error:
 invalid use of undefined type 'struct acpi_device'
Message-ID: <202406121252.WfAz8Qg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   271bd03d9ae077ef80973de134409b507e76193e
commit: 271bd03d9ae077ef80973de134409b507e76193e [22/22] ptp: Add vDSO-style vmclock support
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121252.WfAz8Qg0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121252.WfAz8Qg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121252.WfAz8Qg0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'vmclock_probe_acpi':
>> drivers/ptp/ptp_vmclock.c:229:43: error: invalid use of undefined type 'struct acpi_device'
     229 |         status = acpi_evaluate_object(adev->handle, "ADDR", NULL, &parsed);
         |                                           ^~


vim +229 drivers/ptp/ptp_vmclock.c

   221	
   222	static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st)
   223	{
   224		struct acpi_buffer parsed = { ACPI_ALLOCATE_BUFFER };
   225		struct acpi_device *adev = ACPI_COMPANION(dev);
   226		union acpi_object *obj;
   227		acpi_status status;
   228	
 > 229		status = acpi_evaluate_object(adev->handle, "ADDR", NULL, &parsed);
   230		if (ACPI_FAILURE(status)) {
   231			ACPI_EXCEPTION((AE_INFO, status, "Evaluating ADDR"));
   232			return -ENODEV;
   233		}
   234		obj = parsed.pointer;
   235		if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 2 ||
   236		    obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
   237		    obj->package.elements[1].type != ACPI_TYPE_INTEGER)
   238			return -EINVAL;
   239	
   240		st->phys_addr = (obj->package.elements[0].integer.value << 0) |
   241			(obj->package.elements[1].integer.value << 32);
   242	
   243		return 0;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
