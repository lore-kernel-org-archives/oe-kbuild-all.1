Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481287E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Dec 2022 02:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672455290; x=1703991290;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Pv8oM3vDxtf4uLOOyOHx4MDz/fg3d2MIBVLvs8qErHk=;
  b=VCksgWuawtrusowh607ykp/ZNgx5nLpicpyYEJKQW947eqccxpX8mFo7
   vZVrUGxIIdWE3TNl1BSu+DYxO+06UPRyxxSpH2kJibeUd98JFYta+v9Du
   sCcnop9IIY/hK+MFn8TUXENpDhj9Rlzw7n1nkV88Tl0swpPZlpTicQsQI
   SSn8onJThE52QDWbSytnp1DZXdVAmmvj2fdcobzcL5jeuBJEfabIA4GPN
   1f+nPaVr98uwE8zf4qg1l/RFhLJwemUwCM4N0H9b578z7J4ljcYzKPgf5
   TIO0LbylUbc19gClED8pa8yjqjkIOm0Kkh/KzQsN88O6GtmHQaWKnNzG+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="322513869"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="322513869"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 18:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="717311626"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="717311626"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Dec 2022 18:54:48 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBS1H-000Mth-0X;
	Sat, 31 Dec 2022 02:54:47 +0000
Date: Sat, 31 Dec 2022 10:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Darrick J. Wong <djwong@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1926 bytes kernel size regression] [i386-tinyconfig]
 [affcd6e113] vfs: introduce new file range exchange ioctl
Message-ID: <63afa44a.yKxfRr0YKS84RXOY%lkp@intel.com>
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

commit: affcd6e1138c6be71b1ba5d2c05df93a4aa4c68f (vfs: introduce new file range exchange ioctl)
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching


Details as below (size data is obtained by `nm --size-sort vmlinux`):

c284a1b4: xfs: move symlink target write function to libxfs
affcd6e1: vfs: introduce new file range exchange ioctl

+------------------------------------------+----------+----------+-------+
|                  symbol                  | c284a1b4 | affcd6e1 | delta |
+------------------------------------------+----------+----------+-------+
| bzImage                                  | 495808   | 497024   | 1216  |
| nm.t.generic_xchg_file_range_checks      | 0        | 1056     | 1056  |
| nm.T.do_xchg_file_range                  | 0        | 283      | 283   |
| nm.T.generic_xchg_file_range_prep        | 0        | 210      | 210   |
| nm.T.generic_xchg_file_range_check_fresh | 0        | 107      | 107   |
| nm.t.ioctl_file_xchg_range               | 0        | 96       | 96    |
| nm.t.xchg_range_verify_area              | 0        | 81       | 81    |
| nm.T.vfs_xchg_file_range                 | 0        | 46       | 46    |
| nm.t.do_vfs_ioctl                        | 1516     | 1554     | 38    |
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

