Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE1182
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667905131; x=1699441131;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XnFVMUG5NSMBxbkVcJXPV9ZRnJoCVjvJq0xZmVB837A=;
  b=k5Lk3Iv+dUaWofueBh/Jl8ECEJ6XU0bGsq99ELU3al6qfK3oI0I1WdKO
   +GGpvKbdmxf5Cky92TIriSgPEG0OYyR40CCT1t85yr795SUfVeY3awxqG
   ZhG05DGE2ZhRViQHdY8BBwD52lKnrhqgKqF6aZ/pGNGaZDxLBrma0Ua7R
   8HlLRC4Ot2741cp6q82uYVHw54Fy7BuX7odxnVF2gKIJ709cdjQ3/kc0x
   2utTE4tYz2CD+Z406VfBXB6PWixFa0yE5WhRGlFuZOyMSdcdr4yUuvINU
   pbQzZiEpAywjbTeg6XCDp7U+4MLkbmbWSoU/d8ojW03SCedfF8vC9lFjg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="298182315"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="298182315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 02:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="761455179"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="761455179"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2022 02:58:49 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osMJc-0000J0-2N;
	Tue, 08 Nov 2022 10:58:48 +0000
Date: Tue, 08 Nov 2022 18:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+371 bytes kernel size regression] [i386-tinyconfig]
 [12a8821597] xattr: use rbtree for simple_xattrs
Message-ID: <636a363e.ru3Qdmej8KqLsYld%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +371 bytes kernel size regression due to commit:

commit: 12a8821597b0af0c8e2e5e51e4ff426134cbcaac (xattr: use rbtree for simple_xattrs)
https://github.com/ammarfaizi2/linux-block brauner/linux/fs.xattr.simple.rework.rbtree


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
12a88215: xattr: use rbtree for simple_xattrs

+-------------------------------+----------+----------+-------+
|            symbol             | 9abf2313 | 12a88215 | delta |
+-------------------------------+----------+----------+-------+
| bzImage                       | 491520   | 491680   | 160   |
| nm.T.simple_xattr_get         | 75       | 217      | 142   |
| nm.T.simple_xattr_set         | 256      | 314      | 58    |
| nm.T.simple_xattrs_free       | 0        | 49       | 49    |
| nm.t.put_simple_xattr_rcu     | 0        | 45       | 45    |
| nm.T.simple_xattr_add         | 0        | 40       | 40    |
| nm.t.free_simple_xattr        | 0        | 23       | 23    |
| nm.T.simple_xattrs_init       | 0        | 14       | 14    |
| nm.T.simple_xattr_alloc       | 49       | 56       | 7     |
| nm.t.free_simple_xattr_rcu_cb | 0        | 5        | 5     |
| nm.D.linux_banner             | 152      | 154      | 2     |
| nm.T.simple_xattr_list        | 94       | 93       | -1    |
| nm.T.simple_xattr_list_add    | 13       | 0        | -13   |
+-------------------------------+----------+----------+-------+



Thanks

