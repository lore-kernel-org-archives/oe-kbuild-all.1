Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199002E625
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsVf35fU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697129752; x=1728665752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJe8WKgyGgEuk24MFJzl7UKswIEDiqepEGsuJNSOnOw=;
  b=TsVf35fUtYCQO9BxlpX1uSpyFVUxblQ5WB7yYkyy2Kwu6fcL5KMWsCO7
   2xC54VkcYZH5BOoBt36eycxE5yqMzyObFt1rAGlk6kw9wCNsVyANe88xk
   +2Rd8Dd9U71RFXI/ikRhsGsZReaLn/pfeTkocE4XA1IyjA1RA8OjAdsJu
   5TYOxc2N3avRTxEBrR0ocTBdy49ImkqBkM/fO9f88wbYm9bq3ABOOkcbX
   VIhWLzJoRRgUM3WnNdIbOZG3N4jVdAKFvefTgoHOm4j4J1LnDBfHk4Lb4
   vjPj+6avh0RVfPSpgGDB60yjEg3V9KLC7dG7luUji5YtaXGawFrOxjEwK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370046690"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370046690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928067045"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="928067045"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2023 09:55:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyyO-0003fB-37;
	Thu, 12 Oct 2023 16:55:44 +0000
Date: Fri, 13 Oct 2023 00:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 82/196] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310130034.UuL8BvEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: 3aa7598fb35898e04336c9860fd87bf7e54771fc [82/196] arm64: dts: apple: Add j180d (Mac Pro 2023) device tree
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130034.UuL8BvEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130034.UuL8BvEO-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#523: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:506:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
