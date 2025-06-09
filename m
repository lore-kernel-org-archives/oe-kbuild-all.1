Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27113217737
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 20:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501411; cv=none; b=jEUC36KMSYYobJ0QcI8ZyK1gm0W9dFRMwsB0fk4iF6qN9wwWLHKQDFEO45CNj5TpThZNGNdSAS3prqfnfvXYM8ArgDKbYiw4PCgPAnl6/Dc+g8ow/hFfnwOFsHMRXQY00nYbr25ooAiRThqQtS2oEyqXfzQez9OWEF/B1M1eyjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501411; c=relaxed/simple;
	bh=rdGOEnPOqgbn+QFF70CT9xF6NscQAy3gtE6VuhBFnAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Urnnup6WFFIRXz9DIurJCbhL4zK04kUKc1x2j/UiQDk2mKz1hZxn8h+DzltyWOFZ+zQPsNTd5ei8/+G41XX1szu6oSRwVnNg9yN/GYVrGbd8RuPYOZmXq+w031uEGnCw4eOJbfHLfq/UigeXXwUSjDG+NuE0ahYvF4LLwfHwqDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEk2qHs4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEk2qHs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749501410; x=1781037410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rdGOEnPOqgbn+QFF70CT9xF6NscQAy3gtE6VuhBFnAc=;
  b=iEk2qHs4igtnsthK61T+lpdBv5VGl7XRMb7N1F4aLoisD/C1D9QJzezB
   30h/opM7xkFp4+6oCHf1i954TVAnLKwm48Q+a8EKOJiWCz8OHzV9rzwby
   j/Ff58XWKKK9YF6QOfEU4cr0sdd4XeYXDhQzeMmMb1kb2F50tOKa2JjNk
   2ApYerwBF6sr8w/nQw7OWu62wifcAe/6oJQRGsBuN/eazqHbxuu7RcCQf
   s+cNKTqpxxW4ULbdTwS5qhT1eW86T64hoTgEAZmIs+0szqGs9LiyGPQM+
   5ijkOW/ct5A8C/ekHmkQqMmGk6aPWPxK3S24G6E5M5N7VEbi/E8g/Exam
   w==;
X-CSE-ConnectionGUID: u/DxfC1YRjWyTiqHHj5KvQ==
X-CSE-MsgGUID: sTUsOiGLRtesyZSBXzmTeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69153886"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="69153886"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:36:50 -0700
X-CSE-ConnectionGUID: YtUq971mT92/u0xbxLS13w==
X-CSE-MsgGUID: fa5JFmC9TpmNSPOsL8mHXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169796600"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2025 13:36:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOjEc-0007OT-2Y;
	Mon, 09 Jun 2025 20:36:46 +0000
Date: Tue, 10 Jun 2025 04:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
Message-ID: <202506100440.fyTGO7CG-lkp@intel.com>
References: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on soc/for-next krzk-dt/for-next linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/regulator-rpi-panel-v2-Add-regulator-for-7-Raspberry-Pi-720x1280/20250609-081005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250609000748.1665219-2-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
config: parisc-randconfig-r051-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100440.fyTGO7CG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100440.fyTGO7CG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100440.fyTGO7CG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/rpi-panel-v2-regulator.c:95:34: warning: 'rpi_panel_v2_dt_ids' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id rpi_panel_v2_dt_ids[] = {
                                     ^~~~~~~~~~~~~~~~~~~


vim +/rpi_panel_v2_dt_ids +95 drivers/regulator/rpi-panel-v2-regulator.c

    94	
  > 95	static const struct of_device_id rpi_panel_v2_dt_ids[] = {
    96		{ .compatible = "raspberrypi,touchscreen-panel-regulator-v2" },
    97		{ },
    98	};
    99	MODULE_DEVICE_TABLE(of, rpi_panel_v2_dt_ids);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
