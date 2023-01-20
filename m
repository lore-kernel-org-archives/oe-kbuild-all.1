Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F682F2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674231206; x=1705767206;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=kreh3owuhJqDUwkh98dtMip9LA4EbDf3CVSOI8/3BQc=;
  b=EB0EDc1UzePrGtrgMempba7CfnosPy3VHl4fmEnB6yqTGrS2hZ55P2vj
   qzrL550uoJ9uDR6OcdH+f5yqW0St1P3ZhiRaVtNG5q0C78+JaJinUWaEN
   SMzpJsYnYJ4FlRgZTtNGqtdHFwuXstfOsw2PcJOFd/fTaB0eREnIXvoOQ
   pLc0+v09HoV2ndodHF8UKB/tYmAik97ublS98/vFO0sX/BGbGDMj78QTi
   2Vt81OjzVbQHbOmkS2NEdBtV0Wf3/LRCqX2mXHCk7Vo9ydNPhawBAo7Bm
   BXB2FgwE9L3tT7U7Rota1cPfE1A8CeTBfFQUlaxEXxEfCDkY+YX1oMcyv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305284855"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="305284855"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 08:13:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989434775"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="989434775"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 08:13:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIu0r-0002gi-1w;
	Fri, 20 Jan 2023 16:13:09 +0000
Date: Sat, 21 Jan 2023 00:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+309 bytes kernel size regression] [i386-tinyconfig]
 [9a08e0b054] ptrace,syscall_user_dispatch: add a getter/setter for sud
 configuration
Message-ID: <Y8q9dASEL6txv6Xn@0baa18830fa3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120144356.40717-4-gregory.price@memverge.com>


FYI, we noticed a +309 bytes kernel size regression due to commit:

commit: 9a08e0b054230e2e0a4c6313e708c64c338d9f89 (ptrace,syscall_user_dispatch: add a getter/setter for sud configuration)
url: https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/ptrace-syscall_user_dispatch-Implement-Syscall-User-Dispatch-Suspension/20230120-224726
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git d368967cb1039b5c4cccb62b5a4b9468c50cd143
patch link: https://lore.kernel.org/all/20230120144356.40717-4-gregory.price@memverge.com/
patch subject: [PATCH v3 3/3] ptrace,syscall_user_dispatch: add a getter/setter for sud configuration


Details as below (size data is obtained by `nm --size-sort vmlinux`):

12197c6c: fs/proc/array: Add Syscall User Dispatch to proc status
9a08e0b0: ptrace,syscall_user_dispatch: add a getter/setter for sud configuration

+---------------------------------------+----------+----------+-------+
|                symbol                 | 12197c6c | 9a08e0b0 | delta |
+---------------------------------------+----------+----------+-------+
| bzImage                               | 495840   | 496096   | 256   |
| nm.T.syscall_user_dispatch_get_config | 0        | 181      | 181   |
| nm.T.syscall_user_dispatch_set_config | 0        | 86       | 86    |
| nm.T.ptrace_request                   | 1186     | 1228     | 42    |
+---------------------------------------+----------+----------+-------+



Thanks


