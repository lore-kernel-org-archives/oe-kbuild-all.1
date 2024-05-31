Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600471422CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149794; cv=none; b=N9XMGc4RwZJa2MiiGY8jD1oMG6h8u7oxRwAfgX2T3Flfd/oTNKxodKrl7McsX0LXQV8VcAs0k+h+gxewSs8sLTkaOAzyc9t22NQZ8kYKs4RzNVbCb23C7qRIO4uVMQTVQSJKg9DavtjngRgjgRjUpf0b+9EbOfCRo3jJBk4MoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149794; c=relaxed/simple;
	bh=ury8zgThnokUcpQDW05jAnLsq3lz+TjzXQ0Ed7TOt2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpEpcq9syplKzoGImN8SLoBjkSnXDdfOF0OQKPxcsUcuNkcCpUsqFQ5bBruQATLMMZsO7nK/pHVa+B4cvuE61KFqCK0upUUrVCMhPmedAtpn1hZjYe1jfaFR4DfQzfU0x3BzxM8m205Z8Kmws5VC+9q0A98cJdQKWGum0+2XOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpW6MTrq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpW6MTrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717149792; x=1748685792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ury8zgThnokUcpQDW05jAnLsq3lz+TjzXQ0Ed7TOt2w=;
  b=dpW6MTrqSYx/iFRfqkuRaGDe73n8BjinRyRyePM1TlLz0JT6u4hrvgkL
   YkoJllLA2V50i2lNJx3VMIayRcIPVNdrgVTjBDX+tYG8ahPCpwg258yGf
   N6Ho83vrpGKvXLgfYMYpMqCaJHL2QKBoNmR++7PSm+fEzFPNr37nL6L8g
   3yl3K4uj+J1bN6fZ7j17fINRjPDXAQmDiuXnrF1ncEas1IX1wpPA57M/7
   oVwnzpYBSxLoUAAWG0npWgyIOw+RzQehiqZp162h3rukSUyynjfAGCb5e
   MTtFoouHBXSmzi11vg1xWo5WtANf5ETmYesyPCNEm0bsB0xx4ww+ZSadY
   g==;
X-CSE-ConnectionGUID: k/D0k+vTTzWtls55bdVLww==
X-CSE-MsgGUID: i5Xshp3BS2u9jF3S1dLpTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25092334"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="25092334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:03:11 -0700
X-CSE-ConnectionGUID: A5GHig2tTYOg5Ky1vPohug==
X-CSE-MsgGUID: MRT0yAclSh2TibnylmLgoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="73599901"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2024 03:03:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCz5z-000Gu2-0Q;
	Fri, 31 May 2024 10:02:58 +0000
Date: Fri, 31 May 2024 18:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 293/310] lib/time_stats.o: warning:
 objtool: unexpected relocation symbol type in .rela.discard.unreachable
Message-ID: <202405311727.Aj4VDe5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   074ce47a8bd5ff767d2a86c6669ddba0d3a5526c
commit: fed57820878bcdd3d2c9f232e3fa60cef8b16a13 [293/310] xfs: present wait time statistics
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311727.Aj4VDe5W-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311727.Aj4VDe5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311727.Aj4VDe5W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/time_stats.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
