Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930E36D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554948; cv=none; b=W7pMeL0dThrqUEkY6lNo7CoZZlcFAPBZcG3sOvp1JvU+AJomeZ3PtUxxD5h2QGPDd+wnlD/3rBEXHa1R+kKawywNabt8VVjXEEv+oJtesCo1sfhOY/c20YQPeTGyeUhvDUWMVYjFG8XivxBTf6TTJv3JB2M5i5p6ciq2rDzNiyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554948; c=relaxed/simple;
	bh=OrclKneQTavYkJFGLslgWN4OAzbEYNA8NflkUDcJ7Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQgTWc4ruJUSCRFYokPpFapWU5jbhslb/ab5vNLIFQ620xbofG/mdK8+UZD7J0LIUk6Cx8UeDXidSqGxd/5szjei5qP2WOOhQINjnd4XUiYm4LpiZWn/x1C6SkqKyL1Tl6YQTZqLRxqQlIrKOON4VztXeND+Vcciv3pDgmGrAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9tP6ua4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9tP6ua4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728554946; x=1760090946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrclKneQTavYkJFGLslgWN4OAzbEYNA8NflkUDcJ7Ro=;
  b=C9tP6ua4TdA/u8a5mjHXATM+jtpHBRHQYoJMKZeMMcIQJ8z6oNELTQrK
   c4kwH3btY0gt+W6aINJMrNG6eLK8T53YnLvSM+ORbJw5r9YziL+ocW7Dq
   orPS0wQgPRFeNT3/MJ7NW9BvzPGCwx57uCdV7tAQ26ATfC2dKnTPvR9Al
   JVkCtmJ1T2sHbE5hyLRv6PpWkKA6YWUNw4JJ0vBbEprByqCZjLHDmOKnq
   MrJ4Q4s2Dx/FJXXcoqUw8jsUZBg5TXZc7mIaXibGf+OG675tlgVX9Bykj
   kjOcTatnrOml4x6VFAQs6Fp9RS/OpFTbFBp5oQvMwy1FetwoRnkT6nQPy
   A==;
X-CSE-ConnectionGUID: ZM3NaMa5TuCYCYu0zNKspA==
X-CSE-MsgGUID: PJr4lQfTTfSANnmaMr6owA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38546636"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="38546636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 03:09:06 -0700
X-CSE-ConnectionGUID: OYtfUW9fQKC4WqCWL4HSfA==
X-CSE-MsgGUID: iA+5zAKGTwmj6qXE24NyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="80553283"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Oct 2024 03:09:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syq6Q-000Abx-2D;
	Thu, 10 Oct 2024 10:09:02 +0000
Date: Thu, 10 Oct 2024 18:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Subject: [linux-next:master 2784/3639] WARNING: modpost: vmlinux: section
 mismatch in reference: rtnl_net_debug_exit+0x20 (section: .exit.text) ->
 rtnl_net_debug_net_ops (section: .init.data)
Message-ID: <202410101854.i0vQCaDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
commit: 03fa534856593bb4edf4935451fa55863e34a108 [2784/3639] rtnetlink: Add ASSERT_RTNL_NET() placeholder for netdev notifier.
config: parisc-randconfig-r064-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101854.i0vQCaDz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101854.i0vQCaDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101854.i0vQCaDz-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: rtnl_net_debug_exit+0x20 (section: .exit.text) -> rtnl_net_debug_net_ops (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rtnl_net_debug_exit+0x24 (section: .exit.text) -> rtnl_net_debug_net_ops (section: .init.data)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
