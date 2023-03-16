Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C937A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 00:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678927636; x=1710463636;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=k6y8x3QVhVMEFGgBzZkQgq8VEz6KEnSUj9UHzHObRUM=;
  b=Hg/fwBtLPlXr+gRPxLExQdbUBbZNoOgOMFI1joUNIeT2hyKmgK1CFFQJ
   E0yO/rv+uNZP3ltFOfEV0ndY3cCEkT3TVqQPz8WgVDFDOSLWWbbpb5/ql
   Rmkd1MYEloEoscdpqq/gtA6sJUU00y+kDkO5e6bN07S9CpjyLFl3uZWdV
   QlJgC5kIGAFHg5645vJqUWx3hNQ8BGZDSRsUtWjTqzfjTnmANMmXGDafs
   JK4V29rzG4Y3b0X1H1IAbp70IbvJuksXThaKgPwG62lYbMQIkUZSSKmvU
   WnLiLl1pKowv9XjSXNj7kA1CB3siRIyD981dCpVEbTs9u9XC3Ey17+t3r
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="400431449"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="400431449"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 17:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1009026085"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1009026085"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 17:47:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcblx-0008AB-2Y;
	Thu, 16 Mar 2023 00:47:13 +0000
Date: Thu, 16 Mar 2023 08:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+118 bytes kernel size regression] [i386-tinyconfig]
 [6e6937ac88] fs: introduce lock_rename_child() helper
Message-ID: <ZBJm/VySI5NOYpji@7948dbfe554b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315223435.5139-3-linkinjeon@kernel.org>


FYI, we noticed a +118 bytes kernel size regression due to commit:

commit: 6e6937ac882828b632bbcecf35ce35d280a2b4fb (fs: introduce lock_rename_child() helper)
url: https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-remove-internal-h-include/20230316-063731
base: https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git for-next
patch link: https://lore.kernel.org/all/20230315223435.5139-3-linkinjeon@kernel.org/
patch subject: [PATCH v8 2/3] fs: introduce lock_rename_child() helper


Details as below (size data is obtained by `nm --size-sort vmlinux`):

2d2e9d60: ksmbd: remove internal.h include
6e6937ac: fs: introduce lock_rename_child() helper

+---------------------------+----------+----------+-------+
|          symbol           | 2d2e9d60 | 6e6937ac | delta |
+---------------------------+----------+----------+-------+
| nm.T.lock_rename_child    | 0        | 98       | 98    |
| nm.t.lock_two_directories | 0        | 77       | 77    |
| bzImage                   | 501536   | 501600   | 64    |
| nm.T.lock_rename          | 109      | 52       | -57   |
+---------------------------+----------+----------+-------+



Thanks


