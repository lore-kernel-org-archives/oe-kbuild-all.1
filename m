Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC342941A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 00:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467746; cv=none; b=AfI6FdR2JAUqv+RsdFh3XGBVb+fQ+OxTfnUrxYhtw2VXnN944UWIYLjLbXE2aYn597ZP8AHsPascLZDd1nkoinz6MG1G+nz9yDjeofor7m6SovXCAeeo1JpcMDgFdRV6ALz4f3Ssg2f9XH0BQTfuUwtv+oqyDJ3a54MzzNaEUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467746; c=relaxed/simple;
	bh=ANLZsfjxVXmRZH91UgZTJ0UvSJRqWNSZCwnTELX9vAs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p72JyCP9lHyK2STHMsYxvcM8f97GHA6VBUk/6FfoTMPKA25sDp/JRhEZn9UT7VRnUH4ldoIh5RzNHnVZuiFXix6A+9F7VuKSf5HF9hnG490z6dkBVMlCyku2NvKJ9IywLKxaE/hxDYd//aJis/1yEhiy0RaWeH52n8Q5LdKPesg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhcwTbgV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhcwTbgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790467744; x=1822003744;
  h=date:from:to:cc:subject:message-id;
  bh=ANLZsfjxVXmRZH91UgZTJ0UvSJRqWNSZCwnTELX9vAs=;
  b=jhcwTbgVf9v27jwgyYSGBq0Vdalnt0oocfsdS4HQrk9kg1jcKngmP9bd
   oucNKMXsU3Z7n1Styk+sIrinOAhTXrJX+XAZDmN13jxIAD80yMhaFlkmh
   bey2vqsCcRXBLg14Rv6fwNVUA+ronaI5GoIDnmKggXTBBgtzJIEOju9kW
   FGIxcm1arEjKgaIq0w50dUroxljblGO6EhTNdRJiSzB3c9sv3OcW0SbIt
   9c0O30J7yk10P5D0qz9XGMHnCiyml4b1AXzNE6HXrcoZAgXGWVjYediAc
   d6jfTdGHxySIdssQ0GikF50clKy/8EgjArtsRRXiC8CvrMS4Qo5JcS2uW
   g==;
X-CSE-ConnectionGUID: Y8rayWbmQyO4fOOifHgB8g==
X-CSE-MsgGUID: Opt+FFcTQ0eLPVMtqSDQtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90166009"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="90166009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 17:09:03 -0700
X-CSE-ConnectionGUID: V3duU6AwQEqan4Mm7ItUZA==
X-CSE-MsgGUID: FtdbHGehTzWLCmBiVBZDPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274811858"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2026 17:09:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAcRu-00000000MIH-3qfa;
	Sun, 27 Sep 2026 00:08:58 +0000
Date: Sun, 27 Sep 2026 08:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dinguyen:dw_apb_timer_defer_probing_v1 1/1] WARNING:
 modpost: vmlinux: section mismatch in reference: dw_apb_timer_init+0x79
 (section: .text) -> register_current_timer_delay (section: .init.text)
Message-ID: <202609270707.TU2A0JUW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git dw_apb_timer_defer_probing_v1
head:   3fed97ebe7aac47be0435f65a76ff0a7e3672771
commit: 3fed97ebe7aac47be0435f65a76ff0a7e3672771 [1/1] clocksource/drivers/dw_apb_timer_of: Add deferred probing
config: arm-randconfig-1000-20260927 (https://download.01.org/0day-ci/archive/20260927/202609270707.TU2A0JUW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270707.TU2A0JUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270707.TU2A0JUW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: dw_apb_timer_init+0x79 (section: .text) -> register_current_timer_delay (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
