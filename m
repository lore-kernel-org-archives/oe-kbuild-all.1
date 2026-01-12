Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B524679F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 22:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256963; cv=none; b=epHWfxPxWZ1TaHqw1tUgWlUTZbmI8DLOIp3QF2cvDLaPiJG/V52Eu6BFWAk7wQkbTrBzusdf6QuSvVt6nFiqvDruvyYH2jkOe91X36YyMRmMTJrdOE73pnISZqShXdgNhDkOhfkFXIeY689US1hcxU50w1EgCJMCWZFaWEuaRlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256963; c=relaxed/simple;
	bh=QfunVFMyXqRch9u4+wBeRbp65OOMefhAax9+U3AtVM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NC/NBkkSWWGJdCM+CO1G1alK+x+DLmsXe548cuTsapkfv1I6cWrEhYTKXTDP5DAzRSiR7X2JX6ZPRyhUR/EBJ8mUf7vXXk9ugVlBe2x/dCl1zgol47PtyjOBMzO8pbBOFXWdrFbe/z8TJDU1xr7z8SRM28iJ7S8ddHZgyrdAf1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNsGqiZq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNsGqiZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768256963; x=1799792963;
  h=date:from:to:cc:subject:message-id;
  bh=QfunVFMyXqRch9u4+wBeRbp65OOMefhAax9+U3AtVM8=;
  b=UNsGqiZqZuGq8rYT/+Dk6dlH7ju0OYYVJZm0ZrOU9VGk26osiZhOYxFw
   KdyXzHc06bBWcoTcT+TL9ETDCbqC2mQtdx84S8nkR9DL8skEonevjop7M
   4YBXgapq4IQbkhy9a/Q4UHtUggjGxjtDVqrxLBejby4IuiIXgi9d5FjbH
   G7Ymc9z2lwmAWIgW38UPdwsvZahqutwx0Ojd7M7we0eTn3E9pEmtb+HwH
   7iOCQap/4LyperYoSd0j0IfV7hqfoyto5YU3msuAklAllBifSoOkavNZ9
   dxFfINjsjmUHNhiPMR9EC/pAoJk83cYaC1TRONQWOIAXJS3RnpedXTk8B
   A==;
X-CSE-ConnectionGUID: q3qtKiqbTm+r0NCW9zo4Gg==
X-CSE-MsgGUID: gZEUnkThQMuHNAI7ZJNTXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72121094"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72121094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:29:22 -0800
X-CSE-ConnectionGUID: eTW+HUWUR5yZLu2CK7YuIQ==
X-CSE-MsgGUID: Jwcs1lQ+TJGn9lSiB8M8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204865579"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 14:29:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQPW-00000000DwQ-1un7;
	Mon, 12 Jan 2026 22:29:18 +0000
Date: Tue, 13 Jan 2026 06:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 14/17] tcp_splice.c:undefined
 reference to `tcp_read_sock'
Message-ID: <202601130624.7EmlzZD7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: c7e6749fbcdb98f6dff42c48c59c72da58d6cf43 [14/17] tcp: Add splice-to-bvecq
config: i386-buildonly-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130624.7EmlzZD7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130624.7EmlzZD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130624.7EmlzZD7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/netfs/tcp_splice.o: in function `netfs_tcp_splice_to_bvecq':
>> tcp_splice.c:(.text+0x40e): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
