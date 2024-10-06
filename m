Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1560A18A6B5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728242019; cv=none; b=n7FC11ju7jjhKKsrQlTXxwQJQsm5tS89xOFeudFtvoG0ieu9DHmeOD8kSzsgb97237BU/julojR5YNbWwMMft1hn9wiCBKz7qAbTHnJ5kCi1cDpsMdRER4XwBpy88BL89Ntx0Yi50IPug208oqPlYeFHGB0RPEhOqYmscor4Wvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728242019; c=relaxed/simple;
	bh=Uhg9qnSWHyZrTIesQQAlh3f9RhAs4bHWMD/TNKeddfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tb1iyOXbqOksNo97QAArGziE0aiNrTR8vS/qlRlwK1LWpYXgn2KEcPyvQCETIboli6RJAOJ5sXlVHiAcbgokQiGJ0HJLvALzAaLo1TSZvBfGLU23gFbqfzV+fs0lxrNXP03Lddiq1chQzD8pmiKkFJKwYAWypzfa6Wq1XGPtP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIBKC6HH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIBKC6HH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728242017; x=1759778017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uhg9qnSWHyZrTIesQQAlh3f9RhAs4bHWMD/TNKeddfc=;
  b=JIBKC6HHx0pT0ru9JMwdOrqLHBLeZsi+0t20MVm3Xa1MTn2CqumElZ4l
   wjE2HU8TAHBDWQ28sHs1DwL3gn/hKKBMhe2Ypl+nDm4TlQClYvOTv7JMa
   5qx+JAOdoic9GQQMO2/EE6Nnx5Dy5fPnEKRAf3BOke/u31MGgfnIX+1Lt
   LSJsdjdIVYJ8N0B1dG+jJ5vkeyNzMQNXdh9x+XCvtSn0m6v1FclPnkd32
   A/cOaFRma8UsuUrpt9KsRRHapOFxRML96y+mFX1vR8FK2RFW3SQwCq+af
   dNS3OdjDjQxqYpb8OEgeqxsPec8muQ7/kfiO1oCMBPXkbkJ2pMve8Znmt
   Q==;
X-CSE-ConnectionGUID: htEkf9zdT6Gs4pcDelQrww==
X-CSE-MsgGUID: p8n0h29+TR6ExbbTpe4ykA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="44859574"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="44859574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 12:13:37 -0700
X-CSE-ConnectionGUID: 40GBdCXSTNOsX2enGXAwOw==
X-CSE-MsgGUID: WswuLlt0ROuIqqa+G6dh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="112729786"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 12:13:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxWhB-0004G9-1p;
	Sun, 06 Oct 2024 19:13:33 +0000
Date: Mon, 7 Oct 2024 03:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5892/16788] gcc-12: error:
 unrecognized command-line option '-mfpu=neon'
Message-ID: <202410070316.2Dpu0QgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 4ee746439830c24ac6722d15237c9992279f74ef [5892/16788] Merge branch 'mxc/next' into next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410070316.2Dpu0QgJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410070316.2Dpu0QgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410070316.2Dpu0QgJ-lkp@intel.com/

Note: the freescale-fslc/6.6-2.0.x-imx HEAD ac32ba5fe66266329914d2020570364afe217bec builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> gcc-12: error: unrecognized command-line option '-mfpu=neon'
>> gcc-12: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
