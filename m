Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8811CB8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dO5Z45pd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697900186; x=1729436186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77KCi+MRHGII0sgKmoJQRHL1zL/YvY62Eh/6UgDXiGM=;
  b=dO5Z45pd86mAEQIFeHYGRW1I8EQEYVQOCWN9UoVESUgQ/epNWcM85ScV
   5L9JO89sHdo1aSEbefbiCDXIdbNKx3CcMqAWtKhDegFwUlVX0SEi+hczk
   LRgFiVU/5iZdOL67epE/4jSd0WUjr0ZCeV5VDwr/PgUGhjYQSNBX0EZ2x
   ntU+vF/e1wk8pFRLzBEvFvIIKKkTQ71dGtuPzQSQh2l131s9svBSMcTwY
   NXtojo2gXibdWGj4LBuT/aPo2lcROZecCcgtbpaTA3CXyTsLx7AcCNsWX
   EY1UdPr8VKJU3RikgLsoi7XTt1Uc4I8/eXw/ZUeE2EUfgtWdt56D8HHnk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="472860086"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="472860086"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 07:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874218844"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="874218844"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2023 07:56:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quDOb-0004wq-0w;
	Sat, 21 Oct 2023 14:56:09 +0000
Date: Sat, 21 Oct 2023 22:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 28/209] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310212211.gr8G5q80-lkp@intel.com>
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
commit: 422ed2de70b58ed698fcca188eacbdc566d760b8 [28/209] arm64: dts: apple: t600x-jxxx: Put in audio nodes
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310212211.gr8G5q80-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212211.gr8G5q80-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#244: FILE: arch/arm64/boot/dts/apple/t600x-j375.dtsi:221:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
