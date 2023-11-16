Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD137476
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 03:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSD4kWqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700105231; x=1731641231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+ztIsaJPPcZd3X62APuvKxC7EyviIVAqsrsnV1Amrk=;
  b=gSD4kWqIO0j06abp4cBw+1RZjcYNjccPjyr9PPeIH+PSwi4FWCLP+ou6
   FdvmO7T1s7pUbFF6T6Vs3dxEqjgWv7hWqsQrzWhC/8g62G03lfUWFVHJX
   IYwl+YlKT8N3XUsKrs90g9DujWYqKArIXYWdtRr8uyt3VT+TcJ9d0ih86
   sVB6WMxAOGTcVKkAzteFO9JdBswKu3XiheaJtH5brmlIgpbUflanC9pEa
   Dg4tDbKd/O982YjmBtvxesGOrmtPpRY3jEUCRVsBKYpMJBAe7d/oXAcHx
   AObRndr43VY85nYwSqP0K5Jkje3HhOPEz2F0h7GpkeXaZqq+LyF0gA1y3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12557782"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="12557782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 19:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855853275"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="855853275"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2023 19:27:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3T22-0001El-2U;
	Thu, 16 Nov 2023 03:27:06 +0000
Date: Thu, 16 Nov 2023 11:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:aarch64/hotplug-vcpu/v6.7-rc1 41/42] kismet: WARNING: unmet
 direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by
 X86
Message-ID: <202311161157.IV18vxXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm aarch64/hotplug-vcpu/v6.7-rc1
head:   7cd0d2ba4b60697c90c4328a7377ce411568299e
commit: 14c87bb96df0d5d15ee8cea9114bcc9183d5dc4f [41/42] ACPI: Add _OSC bits to advertise OS support for toggling CPU present/enabled
config: i386-kismet-CONFIG_ACPI_HOTPLUG_IGNORE_OSC-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20231116/202311161157.IV18vxXE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161157.IV18vxXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161157.IV18vxXE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
   
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
     Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
     Selected by [y]:
     - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
