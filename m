Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881464AA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786829074; cv=none; b=cmIw8fSA4ZmYHtk+5qJnKLTMqgzzSkiulHyHXqUj2bS8V/WWdKlovehpboJq36X+ryj6o+BVuDkNyzrpHe+NKXN1JVf/YzbxBLZTW+OIOW31FshliXhMvJiFiBA9dlJMGhZumrAoudZcBRZ0KerAxZcLB1e7qH3M6tiUXp1B500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786829074; c=relaxed/simple;
	bh=l/ctlQa6dwGwHNkmZ8wzY29h7VzY39BRkzpEvIXoTI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZVp3Flmn5EPFTr8YJNs0uiiEND6WauRS++GCgsLzYQP0E99IgQFA4qLTe7KYNC9JBhGuYfy/MB9u0SYhgVSB5OJrfXwnpT9hRLQz4AQmooWXcC/Tl6zQqoOGNKTjxH9GswFvz5hMf189t+SD5GZINruAgg4O5TEpOHhTPISIhi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNPxG0bW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNPxG0bW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786829073; x=1818365073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/ctlQa6dwGwHNkmZ8wzY29h7VzY39BRkzpEvIXoTI8=;
  b=VNPxG0bWEvOt4fvCdYQsjzGncsnlbp1/ZtmxKv657Gvnl0ztjH9MrO8C
   x83Xn14W3FkOcqmzvAQ0CQ7aPPIwVe8v+l6g/HDqB+uEy1d4w/mOCMwYw
   68QMVKWlex7nv2hIaXAKfyzGOUiqpYVXiBTm+BYL2KoYqAFRtr04WVvOn
   0XayIHdACdjrsjtA91OGskDx9wip4FxQQ7BXO6aKwTFZ6LFEQElcAvsUx
   CjaXQx2FElzhpBAwPql9bfPl2+Du0L6lzUmQLeav5Qgfmp//dQUGChjUN
   PMyh8SN3DIAxMHHuY98Wa4RAkKxKCVQnB2rY4lkmkOXKKzsWbmnulOq+A
   g==;
X-CSE-ConnectionGUID: pwHgwKLHQHylyUXizCVgsQ==
X-CSE-MsgGUID: hVrD6PHnSKyCMWoBI9/yjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87283886"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87283886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 14:24:32 -0700
X-CSE-ConnectionGUID: YduuWt58QpiC8TB5iwkfPw==
X-CSE-MsgGUID: Lv8nlWEkQCWJNM6YlvHUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="258325582"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2026 14:24:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvLrf-00000000cUo-3q58;
	Sat, 15 Aug 2026 21:24:27 +0000
Date: Sun, 16 Aug 2026 05:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 1189/15435] apparmorfs.c:undefined
 reference to `zstd_get_frame_header'
Message-ID: <202608160539.MWmtJjnG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [1189/15435] apparmor: Initial support for compressed policies
config: i386-buildonly-randconfig-005-20260816 (https://download.01.org/0day-ci/archive/20260816/202608160539.MWmtJjnG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160539.MWmtJjnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160539.MWmtJjnG-lkp@intel.com/

Note: the linux-next/master HEAD 4477a78374a57c3809b172ad30cceabda48c47c6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: security/apparmor/apparmorfs.o: in function `aa_get_data_from_compressed.constprop.0':
>> apparmorfs.c:(.text+0xe6c): undefined reference to `zstd_get_frame_header'
   ld: apparmorfs.c:(.text+0xeaa): undefined reference to `decompress_zstd'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
