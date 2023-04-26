Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498931859
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682493340; x=1714029340;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=UYXppCWknUYIn5fxRDBmk84OE2J5qyAdjipqXW8MwXs=;
  b=hlX2UOtH0zGrNjKY8T4H9oGo7lZuDOLLM34JWXOUEmFgEXhWvjWCDlJD
   UjA01zQ86DLzAhEoqGeROzewMhwFkPhA4XzOOhylZAWvLXcBmFGYnrAFj
   4FcwtDzCI1HgOYQ0TYgBPa4PzYy7koKX0Cbq/zgEISOA7bDu33AWqxTps
   x+9EXXXCeVJyoJbTwvzCtlN262w1O4w+OBt9ljLaGnqtSjGHB5Y1JxRyr
   ZpNv/PIbTP4Z+w4ltm7eK+S90Hm8avk1sN1xrMsx6D/BmxNZswjZuEMDE
   3dF2V07ChkXeYtDeXCYngDrGTw7gsWqtUa7oPrTx4mFlW4IJbPof3FjAr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326635028"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="326635028"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 00:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="868171463"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="868171463"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 00:15:38 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prZNJ-0000Fk-1e;
	Wed, 26 Apr 2023 07:15:37 +0000
Date: Wed, 26 Apr 2023 15:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Wang <hui.wang@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+82 bytes kernel size regression] [i386-tinyconfig]
 [5fab44501b] mm/oom_kill: trigger the oom killer if oom occurs without
 __GFP_FS
Message-ID: <ZEjPaZrdrSAv8ONy@5ea6bc24b18e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426051030.112007-2-hui.wang@canonical.com>


FYI, we noticed a +82 bytes kernel size regression due to commit:

commit: 5fab44501b62e2132235cb0a88c5cb8e0481ff09 (mm/oom_kill: trigger the oom killer if oom occurs without __GFP_FS)
url: https://github.com/intel-lab-lkp/linux/commits/Hui-Wang/mm-oom_kill-trigger-the-oom-killer-if-oom-occurs-without-__GFP_FS/20230426-131239
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20230426051030.112007-2-hui.wang@canonical.com/
patch subject: [PATCH 1/1] mm/oom_kill: trigger the oom killer if oom occurs without __GFP_FS


Details as below (size data is obtained by `nm --size-sort vmlinux`):

25aab2ea: Merge branch 'mm-nonmm-unstable' into mm-everything
5fab4450: mm/oom_kill: trigger the oom killer if oom occurs without __GFP_FS

+------------------------------+----------+----------+-------+
|            symbol            | 25aab2ea | 5fab4450 | delta |
+------------------------------+----------+----------+-------+
| bzImage                      | 502464   | 502560   | 96    |
| nm.T.out_of_memory           | 430      | 467      | 37    |
| nm.t.trigger_oom_killer_work | 0        | 29       | 29    |
| nm.d.oom_trigger_work        | 0        | 16       | 16    |
+------------------------------+----------+----------+-------+



Thanks


