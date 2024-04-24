Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A24158DBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952467; cv=none; b=Zo4ZcMvOY5lJ8//3ns30mHpWop9zUXczkTgKaekZDSCMttCCkaceo4T8/lxqm6nGHN0rV3i6QNS66q5QxAS6QvxcUv39n3veWRtBugnfNmTme5yXuF3bVtL9Lg4vCpJkCAaxyr0eeEcAYlgqusfUbPj3FVTz7L2kTRB+0jLLfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952467; c=relaxed/simple;
	bh=xR/v6Zjvghs+NuwrschJ/sSprf8LzwIpaFGlu3vMjxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCodIdrtc8AwepKSqVPDict+9IwqJIB2GDqKedHVH8A6Tj5JDC9QY1DU8UsScs+AKwFtNBwHvYDW3aW9VkyRAevOOcgdilFUaPCo6eXmGUFslFTf/iCg4RKliDoStWXmJcyG5cR51GDKMY1sndbvog+FiBU45nYQJcD0Cy5TAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIzsmJRw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIzsmJRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713952466; x=1745488466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xR/v6Zjvghs+NuwrschJ/sSprf8LzwIpaFGlu3vMjxc=;
  b=BIzsmJRw1XWRWQnxb1tvoQrzW5lKKew4pywv4H4Tj/Q456m5ArjrgjkS
   wE5thM9WFbmwh5XAwoAOQJItpjDn6vTytZCGOdi02eEnv4OLZENVzqxpw
   qKEYSY16YD0+CvnjKUMiKTA6VKuxDRYWYpoKmdI8TtF81oVpNjRNuZc63
   jP1hkdsGQWEej8KpLkgp4GUUaZYkVIjffOrYYwrl8c/ansQvIn0Dg+Tsw
   rbXbxInF7myyPEqbkaXDxEFUqL0cQk9NLZPRw/ypJ6fKbRk0NnyDrDhB4
   wsy9J9gp84oaqfKyoduJM1bX+Wh5cfmXNKXXJWH/fCjGJp5uQ2dq1HIkw
   w==;
X-CSE-ConnectionGUID: mAYa652XT52xKQiRUXCzMw==
X-CSE-MsgGUID: JiFUfs/xTmKplITRAtY3pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20983612"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20983612"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 02:54:09 -0700
X-CSE-ConnectionGUID: P8usZpDgTAWizo9UZ13ilQ==
X-CSE-MsgGUID: /COzpPAdQ1Wnr17faxpasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="29460821"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2024 02:54:08 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzZKI-00016i-03;
	Wed, 24 Apr 2024 09:54:06 +0000
Date: Wed, 24 Apr 2024 17:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 11/17] helpers.c:undefined reference to
 `__bpf_prog_enter_sleepable_recur'
Message-ID: <202404241719.IIGdpAku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   6e10b6350a67d398c795ac0b93a7bb7103633fe4
commit: eb48f6cd41a0f7803770a76bbffb6bd5b1b2ae2f [11/17] bpf: wq: add bpf_wq_init
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240424/202404241719.IIGdpAku-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241719.IIGdpAku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241719.IIGdpAku-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/helpers.o: in function `bpf_wq_work':
>> helpers.c:(.text+0x89c): undefined reference to `__bpf_prog_enter_sleepable_recur'
>> m68k-linux-ld: helpers.c:(.text+0x8a4): undefined reference to `__bpf_prog_exit_sleepable_recur'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
