Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C252CAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Dec 2022 19:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671390506; x=1702926506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5mySaiyetTn1SKqzEs5uF6CmagO38FPppyiHs30iVI8=;
  b=No6/tEq4EscZo/cQfda8Awdk2G0eg2UhzMEyl0cEEVX1oZ+zcetgHpyt
   2/oAzItUqq+rnMJd0QWoIonDKROpRFEnV47r0//QZ1XVHpTnVfrGo7lH0
   nZzSEE9a4Gr4FAmGi+dPmKnMnTdfNux/oaie/gdBPCn0mJ9xm+G2NWWt8
   wxvliKL28vfKiI3glWjCfjvFcIwuoJuTdvruxfKYp29GvKyh0Pq7zUP+X
   8k8sYjtRf14rGTMgq0BpFTdHB1/9mkCrqvkW0+HChYZb46i4nFNQqCaJY
   t59GIoh7gw8lQSY0hRVZXEHl5CMsghpwq701l6X/ZOxDQfoEeYMVAjN/R
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="346319675"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="346319675"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2022 11:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="652486620"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="652486620"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Dec 2022 11:08:24 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6z1L-0008Pq-28;
	Sun, 18 Dec 2022 19:08:23 +0000
Date: Mon, 19 Dec 2022 03:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Darrick J. Wong <djwong@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1926 bytes kernel size regression] [i386-tinyconfig]
 [176cfe125b] vfs: introduce new file range exchange ioctl
Message-ID: <639f650c./ICPlhi5H+Eh/qBp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +1926 bytes kernel size regression due to commit:

commit: 176cfe125b72ab6051cbac08bb4df700725dd380 (vfs: introduce new file range exchange ioctl)
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching


Details as below (size data is obtained by `nm --size-sort vmlinux`):

4fe8806a: xfs: move symlink target write function to libxfs
176cfe12: vfs: introduce new file range exchange ioctl

+------------------------------------------+----------+----------+-------+
|                  symbol                  | 4fe8806a | 176cfe12 | delta |
+------------------------------------------+----------+----------+-------+
| bzImage                                  | 491648   | 492768   | 1120  |
| nm.t.generic_xchg_file_range_checks      | 0        | 1056     | 1056  |
| nm.T.do_xchg_file_range                  | 0        | 283      | 283   |
| nm.T.generic_xchg_file_range_prep        | 0        | 210      | 210   |
| nm.T.generic_xchg_file_range_check_fresh | 0        | 107      | 107   |
| nm.t.ioctl_file_xchg_range               | 0        | 96       | 96    |
| nm.t.xchg_range_verify_area              | 0        | 81       | 81    |
| nm.T.vfs_xchg_file_range                 | 0        | 46       | 46    |
| nm.t.do_vfs_ioctl                        | 1508     | 1546     | 38    |
| nm.T.generic_xchg_file_range_finish      | 0        | 35       | 35    |
| nm.T.do_clone_file_range                 | 271      | 276      | 5     |
| nm.d.bad_file_ops                        | 136      | 140      | 4     |
| nm.D.def_blk_fops                        | 136      | 140      | 4     |
| nm.D.def_chr_fops                        | 136      | 140      | 4     |
| nm.d.empty_dir_operations                | 136      | 140      | 4     |
| nm.d.empty_fops                          | 136      | 140      | 4     |
| nm.D.fscontext_fops                      | 136      | 140      | 4     |
| nm.d.full_fops                           | 136      | 140      | 4     |
| nm.D.generic_ro_fops                     | 136      | 140      | 4     |
| nm.d.memory_fops                         | 136      | 140      | 4     |
| nm.d.misc_fops                           | 136      | 140      | 4     |
| nm.d.no_open_fops                        | 136      | 140      | 4     |
| nm.d.ns_file_operations                  | 136      | 140      | 4     |
| nm.d.null_fops                           | 136      | 140      | 4     |
| nm.d.perf_fops                           | 136      | 140      | 4     |
| nm.D.pidfd_fops                          | 136      | 140      | 4     |
| nm.D.pipefifo_fops                       | 136      | 140      | 4     |
| nm.D.ramfs_file_operations               | 136      | 140      | 4     |
| nm.D.random_fops                         | 136      | 140      | 4     |
| nm.D.simple_dir_operations               | 136      | 140      | 4     |
| nm.D.urandom_fops                        | 136      | 140      | 4     |
| nm.d.zero_fops                           | 136      | 140      | 4     |
| nm.T.vfs_fadvise                         | 48       | 51       | 3     |
| nm.t.ioctl_file_clone                    | 142      | 136      | -6    |
| nm.T.__ia32_sys_ioctl                    | 101      | 87       | -14   |
| nm.T.vfs_clone_file_range                | 231      | 133      | -98   |
+------------------------------------------+----------+----------+-------+



Thanks

