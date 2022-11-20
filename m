Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C4A57
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Nov 2022 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668958081; x=1700494081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g8+LxKrpwfAXrexlFvcPAn5gUe9xfJ2OM9KUc7FzvRQ=;
  b=KQeifCH9eHBSZtBsUzHvfnc2l2Wm0aOlkqe6mPSAnWm21lGU56KgS4RZ
   tA7SkOvfGXew/Y1ZtGr++OSzpRiOdlGMuJEakO59zpHR7KjaAFXZ9adwF
   k08hWVRkl5k6+XIBneaKbWzLAlm0dUuJnAq9ZKKp8nAyG5sYsXZJGtDnW
   Y/CeWdpedH6odYSmLH0MIfE5+m4YpXryoueReZKQw5l53ez9se68w19DJ
   HMVL9gnUFfmJC11O9XmecY4cbAwV5Kvif+5JdJacBtb+2r7Ecln3qDdyy
   Va0ThhHAJDOLo56WcfmElSeJoWu6W+gv+41n+o7zA8DO2XQgQ7upU4LZp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="312107309"
X-IronPort-AV: E=Sophos;i="5.96,179,1665471600"; 
   d="scan'208";a="312107309"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 07:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="885839095"
X-IronPort-AV: E=Sophos;i="5.96,179,1665471600"; 
   d="scan'208";a="885839095"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Nov 2022 07:28:00 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owmEh-0002yf-1S;
	Sun, 20 Nov 2022 15:27:59 +0000
Date: Sun, 20 Nov 2022 23:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+72 bytes kernel size regression] [i386-tinyconfig]
 [a0fe8a93f1] softirq: Context aware timeout
Message-ID: <637a4766.O6dS4HNJrSHwnxw1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +72 bytes kernel size regression due to commit:

commit: a0fe8a93f158a4e821adfeef1d1759136c2177f6 (softirq: Context aware timeout)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git core/softirq


Details as below (size data is obtained by `nm --size-sort vmlinux`):

6b3ad2a2: softirq: Allow early break
a0fe8a93: softirq: Context aware timeout

+----------------------------+----------+----------+-------+
|           symbol           | 6b3ad2a2 | a0fe8a93 | delta |
+----------------------------+----------+----------+-------+
| bzImage                    | 491584   | 491744   | 160   |
| nm.T.__do_softirq          | 383      | 450      | 67    |
| nm.t.__softirq_needs_break | 49       | 54       | 5     |
+----------------------------+----------+----------+-------+



Thanks

