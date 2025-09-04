Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E932223328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010348; cv=none; b=ukPOLuWQziprersATHR0MzU/ajVZJCGMTLdGKUdHg3sqkL1a5R5m0IIXLeXrQSwq4WP+PTVDfHcFTQWXkhrvBQvqlp/axzM6RpPg7BihafnI3rJwu60TSpLL4iFXUYtEAapz22X/trv9Ds4HcFOyN5UzspLld+9x9oDcmth6Ujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010348; c=relaxed/simple;
	bh=mPyxdfpUPBg0jwKbz4ZTBFZM0gGAXh6rZzVumHeOnmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvPEm5ppxJo5/d3r1kulfsXxW7MCosiq5HfDOZW4LdWsOdD4FZX9x6HJffdtwHnoG8V5t8VLOka2npzoAzBDj6KrxAtURbY2XuXXqzwlO4Izxefh1uVmgz91/DkV1I7mlzzwCOqtFF/8F23XEuMjgenrDtDwUkaIYJhC4cKVXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwOpJM+p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwOpJM+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757010347; x=1788546347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mPyxdfpUPBg0jwKbz4ZTBFZM0gGAXh6rZzVumHeOnmM=;
  b=dwOpJM+p4VBHwaLXBgBAGcgsbpruDyNiX8+zrpHK6TN39bPOYlRfU/qS
   QfNJ8wLiMl2kMx6F6g6sFC8+QPPF66HwROoh0jRuE7Al7mF7eNlGwDq8L
   YJjblvtyoitl4UzJr5cJ+TJsfC/y8BeNVUntvmrntjITlkj465Jb4vujm
   le9vi8BiwK8s331n1uHc2Wd2vxsQ5MpILQtDjFlj6v20uCQVlNZDNJ3B3
   x8AkWBPScJW+n2RiUh3+l1nJqSKF1rqfF0tvAFJVq+T2ip7EXiDhBNhKx
   Uo+9AqkDCQnJ8XXrCTEZj7mI8UuLtVlhJwsViuwgMIz+EcMtnw+yxIJpp
   Q==;
X-CSE-ConnectionGUID: WiVAgFXARGyjFrK7rNvYAQ==
X-CSE-MsgGUID: g1jHMvzCR42HsfaykkuJyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76815849"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="76815849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 11:25:47 -0700
X-CSE-ConnectionGUID: dJxZfAC8T+eH9vmenFvyEw==
X-CSE-MsgGUID: HX/yD1qQQJqKoyZFgfzALQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="176305148"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 11:25:46 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuEeV-0005cP-1y;
	Thu, 04 Sep 2025 18:25:43 +0000
Date: Fri, 5 Sep 2025 02:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 RFC 3/7] kfuzztest: implement core module and input
 processing
Message-ID: <202509050236.MhX2oUXo-lkp@intel.com>
References: <20250901164212.460229-4-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901164212.460229-4-ethan.w.s.graham@gmail.com>

Hi Ethan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-crypto-2.6/master]
[also build test ERROR on linus/master v6.17-rc4 next-20250904]
[cannot apply to akpm-mm/mm-nonmm-unstable herbert-cryptodev-2.6/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/mm-kasan-implement-kasan_poison_range/20250902-004648
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git master
patch link:    https://lore.kernel.org/r/20250901164212.460229-4-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v2 RFC 3/7] kfuzztest: implement core module and input processing
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250905/202509050236.MhX2oUXo-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050236.MhX2oUXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050236.MhX2oUXo-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: lib/kfuzztest/main.o: in function `kfuzztest_init':
>> main.c:(.init.text+0x8): undefined reference to `__kfuzztest_targets_start'
>> /usr/bin/ld: main.c:(.init.text+0x2f): undefined reference to `__kfuzztest_targets_end'
   /usr/bin/ld: main.c:(.init.text+0xc4): undefined reference to `__kfuzztest_targets_end'
   /usr/bin/ld: main.c:(.init.text+0x2eb): undefined reference to `__kfuzztest_targets_end'
   /usr/lib/gcc/x86_64-linux-gnu/13/crtbegin.o: in function `deregister_tm_clones':
   crtstuff.c:(.text+0x7): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
   /usr/lib/gcc/x86_64-linux-gnu/13/crtbegin.o: in function `register_tm_clones':
   crtstuff.c:(.text+0x38): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
