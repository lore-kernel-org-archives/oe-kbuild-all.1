Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877E3043DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478737; cv=none; b=I45CshoMJOzcdGmCFDTo4NK3cZrtW/ajSmH2Kmvx51QI5NPti1Gujgd/hJr+7VBqJ4cUBp+S1y7kCr2R+uEFjTRNFQ3bWxnezDwTaSQr+ARhgVE8OXrtAdkEKFPvFttJBdN1XxN5Kl9YkD5wieCw2OS/9pZe1j29DFZFO4+HLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478737; c=relaxed/simple;
	bh=phFIaNQNJFtmcUdbQ2l//8E6c8izUvMDzrhI+AMu3GE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jozLMSiv4Fmx4J5MwilVUqVvfLP/+OhjnJMhv5alXN36y3fMSFU4EIigjOOCl41UPxIm1nPZYxmUPaCCDRfl0LLGxU1E7IgUNJvXuIUPJS/RoZEl/RK+LzK0crfQT1zUJLhcwB5n+fAArcx3IFBleahEBlBDi6fHlfK6eXaN+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A70TnjMs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A70TnjMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786478735; x=1818014735;
  h=date:from:to:cc:subject:message-id;
  bh=phFIaNQNJFtmcUdbQ2l//8E6c8izUvMDzrhI+AMu3GE=;
  b=A70TnjMsG+ferBbOsgNEVJNbFN3k+KqJoaWuludHrQrBULEa8vc/jMpz
   nS5nmDUu1RJoMVLXnVqUQij727X997hSnFTLrzDSMHDv1GDSy3+nCpc9f
   McanhwHRxE4BPHF96vqxcsKWD7KtMluClFs03xiGLjfpMsl8/mniIXUNP
   UB5d6RaReJHN2aaq7LlL/qwUmd3TI/Uj9orL6jLvmY+McQz1sJhexUkXp
   R0j4sILH/ffHBT2jBMd0CWVX+dmkN5kyWNhGMVq5I41VOBdf3wTmvgk4e
   fmavT5u8Z45JcSaVVfw+zaIV+0iLzM9y3i6QpUFs20Z6gZ88DiPbVMnFd
   w==;
X-CSE-ConnectionGUID: Ql3RwMiaQECyyktOD+Qqng==
X-CSE-MsgGUID: 50jbKywVR9WvtQlArKRcqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74558261"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="74558261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 13:05:35 -0700
X-CSE-ConnectionGUID: TWkPaiaTTmmSo1VHJ6hXkA==
X-CSE-MsgGUID: 6uR14RbDS62EvwZOI9CdGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="301665660"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Aug 2026 13:05:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtsj5-00000000PEY-1AGN;
	Tue, 11 Aug 2026 20:05:31 +0000
Date: Wed, 12 Aug 2026 04:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 25/26] ERROR: modpost:
 "__SCT__tp_func_netfs_rreq" [fs/cachefiles/cachefiles.ko] undefined!
Message-ID: <202608120322.juGMNsCr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   a220dcb80a5e634e3ab906edfe8eb2c86c389663
commit: 2ecd13ce98b2ae598966a1cb0389ce08ac195793 [25/26] netfs: Combine prepare and issue ops and grab the buffers on request
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260812/202608120322.juGMNsCr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120322.juGMNsCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120322.juGMNsCr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__SCT__tp_func_netfs_rreq" [fs/cachefiles/cachefiles.ko] undefined!
>> ERROR: modpost: "__tracepoint_netfs_rreq" [fs/cachefiles/cachefiles.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
