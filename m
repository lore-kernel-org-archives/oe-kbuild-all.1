Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5625F1D90C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196889; cv=none; b=Omi3Cqqfx7pHS7fep/6cnR6fPcd3VikI7qoRt3N64cqNxX2+iLPHwjZBWWMgyoETnC+dcRgtWXB5+ZGaRqd8VaxtvFrP07KwC/0BQlOnwZkNpK7DUkiR30PbS2GxySS2/9u2Clb/p0x1Tf5L20oa1XQCAZl+VaNqrC2P58YDnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196889; c=relaxed/simple;
	bh=5ErUIMAHZ0I4cEOApvP0fKhZO3qrFvs5TqKc+M+dRPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1VmHiJQ6gQNRSTOGtDzK600wj4RwG5q2dJrx6x+uL5pbarPsU/iXAAkjebQG9+kD2Y9UBlLDvJoWHer1EAoht9x+IgkvHGiKhLBDl9xCvVSkrwYPpn4vh8/lxQP2CST8P6NdMtHXLR5OMVKhAbvDHY5eMNkJqKXKonQQ/jP028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nC78LHUO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nC78LHUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732196887; x=1763732887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ErUIMAHZ0I4cEOApvP0fKhZO3qrFvs5TqKc+M+dRPg=;
  b=nC78LHUOvgSSfby3awIj/HMHnykUU/w+MeWiVSqbJVedHA7QrlDNCjn2
   UynpTia6xyIFbkEFY9XVVIzY012IpxxcmpOFgG9UEZYke2HIESGM1/6aO
   fSGX0UX62TybuAsfxAD2626J1pmgC3EEn8QgrmQr7QvfRXeUYsP7ZhXtx
   +xGgnd75r+4CWU0dZgSmTJAuLqMab9/Ilt7Vc6uj9809cjVZYd2rHdYLY
   wPb8zaGlwZNmQyXi+1PSi//C6Ou4KL8FtdvclTMPAhqRPkiEu/UmO++7E
   vLv3pDmhZxJzwAjCLiOuq9tfazIEFai+JUgN4EQkgMYiSBq69s7Ibhwea
   g==;
X-CSE-ConnectionGUID: 2ke02cSiSk2dB9uKNrDtKA==
X-CSE-MsgGUID: e2BPTk26RP6a5tsc5yn6uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35974977"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="35974977"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:48:06 -0800
X-CSE-ConnectionGUID: HXFqUAp5R0+IAsYTsUt0lQ==
X-CSE-MsgGUID: Tr+jsdnwStecmDnTxPOoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90075543"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2024 05:48:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE7XO-00032J-32;
	Thu, 21 Nov 2024 13:48:02 +0000
Date: Thu, 21 Nov 2024 21:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/hwtracing/intel_th/msu-sink.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202411212153.Ajpai55I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 4d516770f81434cde260d33430626e3880b9902e [1297/1297] intel_th: msu-sink: An example msu buffer "sink"
config: x86_64-buildonly-randconfig-005-20241117 (https://download.01.org/0day-ci/archive/20241121/202411212153.Ajpai55I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411212153.Ajpai55I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411212153.Ajpai55I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/intel_th/msu-sink.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
