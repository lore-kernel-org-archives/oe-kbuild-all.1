Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992016121
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681311675; x=1712847675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7pXj/ZmXulSLeeSojsmVqJ9q3mgN4nFG9WMonPd66o=;
  b=StOrPbj4xVzY8KJH+vWIinZk0SE1lluf7aEfsp/kHInPHIFl+MmJ4vof
   YppbIFZmKo6f9aPO5OoQqQ58Cx0bkLRX/iLj7+UIfA0Uq+NGU1Y4JMKbx
   5+HWn86TpDcu1+wTKHMvquHX00SM77ExypVoW2df2pcbEnKhUjv7m0dv1
   PuI2egsUP/ZDwRqRK9qhCDyf9LONz1AyePLBSujV3gmoPBs4MEy6Z1fch
   s+xASRUhHNowm7J4BM7Ez0KGnF+0ilXPF655RhiyRvBXp9ucmchngGPis
   2l3H2tILxsKIMf6yCqgbu92Dk4XhyUuQ100/xsgB1VCfzaeNvpbuIaLKx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324281654"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="324281654"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 08:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639262960"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="639262960"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Apr 2023 08:01:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmbyC-000XnT-0H;
	Wed, 12 Apr 2023 15:01:12 +0000
Date: Wed, 12 Apr 2023 23:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Youlin Li <liulin063@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 7325/9999]
 tools/testing/selftests/bpf/verifier/ref_tracking.c:935:10: error: 'struct
 bpf_test' has no member named 'fixup_map_ringbuf'; did you mean
 'fixup_map_in_map'?
Message-ID: <202304122201.KneaxdtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Youlin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: f4b8c0710ab672a163bbc205978dddf2c556e548 [7325/9999] selftests/bpf: Add verifier test for release_reference()
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=f4b8c0710ab672a163bbc205978dddf2c556e548
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout f4b8c0710ab672a163bbc205978dddf2c556e548
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122201.KneaxdtZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/bpf/verifier/tests.h:59,
                    from test_verifier.c:355:
>> tools/testing/selftests/bpf/verifier/ref_tracking.c:935:10: error: 'struct bpf_test' has no member named 'fixup_map_ringbuf'; did you mean 'fixup_map_in_map'?
     935 |         .fixup_map_ringbuf = { 11 },
         |          ^~~~~~~~~~~~~~~~~
         |          fixup_map_in_map


vim +935 tools/testing/selftests/bpf/verifier/ref_tracking.c

 > 935		.fixup_map_ringbuf = { 11 },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
