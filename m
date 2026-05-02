Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F2240DFBE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 02:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777689317; cv=none; b=TTwuq5eAVM6Ljlx+gNib43cben8c9Nhd3h+cHmXevcErETo6hjffAbly8Rcda3LFeSC6Vq7AGBqCVxqjFE2kKEXLDyaTJExEWFnCZzs/cReo7Ux8ibZaAhbp7iiG9UZibrJgCS9z3ZEl5h5xte4Wf7DN5plt+sd8rWuXYxm+Qpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777689317; c=relaxed/simple;
	bh=bQTNEoSSoTHNx0sU1A7Ig3UDm/hd25UgzMjqzNmyE20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q+iXzEktYJB5+9WXvlQ0/7Cb6tqHVKx+qwG6RAMsq9GG5PVJeSo9F3Cmt6K3xdHjpewue/t7h4bJE8Jq6+s/SX+rFCZ7YBWSVuESfCHO77R12V7luoe3/B80021KZMkJBTBa72xVJdmlovd03Lx1AfL9kGdvBFbPdrKQLt5ezC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DR2Cz6Xw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DR2Cz6Xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777689315; x=1809225315;
  h=date:from:to:cc:subject:message-id;
  bh=bQTNEoSSoTHNx0sU1A7Ig3UDm/hd25UgzMjqzNmyE20=;
  b=DR2Cz6XwvEP0Ae19Rb6SdXfIex5DnW+IT3DIfH4JPEaoAjT4/O+cZSsv
   6350ZQXsRh6NUy3BcGRBsZQtFMLKmWOHv6pMdRxcuwyE42elUaFEBNGAJ
   Tf4nevGS+kC8fFMdOdmy30fZ9UsDMh/Xy+tPz7OgQ/dk9kJEc0oyFB+vF
   KjmhEeTBM5WyIXDQCnzIzAALkL/S95tgHzwCCgTc/c+XrZJQrBl46/uuA
   n+KWOXk+W6NsbHWSnpReieFco3da1hU1W0Vh4qCwR0UKH6A+KLX7sypDI
   MqNc4+vOzOM7jAKTg8hQ2GyOU6hrVTozpuh51PYji7daooJFJflmva22J
   w==;
X-CSE-ConnectionGUID: pIlnC9LmQiC2UmXIdvuroQ==
X-CSE-MsgGUID: Or/5UpwwRdyAo2AQ88BuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82498233"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="82498233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 19:35:14 -0700
X-CSE-ConnectionGUID: vx0pus94QISRXXlqfBk+Kg==
X-CSE-MsgGUID: oa4m3qeGT2KKd3UjpZE5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="230417993"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 May 2026 19:35:13 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ0CD-0000000015l-2oXa;
	Sat, 02 May 2026 02:35:09 +0000
Date: Sat, 02 May 2026 10:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] vmlinux.o: error: objtool:
 ___bpf_prog_run+0x21f3: sibling call from callable instruction with modified
 stack frame
Message-ID: <202605021035.FoQIBzjq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   9a6d85275cb1def4a196bd5c757f22c4e21f1d0a
commit: 07c6fcc0ac3d793fe9ee0b7a8a1b8b636e8881ba [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-003-20250820 (https://download.01.org/0day-ci/archive/20260502/202605021035.FoQIBzjq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021035.FoQIBzjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021035.FoQIBzjq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: ___bpf_prog_run+0x21f3: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
