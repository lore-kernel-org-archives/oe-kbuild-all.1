Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466661849
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673082211; x=1704618211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=thedu7rr3npNcOqLzJhSEnHKvP4JT3oq9v2liFbf8QA=;
  b=hkuCY+DI7oMROmNHxk4JxBN36GoQkAYRo+u5vifKpId+B6rcJmg4MTvt
   tNL7rR/7s/yjxm7GmQf5D6fdcBN6IvjwWTHw5XL0h3hKwK/gXH9ovn0Pc
   oJvpsMbcaoOqy5P/eaxNlz3EeOXGLF43yKcmvkXVxJ7vk7PdxU50gGm1H
   zwTVCWfHmddMmlEkBv+s0OVF9fOKI6tUfdj+MUWS8qEZdFOt1qfrTH0jt
   owl8W5D++Tapx0QnUTXdXoY01s+J7k6xI9zck39FFepyj+38O+RpMtvfC
   BKUgrybIz9RSsoZAtHK2BVDFpr9zXzxk9yZYbrHTk+Kpa+a2ZN2NDsu1v
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="302323119"
X-IronPort-AV: E=Sophos;i="5.96,308,1665471600"; 
   d="scan'208";a="302323119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2023 01:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="830139447"
X-IronPort-AV: E=Sophos;i="5.96,308,1665471600"; 
   d="scan'208";a="830139447"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Jan 2023 01:03:27 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pE56s-0004RM-0b;
	Sat, 07 Jan 2023 09:03:26 +0000
Date: Sat, 07 Jan 2023 17:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Paul E. McKenney <paulmck@kernel.org>,
 Feng Tang <feng.tang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+64 bytes kernel size regression] [i386-tinyconfig]
 [78532abaf5] x86/tsc: Add option to force frequency recalibration with HW
 timer
Message-ID: <63b93549.zVwVAqMScLqdk2+g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +64 bytes kernel size regression due to commit:

commit: 78532abaf5f1c973c99680960ae22bd797951ddf (x86/tsc: Add option to force frequency recalibration with HW timer)
https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git workqueue.2023.01.06a


Details as below (size data is obtained by `nm --size-sort vmlinux`):

8913f44d: clocksource: Permit limited-duration clocksource watchdogging
78532aba: x86/tsc: Add option to force frequency recalibration with HW timer

+----------------------------------+----------+----------+-------+
|              symbol              | 8913f44d | 78532aba | delta |
+----------------------------------+----------+----------+-------+
| bzImage                          | 495904   | 495968   | 64    |
| nm.t.tsc_setup                   | 103      | 129      | 26    |
| nm.t.init_tsc_clocksource        | 111      | 132      | 21    |
| nm.t.tsc_refine_calibration_work | 427      | 440      | 13    |
| nm.d.tsc_force_recalibrate       | 0        | 4        | 4     |
+----------------------------------+----------+----------+-------+



Thanks

