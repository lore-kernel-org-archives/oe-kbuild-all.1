Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162382866
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 23:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738020063; cv=none; b=qNSJi0gbPAiWcofNIx12SuHmTKTCKQHhr0qmhSOcxMrHcl+KI1GJoiUyUiqUFSNlOq8OKawr4LEOQf9lGrtWbR+qmdRNe7+t8vf4bzvPExDusHfUc2sqMZLEO4aApZ/bogip1z8BQKuylc1spGU/Ly6hMHubQXh6gmDOJJnC35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738020063; c=relaxed/simple;
	bh=JmvgC+9Zg4FFW8pmfERXdzRc0QeiKZ/qDfyrchGOQss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSK23xrsQ+pv4cX7WXjIMf3DYLcHO+ziaTr47SV2VNYJIm9alPQeXoY4YSLnciFLuvslAs6u08grexwXT/kuG64BIcuUXqw82+bXQa4roPVwXsoQ23odxUY8weuk+PWEQMy1oR0J8exB6PSrvUo0ZkVFF3iYor/OMwm7I6r/Bcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/CLI2QT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/CLI2QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738020062; x=1769556062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JmvgC+9Zg4FFW8pmfERXdzRc0QeiKZ/qDfyrchGOQss=;
  b=f/CLI2QT9i+l3w7sXvSDKR+u7JPrNOC3nNDomTweX84P+ZJSkNzGtA0A
   YS76hSfgh96mxWI6dQsTI1eQ0XrNSWIfDA8LvNXl9hBC2Xmg3Oi5yj5Dz
   fJkaZQDPfutR1+hEZqwuYdALtOH/+deBYlxlXNtcVW0gMi9F0Gt5K8prF
   CxUYZYIbsQMi0GX2YBsB2rXxiYuMl01MSl0tJPECLYItC0lq4GYGryHRx
   GssCNKSuQl5zwxnHNcgvB4wYCzqTXdfZXeng9zpVDpEQGvkCIWJguIoTC
   zCOfZQZvl/znD7KUnl8zHmIuRaNt3qCo8y43D4C+f2qnO3XueGZbYRypl
   g==;
X-CSE-ConnectionGUID: PEwCWvJHT8Caw1dAKqA3qw==
X-CSE-MsgGUID: +K5amC0mQUqA1KMyOA0+gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38198100"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="38198100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 15:21:02 -0800
X-CSE-ConnectionGUID: +OyBxYGsRX6+W5AWmnrM5A==
X-CSE-MsgGUID: mDJl+qJySE+cWziJ1tmdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108426530"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Jan 2025 15:21:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcYPa-000hFH-0O;
	Mon, 27 Jan 2025 23:20:58 +0000
Date: Tue, 28 Jan 2025 07:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 11/14] ahci: pata_arasan_cf: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Message-ID: <202501280705.bud0LV6C-lkp@intel.com>
References: <20250127-pm_ata-v1-11-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-pm_ata-v1-11-f8f50c821a2a@gmail.com>

Hi Raphael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/ahci-brcm-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20250127-205128
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250127-pm_ata-v1-11-f8f50c821a2a%40gmail.com
patch subject: [PATCH RFC 11/14] ahci: pata_arasan_cf: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250128/202501280705.bud0LV6C-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280705.bud0LV6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280705.bud0LV6C-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/pata_arasan_cf.c: In function 'arasan_cf_suspend':
>> drivers/ata/pata_arasan_cf.c:938:9: error: implicit declaration of function 'ata_host_suspend'; did you mean 'ata_sas_port_suspend'? [-Wimplicit-function-declaration]
     938 |         ata_host_suspend(host, PMSG_SUSPEND);
         |         ^~~~~~~~~~~~~~~~
         |         ata_sas_port_suspend
   drivers/ata/pata_arasan_cf.c: In function 'arasan_cf_resume':
>> drivers/ata/pata_arasan_cf.c:948:9: error: implicit declaration of function 'ata_host_resume'; did you mean 'sata_link_resume'? [-Wimplicit-function-declaration]
     948 |         ata_host_resume(host);
         |         ^~~~~~~~~~~~~~~
         |         sata_link_resume


vim +938 drivers/ata/pata_arasan_cf.c

a480167b23ef9b Viresh Kumar    2011-02-22  928  
a480167b23ef9b Viresh Kumar    2011-02-22  929  static int arasan_cf_suspend(struct device *dev)
a480167b23ef9b Viresh Kumar    2011-02-22  930  {
90f0adf0936d46 Sergei Shtylyov 2011-10-12  931  	struct ata_host *host = dev_get_drvdata(dev);
a480167b23ef9b Viresh Kumar    2011-02-22  932  	struct arasan_cf_dev *acdev = host->ports[0]->private_data;
a480167b23ef9b Viresh Kumar    2011-02-22  933  
40679b3ce9d993 Viresh Kumar    2012-02-23  934  	if (acdev->dma_chan)
72b2caff4aac45 Vinod Koul      2014-10-11  935  		dmaengine_terminate_all(acdev->dma_chan);
40679b3ce9d993 Viresh Kumar    2012-02-23  936  
a480167b23ef9b Viresh Kumar    2011-02-22  937  	cf_exit(acdev);
ec87cf3782f7b0 Sergey Shtylyov 2022-02-02 @938  	ata_host_suspend(host, PMSG_SUSPEND);
ec87cf3782f7b0 Sergey Shtylyov 2022-02-02  939  	return 0;
a480167b23ef9b Viresh Kumar    2011-02-22  940  }
a480167b23ef9b Viresh Kumar    2011-02-22  941  
a480167b23ef9b Viresh Kumar    2011-02-22  942  static int arasan_cf_resume(struct device *dev)
a480167b23ef9b Viresh Kumar    2011-02-22  943  {
90f0adf0936d46 Sergei Shtylyov 2011-10-12  944  	struct ata_host *host = dev_get_drvdata(dev);
a480167b23ef9b Viresh Kumar    2011-02-22  945  	struct arasan_cf_dev *acdev = host->ports[0]->private_data;
a480167b23ef9b Viresh Kumar    2011-02-22  946  
a480167b23ef9b Viresh Kumar    2011-02-22  947  	cf_init(acdev);
a480167b23ef9b Viresh Kumar    2011-02-22 @948  	ata_host_resume(host);
a480167b23ef9b Viresh Kumar    2011-02-22  949  
a480167b23ef9b Viresh Kumar    2011-02-22  950  	return 0;
a480167b23ef9b Viresh Kumar    2011-02-22  951  }
a480167b23ef9b Viresh Kumar    2011-02-22  952  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
