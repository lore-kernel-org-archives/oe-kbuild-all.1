Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F279D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 06:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692685820; x=1724221820;
  h=date:from:to:cc:subject:message-id;
  bh=wnejkJHvLkEb12WHkGKnbtybTpNJwyiIZuZABAlpWEA=;
  b=d/9oSYjLIk4Q+iF1uo28a3viXCIXqsw7kk5wT7iQOH7qcpjv5JbQ5s8F
   35PpR+QEAIUEuF2469/LEhOBj3Gq2Gg6DRlsT7W3cWK0Ut2DL2+lcOGyU
   atypSwXzxnpUY8epnPTJhw2/XrKXBMwnlT2qibqcq08OqC1U8r3MemXGO
   M8FR/omKQ0Aip4LpwZdEYQEHKL8fEIWrpbmNtgmlHBcjL7HOngvksw8DX
   SgYVLAYPsuKAEcPhvbvdcLhsdd4eD2c4M5YUKCj+sWseZHO5F47+ri1up
   Q97mIuRK+dEvU1IzJDpD+IJqLYJUpICsuzqVMoGXf/UObYV9VbMvaoAle
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404795017"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="404795017"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 23:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066921159"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1066921159"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 23:30:17 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYKu2-0001SK-1T;
	Tue, 22 Aug 2023 06:30:15 +0000
Date: Tue, 22 Aug 2023 14:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+221 bytes kernel size regression] [i386-tinyconfig]
 [ff3d69f087] fs: wait for partially frozen filesystems
Message-ID: <20230822062910.A_Rhx%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +221 bytes kernel size regression due to commit:

commit: ff3d69f087320943f7d948427bd642de53ab998d (fs: wait for partially frozen filesystems)
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfs-6.6-merge


Details as below (size data is obtained by `nm --size-sort vmlinux`):

13992793: fs: distinguish between user initiated freeze and kernel initiated freeze
ff3d69f0: fs: wait for partially frozen filesystems

+------------------------+----------+----------+-------+
|         symbol         | 13992793 | ff3d69f0 | delta |
+------------------------+----------+----------+-------+
| nm.T.freeze_super      | 309      | 505      | 196   |
| bzImage                | 516560   | 516752   | 192   |
| nm.t.thaw_super_locked | 168      | 193      | 25    |
+------------------------+----------+----------+-------+



Thanks

