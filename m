Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00D30C359
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403582; cv=none; b=RbibtfRvExK1bbJi4bcLhh9JAsY6axSeg9CNiILnKDIPFnYiPPRzq+Ow/8NoWiSzGXpcY8Y2jOrybgVNhbMtySAgky0xwQVac/CnkDbwbOSaQk/4Be8eKu3jpz28cpmyhGnxC55Q4OgMEi3IaP/0pkR+NFwPzu30pjX+pZgIZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403582; c=relaxed/simple;
	bh=Rt0FcpkBwrKDPv+RAlnoaXSMHwdO4ZUMq9JaQBbMZSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPO771FaXBmSZEdsrymS0B9wGagqZ6Qd4wL93Oj5r64Azv2WUnm79fI6scszrNQAX7eTYgeQ9z3ZabViookPJk6W3PVnOnR2BYBB58c4iPX05/NLi9SBpshlo0O1IGveZIc706u6NxdbzVWQ8NY6RSsU14DvjJC1SM/RDd17weU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4s+F1qH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4s+F1qH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763403580; x=1794939580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rt0FcpkBwrKDPv+RAlnoaXSMHwdO4ZUMq9JaQBbMZSE=;
  b=E4s+F1qHigzxb08p5U6UZYbgSONcTZQf7PUjS+pNvazFX3RMBMtLLCkb
   LUYx7GnWJ7YRvKUQdKXlZNdz+YmrpIvmMd2j9lI1/N0OI52ETvQt5zsjg
   xIRw7DgSSWoFEN6RUrIRxVofMka4xhamJKNvt9zJPDzb6Q1NCEbcTodF2
   UPKCSIcqkmMieMJB9NKqXscGDwjmrdIsdSPJDmK0ToswWZ4vF752tzV0w
   TrJ6shtC/szPsFB3+YpITfTFKSrDrWtBMVcl8A6QV05SlNwxIJ/e4V7Zn
   SKr56iQiJddo4YRDIJ5VpNqQBk5dlKjEzXTWhDjw82Az1tlQphSzOdxBs
   w==;
X-CSE-ConnectionGUID: VmDPPkO5QSSGGi5OfjJ8Sg==
X-CSE-MsgGUID: MOtg50L8RyuzCbMb/1w47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65451816"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65451816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 10:19:37 -0800
X-CSE-ConnectionGUID: C5g/bgwjT9SJzucdTZHV9Q==
X-CSE-MsgGUID: T0bdGmprRuW8P2kW+VlRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190545919"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2025 10:19:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL3p6-0000vV-23;
	Mon, 17 Nov 2025 18:19:32 +0000
Date: Tue, 18 Nov 2025 02:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 3/11] drivers/gpio/gpiolib-shared.c:62:1:
 warning: 'gpio_shared_find_entry' defined but not used
Message-ID: <202511180232.EItKeYjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   67f9b828d4e5e47caf3472a399c25c3c0ddc824a
commit: a060b8c511abb0997381b397e52149a5e3e5259a [3/11] gpiolib: implement low-level, shared GPIO support
config: s390-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251118/202511180232.EItKeYjY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180232.EItKeYjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180232.EItKeYjY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib-shared.c:62:1: warning: 'gpio_shared_find_entry' defined but not used [-Wunused-function]
    gpio_shared_find_entry(struct fwnode_handle *controller_node,
    ^~~~~~~~~~~~~~~~~~~~~~


vim +/gpio_shared_find_entry +62 drivers/gpio/gpiolib-shared.c

    60	
    61	static struct gpio_shared_entry *
  > 62	gpio_shared_find_entry(struct fwnode_handle *controller_node,
    63			       unsigned int offset)
    64	{
    65		struct gpio_shared_entry *entry;
    66	
    67		list_for_each_entry(entry, &gpio_shared_list, list) {
    68			if (entry->fwnode == controller_node && entry->offset == offset)
    69				return entry;
    70		}
    71	
    72		return NULL;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
