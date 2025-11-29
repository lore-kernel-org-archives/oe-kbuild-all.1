Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AC3C17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 17:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764436301; cv=none; b=hlk5Oz8/j1Qxv81AavBT82sleJlHIGvmmAo4ISLbOrnkC+utSasQwNzdBFJ0/mPHRtGsO+nJ5xh2lu6KA+jIujNbFRhei9KPJVRBbXd17aYssV74SDGNuQPX8+9yd7HW0Ux0ut8skau3GnIJVNzM8MUYkV/Xu4jmpuJRIFGNdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764436301; c=relaxed/simple;
	bh=flspDhsr0JpXN9NkT+mRr2noPvvsAJ+mDXLW2Tk4ioU=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=WrMX2IljnlWJMEJwqFFEKqLwN5Xi1gI8DJt+51kHy5pd+OmV15pYtzkdKu9/kBAY7I66+9dSKO4Xb767lieQpOM6ItsATFKfHfzM4tCGeZpAR9NKQKKvBy2fgg28SKHm5GvLLbLhcqbNjvRIT3VDgGw4xDazZjYq1LgfaXynBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=NYALs+/R; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="NYALs+/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgvExnjedzqs28Qy6/Xq6KkEhdf20nqil5/nrOWUmsI=;
  b=NYALs+/RoOrg1neYGSky6hW/9gVyFOWFVVx/+fHjm7pG3ahp153U1d7r
   renjSrbkaHa53mYwUDpcpHWNJIHLXL3WD3jg83qlN0jHAibVCU8uyxLZH
   2f3gTqmZXHxWQJXSve+K9hdXqcUMpnorjspNtmMB9st5oiMxyzu4NlIcW
   8=;
X-CSE-ConnectionGUID: Aa68ubkfQleLZdzZ4CMz2A==
X-CSE-MsgGUID: zrVzw6P4Tv26NUbYJ0uM+w==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.20,236,1758578400"; 
   d="scan'208";a="251898887"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 18:10:27 +0100
Date: Sat, 29 Nov 2025 18:10:26 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Conor Dooley <conor+lkp@kernel.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 21/25] drivers/pinctrl/pinctrl-mpfs-mssio.c:353:6-14:
 WARNING: Unsigned expression compared with zero: function < 0 (fwd)
Message-ID: <bf697f42-3127-eccc-bf76-8d94d97693db@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 30 Nov 2025 00:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [conor:pinctrl 21/25] drivers/pinctrl/pinctrl-mpfs-mssio.c:353:6-14:
    WARNING: Unsigned expression compared with zero: function < 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   88f8a28f2ada6391ae9be73b9973f921aca27a3b
commit: d1b023c3a5107668f367b2bfec08d721e2b2e7dd [21/25] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-r062-20251129 (https://download.01.org/0day-ci/archive/20251130/202511300058.NCOUIU43-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511300058.NCOUIU43-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:353:6-14: WARNING: Unsigned expression compared with zero: function < 0

vim +353 drivers/pinctrl/pinctrl-mpfs-mssio.c

d1b023c3a51076 Conor Dooley 2025-09-24  327
d1b023c3a51076 Conor Dooley 2025-09-24  328  static int mpfs_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel,
d1b023c3a51076 Conor Dooley 2025-09-24  329  				unsigned int gsel)
d1b023c3a51076 Conor Dooley 2025-09-24  330  {
d1b023c3a51076 Conor Dooley 2025-09-24  331  	struct mpfs_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
d1b023c3a51076 Conor Dooley 2025-09-24  332  	const struct group_desc *group;
d1b023c3a51076 Conor Dooley 2025-09-24  333  	const char **functions;
d1b023c3a51076 Conor Dooley 2025-09-24  334
d1b023c3a51076 Conor Dooley 2025-09-24  335  	group = pinctrl_generic_get_group(pctrl_dev, gsel);
d1b023c3a51076 Conor Dooley 2025-09-24  336  	if (!group)
d1b023c3a51076 Conor Dooley 2025-09-24  337  		return -EINVAL;
d1b023c3a51076 Conor Dooley 2025-09-24  338
d1b023c3a51076 Conor Dooley 2025-09-24  339  	functions = group->data;
d1b023c3a51076 Conor Dooley 2025-09-24  340
d1b023c3a51076 Conor Dooley 2025-09-24  341  	for (int i = 0; i < group->grp.npins; i++) {
d1b023c3a51076 Conor Dooley 2025-09-24  342  		u32 function;
d1b023c3a51076 Conor Dooley 2025-09-24  343
d1b023c3a51076 Conor Dooley 2025-09-24  344  		//TODO @Linus my new function being actually generic means that
d1b023c3a51076 Conor Dooley 2025-09-24  345  		// the mapping of function string to something the hardware
d1b023c3a51076 Conor Dooley 2025-09-24  346  		// understands only happens at this point.
d1b023c3a51076 Conor Dooley 2025-09-24  347  		// I think this is fine, because dt validation would whinge
d1b023c3a51076 Conor Dooley 2025-09-24  348  		// about something invalid, but it's the "catch" with my approach.
d1b023c3a51076 Conor Dooley 2025-09-24  349  		// The other option I considered was to provide a mapping
d1b023c3a51076 Conor Dooley 2025-09-24  350  		// function pointer that the driver can populate, but I think
d1b023c3a51076 Conor Dooley 2025-09-24  351  		// that's overkill.
d1b023c3a51076 Conor Dooley 2025-09-24  352  		function = mpfs_pinctrl_function_map(functions[i]);
d1b023c3a51076 Conor Dooley 2025-09-24 @353  		if (function < 0) {
d1b023c3a51076 Conor Dooley 2025-09-24  354  			dev_err(pctrl->dev, "invalid function %s\n", functions[i]);
d1b023c3a51076 Conor Dooley 2025-09-24  355  			return function;
d1b023c3a51076 Conor Dooley 2025-09-24  356  		}
d1b023c3a51076 Conor Dooley 2025-09-24  357
d1b023c3a51076 Conor Dooley 2025-09-24  358  		mpfs_pinctrl_set_pin_func(pctrl, group->grp.pins[i], function);
d1b023c3a51076 Conor Dooley 2025-09-24  359  	}
d1b023c3a51076 Conor Dooley 2025-09-24  360
d1b023c3a51076 Conor Dooley 2025-09-24  361  	return 0;
d1b023c3a51076 Conor Dooley 2025-09-24  362  }
d1b023c3a51076 Conor Dooley 2025-09-24  363

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
