Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A122236F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 06:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798811; cv=none; b=d5dD/SJWTUnOonKgDmOP4MecCPGRq2r58fbak3nYLpO8ZQihw8XfXCkQH3aODqv4uFRtp1Sgq9w11rcBjRz7nxKDUk+I7WGEbSZJOcfllxLd2JDqPVe7IL7N8OgGK1noh/BEY+nz1SiKygfvYxnfGQtHST+PJTXtcYmMZhErem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798811; c=relaxed/simple;
	bh=IEW8hh64KtfdKaYBJsMyWDmAkz5mQk7B3j5P2Uhyzzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLWC/CjzJizqA5LB5fc8RUL7JSNljG6/BLin7X4lFl/SFk0y7KlKPkeGL4Nk37kMlVbBvhdH3CRkbgUNXDAiIeRwicUk1sYaz20HJrnzg1JPaI7KG97qzkMMxhLom1OTRbmpGJzMVcxj5hFykjCHgB0D/CEoO+aZj4MgkvvCbbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWP711I7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWP711I7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789798809; x=1821334809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IEW8hh64KtfdKaYBJsMyWDmAkz5mQk7B3j5P2Uhyzzs=;
  b=LWP711I7Ody5eWcc9qmZwJgK8wPmrVg2g57/iKexkwoEXJH1u83YAeUr
   Ae2Ah57nvcqvdKAkP+I2It3Krjhy1HwQ9/ug8k2KFY4/ZVUbhVyB3/Wa+
   4ulhVkUumD45dGsBZ27hBjD67WzcH4XkIpbgnRA6HewWDyHhGAouBARaZ
   APWZquqr1U7oW5vrDmI4VtKEqAvbxtn0g2nIcMvdd70MBkbW11aqDlp9a
   nqkQyodRCGccZ/+y6DXetcpPpUQpN1P82c8TgE3WgUw8a28VvtbjWP7Gp
   S3HUJdiFkrFJmMWuwRTHBNX5YUYyndMuUp06YOIcm1vGJLpxA+ogm4FFB
   g==;
X-CSE-ConnectionGUID: cEqEM3A2S3GiY9Mqm+sBrw==
X-CSE-MsgGUID: pkJiamVLSZ+YOgpAn9vM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89262277"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89262277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 23:20:08 -0700
X-CSE-ConnectionGUID: hMFzWDC0SRaRInEGfn6xHw==
X-CSE-MsgGUID: W1lMWoOCRtyy4SZdVOp24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271370188"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 23:20:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7oQe-00000000Aht-3rAY;
	Sat, 19 Sep 2026 06:20:04 +0000
Date: Sat, 19 Sep 2026 14:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Baorui.Liu" <baorliu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] cpufreq: virtio: add driver to report host
 frequency to guests
Message-ID: <202609191437.OaXd0Blz-lkp@intel.com>
References: <20260916073735.541-2-baorliu@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916073735.541-2-baorliu@amd.com>

Hi Baorui.Liu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge amd-pstate/linux-next amd-pstate/bleeding-edge mst-vhost/linux-next linus/master v7.3-rc3 next-20260918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baorui-Liu/cpufreq-virtio-add-driver-to-report-host-frequency-to-guests/20260916-153735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260916073735.541-2-baorliu%40amd.com
patch subject: [RFC PATCH 1/1] cpufreq: virtio: add driver to report host frequency to guests
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260919/202609191437.OaXd0Blz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191437.OaXd0Blz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191437.OaXd0Blz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/virtio-cpufreq.c:165:27: error: 'cpufreq_generic_attr' undeclared here (not in a function); did you mean 'cpufreq_generic_get'?
     165 |         .attr           = cpufreq_generic_attr,
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           cpufreq_generic_get


vim +165 drivers/cpufreq/virtio-cpufreq.c

   157	
   158	static struct cpufreq_driver virtio_cpufreq_driver = {
   159		.name		= DRV_NAME,
   160		.flags		= CPUFREQ_CONST_LOOPS,
   161		.init		= virtio_cpufreq_init_policy,
   162		.verify		= cpufreq_generic_frequency_table_verify,
   163		.target_index	= virtio_cpufreq_target_index,
   164		.get		= virtio_cpufreq_get,
 > 165		.attr		= cpufreq_generic_attr,
   166	};
   167	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
