Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A95FDC6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706979342; cv=none; b=rqjQbdCuA5UERXTLI47ekVSNcvHrj5ulq33uV4d+TPd4O1DO6saCBl36mYYBmMBfDjqr8G+9zLWVWJdDrBZU+SqdNm7hnHa5h7KJ4BmIfAos2yJNcO8w7iWPLRsXvxtXbnRcOC7CZ3xI8sC6FEfp55hLm5Xaezr83pp4wRmcIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706979342; c=relaxed/simple;
	bh=rFfZ+jWCpINz7MqrzfLH0cB19TWQkjWBeRpuTsbeLSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2C27EeKUOMeZ3+LGxOGtwfgw4+0J2EnyciQ6rPXrUNotWSWsGzMwsO8eAb1CAegxLviW4zbhIOs7WBUT/1pCr5VZj/ying7T1mO10moigZIaix3V85uVugFR4MiPqaMYtMGow7kzmNwX+7qsG9kLfXtJPlzGAI8vdBiOq/Sk2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ny/VsRZP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ny/VsRZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706979340; x=1738515340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFfZ+jWCpINz7MqrzfLH0cB19TWQkjWBeRpuTsbeLSw=;
  b=Ny/VsRZPK24XL9Yl3g2NO6CdjYWbjEgKF5oruE/vccB+hxMqaUmFKZXc
   nvoiGQRDB189CqmQBJGQZKZShldJuDdz6EWLxc+NSY+sLrm3avwDJouFD
   K13M+SRwc6RJGBsKMB4YJnkKsKvcbMWzqWCbq/E/052JJLb6ZLohKWeHp
   lvCdu2dRBBDtZkEBREIoVlj/z4fOlPNNTy9UjD/sEgCn1VM2Lz818QUZZ
   /U6+pG4XYZtExWNHimdrpePiAYNl+FpECqQNHNmm+0Sk6QaaBgpEUkq6O
   fXMhLsYCSHVr+cQTmXFGxJ11gjWTL+lEmV8dWiUufRNPRh7FeNrg+avR1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="224690"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="224690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 08:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4940379"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2024 08:55:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWJIl-0005LS-1u;
	Sat, 03 Feb 2024 16:55:35 +0000
Date: Sun, 4 Feb 2024 00:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/9] power: sequencing: new subsystem
Message-ID: <202402040005.3JqRyvWq-lkp@intel.com>
References: <20240201155532.49707-4-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201155532.49707-4-brgl@bgdev.pl>

Hi Bartosz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next bluetooth-next/master bluetooth/master linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/of-provide-a-cleanup-helper-for-OF-nodes/20240202-000307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240201155532.49707-4-brgl%40bgdev.pl
patch subject: [RFC 3/9] power: sequencing: new subsystem
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240204/202402040005.3JqRyvWq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040005.3JqRyvWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040005.3JqRyvWq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/sequencing/core.c:50: warning: Function parameter or struct member 'dev_sem' not described in 'pwrseq_device'
>> drivers/power/sequencing/core.c:50: warning: Function parameter or struct member 'state_lock' not described in 'pwrseq_device'
>> drivers/power/sequencing/core.c:50: warning: Excess struct member 'sem' description in 'pwrseq_device'


vim +50 drivers/power/sequencing/core.c

    26	
    27	/**
    28	 * struct pwrseq_device - Private power sequencing data.
    29	 * @dev: Device struct associated with this sequencer.
    30	 * @id: Device ID.
    31	 * @owner: Prevents removal of active power sequencing providers.
    32	 * @pwrup_count: Keeps track of power state change requests.
    33	 * @sem: Protects the device against being unregistered while in use.
    34	 * @drvdata: Provider driver private data.
    35	 * @match: Power sequencer matching callback.
    36	 * @power_on: Power-on callback.
    37	 * @power_off: Power-off callback.
    38	 */
    39	struct pwrseq_device {
    40		struct device dev;
    41		int id;
    42		struct module *owner;
    43		unsigned int pwrup_count;
    44		struct rw_semaphore dev_sem;
    45		struct mutex state_lock;
    46		void *drvdata;
    47		pwrseq_match_func match;
    48		pwrseq_power_state_func power_on;
    49		pwrseq_power_state_func power_off;
  > 50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
