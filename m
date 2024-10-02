Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E214217320
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727904823; cv=none; b=O9IAlDiochD7xsV0YY/7IOgotiuqH1qtHnnnciRB5oLrLBzi4IDAwFmQA4OSL8tJfNnIiMOB/hAz8hSrxYWagXFVsBtjubq7odTuFiWkLLCCSyo4Yq4OBu3mANl5oI1CqcQR0x/VU1AVZPARAUyYv4msVu48KQVkJdTsiJXNnVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727904823; c=relaxed/simple;
	bh=PpSFhXT5l6Z09JezVa/LZlGDDqPFOd+hAX8JMg0iq8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pux3q+ecs4osETfeJqkven12OQzYGgRmrlIsTFZ6Gzp/xYTQDoNRN90HQ1y1glDVv7hNToeJhFiMxvNfHIW7GeGxVQDyE9qhOAGvGeNovuCc7UFx/7m/q7locBCTZ4SqY7s7gMsdD908s0wRWWk5sGMyvopNculZGc3ROOdK8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CI79kpG+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CI79kpG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727904821; x=1759440821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpSFhXT5l6Z09JezVa/LZlGDDqPFOd+hAX8JMg0iq8A=;
  b=CI79kpG+wRJKDmvgNQGU8MgFBK2fL0BtG8HxUn68JfBPB/GPqmGz0uZy
   cbxePws8ujqVE0MLKurTuA3hBng+ie0JCvG09ftHg/K3LVI+RUO9h6kPP
   asPCbBwfQTcXc0mTFA5C/k7H948spIiBfGZ3rwmVlBc9kVxV+c8mS3Ni7
   AzcVMUGP0ABbeqphgwSA5QGSb20PKoZ4v9SftUFAg1aSJjxQqqyuUi60u
   vtgGYHTYO8QFSiSkgkwqeTXZpQh9Gc0GhTqmDWofK+8mTXoKcyccaUl3q
   Kngp8S2prrbyPUm1Tby8/uw5LJTPm8pV+oUZtF+CNOc2JwbQVtUhsjeFr
   g==;
X-CSE-ConnectionGUID: ynYoxxvXSeSb0FLDzuHq6g==
X-CSE-MsgGUID: cz8rJx+GRcin2MLYGgHeuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26956555"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="26956555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 14:33:41 -0700
X-CSE-ConnectionGUID: SjUp4zfVSGK8457Dqb0/Bg==
X-CSE-MsgGUID: SSGKLz9yQ3CM10z+0HF2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="79109566"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2024 14:33:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw6yV-000UaX-1a;
	Wed, 02 Oct 2024 21:33:35 +0000
Date: Thu, 3 Oct 2024 05:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1202/2444]
 drivers/acpi/prmt.c:53:1: sparse: sparse: symbol 'prm_module_list' was not
 declared. Should it be static?
Message-ID: <202410030537.P9FQryJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 3578bca5b059d37591b25be1c52f1411bfe94780 [1202/2444] ACPI: PRM: implement OperationRegion handler for the PlatformRtMechanism subtype
config: x86_64-randconfig-121-20241002 (https://download.01.org/0day-ci/archive/20241003/202410030537.P9FQryJ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030537.P9FQryJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030537.P9FQryJ6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/prmt.c:53:1: sparse: sparse: symbol 'prm_module_list' was not declared. Should it be static?

vim +/prm_module_list +53 drivers/acpi/prmt.c

    51	
    52	
  > 53	LIST_HEAD(prm_module_list);
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
