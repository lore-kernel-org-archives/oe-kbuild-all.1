Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE217C96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715795283; cv=none; b=LQFLanwPeLX5NKMt7LlaoGGYnhBJmZGJA4ntylla0OvNIBP0Y8TRehNjRJvauTdfi9jhfN0Qrz3Cld3xv+IK1d+e1KfHFRHU9kKCEPbY5rdN4d0jiPTQ7wTwuV34nYQoRknRvuebtouEh93UYe6IbOrVxWIe7EUpJOs2HEqA0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715795283; c=relaxed/simple;
	bh=CZU2Fd+pKX5FnzEJxNxQZxSztpAfC0eiDLYbO2deioU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1miNA3yc26R4jEzhgT3Sr83XX0GxxVfpxiMgsZbcmOWfHSkrIO7HYyUnwyIo8ORgq68C9Fdbx+6ZPu7BGKgnSfn9WrXCTRrWbsTyI3Ypgt/SGtifDw22NG7eDrntstLlyRjt8RRQiHYt74EoDCwtigcSB93TV5hsGJHHDXzwQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAUI5l+y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAUI5l+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715795281; x=1747331281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CZU2Fd+pKX5FnzEJxNxQZxSztpAfC0eiDLYbO2deioU=;
  b=WAUI5l+yylLNwHgCjY4z2MW5GA8fTzhQAh9Jxip8hD+JXqfs8jy/QTzg
   +ZTYUFSADkiWlsfjlogTqRqz87Zomaj1xVE7Ag/anV0mi4ZSnQAo+2ZWN
   s5NQ4I2ze3rqHuRu1+t4qsrhy8B4B5h+LiCggfoD2NlkQlyhqaFDKlH5K
   Bs+iTcPR/pgC3oU+B3bihtDwTuO6sdGB/4daaon8dXEEyIEt6hDeRGfMD
   GpXLg2h5uJNxUzu7aErrDp4zBVvkBv03dQpbS8i/GFq3yhXe84ATCz/8J
   GPSSTan+C1FU2xx6AEapawCp4yKmd5FYDfhiQA9MxdDR2YU4Pf+/xqYmX
   g==;
X-CSE-ConnectionGUID: aMMnAkL0TFu39NccZtF8vA==
X-CSE-MsgGUID: ixyzQxvISwSoHlXhtIpqyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23266167"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23266167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:47:58 -0700
X-CSE-ConnectionGUID: Fdwozf3PQ26Ik0MU/zX43g==
X-CSE-MsgGUID: fPyfEmw/SmilAmNYcCULKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="36019654"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2024 10:47:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7IjK-000D6F-1H;
	Wed, 15 May 2024 17:47:54 +0000
Date: Thu, 16 May 2024 01:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport 16/20] drivers/tty/serial/8250/8250_port.o:
 warning: objtool: unexpected relocation symbol type in
 .rela.discard.reachable
Message-ID: <202405160127.OqJ6Bp7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport
head:   7e2ab7926aa0db705609c2ec4e29b2631f812a19
commit: 9897eefb7f7bfb5047fd7b7b2efb00f78a4c7b03 [16/20] tty: serial: handle HAS_IOPORT dependencies
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240516/202405160127.OqJ6Bp7f-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160127.OqJ6Bp7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160127.OqJ6Bp7f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
