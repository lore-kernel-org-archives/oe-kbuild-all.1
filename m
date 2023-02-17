Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13B323E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ei/OkJ59tTub/fmTilBBqgdKWVODcUOF0St77+ADczk=;
  b=kZGWsDBvzOPBOaYY3/oGXVkFcEa7kwB7WpjpCXOH7AUowyuPgzuCWEI6
   Rut2+XEaZMrInIL1QZy1G0ti6+Lp6zmvqjJoVc0Dpm5FbdM/YyTlEq4f3
   TLXVZXgARtfKBjfMsRlRMNXV0tJ5uXnM4s+JXaTbsqF5+ttgk/TWQIfJb
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="47981433"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 11:28:48 +0100
Date: Fri, 17 Feb 2023 11:28:47 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 16/84] fs/xfs/libxfs/xfs_defer.c:846:24-25:
 WARNING opportunity for swap() (fwd)
Message-ID: <1145999-b48d-b5be-27f0-17ff4b3ffdae@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Fri, 17 Feb 2023 02:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:pptrs-online-parent-repair 16/84]
    fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   3d6a7fbcc79ebb1a96479c8b10d26de1c3591f36
commit: cf8991f3c4f01b0a21fce8683ae1773b2fae4437 [16/84] xfs: Increase XFS_DEFER_OPS_NR_INODES to 5
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20230217/202302170239.Cgz0r1LJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302170239.Cgz0r1LJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
