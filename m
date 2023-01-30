Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034420E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675079826; x=1706615826;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5v9Xivy4KHAmPx0t2xYj5FERSFAmdf0IVdryGqXEA8M=;
  b=kunmfPr6g/WstiGfi0kW0PIov/N3AVvlo3YR0WfEk0FfGkGfMY7R2P2o
   mO5pdI8ZaRrPqqCYB2WJAc66CGHpgOBSBe9lHLG0WIgsU5MHFTgmdP4yv
   8wzaVW9L0ColR8/MZDPICBgro3pz7pVrdnHadlprwDbv5V0rZjiOzQKmr
   2hE6LMAUZgF37Vk0SkOV5cE1CCQ5MZuutacHqAGc526//bca3IHlvG0lv
   upoaMQSlFnOjHbplsyZ9i7QPe/MolYx7/jXGLgOzp3klPHEEbRuvm2sxJ
   r41um1YOpoWaC03T95IGxQix5wvZ7dgHNmi8JA8hT1PXKUT1saORg2muO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327556276"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="327556276"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 03:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="664069622"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="664069622"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 03:57:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMSmT-0003bE-0n;
	Mon, 30 Jan 2023 11:57:01 +0000
Date: Mon, 30 Jan 2023 19:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+243 bytes kernel size regression] [i386-tinyconfig]
 [a2a4e9ba06] vfs: implement 'vfs write barriers'
Message-ID: <63d7b071.+YBgO1AtLRYUW0Ax%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +243 bytes kernel size regression due to commit:

commit: a2a4e9ba06937488fedf5fa51624446f730528e5 (vfs: implement 'vfs write barriers')
https://github.com/amir73il/linux sb_write_barrier


Details as below (size data is obtained by `nm --size-sort vmlinux`):

ca631bfb: fanotify: report file range info with FAN_ACCESSS_PERM
a2a4e9ba: vfs: implement 'vfs write barriers'

+-------------------------------+----------+----------+-------+
|            symbol             | ca631bfb | a2a4e9ba | delta |
+-------------------------------+----------+----------+-------+
| nm.T.mnt_want_write_file_srcu | 0        | 74       | 74    |
| nm.T.mnt_want_write_srcu      | 0        | 68       | 68    |
| bzImage                       | 496064   | 496128   | 64    |
| nm.t.sb_end_write_srcu        | 0        | 27       | 27    |
| nm.t.__srcu_read_lock         | 0        | 25       | 25    |
| nm.T.mnt_drop_write_file_srcu | 0        | 18       | 18    |
| nm.t.alloc_super              | 567      | 582      | 15    |
| nm.T.mnt_drop_write_srcu      | 0        | 13       | 13    |
| nm.T.__mnt_want_write_file    | 26       | 29       | 3     |
+-------------------------------+----------+----------+-------+



Thanks

