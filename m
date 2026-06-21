Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF325A2BB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jun 2026 23:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782083270; cv=none; b=KnOqeDJ5BgP1+oiHJRGngYAIwuzctPLtoW0iEYpOfmS/85BEhJLL1VvPqscY5MPICQDl/ezJ2GDIKIsmaJkJNMvckYBa8lSakPBPyo9h25wTAKnJLYoALxDsQoy5ACJCk1Z83k79j1c9YgDlVq3iDMt7Ks0rv/wP4NjfO55IohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782083270; c=relaxed/simple;
	bh=sldk4v1ecZaDkp4HP8bYaOKLrlaJsEeBWaKR+Z8oscc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uhYlD63sdpgbto5XivB1Qt2/mUCzCQ44WvxZO4oGR9F3uRjlEj88ljXovbxb+obx+7SQrIm/cLcHWV/+82D6UyyZz2B35RHyPtM33X92Zg6cLfYeYy6MZkNaXOM3X5b+I3jtcGk3Vx2CW1USPtjyv2S+mgzwidUTq8wtOZ/7mfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1sYunv2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1sYunv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782083269; x=1813619269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sldk4v1ecZaDkp4HP8bYaOKLrlaJsEeBWaKR+Z8oscc=;
  b=n1sYunv2gNLpRYrg68heApyj1/2/dkvl+LGggR9G4M3AFtCEB0HnLjaB
   Zem2s8opBRNI2hEiTFBqNZcJZZry2OOUqWpViWhLszDXinR+xW1OqVMpH
   KDoDFEbncQWDI+r7SHIPBCAuV7t3gd2vJcbeoKLSGj/pbZTcWrjUu7443
   hMosypijwtYPdVZGMaS3ntX/F+ofF3RdhQmDy1F8zXukpeGeKcqecXq8k
   7FGplstdCWcrDrnfRdRBGlZPQmcJ3qgSgzg5XR9To7qTXZv/hWXeZjeEw
   wj7AyJYKu0jMm3tHXa+zYx/l/O72EUMpZJ24jthfLF4+JtkDKKndPd8oS
   Q==;
X-CSE-ConnectionGUID: AsdriW6YRBKw91nikg4Jtw==
X-CSE-MsgGUID: fvnMIPRwSKi5AheobL5fZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86496997"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="86496997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 16:07:49 -0700
X-CSE-ConnectionGUID: GIPIf1SgQiWsJQ0B0DuqqA==
X-CSE-MsgGUID: Vy1DQ7CqRnuI2pElCwywww==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jun 2026 16:07:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbRGS-000000005xR-3ffc;
	Sun, 21 Jun 2026 23:07:44 +0000
Date: Mon, 22 Jun 2026 01:07:41 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 37/120] ERROR: modpost:
 "rtl8192cu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko]
 undefined!
Message-ID: <202606220003.qhswWrHW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   e837c4a4d860d6896e61ca44c5bac69b2500abcc
commit: df8834593648ab0294719594eecb9e2d2e2cb341 [37/120] Try to add the wifi card in the dlink device.
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260622/202606220003.qhswWrHW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606220003.qhswWrHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220003.qhswWrHW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rtl8192cu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
