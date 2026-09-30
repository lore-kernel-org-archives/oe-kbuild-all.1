Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A675172C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793646; cv=none; b=b7oaeAZQxDDGpXF57Rjb05u6rR7KfpYajAlFJ+3vDSv/Zg9/4qT/UyELSDPkbyRrSJH0oaa+fQ+T7AUbNe6K/1pZmcCRVj0SdOe3C8wKTjMOXl464AZ1UX2TPt1OHAzcJ1Fvhw4hp5CSVC0MHn7/B8pPlIJ49yP8tV9yEqlK6a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793646; c=relaxed/simple;
	bh=202FVV+piLQL8Lfvo6RQiPVsawg+Eqdmpw4OruI+5cw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hucNDUtpIWvfzJ+KHbApUVXWfcX/hl9rUFbGfQsQJdamPQybY9x1Ab3ZXcZP1bUh5vJwdGEmFYCBANur9aEHUeH0vYYtRk2zM3/9Qjx3AOiKBQpBlK0RWNlpMK5glKbzDBJvTGg5JqNMeyF4i76BKkqt/oJIMLiYsRNkLKewCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P11kEO14; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P11kEO14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790793644; x=1822329644;
  h=date:from:to:cc:subject:message-id;
  bh=202FVV+piLQL8Lfvo6RQiPVsawg+Eqdmpw4OruI+5cw=;
  b=P11kEO14zIHhMveDerCGwmMsYOImBFJo0HdhKgIpPLJ0JP5fGuWNujjv
   PuORTHRsUj9dxBP4TOJHkLv4v2OBd2Wd37NZwK/LMH+L1AafqPS+CXwf2
   jyz0lyi19zelfJbKgIu/baMACBy5bKzdh9oCkWQMFLncBzst0WmKzeGg0
   i2LySEg56oTo3BiwJTVW8N/l2mpvqlSSzQ/AkKxHkwFVLsm7dhOQDyi90
   o6/ORir2VBgJrPQcJEgBHZabIxwmDT16ZUXoVNzFZL4VZ/mjpfte1ym7F
   mO5ffPtWZXt17ShVqrZV7qtSehFjHnUfYcQveU8Xgv/Av+zf49aQhHyfA
   w==;
X-CSE-ConnectionGUID: JDemHF57RJuJmonBS6lArw==
X-CSE-MsgGUID: vJTgdg/sR6yluV5ID5mdeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90596713"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90596713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:40:44 -0700
X-CSE-ConnectionGUID: TlzzrpCwSie1pIcizcBx6g==
X-CSE-MsgGUID: 00d3HnClQuaz9IZ0cx7ORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275313646"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 11:40:42 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBzEO-000000001xj-13xy;
	Wed, 30 Sep 2026 18:40:40 +0000
Date: Wed, 30 Sep 2026 20:40:15 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 14/26] Warning:
 drivers/ctlv/tests/ctlv_test.c:52 struct member 'magic' not described in
 'ctlv_test_device'
Message-ID: <202609302008.s9ZtV9Ui-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: dc08a4758d45d2731b99d4bc6f4749d69a362bde [14/26] ctlv: Add the test family driver
config: arc-randconfig-r2301-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302008.s9ZtV9Ui-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302008.s9ZtV9Ui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302008.s9ZtV9Ui-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ctlv/tests/ctlv_test.c:52 struct member 'magic' not described in 'ctlv_test_device'
>> Warning: drivers/ctlv/tests/ctlv_test.c:52 struct member 'magic' not described in 'ctlv_test_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
