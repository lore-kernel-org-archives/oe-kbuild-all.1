Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61B1FDE08
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 18:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738779685; cv=none; b=U63eSgBxKX9amE8ffnIjt1IbKvtPCefqjZnZBJUh909DvVLu05t3mozAgtRlr3Oc4N4oOLFXZEJ2pT8zUh65DV0n58jrTN5SXT2gpUfTyYfs4pdyrV/HjeukNcucc+iwFmahl9Xkv6+rQ3D3UMwTHFFbEEldjLn+fXYwec3RE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738779685; c=relaxed/simple;
	bh=xFeY4NN3Z78hWOGr3p2pKdU2pYcVtwpCUUeqPuxJA1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIo59jQLEpAKNWItQ8otQqp+7ik6zmHX1NjKrbVAA5fVqGD3NZORQfRZn3so2q0eVSyrXqCOqurV5P+NMh51AU2rDWb5ABB+z7ToFWW+4ixvl1TdtQwxcb2R/LkD5Bwc2DGSN6vijcdGLE94BVKO/IokTWg/BehnFbF3u3pjG14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiNhlqti; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiNhlqti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738779683; x=1770315683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFeY4NN3Z78hWOGr3p2pKdU2pYcVtwpCUUeqPuxJA1w=;
  b=QiNhlqtiEhfDU/HgLZE0g3Z/df+hV5IWQlkkbXlD9iTEUGEiPIB7rTSh
   0DVr3tlptvNLsQwvgltPLyi0ZKfA7Rc4A3kVAraRuf60jIk88xJLQdp6a
   LTVndmNWac9tsu23R6Evh6Hxh+17JJmu3xG/SwrgzzTPlsgLoTpVeUS1t
   459RL/xw7ECC5FfvfssKlLOJnuIBe7R1WvPG3ZZYDyBU2af1xkLkbzVxR
   0ksDWxoNJrCLDYdiG9YVOPzhBhlUctEEIxygfZxLa+GDX/jQafxqWNpsj
   7K5W7YPrhUI8zKKgNGRrjO7IjkVBRbS+jAY6JM6/NmpH+jpe5EVSQYgn/
   Q==;
X-CSE-ConnectionGUID: JZHOqR2vSFOixwudQAegJQ==
X-CSE-MsgGUID: 3nJV4mArRdqWztIFeZF+xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39496383"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39496383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 10:21:23 -0800
X-CSE-ConnectionGUID: Gx884DgpTS62ZI3jhit3bw==
X-CSE-MsgGUID: kneS8LztQaiHh3wt4fw1DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="116022464"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 10:21:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfk1Y-000vuE-02;
	Wed, 05 Feb 2025 18:21:20 +0000
Date: Thu, 6 Feb 2025 02:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192] drivers/memory/mediatek/smpu.c:
 linux/soc/mediatek/mtk_sip_svc.h is included more than once.
Message-ID: <202502060227.HextgjW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: dbcecbd857e7f464d25d76f956d9245ac6ae45e1 [192/192] CHROMIUM: memory: mediatek: smpu driver porting
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060227.HextgjW0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/memory/mediatek/smpu.c: linux/soc/mediatek/mtk_sip_svc.h is included more than once.

vim +21 drivers/memory/mediatek/smpu.c

  > 21	#include <linux/soc/mediatek/mtk_sip_svc.h>
    22	#include <linux/ratelimit.h>
  > 23	#include <linux/soc/mediatek/mtk_sip_svc.h>
    24	#include <linux/delay.h>
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
