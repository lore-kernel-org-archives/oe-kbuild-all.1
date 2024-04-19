Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5919F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713544756; cv=none; b=snIbVrXS0tD4NiDyA2CX2jCG1ZM3gOvpKmvKY1/sntgBPGpFQrUppUvpK7+H5VCGWhf244r08fGd9wxUe1EzYrIf5Kw5p4hT7710y+e0nx+EmyfG22o5l50iEp3UNPNUK7ioaLfi+lfx6azUDf8NTO1olvrapequvFDrvqnma6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713544756; c=relaxed/simple;
	bh=3NkTiJa/TXLO0yV1gWWIu/A4oAwsiIGI3eFfMCyq+gM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iggx4yQAHtl0mZkwhYcY6MJNtYfnaPaAGG1dQzpsY0XDP3erup5mDi2sR3eywWSeU+hvXzVYrbIhb0Q8JGg+LwkS8GgayNGf6Q2SoGDMNcYRifRvaiXK09XCCZm6N7wS+YVJUa9xgqLfBOqRZxu4mnJhHzAwTfPNQRc389sHAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUGs+ovK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUGs+ovK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713544755; x=1745080755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NkTiJa/TXLO0yV1gWWIu/A4oAwsiIGI3eFfMCyq+gM=;
  b=iUGs+ovKI/JnIyrIZ+krq2ZLmrbaeLAO4rI6pALNa5yUAutbjjumnaiy
   bIxwLvioFhGOmsAtUMlZfFp9bEZIUPMmwCQttzJGw/eU0vzDeAt7CJV2J
   jNjhw4YG6zNDLiKOUUtgVAzK0HRFLmitrIyxV/bWFt486CpORr87jIZjo
   yvHPXJVr2aul5swRhjMFZWhwiIS6b31H3npxmDtZ09ZdwBnhXDq49Naq9
   34B8mEKvfBD2od7SsA/yQyh+JdleuvoQs9hisnHvOQf4CzMZNYNQib7Bz
   +M1XtM+JHTt2bDZJgOu8cHnRDM2mNtDGx/0p9WX1M+goa2ffMcOlxxhpr
   A==;
X-CSE-ConnectionGUID: 9VsBCVVrQIyWcv7xS9nlcQ==
X-CSE-MsgGUID: qWtcDgWqQoiF1LVu/vc/9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9269899"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9269899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 09:39:15 -0700
X-CSE-ConnectionGUID: GBr3yQJwRru0w1fjeaE5uw==
X-CSE-MsgGUID: JCGIEthTSVWI1ojZ2FyiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="28202672"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2024 09:39:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxrGY-000AJC-2w;
	Fri, 19 Apr 2024 16:39:10 +0000
Date: Sat, 20 Apr 2024 00:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (Dent Project)" <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: [net-next:main 19/25] ld.lld: error: undefined symbol:
 devm_regulator_register
Message-ID: <202404200036.D8ap1Mf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   4cad4efa6eb209cea88175e545020de55fe3c737
commit: d83e13761d5b0568376963729abcccf6de5a43ba [19/25] net: pse-pd: Use regulator framework within PSE framework
config: i386-randconfig-051-20240419 (https://download.01.org/0day-ci/archive/20240420/202404200036.D8ap1Mf5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200036.D8ap1Mf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200036.D8ap1Mf5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_regulator_register
   >>> referenced by pse_core.c:308 (drivers/net/pse-pd/pse_core.c:308)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_controller_register) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: rdev_get_drvdata
   >>> referenced by pse_core.c:212 (drivers/net/pse-pd/pse_core.c:212)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_pi_is_enabled) in archive vmlinux.a
   >>> referenced by pse_core.c:230 (drivers/net/pse-pd/pse_core.c:230)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_pi_enable) in archive vmlinux.a
   >>> referenced by pse_core.c:250 (drivers/net/pse-pd/pse_core.c:250)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_pi_disable) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: rdev_get_id
   >>> referenced by pse_core.c:220 (drivers/net/pse-pd/pse_core.c:220)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_pi_is_enabled) in archive vmlinux.a
   >>> referenced by pse_core.c:238 (drivers/net/pse-pd/pse_core.c:238)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_pi_enable) in archive vmlinux.a
   >>> referenced by pse_core.c:258 (drivers/net/pse-pd/pse_core.c:258)
   >>>               drivers/net/pse-pd/pse_core.o:(pse_pi_disable) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
