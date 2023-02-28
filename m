Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD863C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677599990; x=1709135990;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E2SPsqI7IDpBNfWUeZOaVuBBT1WlWC6lfscUeSuvHAQ=;
  b=Dcx/50GFqvA48oaT00FnTo3Q9It5Zk+RmabLfktTIhIw19e8m/4wcs1h
   /4XqfzyBeY/nOsnSTtUfIZ96oIUxOXDqZyQNnWIXGKklxaueSUcYp3FBL
   u2/0cR6hzQIgsCmcpUXQQkVl7s8uUV+Pp4xlp7MbF1cF78ABr1WKhaSm4
   WVOIVL5WhopUxMuyWda95hYes3UEt61qKEaVgWw4v12mZkmYXry2eQd4n
   Dpzo+aBEJ1w4ZJgdvkUuzkvRwgOBAr9pSoVtOO8XK2S0mPN+j207mDCnD
   MwCsXDpwsOZCuf0UFZlHlYtFfYB7KLPtFFetCv5SIwYCVSFVQ1rkbC309
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314595723"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="314595723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 07:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="624081551"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="624081551"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Feb 2023 07:59:44 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX2OB-0005V1-16;
	Tue, 28 Feb 2023 15:59:39 +0000
Date: Tue, 28 Feb 2023 23:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+92 bytes kernel size regression] [i386-tinyconfig]
 [212b3a6f7d] atomics: Provide rcuref - scalable reference counting
Message-ID: <63fe24df.ZGvPau3EQ+EDjGtp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +92 bytes kernel size regression due to commit:

commit: 212b3a6f7d18535cb6b745193608bf2ffaf111b9 (atomics: Provide rcuref - scalable reference counting)
https://github.com/ammarfaizi2/linux-block tglx/devel/rcuref


Details as below (size data is obtained by `nm --size-sort vmlinux`):

cb0a6575: net: dst: Prevent false sharing vs. dst_entry::__refcnt
212b3a6f: atomics: Provide rcuref - scalable reference counting

+--------------------------+----------+----------+-------+
|          symbol          | cb0a6575 | 212b3a6f | delta |
+--------------------------+----------+----------+-------+
| nm.T.rcuref_put          | 0        | 66       | 66    |
| bzImage                  | 496000   | 496064   | 64    |
| nm.T.rcuref_get_slowpath | 0        | 26       | 26    |
+--------------------------+----------+----------+-------+



Thanks

