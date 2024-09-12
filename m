Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9946C5684
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 01:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726103728; cv=none; b=egl4IpM2g6aNCJPaxcvp9ZojSWcqH+gP+KepDhlLgi26HeJHPkq5jWhmAENkJGBM0SFu5J1CUHddPApLlz3dRA38goMS3UpaT3ZMFYXMwX3giuaMuFx7kYmhzQBOcPAJr0GMMVky6VNhiirohZjGCDLfOlr3+x++d86PBJNCkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726103728; c=relaxed/simple;
	bh=OBRMLTwS1XfttxM3kPyWYoeTjDxBG1ZdR9wb10EBZaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlujcobP8rEjWMi13qv21RAZlHHfitQtD0LQqxQrKC2e5k3A6LFy9HY1oZQi3QsEMXOugR+7H08ceAE4gmPaMlssFNONXd+b0tDm8LgJ13qDqb5xn+0WxHrRbYO7m3poVtpX/bRz/uqtcoM719AK2Tvb707sIeYd8lai16Ccgyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/duYRUO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/duYRUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726103726; x=1757639726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBRMLTwS1XfttxM3kPyWYoeTjDxBG1ZdR9wb10EBZaA=;
  b=Z/duYRUOvXq+arHXW9vnZFnaS8fC4uGHSaXNd4/3hifJ0t4rne/g3T4E
   8WR+wv/A3/Iy+Ekwp7J4r7+v/GAw5TuYkZxK2vI1r9OVb3bogVyDICyQw
   V6NcWYUxlGKTuDbAy9Yj/O0HIh1QxrFrlZuxVtL1sDcmV8X/ue+dbst/0
   Up3yAh9+62mHOjkJAtzIQo4ya1ZNHz56ctSjsg8kmlyYRN2bi7QTVtATF
   A0EFMvfFGJoOTb+/VTL22o1EfKHuzwwiRX422iIgUw/P6qX0vyAWhWKRT
   /lxYTVF2zPbB/niWCh33Pkk+VYAO830mQcDdrk+TgEuV5yTXcwbZ66ea0
   Q==;
X-CSE-ConnectionGUID: kkRsAd/zRLG6S3bZljGJXA==
X-CSE-MsgGUID: d8CPpGN7RL2K3iz6kjucuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24474593"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="24474593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 18:15:26 -0700
X-CSE-ConnectionGUID: J3Y8FXVfTaOieM0vZa2mlw==
X-CSE-MsgGUID: qu11JHcjT169cFdcldbygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="98247775"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Sep 2024 18:15:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soYQc-0004Lm-23;
	Thu, 12 Sep 2024 01:15:22 +0000
Date: Thu, 12 Sep 2024 09:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 40/53] sound/soc/loongson/loongson_card.o:
 warning: objtool: loongson_asoc_card_probe+0x40c: stack state mismatch:
 reg1[29]=-1+0 reg2[29]=-2-64
Message-ID: <202409120906.FaI1Y7pl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   394400796206855479c4f2c7013896d7cac0d683
commit: 5e6f78cb5f53c52a11090657e917d2d7202aea23 [40/53] ASoC: loongson: Add the correct judgement return
config: loongarch-randconfig-001-20240912 (https://download.01.org/0day-ci/archive/20240912/202409120906.FaI1Y7pl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120906.FaI1Y7pl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120906.FaI1Y7pl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/loongson/loongson_card.o: warning: objtool: loongson_asoc_card_probe+0x40c: stack state mismatch: reg1[29]=-1+0 reg2[29]=-2-64


objdump-func vmlinux.o loongson_asoc_card_probe:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
