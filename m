Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F122E2FC871
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247688; cv=none; b=peretRP2qJNljzCB3XTl6YU/EdP2v6sexK+jOsM5rHHPzKBBDhZ++mXweQo90cNtwykNBc1ed0xCArWbMLjAZ35qIs87Q8L7M4To+B4ZjcFqEhp1xykiB3sk2cTHPOFYZFwBgZPZRPXtcBSnv4AE0/QFoClPO51vizXi/AJnn/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247688; c=relaxed/simple;
	bh=apTlI39XIeAh2vc0/wn/NRk8DAtPU/n7j0es00YMik0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGtieWsHSLXtXlXL3xZjDF/Ys4bw4W0WH/VGOYCAdsgQjixVGMUWZtQh1A3RipXQ2sQrS8YDQ4KTBqJePMFrayW4ljZXh4J7YHWZ8LhW7LBBtG9bJxJlFx3EYKcw69rog9e6bFsj5hCSqBogKPU7Ipca3UPHQnS36wXOGJvI0os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBJ7aetC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBJ7aetC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766247686; x=1797783686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apTlI39XIeAh2vc0/wn/NRk8DAtPU/n7j0es00YMik0=;
  b=YBJ7aetCQJmmqYZNp9lbQX2IdB87xjzhmNcpZ1EhC3DreNRpTyEoIahX
   KhJe4Ad9NFbjxj/BCD6u/dkwZNpyDJP7/9T/sSmVDFFOfUVwJqL+NCy73
   wqTsah8qNlvhCUdB0Cgb0O/fJ4uWN9j4Nst1A8gIL01QtEH0oJHwdMBGU
   1cYczqm+2D493J0HukLLyOtjFa49H81LA51vJDCvLHceTH2pZzwW9//26
   fIGfKIt72WHtOpPhsbXteHgC1B5XeY6O/SnYwg1GFRLSdXOPBMETy9tzA
   mqQ8xlEQkKtNhsf5EAA0JheVtrk2uachhk4cjTh38hjkICvy5Egh0uXxc
   w==;
X-CSE-ConnectionGUID: 4/xd8wjFSgy+UfmaFh1yhA==
X-CSE-MsgGUID: n/JDu4+oSg6hYkjLU6IXNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67929311"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67929311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:21:25 -0800
X-CSE-ConnectionGUID: KY8zcA+YSFiw7J1mb+eD8A==
X-CSE-MsgGUID: +kJcyU2LSjqtQVxyL2/m1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199364119"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 08:21:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzhq-000000004rw-2m7m;
	Sat, 20 Dec 2025 16:21:22 +0000
Date: Sun, 21 Dec 2025 00:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547] drivers/cpufreq/acpi-cpufreq.c:638:13:
 warning: 'sched_set_itmt' defined but not used
Message-ID: <202512210018.ZcEdgI6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi LeoLiu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 06ee47aa957617950ebf29f2a9dbb5682233ba4e [3547/3547] cpufreq: ACPI: add ITMT support when CPPC enabled
config: x86_64-randconfig-006-20251216 (https://download.01.org/0day-ci/archive/20251221/202512210018.ZcEdgI6o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210018.ZcEdgI6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210018.ZcEdgI6o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/acpi-cpufreq.c:638:13: warning: 'sched_set_itmt' defined but not used [-Wunused-function]
     638 | static void sched_set_itmt(void)
         |             ^~~~~~~~~~~~~~


vim +/sched_set_itmt +638 drivers/cpufreq/acpi-cpufreq.c

   637	
 > 638	static void sched_set_itmt(void)
   639	{
   640		schedule_work(&sched_itmt_work);
   641	}
   642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
