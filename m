Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844D7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 00:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668990081; x=1700526081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IgbigICw4zuYHE0q+9fjlpqwHIGEPqzMDADqBpNYiE0=;
  b=QxQK/Xou4BBFznC4XV5sN1XcpECrVfZZBIl0KRfv6kIoqUtsRhb4HtRw
   KJeYLwH70hXW35jqz+c6BNRl19CE3J0cYrAZr/UEnfvQDHPCqAV66XkD9
   PES/zFCtKSEkwBDbrbLJqaleatGoFBYo+XpgSagOHNMsZ3x+ogbZo9K8b
   U5rCrX6EQL2NMRx8o00eR6WhzDe8wUoVa4tRJlLzC3qrtrtIWfQwbhruJ
   oiSzeEt3h9/uG02FGH8uEra/pc7sdS8LPq9xTSo9/Vb3gCxGvkyZrXhJo
   DMeeRNyWBlf0riSf4q3CvuJRhgVJ0tjWOxjIjHU08Sd7/tVYqrvIAfq9d
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="314592003"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="314592003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 16:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="640835159"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="640835159"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Nov 2022 16:21:19 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owuYo-0003IT-38;
	Mon, 21 Nov 2022 00:21:18 +0000
Date: Mon, 21 Nov 2022 08:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+283 bytes kernel size regression] [i386-tinyconfig]
 [4ccd382bb8] xattr: use rbtree for simple_xattrs
Message-ID: <637ac45c.tcUpygnco2QBPpvT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +283 bytes kernel size regression due to commit:

commit: 4ccd382bb8158a757a23cd760a423d86e908caef (xattr: use rbtree for simple_xattrs)
https://github.com/ammarfaizi2/linux-block brauner/linux/fs.xattr.simple.rework.rbtree.rcu


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
4ccd382b: xattr: use rbtree for simple_xattrs

+-------------------------------+----------+----------+-------+
|            symbol             | 9abf2313 | 4ccd382b | delta |
+-------------------------------+----------+----------+-------+
| bzImage                       | 491520   | 491616   | 96    |
| nm.T.simple_xattr_add         | 0        | 91       | 91    |
| nm.T.simple_xattr_get         | 75       | 145      | 70    |
| nm.T.simple_xattrs_free       | 0        | 49       | 49    |
| nm.T.simple_xattr_set         | 256      | 299      | 43    |
| nm.t.free_simple_xattr        | 0        | 23       | 23    |
| nm.T.simple_xattrs_init       | 0        | 14       | 14    |
| nm.t.free_simple_xattr_rcu_cb | 0        | 5        | 5     |
| nm.D.linux_banner             | 152      | 154      | 2     |
| nm.T.simple_xattr_list        | 94       | 93       | -1    |
| nm.T.simple_xattr_list_add    | 13       | 0        | -13   |
+-------------------------------+----------+----------+-------+



Thanks

