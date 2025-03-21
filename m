Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E1A23DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742519386; cv=none; b=L5MJIZ6kzaeXCkRIhlvTRXrYqyBULq6TLEinxlqrLw1dSay1fib6n1falhqH8DlNWD87wbGrtNPlOJo+CAKbuin2BNUiZrSMGgFjYmZbKs4pqQKd/FBR+ICvrUXfHXAvEfB+0yKF9XivDq0kiXP39IOdVaWgsLJilGuIUXan8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742519386; c=relaxed/simple;
	bh=eS7zxS4kkPgRemu144NaoUBrIIvWfgD/s90Ambvmu/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XB1WnF3SKdGzeZKbUgesMJhowPkmME1s8YZiIA36hsuc8FtuKxV7ERfaAYJkWuUZp77B54GOs/bqcOc1OIWDsuRZEGW38g65nj33lQ/RlPQPXk+Yzn1mpOIYF7Hk26QlUOo3goLPHSMNsDc9X6gug8zCLJuFCniTmO/eULwVvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvqkhPEK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvqkhPEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742519383; x=1774055383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eS7zxS4kkPgRemu144NaoUBrIIvWfgD/s90Ambvmu/U=;
  b=FvqkhPEKvB+2n/ii5jcDR4orlUgvpKksfXFyacn6xTHC/+H6uAjpuFkC
   45ymO/iwFfg0vtGyVRTxtuviWyvIkE+7o4GCsSZNGAkErvQTUqkV6/51Y
   j22FEHRc098rRNOziYJXdDdc22GdM01F0hQhT9JeRxmsFgP9ulJBi8cyD
   j/qQ3PFyEANk4SaYWsEeV7ojC/NReb55m15Ny9t/bfzqo5UZV/I+GR6mJ
   BEqcgwcmVJJ4GlyvF3Ap7ktlvrVeVQ6vKV4RRoXZxvkpZAhcLsUz3ECJO
   8h2Q4qiskMuQHZfhqU4JkuUnRw2QYyEXtpAZAmqJtASPd4sal5+FZnzpY
   g==;
X-CSE-ConnectionGUID: QM9d/Si0TcKYXUydcPn15w==
X-CSE-MsgGUID: bLsX7PupStKe/oRO5lD0tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43657106"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="43657106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 18:09:42 -0700
X-CSE-ConnectionGUID: ksUp3nt/SaC1F6kbU91crA==
X-CSE-MsgGUID: wzJFk4ePQTSd0Birym7WRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="146485059"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2025 18:09:41 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvQtG-0000up-2Y;
	Fri, 21 Mar 2025 01:09:38 +0000
Date: Fri, 21 Mar 2025 09:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 12598/12769]
 drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'
Message-ID: <202503210903.kUr36x1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73b8c1dbc2508188e383023080ce6a582ff5f279
commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491 [12598/12769] hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register
config: i386-randconfig-061-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210903.kUr36x1C-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/acpi_power_meter.o: in function `power1_accuracy_show':
>> drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'


vim +618 drivers/hwmon/acpi_power_meter.c

   610	
   611	static ssize_t power1_accuracy_show(struct device *dev,
   612					    struct device_attribute *attr,
   613					    char *buf)
   614	{
   615		struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
   616	
   617		return sysfs_emit(buf, "%llu.%llu%%\n",
 > 618				  res->caps.accuracy / 1000, res->caps.accuracy % 1000);
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
