Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3075F269CF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396847; cv=none; b=UcuBZKs0YrXTWFSrAshaDnqcBh1EljRPhr6qi48FWG2AqOtHD7HojHpJRcJ+Fx/861yvUwX2nKf1VzvWw4l9tOZoXwqtJc6VnggdddCO8wLlrX6CbtNycHuEh/40MGkg7CynYsow9dPCCnOJaeCB//BhI5lGj5CYEL3A1nuSpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396847; c=relaxed/simple;
	bh=MQe9fJ1QlJG4gg9SoGecJ04sTy85KoNdCNXy4PuD1n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGJadq/iiNXLs4FoECRfhYDyCIZfW5+3PS7CU7K4mqf3FGF1TixCwugl7R3DjSx3QENYSwD32e6+FEw35h9i0f1+DxT+JU/JmxvOX2FXkrIE7FkIjvCwU4j6TRgs7jRs0b4It0L5qshVzdP0+twyif/m3HBwdU2xFLVU5aDXtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGfu198j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGfu198j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744396845; x=1775932845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MQe9fJ1QlJG4gg9SoGecJ04sTy85KoNdCNXy4PuD1n4=;
  b=eGfu198jgNGWXbgl6b4mQ25OmzakNdc1U0qsbe5JLQqhqPuiHb6Zf2zp
   63x7sDpeGVCCMtIknoY4tbps9ikeY/tqftbz7KvrBN5JQ8DuMF8sIhNGT
   FH6TgDOd9rHvBYP4EbE39zNU48ma0ze//D1234L2vpoNIsvEkj0s6BCV5
   G3JT3ZtnytJhHNm7jjRgf8JJHi5+WLP/HOt7LZbg6N+B6cv7zggjF7jCI
   K23kcAqiOu8IEOly5ZJseqxjYGsbn4eoJtIT9T+1PACrkahUO5y5ZHlJK
   yBi7YdaWAN7Jp+MpzbbrZxfv9BWjXMqM3pi3/1eqDYxuWa1B56Znr7qqJ
   w==;
X-CSE-ConnectionGUID: jglAMK/WS1u4X/8eyW2mlg==
X-CSE-MsgGUID: oxS6oFTET1i+MZH0PmSUHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="63500498"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="63500498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 11:40:44 -0700
X-CSE-ConnectionGUID: vSEBsDXETWWLNVwrq7WTzQ==
X-CSE-MsgGUID: r3V/xByoQPC2Hh92EDLd1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="129124449"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2025 11:40:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3JIv-000BJW-0Y;
	Fri, 11 Apr 2025 18:40:41 +0000
Date: Sat, 12 Apr 2025 02:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.fixes 12/12] readahead.c:undefined reference to
 `anon_inode_aops'
Message-ID: <202504120225.Q7nZarlm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.fixes
head:   662342bfac7e9c924634ae390d3d97294b172773
commit: 662342bfac7e9c924634ae390d3d97294b172773 [12/12] anon_inode: retain EINVAL from readahead
config: i386-buildonly-randconfig-006-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120225.Q7nZarlm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120225.Q7nZarlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120225.Q7nZarlm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/readahead.o: in function `ksys_readahead':
>> readahead.c:(.text+0x9e0): undefined reference to `anon_inode_aops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
