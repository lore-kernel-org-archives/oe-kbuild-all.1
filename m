Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA75915AAC8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725710080; cv=none; b=AdJuz+A21gTpGWamK+Jl/9IbhDT00U6GUOiu80hFrbTI3aSWDIJn23Cwfqp2l/Q3gpu22OKqISn/4SyNsqaGKGA0uy3mfYnXLWvqfDntCB//78YGSEFcfqmwwfn0e76pXmmgGC/KcapinK39jwOrvwAlqYPN4ye8eyTtQl8ncs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725710080; c=relaxed/simple;
	bh=TVYkpBGF+D+JeqhslKis6VRoGixYrtCQaGwIuqkmIqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsZlHBIKAVtFgPG4CNj0C5nCLu3OdXrwcsw+4aGRQXi+CSFI4+qfKZ7xHx+4Jqpa3i8uY/0B6aCZE9VqCZwkiIa32o4DG4kO7dK313DhZqFVq2fpXb9CwS8bIPZpFmBKhvszZKzF2+Gxezq+FAlteTaLZDH9spOEBPQIYHvHwYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pl2gr4v9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl2gr4v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725710078; x=1757246078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVYkpBGF+D+JeqhslKis6VRoGixYrtCQaGwIuqkmIqU=;
  b=Pl2gr4v9GBxjRTLNaz3SS9u2VIva1jzfqTdqh/lPOECPXSSTZyLDJJdu
   vYWKU6Bj3Vemlm+/Pns48Eg6APPLvDfYd11df8uVDxUn0iWXTOpSfr0xH
   JYPzAO2UHezzNi8Niu1aY94ShNHj8IgdfIpTx6liEhRbbxWVkgzswpTA4
   vysbQpq59VaMzKrOC0vA82CNtsKD7MdBfHRXpdoAkepPp2QzqXeEuYHLL
   a5YM+fBAHZ6rClgNQh+yO9Mb9t+WhQ7YdDWThBdoZ6RQk2bBMcMvnxpqE
   L+RVzF1INZt0lIJyrTNAAqeobK5i6vzwKoXAWdd572FEh3vFqHUqrtux1
   w==;
X-CSE-ConnectionGUID: c+PqseVjS1WU6VE9IJurSg==
X-CSE-MsgGUID: cHsEijM8R6CO50xZRX7s7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28202410"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="28202410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:54:38 -0700
X-CSE-ConnectionGUID: 8aNQZzUBTBi0A4ju4Va0hA==
X-CSE-MsgGUID: axa+PRGiQneprtIYfgi4ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="71013915"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Sep 2024 04:54:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smu1S-000CWl-0G;
	Sat, 07 Sep 2024 11:54:34 +0000
Date: Sat, 7 Sep 2024 19:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot/v6.11-rc1 47/129] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/arch/x86/resctrl*
Message-ID: <202409071910.z1Kbl5Rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   a3cc1ee01f0d935f82db885e4ec4772dc6032efa
commit: 1c58b89b79f03fd9013a8a2da78f87424fbcb97f [47/129] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409071910.z1Kbl5Rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071910.z1Kbl5Rt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/arch/x86/resctrl*
   Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
