Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8AF7C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 02:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667444154; x=1698980154;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=lAtMqj5OKkXWKPV9cia6mvwgh5L0k4KaH7IMEc2qpmc=;
  b=EVKn1JS4MQ8zE+r7JIpkrYV+r7q21tN1OLSHU0XWaNifoP6TzXMDuPox
   D/InkRgSvu/Hf67GculQ96b671j55NysWWB4x/0vVOqQj9P7lOG7n6iq1
   uMKgOfJls+pKF4e5DMWGAxWIMcV/L0EmcQz2ff3y5OBfDln3PuV5/Wrw2
   RbPb7xguf0RoHU2qqeG2568bbsbN+DGM37QW7BTkeVrUC8zeZmbZ3/mTh
   GaJ+t7vy3fFkca242jvMIf6UHTJzj6mDb3KuiwFUg7LPcxkUh3ajxkF5x
   i+oWH5VKCA8bDHSTS0TBxmK72uMvmbDWozj/iLConYBs3NI/25f8+8ICD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="373799114"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="373799114"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 19:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585627967"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="585627967"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2022 19:55:52 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqQOV-000FO5-2l;
	Thu, 03 Nov 2022 02:55:51 +0000
Date: Thu, 3 Nov 2022 10:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+360 bytes kernel size regression] [i386-tinyconfig]
 [a3cbd790ac] mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts
Message-ID: <Y2Mts96+N0TMFp90@3c1188ed3aac>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b42bd1a-8223-e827-602f-d466c2db7d3c@google.com>


FYI, we noticed a +360 bytes kernel size regression due to commit:

commit: a3cbd790ac6e9d8f6d63731647a8123d0fdc69a8 (mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts)
url: https://github.com/intel-lab-lkp/linux/commits/Hugh-Dickins/mm-huge-rmap-unify-and-speed-up-compound-mapcounts/20221103-095502
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/lkml/1b42bd1a-8223-e827-602f-d466c2db7d3c@google.com
patch subject: [PATCH 3/3] mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts


Details as below (size data is obtained by `nm --size-sort vmlinux`):

74c6c283: mm,thp,rmap: simplify compound page mapcount handling
a3cbd790: mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts

+--------------------------------+----------+----------+-------+
|             symbol             | 74c6c283 | a3cbd790 | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 491584   | 491712   | 128   |
| nm.T.page_add_anon_rmap        | 100      | 209      | 109   |
| nm.T.page_add_file_rmap        | 39       | 143      | 104   |
| nm.T.page_dup_compound_rmap    | 0        | 69       | 69    |
| nm.T.page_remove_rmap          | 87       | 151      | 64    |
| nm.t.page_dup_file_rmap        | 0        | 28       | 28    |
| nm.t.lock_compound_mapcounts   | 0        | 13       | 13    |
| nm.t.unlock_compound_mapcounts | 0        | 13       | 13    |
| nm.t.__page_dup_rmap           | 40       | 0        | -40   |
+--------------------------------+----------+----------+-------+



Thanks


