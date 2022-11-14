Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3136EA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668385831; x=1699921831;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jCAWZTSZ8CsWtbOKUdOoYUJ/WZCiWdjknTwXmQCf34Q=;
  b=Se/SGq12wwGfdoKP04XPbfrP3+UmkMGa2HXREBultObS8ptVdIzyp0vs
   pZVTUJGSHEBK3Lx5ydA8DZrQCzU9nnlmk4aPncNhaWK/fbfaOhUnE90Oe
   mUVn+syixNE00wIgmXwuZIvyg5igTu8IH0BaYwb6V47BCQaCYr46c7hCa
   kUK7+DFZL/I7MBJMZJlyYVj4jyWeH8EZbVUg7HaziDdNVIsoVS98QhYtW
   dipYnL5G7fuzIgHN54kMD/nka2FLJYF4936KZukYlftV8viJ5AJ9d7UNB
   EsL4MBW7uyMgVwtb5wCDxHZ/W31p34SFm9iNnJK5wPHlma9Z+UOEkLE4D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="373980930"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="373980930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 16:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="701800759"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="701800759"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Nov 2022 16:30:27 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ouNMo-00062P-2p;
	Mon, 14 Nov 2022 00:30:26 +0000
Date: Mon, 14 Nov 2022 08:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+182 bytes kernel size regression] [i386-tinyconfig]
 [1c9493d6aa] fsnotify: prepare to report file access range
Message-ID: <63718c06.sG3VUUjQ2BEHn63J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +182 bytes kernel size regression due to commit:

commit: 1c9493d6aa6f8c21a9739cb5e13cf161e0b78008 (fsnotify: prepare to report file access range)
https://github.com/amir73il/linux fan_access_range


Details as below (size data is obtained by `nm --size-sort vmlinux`):

02304b12: fanotify: prepare for pre-modify permission events
1c9493d6: fsnotify: prepare to report file access range

+--------------------------------+----------+----------+-------+
|             symbol             | 02304b12 | 1c9493d6 | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 491648   | 491776   | 128   |
| nm.T.__rw_verify_area          | 22       | 103      | 81    |
| nm.t.do_dentry_open            | 578      | 640      | 62    |
| nm.t.remap_verify_area         | 0        | 43       | 43    |
| nm.T.iterate_dir               | 196      | 232      | 36    |
| nm.T.vfs_clone_file_range      | 266      | 298      | 32    |
| nm.t.fsnotify_file             | 0        | 24       | 24    |
| nm.T.vfs_dedupe_file_range_one | 272      | 295      | 23    |
| nm.T.rw_verify_area            | 13       | 32       | 19    |
| nm.T.kernel_read               | 42       | 55       | 13    |
| nm.T.do_clone_file_range       | 271      | 283      | 12    |
| nm.t.do_sendfile               | 558      | 565      | 7     |
| nm.T.vfs_iocb_iter_write       | 105      | 111      | 6     |
| nm.t.do_iter_write             | 136      | 142      | 6     |
| nm.T.vfs_copy_file_range       | 754      | 760      | 6     |
| nm.T.kernel_write              | 70       | 74       | 4     |
| nm.T.vfs_read                  | 288      | 291      | 3     |
| nm.T.vfs_write                 | 317      | 320      | 3     |
| nm.T.vfs_iocb_iter_read        | 107      | 108      | 1     |
| nm.t.do_iter_read              | 138      | 139      | 1     |
| nm.T.vfs_dedupe_file_range     | 478      | 459      | -19   |
| nm.t.fsnotify_access           | 22       | 2        | -20   |
| nm.t.fsnotify_modify           | 22       | 2        | -20   |
| nm.t.do_sys_openat2            | 143      | 121      | -22   |
| nm.T.vfs_fallocate             | 490      | 468      | -22   |
| nm.t.__rw_verify_area          | 97       | 0        | -97   |
+--------------------------------+----------+----------+-------+



Thanks

