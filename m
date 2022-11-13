Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFFBA20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Nov 2022 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668351995; x=1699887995;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DGSMrU6vlG6IeO9Ww7uBvBJQSLsqEpby56EB/XwjS7A=;
  b=fUpMndyIUNnDuu3hZV2Jy63kovkn6KjHItQsianH5UEgVcVWW4kIAlSK
   Cti3f79ASq3uBXA7zGEWIZ+mkK9/fS+XiPddUEAjC9b/QVDBIruosOiLf
   +ZDwMH/Q2+XWDjZrZKeZia/fkIRH5Shgb3VvjrPLQ8bUMwNg9PJoVBgRw
   uS+jhOxIpF0y5Hk32Md0Gifj55He6P89TRZpf2zlR4gp+mYn4hL+nq1WE
   oyxRi+XRH2S7xgvGtyeAOCEYuNQlVgy4WczNszXPJaYQDPDPGI2CDaSkI
   GVZ258zqidZV1VMCHhkttt1WdczB0xr/Q45fsKduAgji5gtoIl621T7SE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="376083055"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="376083055"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 07:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="707024233"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="707024233"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2022 07:06:33 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ouEZ6-0005q1-2H;
	Sun, 13 Nov 2022 15:06:32 +0000
Date: Sun, 13 Nov 2022 23:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+72 bytes kernel size regression] [i386-tinyconfig]
 [318e66856d] xattr: use posix acl api
Message-ID: <637107f1.De8NZrJVwqooyQQk%lkp@intel.com>
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

commit: 318e66856ddec05384f32d60b5598128289f4e7b (xattr: use posix acl api)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git fs.acl.rework


Details as below (size data is obtained by `nm --size-sort vmlinux`):

31acceb9: ovl: use posix acl api
318e6685: xattr: use posix acl api

+-------------------------+----------+----------+-------+
|         symbol          | 31acceb9 | 318e6685 | delta |
+-------------------------+----------+----------+-------+
| bzImage                 | 491456   | 491552   | 96    |
| nm.t.removexattr        | 64       | 82       | 18    |
| nm.t.is_posix_acl_xattr | 32       | 48       | 16    |
| nm.T.do_getxattr        | 157      | 167      | 10    |
| nm.T.do_setxattr        | 52       | 59       | 7     |
| nm.T.__vfs_getxattr     | 71       | 78       | 7     |
| nm.T.__vfs_removexattr  | 75       | 82       | 7     |
| nm.T.__vfs_setxattr     | 104      | 111      | 7     |
+-------------------------+----------+----------+-------+



Thanks

