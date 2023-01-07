Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4710E5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 01:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673054660; x=1704590660;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l/tJ3H1ZU+EbKo/iOGTJSzE/4zKxIQoPZdlXc4M2xZU=;
  b=b7AnKuJXZiyGxIAg45aZQ/vNN8qKOOBpekqI1MnMU6/x0Kq7DQ/ATAV7
   z+RBAzQIlYN/GSnrH2l6DtS5xfpq+2wGGMuAFW9RQi5Xh7z9Y7oDIm3YF
   GjSJcopnLeR0YWiJygjjt8a1info/FnnvlFv/+28iftN4LkrlwlSrhzhp
   Of76Y+N/5q4kxT0mytupjhUKjMAz8fZlzdyPQiaurJpWwK7ZWaHqXMwWE
   R0hCAHn+uvZUKb1zHIaG1Eg2XsLMKRqQzcp/9nznVfaFsCneOAbbXlG7A
   sCHIe33iXZUsMmEULfWlRaRg961WJkhfC4pJWpYiycA6D6F9vuc9hcu0z
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="310391929"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="310391929"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 17:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="686649169"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="686649169"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Jan 2023 17:24:18 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDxwT-00044M-2H;
	Sat, 07 Jan 2023 01:24:15 +0000
Date: Sat, 07 Jan 2023 09:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>, Paul E. McKenney <paulmck@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+258 bytes kernel size regression] [i386-tinyconfig]
 [c76feb0d5d] workqueue: Make show_pwq() use run-length encoding
Message-ID: <63b8c9a8.7l//Gw8ORC56zpoB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +258 bytes kernel size regression due to commit:

commit: c76feb0d5dfdb90b70fa820bb3181142bb01e980 (workqueue: Make show_pwq() use run-length encoding)
https://git.kernel.org/cgit/linux/kernel/git/tj/wq.git for-next


Details as below (size data is obtained by `nm --size-sort vmlinux`):

33e3f0a3: workqueue: Add a new flag to spot the potential UAF error
c76feb0d: workqueue: Make show_pwq() use run-length encoding

+-------------------------+----------+----------+-------+
|         symbol          | 33e3f0a3 | c76feb0d | delta |
+-------------------------+----------+----------+-------+
| bzImage                 | 495872   | 496096   | 224   |
| nm.t.show_pwq           | 193      | 363      | 170   |
| nm.t.pr_cont_work_flush | 0        | 45       | 45    |
| nm.t.pr_cont_work       | 0        | 44       | 44    |
| nm.D.linux_banner       | 155      | 154      | -1    |
+-------------------------+----------+----------+-------+



Thanks

