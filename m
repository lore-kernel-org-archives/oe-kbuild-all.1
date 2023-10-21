Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49363C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bs41pJLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697900183; x=1729436183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNlHn0TrnWnoV48FEHQsbPFnqO5ka4JuG7RVTMqSxeM=;
  b=Bs41pJLhbaq1IkSfl+aVieB6gAGyoSU4xelKg9mjoPUTlC+pF0r+42HC
   RJoIP8SZQSf9ShCbNIe5L7tE57p5wAysN7ocQDiYlMQZRsS5v9chFLvlo
   ziZH2Dlo8ajglIfcgMoMZERRc0tPivp3uOIKuk0RS2tRxIqBVssHT9fZq
   SDhf3/1/fOYTsENjmUXn1Gv9yv3eaAF31KYpdjAMGJeqavrFQWg4WyDff
   +1Kps8p1D8VBuUVRfAaasSPZyijmyDwunGWyd+d9nb+imFAGMP77JNIDe
   AhRZuPB1bTF+EWIm3dD3c5sTS5ZHcZR+0Z3rhLCW3uK3jDsXvMnWyWY9W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="472860084"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="472860084"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 07:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874218845"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="874218845"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2023 07:56:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quDOb-0004wt-12;
	Sat, 21 Oct 2023 14:56:09 +0000
Date: Sat, 21 Oct 2023 22:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 21/209] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310212253.FwjuB2UZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: e0861b512d7e5cb7441ea92e5063376370585224 [21/209] arm64: dts: apple: j31[46]: Add keyboard nodes
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310212253.FwjuB2UZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212253.FwjuB2UZ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:121:
+		 * best guess is they are cumulative.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
