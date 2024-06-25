Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B423BB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719283621; cv=none; b=IouzvVHZ2NXk6IigOrmgRepAX4OcFokh2YaGnmi0TXmAS3b4mNC76dRuuXhtEelxcSLT6expvDhzxKpLKNh/1Bs25YsNJBh1O8UQDeSc38KSlKrOQN3bWGMujzFA5mrKfaCi5iJSACyN0Nns3mLzUEuSCXQBWdVwI+tcUSBNMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719283621; c=relaxed/simple;
	bh=9mDPIn/3u5kki6znO6SeuavmUCdlxcLOiRprP81Gw80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pykEIZE1awrDdE1KXkCEBdf/YsVuuhw/ZgAmfoMVvhq6tb/marjatLVIXHgJ9M264LIWtqVJ8qhtagsG4/PDsGLhXDvR7k9A6GS/wY7lW54OhrJjyy40nCzf6057muOPCerJuMBthQCtfYPJjzUVF394ejEchRhscbBjFfGitbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLPtvsAY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLPtvsAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719283619; x=1750819619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9mDPIn/3u5kki6znO6SeuavmUCdlxcLOiRprP81Gw80=;
  b=NLPtvsAYc5izVZfIKmEulubXwxqf98gMCSPjSBMie69sQHbbKKeAxosI
   R16su1QB3+mlXplf8JGBzYkiMWQzKIBB7OLIlWj3zdubBXyWPYgA/kWh0
   ksgmsEn4WMpfFB2yYdQGhK7jVPHjXRbFbt1smqpl12vyP4mWrrFLYnUwk
   lhK//CqEnatsyQUd9QzU8iZDkEGusuVS+FuGjSWyCtnOM1xhuiwh7RvBz
   1oTwdyV58JtnZ4NlxVgq46pfRiHzSeK0fs2Kd1Z9vCyqUjt5Wa56wPsBA
   oersigfMmvkRSQObsfXwiVjM7fM2GesTgkPwufeomixSBDVx6EpU42zMY
   Q==;
X-CSE-ConnectionGUID: AF8tYLpcQ+yfYqE389MKEA==
X-CSE-MsgGUID: cZJ0PmOMTCyrZBLFqbOf1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20050780"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="20050780"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 19:46:59 -0700
X-CSE-ConnectionGUID: ViwG4U5jSIiTubZCXWovzQ==
X-CSE-MsgGUID: L7FBM5EKQCCOJzt447XpCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="48036277"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2024 19:46:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLwCt-000Dx8-2C;
	Tue, 25 Jun 2024 02:46:55 +0000
Date: Tue, 25 Jun 2024 10:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 8/35] undefined reference to
 `__tracepoint_page_pool_state_hold'
Message-ID: <202406251031.lXQeoCOy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: 8306bf316a4d3928d670f98e9e6a3b3218e8c73a [8/35] memory-provider: dmabuf devmem memory provider
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240625/202406251031.lXQeoCOy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406251031.lXQeoCOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406251031.lXQeoCOy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mp_dmabuf_devmem_alloc_netmems':
>> (.text+0xc27d1b): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: (.text+0xc27d2f): undefined reference to `__SCT__tp_func_page_pool_state_hold'
   ld: vmlinux.o:(__jump_table+0x10978): undefined reference to `__tracepoint_page_pool_state_hold'
   ld: vmlinux.o:(.static_call_sites+0xb8fc): undefined reference to `__SCK__tp_func_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
