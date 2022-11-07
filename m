Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DDDD516
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Nov 2022 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667830862; x=1699366862;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=I+5BEMrCH099ZxbC1iS8+H9jJLzMz15ICAOVTqHraSE=;
  b=f3l9sdwfb+iApiZIFHMiSZAITTqQBeMdzffTQrx1nyrVA7MoGJf6eOaA
   LTMaDaBwk/JZPBU7WDtpf5kuFr35PoT38cOBBCVzVlcSUAr0BD55gGsK3
   WJieM5iK90MX7Agj1yBf5fqhWE3ph18RdAGFiX3FA2B8IGbgbzOE3qFj8
   V6mjH8Nu0e9GxK1BIM2EGp4XLxRGwAznQ/spuvAD4skf3JjjP91JC+DoA
   /hZlW5ZDmORQEoNvzIDSFimjC7xYGT4CdCgm0B0DRfPbTPQJEZ7d4ZD1T
   EXMMuurrn1vkbi60hXwVc4qBgIhbBfHdky24wgSIgzyMv7EnEoX08pBfE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374670687"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="374670687"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 06:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="586983433"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586983433"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 06:20:49 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os2zY-0000kG-21;
	Mon, 07 Nov 2022 14:20:48 +0000
Date: Mon, 7 Nov 2022 22:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+364 bytes kernel size regression] [i386-tinyconfig]
 [d68fc4d5da] xattr: use rbtree for simple_xattrs
Message-ID: <Y2kUGUXN2DF0M159@2d882e5f7ced>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107133540.1503822-1-brauner@kernel.org>


FYI, we noticed a +364 bytes kernel size regression due to commit:

commit: d68fc4d5da695b25e5580d96fafc8ab7bb4b1fc5 (xattr: use rbtree for simple_xattrs)
url: https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/xattr-use-rbtree-for-simple_xattrs/20221107-213723
patch link: https://lore.kernel.org/linux-fsdevel/20221107133540.1503822-1-brauner@kernel.org
patch subject: [PATCH] xattr: use rbtree for simple_xattrs


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
d68fc4d5: xattr: use rbtree for simple_xattrs

+-------------------------------+----------+----------+-------+
|            symbol             | 9abf2313 | d68fc4d5 | delta |
+-------------------------------+----------+----------+-------+
| nm.T.simple_xattr_get         | 75       | 217      | 142   |
| bzImage                       | 491520   | 491648   | 128   |
| nm.T.simple_xattr_set         | 256      | 314      | 58    |
| nm.T.simple_xattrs_free       | 0        | 49       | 49    |
| nm.t.put_simple_xattr_rcu     | 0        | 42       | 42    |
| nm.T.simple_xattr_add         | 0        | 40       | 40    |
| nm.t.free_simple_xattr        | 0        | 23       | 23    |
| nm.T.simple_xattrs_init       | 0        | 14       | 14    |
| nm.T.simple_xattr_alloc       | 49       | 56       | 7     |
| nm.t.free_simple_xattr_rcu_cb | 0        | 2        | 2     |
| nm.D.linux_banner             | 152      | 153      | 1     |
| nm.T.simple_xattr_list        | 94       | 93       | -1    |
| nm.T.simple_xattr_list_add    | 13       | 0        | -13   |
+-------------------------------+----------+----------+-------+



Thanks


