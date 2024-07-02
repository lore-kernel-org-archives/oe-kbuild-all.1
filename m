Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECFA200132
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719952083; cv=none; b=EgRzXgCbhTO+zbmLz3VhtBrSBSDmVpAIg4fAHjUxYn5mmLcKEE4Mml+SsuBicdF3WrrCtPa8QAZ/8uU4BxIBbhu30FZTNqPMDMUIUkzsE/ob21y3MLcXEOolrn4cJKuCLP5RKU2dI+T/wtiIM1brI3Io6iviAK79/mFLMEQNdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719952083; c=relaxed/simple;
	bh=N5/uGM2+oOmONl/C1TjaF0vUwdFoak+04b0cbgCoFLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sM8l7nrV9tzHirppXTnSZX5qq5pzM8oO9RsT8wBSTrw6ziSc5kiKcjXLToPWlN5JPL+D8kcb02KrYNDu7D5Kc4sB4opFmgGiB9ov9Uw2rbWkLLsuPO5yXI5iqDt9mucURtffNEb/CIUyp2EO99iRDVQ8LXdiDtRRqixnSJWDq10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUczK9aX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUczK9aX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719952082; x=1751488082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5/uGM2+oOmONl/C1TjaF0vUwdFoak+04b0cbgCoFLw=;
  b=aUczK9aXmhj2H2iQxDzIlXE+3SX75cJ/mxHQD02ZPrMU5C3Swtoqm+NE
   /l91bYTMUf7LD5MEGMTFAvtdRvpI+dyNxwGIcuHhwCLsa531K06clldwl
   4N5YSvtXdQ7JoEZvBgJbluwSGNel/Dbi9pQE/9oUwJvnYxK/TLNcz5Q+2
   3uCfxdgn2kDv8oK//14kunjO+94arWdlST2UhitTQIqC53aqsSfW5/87t
   DgNw7i+3oZjBpLLG6dGH1wvzlo1mjqCHx1CTy6yd0qn1Wb8SY9RnuV2Ea
   G4q8hMlSZRwK7JDkfD5fYkp1EmGVbsfwz9xPePAAggIagoc5vGKohUBnX
   A==;
X-CSE-ConnectionGUID: fZ73/VpzTvSQnaK8NLrMsQ==
X-CSE-MsgGUID: BwP6BtTHRV2BROCNFQpbww==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34689566"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="34689566"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 13:28:01 -0700
X-CSE-ConnectionGUID: EEfperq2QeapJ/K/I2ODng==
X-CSE-MsgGUID: +bIGfLD1Thax2wF6VoXC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46003528"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2024 13:28:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOk6Y-000OdK-02;
	Tue, 02 Jul 2024 20:27:58 +0000
Date: Wed, 3 Jul 2024 04:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 28/36] arm-linux-gnueabi-ld: zcrx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202407030450.GBobmNfr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   daa95af9ac26711b21e20be3c8d512d6de26bb11
commit: c6ddcf8bb4be70d37e64fc657afaadc3a76cdaee [28/36] io_uring: add io_recvzc request
config: arm-randconfig-003-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030450.GBobmNfr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030450.GBobmNfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030450.GBobmNfr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: io_uring/zcrx.o: in function `io_zcrx_recv':
   zcrx.c:(.text+0x1600): undefined reference to `tcp_read_sock'
>> arm-linux-gnueabi-ld: zcrx.c:(.text+0x16a8): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
