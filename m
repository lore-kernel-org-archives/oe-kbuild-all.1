Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5147276B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564961; cv=none; b=VXJigQnngiVq9FARYhH3E89BQLVxXVHIwwHVaAek1wKAh81yH+JoqhdyBTf1PzneySW7ReG8oO0OwFzNT/oinoUbsJNrBgBl5SNw2vOT7n2WpIpqeJDXfnYi9CGLGtbP4AlmMQrJiRuiBVBMVFOy4CnMEFEZ7htOmmXHS9juNeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564961; c=relaxed/simple;
	bh=d4nPnv7EX0gkC5nj7dq6LqIQIFD/qBzh74DFrc6HpQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y49WasUNZB3fhuxlnsheDbskjTk0TUoYkpGd6pOq99y5ly8YNaJj5t+eAIkgywQ/2vVq3fyQdrUJmYvCwjndx2OFA60VhDJn+Dso0Y6KhaQV+X+vWNVnoi89xqeyVWSBvyb7KXCIRNBpWTjdohxG54XWcig36hNqvHGuA7FGnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V80TapwX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V80TapwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777564960; x=1809100960;
  h=date:from:to:cc:subject:message-id;
  bh=d4nPnv7EX0gkC5nj7dq6LqIQIFD/qBzh74DFrc6HpQo=;
  b=V80TapwXbOO9p3kI0sMg18DpWvom9Nh1YpJxCDwcLvNVnYbVOS8URWt1
   A+xbLQaIShl7Z5hqFzbn+q7c7afIaav3oFk+XzNLdvVtZRLr56id8oX25
   9iVo2WPJ1ZjhzRfkb+KVQzrKITD1M5qK5d3dVikyWrAq9pMUrDFCiV8e9
   CD2qh2tXifcccc6XlAcc92nuthIz9OEmUhR8mj9T2iTVzFTOeRBhiXozc
   7QfSAwd7rE71LqeUCJ26s3GQFRDdrzIpaRcrYoziRsB71uOqr+OFjGqsg
   OuRgw7qqETA+gsVVdmYVHjUSpErueYuAU3wjWOJ//QXcSQ9OMNtB7lcBo
   w==;
X-CSE-ConnectionGUID: 7UlKFHgqSse2pVJALmIgxg==
X-CSE-MsgGUID: 97xHUzrpSAG5rrd9SouV+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="88835664"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="88835664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 09:02:40 -0700
X-CSE-ConnectionGUID: gSoA2tx2RMC1y2uIxilB1Q==
X-CSE-MsgGUID: rlDtiZDvTKeRJkBPTujjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231971916"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 09:02:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wITqV-000000004qr-3alb;
	Thu, 30 Apr 2026 16:02:35 +0000
Date: Thu, 30 Apr 2026 18:02:28 +0200
From: kernel test robot <lkp@intel.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/miscdevice.h:89:32: error: field 'fops' has
 incomplete type
Message-ID: <202604301743.JW3m2oP8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/char-misc-Simplify-locking-with-guard/20260427-231042
head:   a108f6242a528b7f829f7e2aefd51355c06848bb
commit: ccfedb0a2f5cbe99e74cc676d316f35195e82f90 char: misc: Introduce misc_sync_register()
date:   3 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604301743.JW3m2oP8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301743.JW3m2oP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301743.JW3m2oP8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/hpet.c:14:
>> ./include/linux/miscdevice.h:89:32: error: field 'fops' has incomplete type
      89 |         struct file_operations fops;
         |                                ^~~~


vim +/fops +89 ./include/linux/miscdevice.h

    83	
    84	struct miscdevice_sync_ctx {
    85		int minor;
    86		struct kref kref;
    87		const struct file_operations *orig_fops;
    88		struct list_head list;
  > 89		struct file_operations fops;
    90	};
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
