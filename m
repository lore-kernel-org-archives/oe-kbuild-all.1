Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CF223422
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685630066; x=1717166066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nTYApVB660JYDRJ8Kms0xOXqaDG4SZ9pU8lJi5dvnnA=;
  b=nwcCRudkAe7zFonYE1slR80Rj+YtkJeR9SCUi9EsX9r5EZpb0Y57Z2CO
   OHQ+1WI6SC1FR7Kjut5qn/hyIYkh2kxPbr9X3bfeIh22l+UdrcF5Yt0xe
   Va7vFWJ/FcipBGW3jRF1KqyiEH71E+FCDxjITWaTl5JdRqGMwexRvU7IS
   4IyigMOuxdw+UYhGgFeNhGG9NNxeAKnW+izfmUe8nNTjt0O0I8OjeBfbR
   PzP+GCm8OJN36hrNCl9V+Ye/HcmXxktzQHK8RmGwnQRxJqvcrIoxvYc4z
   P0XocsbW5VvKODVuotRXpBRsMMSGjIeAZ8VtOyYTzBu4ny6kfjPsWDyR6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355585915"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="355585915"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737123546"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="737123546"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 07:34:22 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4jNd-0002N6-2X;
	Thu, 01 Jun 2023 14:34:21 +0000
Date: Thu, 1 Jun 2023 22:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Youlin Li <liulin063@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 6544/9999]
 tools/testing/selftests/bpf/verifier/ref_tracking.c:935:10: error: 'struct
 bpf_test' has no member named 'fixup_map_ringbuf'; did you mean
 'fixup_map_in_map'?
Message-ID: <202306012109.IYcoxxZi-lkp@intel.com>
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
head:   272d4b8a5b96dda1374b9039a884cce2cd9cb630
commit: f4b8c0710ab672a163bbc205978dddf2c556e548 [6544/9999] selftests/bpf: Add verifier test for release_reference()
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=f4b8c0710ab672a163bbc205978dddf2c556e548
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout f4b8c0710ab672a163bbc205978dddf2c556e548
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306012109.IYcoxxZi-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
