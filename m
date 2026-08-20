Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E787478
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200498; cv=none; b=VL1UpWoz0xL4P6vygzkQ3RxW+IIYx8a2Ufnu5k8peOg2gZG/+E8nO+YZ1NmtlZmA6o43Sfx0wQLhG6sISqMf9o4zxgj2+5lkgifqa3AMMppTJEKoI4xzTX7OFoVrbBKgS+GH740GupfFHoHtCu0jMnlQTIX/1gQPD5miFtspHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200498; c=relaxed/simple;
	bh=412sh5o7plo18o9iPtBUWJ8WGk3ceT+1bg1IDAIqFQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qvH7FcP8gpCDJHCMLIEISc31//2iXqeadLXU51uw4T75dNzxC1FGz8fff89HwRMHCCqsJTvSBKbUv5PBC48Gx5KOZQwFeCYTVX11Up8K2Qw2qDpUWg6MXj38uoP7CaJUWwM+HEgeOrLygpmxwA75tmZAyzv/AJltqKoZ1gEk2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1XrD/qg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1XrD/qg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787200496; x=1818736496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=412sh5o7plo18o9iPtBUWJ8WGk3ceT+1bg1IDAIqFQM=;
  b=M1XrD/qgKhRAaMVEv+jGexYHbORcOmoKtIci4NTQ+lw4jZscXcf1p+Vx
   IQR+MdzIJ0qLSkhZa+NR2+D1hs2PDT2gYQVwSPRSYcsw8aS+n16lUKQGH
   OjtdX+4KUK+Oh/rhNrWe57FPm4sf6kXspg/M53aArp1r4jsBDNY+w4Ko3
   8WUW54l0swu1oJIM3qwHsbA5c021BlkJWbp+zoiYocGeZT2WHf+q/NtxF
   sXoivDhMLiEb9qeM0BDansdjohs1Zu4NJxCrAOKVUgoOyzVuNkW2/bWTf
   TLpnYA/rdQpyCH6kV/rUibSD6DE2oRJ4cPa+zJ/VwcNu9beUvyJSFQpKN
   g==;
X-CSE-ConnectionGUID: pfbS+H/4Ta+tjj9qgXc61Q==
X-CSE-MsgGUID: UGR9u/gNQ0eitvSwARHZBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87740704"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87740704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 21:34:56 -0700
X-CSE-ConnectionGUID: e2WZJekpSiC6AUEdTwHeCg==
X-CSE-MsgGUID: XegpZ9mvTRGvTObrCxAAVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="270078321"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Aug 2026 21:34:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwuUO-00000000hmt-2XiH;
	Thu, 20 Aug 2026 04:34:52 +0000
Date: Thu, 20 Aug 2026 12:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 19/46] ERROR:
 modpost: kernel/time/time_test.ko: symbol '__divdi3' undefined!
Message-ID: <202608201227.IPy9YTq6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   c2c4c41975b73f849b3e42b958a7af64cfbc4cbb
commit: 55ba1b7d3f0bddc06828578aad70b82a19887104 [19/46] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260820/202608201227.IPy9YTq6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201227.IPy9YTq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201227.IPy9YTq6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: kernel/time/time_test.ko: symbol '__divdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
