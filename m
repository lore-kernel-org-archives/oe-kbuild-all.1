Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613CEA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Nov 2022 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668253305; x=1699789305;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o9ZxlyVm8d6Fn0YS9DZl1pWag4w1UhhO+g/QOF7J+Uo=;
  b=P3f783aRHwAaZ+8jxaJhKCaug1Gu29c8L+pETTwDF3GmRBFDRhH9vMmi
   93wcfx6E9ZbkIqof1fEmOulVjF8DYl+GrO6+WjKM8TYdB9uG33qZh247s
   d/PuK/ck3dc7zPktmCujP75AnESBxLqSuakZVyC9+bFBG6zlFubbPv2Pz
   va8GZBPRpJmKyVEPP5xwJS+MWotQFps401xHrllcy1UKdnxtCLABt9DAh
   Fc4zPfrPu5eYqW7VL3Ni2Sb+UtP7mREtLnUq4nW0T63TH4ZG6k6sAw9dA
   f+EtzhUk9UitfKJ96lQozW3hI1Ru23TvaR+pQub8GzTp2pJxjdMbwOREh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="311729359"
X-IronPort-AV: E=Sophos;i="5.96,159,1665471600"; 
   d="scan'208";a="311729359"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2022 03:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="637834321"
X-IronPort-AV: E=Sophos;i="5.96,159,1665471600"; 
   d="scan'208";a="637834321"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Nov 2022 03:41:43 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ototK-0004rA-2N;
	Sat, 12 Nov 2022 11:41:42 +0000
Date: Sat, 12 Nov 2022 19:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+180 bytes kernel size regression] [i386-tinyconfig]
 [6f2db0132c] xattr: use rbtree for simple_xattrs
Message-ID: <636f866b.E6i2V4nhw1Gvjmex%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +180 bytes kernel size regression due to commit:

commit: 6f2db0132c6b786ddcb3ca42b7e24528b123a921 (xattr: use rbtree for simple_xattrs)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git fs.xattr.simple.rework.rbtree.rwlock.v3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
6f2db013: xattr: use rbtree for simple_xattrs

+------------------------------+----------+----------+-------+
|            symbol            | 9abf2313 | 6f2db013 | delta |
+------------------------------+----------+----------+-------+
| nm.T.simple_xattr_add        | 0        | 72       | 72    |
| bzImage                      | 491520   | 491584   | 64    |
| nm.T.simple_xattrs_free      | 0        | 49       | 49    |
| nm.T.simple_xattr_set        | 256      | 282      | 26    |
| nm.t.free_simple_xattr       | 0        | 23       | 23    |
| nm.t.rbtree_simple_xattr_cmp | 0        | 12       | 12    |
| nm.T.simple_xattrs_init      | 0        | 7        | 7     |
| nm.T.simple_xattr_get        | 75       | 78       | 3     |
| nm.D.linux_banner            | 152      | 154      | 2     |
| nm.T.simple_xattr_list       | 94       | 93       | -1    |
| nm.T.simple_xattr_list_add   | 13       | 0        | -13   |
+------------------------------+----------+----------+-------+



Thanks

