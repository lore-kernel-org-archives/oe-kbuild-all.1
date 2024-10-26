Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700117FAC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729976009; cv=none; b=V1Ask1ZFwAyMIpYxp0WmMZhC0Bz9f8VtPV9q1dye3W204H7Yp9Dp/qYrbHmkbG3HHGaf+Rs8/kxTEV9aLQs6KTE7duhIJ4YNTT5mr3jhpzswfj7f1U8f3bpHid7snAzV7n7ytM2KzPkz+ke/XvWHiGGX4jpCfo76eqJnlw3jqvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729976009; c=relaxed/simple;
	bh=ORt3MjbR2QGUcOz2WNxEA96i2zLTy3dOPmdJvhZggyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdRvWv57fUW8iNm93CzjcpYo0vc/FouN3iupF62nP22GIiOMZeka17ij6MGIS7IFuIAaDwwEEvgIs7jNBpbM6mgU023Ss2Ys22aut/aY0DE6K0TpTmOJYmE1DP02HsVyqZ+bfg7bab0YzmrFyvsBzYR4OLHXIbZRAqyXHFQ9LIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4VPtGKE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4VPtGKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729976007; x=1761512007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORt3MjbR2QGUcOz2WNxEA96i2zLTy3dOPmdJvhZggyQ=;
  b=H4VPtGKEP85yY3G3hGuaYYW+3eO/UZB8Roai/VroVdm6VfT8OzRjCFL1
   ux+BBrMUBIVAG7yb7ooeCEAj2kmfW/XAeRM/CbEJU9QkbHajtlwfn5uI5
   Wn28F2hKg4F4ep1hIIb8ikt4Tk7qzE/kLEiL+ICdzPxFiVwOSZ5CuYfKO
   Cpgcyv+N52w9aVMZ71jbE7LpjohU/Mgi05gia3k3UJYJ6i2FF2x+T9nbr
   e32PSQVAvEQePETUfmozw0JO/pM4R6FnKGwsyKFDsJ2SZsQooT2hvnslx
   vhruJziwLU8qNxIUzFywWNv0c1F1vy8WRXYgz6BDol3Kaij95ZASsCqic
   Q==;
X-CSE-ConnectionGUID: 9nrmTovvTKG6HJSROoqcLw==
X-CSE-MsgGUID: HJGKolUMRVO/bbVApq+lOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="40995275"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="40995275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 13:53:24 -0700
X-CSE-ConnectionGUID: MHspdPA8QJ+lrpX4M2XQXQ==
X-CSE-MsgGUID: wKRBO09aSuOsZmYhLAZi4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="82068842"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 13:53:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nmi-000a20-1S;
	Sat, 26 Oct 2024 20:53:20 +0000
Date: Sun, 27 Oct 2024 04:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/15331]
 drivers/cpufreq/loongson3-acpi-cpufreq.c:89:12: warning:
 'lasx_count_threshold' defined but not used
Message-ID: <202410270415.BPgdabxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/15331] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-randconfig-002-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270415.BPgdabxg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270415.BPgdabxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270415.BPgdabxg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/loongson3-acpi-cpufreq.c:645:5: warning: no previous prototype for 'loongson3_set_mode' [-Wmissing-prototypes]
     645 | int loongson3_set_mode(int mode, int freq_level)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cpufreq/loongson3-acpi-cpufreq.c:835:14: warning: no previous prototype for 'load_update' [-Wmissing-prototypes]
     835 | unsigned int load_update(struct core_data *core)
         |              ^~~~~~~~~~~
   drivers/cpufreq/loongson3-acpi-cpufreq.c:1520:36: warning: 'processor_device_ids' defined but not used [-Wunused-const-variable=]
    1520 | static const struct acpi_device_id processor_device_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:89:12: warning: 'lasx_count_threshold' defined but not used [-Wunused-variable]
      89 | static int lasx_count_threshold = 200;
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/lasx_count_threshold +89 drivers/cpufreq/loongson3-acpi-cpufreq.c

    85	
    86	/* threshold of core's get into msa */
    87	static int msa_count_threshold = 200;
    88	/* threshold of core's get into lasx */
  > 89	static int lasx_count_threshold = 200;
    90	/* other cores' upper load threshold when 1 core get into boost mode and enable msa/lasx */
    91	static int load_threshold = 60;
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
