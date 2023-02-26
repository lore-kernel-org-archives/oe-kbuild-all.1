Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56712560
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677420960; x=1708956960;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FcEjjnAzXytR4xsHAEWwqmvFwt0OIL9mLWa6gwcMCl8=;
  b=oJJ/vEtAqzRHs2sPfEggoe0Pf7nrDoBSzKhFysyYmdf2iUgMeYEQdn9G
   eCcpxufWrkYsQCkUWj0dUbotc6WnF7LGw8C9oUtH1hYOW0uTaLHiv6LiB
   dzw3iYDUJ4VaOmjPaNDzj6/cqOtxv3y8EiGDNZxAO5yubjXi+jKSn8MJi
   ubjUbMbPwCG/ZG17rxDZ/6DYTMEXGNzMz682RJ6x1Z9vzi2zMOWXr3r8v
   TlR+PzQLIURVou1G9Ge1NR4Kh3MvzkHMdOt8e5l036ckYXiSDS8mlNi18
   ivHEeynXRiXAI3nFT/v9SkIRHDZerzmVh5fIYTwkETMXoRm1s/BZq4sbP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="314140611"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="314140611"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 06:16:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="675518549"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="675518549"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Feb 2023 06:15:58 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWHok-0003mJ-1A;
	Sun, 26 Feb 2023 14:15:58 +0000
Date: Sun, 26 Feb 2023 22:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+257 bytes kernel size regression] [i386-tinyconfig]
 [0e7f316b2e] ptrace,syscall_user_dispatch: checkpoint/restore support for
 SUD
Message-ID: <Y/tpkduqvE9J74Yx@e5183f283a38>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224233126.1936-3-gregory.price@memverge.com>


FYI, we noticed a +257 bytes kernel size regression due to commit:

commit: 0e7f316b2e1ac29e596cb919a0d2b126dfd057b7 (ptrace,syscall_user_dispatch: checkpoint/restore support for SUD)
url: https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/syscall_user_dispatch-helper-function-to-operate-on-given-task/20230225-073338
base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git next
patch link: https://lore.kernel.org/all/20230224233126.1936-3-gregory.price@memverge.com/
patch subject: [PATCH v12 2/3] ptrace,syscall_user_dispatch: checkpoint/restore support for SUD


Details as below (size data is obtained by `nm --size-sort vmlinux`):

340b612b: syscall_user_dispatch: helper function to operate on given task
0e7f316b: ptrace,syscall_user_dispatch: checkpoint/restore support for SUD

+---------------------------------------+----------+----------+-------+
|                symbol                 | 340b612b | 0e7f316b | delta |
+---------------------------------------+----------+----------+-------+
| bzImage                               | 495904   | 496096   | 192   |
| nm.t.task_set_syscall_user_dispatch   | 0        | 127      | 127   |
| nm.T.syscall_user_dispatch_get_config | 0        | 117      | 117   |
| nm.T.syscall_user_dispatch_set_config | 0        | 73       | 73    |
| nm.T.ptrace_request                   | 1186     | 1228     | 42    |
| nm.T.set_syscall_user_dispatch        | 128      | 26       | -102  |
+---------------------------------------+----------+----------+-------+



Thanks


