Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757D184
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305689; cv=none; b=hY8dV0XZ4YBqBCV6el9XR/XgznBeJH7pBX21ob8QtJSnaiepWP9qh5BATNzTBE3THDaSe3qfw4YipIzy1fAmjJZf3LQN76/s/+m09bXsO3JqzrBGkZTMydDhN9ZvW7j321PKtb4LyL5CLlIRVH37OT7WXwMBH/yJEK2DFPV+Ty4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305689; c=relaxed/simple;
	bh=HrGaRZ4i50b6fvhOkml2OlKn5Fc0qaAwhRbqfCv+7gY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1gbB6IEilhIxGTTZW9fAM0kMFLjj2Fti1jVquDKDAt1vWvV0FulO9MytGHDkSQGtABz3c38JOj6k8N+JlayMq1oOUkK688pdDFac+0zz65JCHyVgat71oVOEK+iuSxTOyx43XjVsEh58AnaYIFGQx/Ag1dwLQGqgZJkAtPDcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mroGUkFW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mroGUkFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737305687; x=1768841687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrGaRZ4i50b6fvhOkml2OlKn5Fc0qaAwhRbqfCv+7gY=;
  b=mroGUkFWqEQyfSD5ujoTlLZ6gvG4vbnqcnNf2EN/jGfyMcvx16yUDJbb
   5C1R6jzi3LtmqbYVpfROu9Glo3vLjYrJCM2knPgMI4aZVUe3zEi8f17F9
   EHHnKXHsKoRW6a+0N6bEBqXJUWTf7wfez+WcUzDWYTJUawAT/rqKTjRBt
   0aceWHZ/uk3lXYaUsNaYNJC1wDi25f/B4UkGlL6QjVzvDtEkWG6+BjQ9i
   oHELJty3BeidfjS7iL6PHn/HZ5Fi8OgM333oSF/tjzfvvMvD0OvUp/pU7
   R91Q00C48iNfHDHmFVdvambNxrPlmLaE5GnT3F0aRFKCivmQ4gn76GeYY
   Q==;
X-CSE-ConnectionGUID: XSrUMSasSqqaeXKSDLfhDw==
X-CSE-MsgGUID: 8jZW2eznRc+CHSMU4fJn7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48342347"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="48342347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 08:54:45 -0800
X-CSE-ConnectionGUID: MqXiId3gTnevx5rd6VgdZA==
X-CSE-MsgGUID: 4tBA86zsQgGT23riCvLZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="106288038"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jan 2025 08:54:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZYZO-000Vcx-1P;
	Sun, 19 Jan 2025 16:54:42 +0000
Date: Mon, 20 Jan 2025 00:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 25/25] drivers/media/i2c/lt6911uxe.c:653:36:
 warning: 'lt6911uxe_acpi_ids' defined but not used
Message-ID: <202501200054.CznLXkeC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zouxiaoh,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   e5247e8df469b81bea0d59bde9faf0e99e3bb259
commit: 60faa2ac3cc3bdb592073362d055de589b87e0ff [25/25] media: i2c: add support for ar0234 and lt6911uxe
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250120/202501200054.CznLXkeC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200054.CznLXkeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200054.CznLXkeC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/lt6911uxe.c:653:36: warning: 'lt6911uxe_acpi_ids' defined but not used [-Wunused-const-variable=]
     653 | static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +/lt6911uxe_acpi_ids +653 drivers/media/i2c/lt6911uxe.c

5f626592a87f58 Dongcheng Yan 2024-06-03  652  
5f626592a87f58 Dongcheng Yan 2024-06-03 @653  static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
5f626592a87f58 Dongcheng Yan 2024-06-03  654  	{"INTC10C5"},
5f626592a87f58 Dongcheng Yan 2024-06-03  655  	{}
5f626592a87f58 Dongcheng Yan 2024-06-03  656  };
5f626592a87f58 Dongcheng Yan 2024-06-03  657  MODULE_DEVICE_TABLE(acpi, lt6911uxe_acpi_ids);
5f626592a87f58 Dongcheng Yan 2024-06-03  658  

:::::: The code at line 653 was first introduced by commit
:::::: 5f626592a87f5800a993b17223d3c4b45103a9f8 media: i2c: add support for lt6911uxe

:::::: TO: Dongcheng Yan <dongcheng.yan@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
