Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B01F3FE2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742942628; cv=none; b=oj5KATcHhaiATUXSUgRGCHqmQ2sbOWJ8S9Y4/lCcNFbXkXAIyplQX8B1VvFCGwEDGmJkMehsLkMCCw7HcOUA4mZTuXI7dMugA/QUqvva8guyvkMaHtQj/OUJo/qG3kJLqcLIEgvIuM/XhZn/IaMePD+Ssfyc6s76cbL7mCv61PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742942628; c=relaxed/simple;
	bh=bTgD9vusWgHmH3tJp/kyeZP4Bh300fZWrXEYvLvB9HI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0mWJfO1LepRbS2LNALPULf+A2sPHtci+lJASQdEzgVlxln0x4yhoGjMLRL+1nucp9Ghhp1pg0hRMGXtyqGdS0UelIDBkJCHrbbrPwsop278K25PJtgYlVCjRBfFWPjoZhEujSxqxxug0cvN8gN2HLhfFKkBb53vYF+iwUCfi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwuYmTKj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwuYmTKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742942626; x=1774478626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bTgD9vusWgHmH3tJp/kyeZP4Bh300fZWrXEYvLvB9HI=;
  b=DwuYmTKj/6Fv+66dQ4x8p2iuBS0EqHIZEjRfGuoMbVZAc4W08EM1kS4b
   oXs0LRc7AXca/hAWPNT8d1tiXezfZocIrE4FmTjQ35MXOy906k9l6Dq28
   efsU3UsE4GkuiRdj+ps9jpoSaKCjU1NyXc7Zy+qi68GyU48lPLSRf+S6B
   5k4frBdU1Dfqkd5ulRj3NFLmrFVL4iH6APNzlCi6MeUjnKmLXGDuD387W
   T0Mn7gW8g7tkRemr7DV7BMsipZ33wNSnuEYNN2SJ9DWWkf4WLxtRCIzVb
   ZzyulPrkQ6g2BwmHk28LFLLGQg7f9S09CwbPoq9N1KefkYaQg8VIENHSg
   w==;
X-CSE-ConnectionGUID: twZTeM5iRI2amoPxcSrMKA==
X-CSE-MsgGUID: xc9dNoUgTSSCZDCkUTRGdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61735612"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="61735612"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 15:43:45 -0700
X-CSE-ConnectionGUID: WdbYyihsSoSz3iVzbEklSQ==
X-CSE-MsgGUID: Ajy6Q/uJRn2Zw5T8KLa21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="129188370"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2025 15:43:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txCzj-0005FX-1D;
	Tue, 25 Mar 2025 22:43:40 +0000
Date: Wed, 26 Mar 2025 06:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2821/2821] io_uring/io_uring.o: warning:
 objtool: __io_uring_free()+0x69: unreachable instruction
Message-ID: <202503260613.Q2n0VF4Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0d616a77cb5f7198cca524a24f717f59ad51b41b
commit: 2c4dc5d73facd120aab1305ec14eef4f9a524812 [2821/2821] io_uring/tctx: work around xa_store() allocation error issue
config: x86_64-buildonly-randconfig-005-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260613.Q2n0VF4Y-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260613.Q2n0VF4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260613.Q2n0VF4Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.o: warning: objtool: __io_uring_free()+0x69: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
