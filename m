Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039DA8F43
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 22:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670451747; x=1701987747;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9AKpsfDDUpzzjriWvuFp1We4QkOK7r9XjWp3KzuQMYw=;
  b=n0ga4439xDQ5Qyutepmd7qSoTlNdLaRz0oDhMegXK1k3OlJHoNx4b2x1
   g046JhMGtVxSPxgzpw4yvWv0jXtReHgKbJNACOU75AUvCaE7dDwkqwLL0
   z4merVuEPsht49gJhdsc/1T9z7I26fdNDJWyJHt7SAlechmceWfI5Hxpz
   f3RDG1UozAqwvoBBzx6yEUI8u69c8oimqyvf5VlxT4ZAFfFd1umU2H4rT
   kLi+6Yntd6vQ6O+pG8UnzVi2uHtbu4uAJ64slKo23urmCSxQ+BQ/3Hpj8
   h8QXb2xzpJybuyxCL+jRMVgFCVNoCJkNm//2fo2aFdTNKjGjOnMfc21o3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379183515"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="379183515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 14:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="677527042"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="677527042"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Dec 2022 14:22:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p32nz-0000bX-2I;
	Wed, 07 Dec 2022 22:22:19 +0000
Date: Thu, 08 Dec 2022 06:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+243 bytes kernel size regression] [i386-tinyconfig]
 [e8a2a30b4b] vfs: implement 'vfs write barriers'
Message-ID: <639111f6.zMrjOgwM9vIm8kXZ%lkp@intel.com>
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

commit: e8a2a30b4b2edf996c4f296a5ed62fc7aa200fbd (vfs: implement 'vfs write barriers')
https://github.com/amir73il/linux sb_write_barrier


Details as below (size data is obtained by `nm --size-sort vmlinux`):

74e355ec: rcu: Add srcu_down_read() and srcu_up_read()
e8a2a30b: vfs: implement 'vfs write barriers'

+-------------------------------+----------+----------+-------+
|            symbol             | 74e355ec | e8a2a30b | delta |
+-------------------------------+----------+----------+-------+
| bzImage                       | 491712   | 491872   | 160   |
| nm.T.mnt_want_write_file_srcu | 0        | 74       | 74    |
| nm.T.mnt_want_write_srcu      | 0        | 68       | 68    |
| nm.t.sb_end_write_srcu        | 0        | 27       | 27    |
| nm.t.__srcu_read_lock         | 0        | 25       | 25    |
| nm.T.mnt_drop_write_file_srcu | 0        | 18       | 18    |
| nm.t.alloc_super              | 562      | 577      | 15    |
| nm.T.mnt_drop_write_srcu      | 0        | 13       | 13    |
| nm.T.__mnt_want_write_file    | 26       | 29       | 3     |
+-------------------------------+----------+----------+-------+



Thanks

