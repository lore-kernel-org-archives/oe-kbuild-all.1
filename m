Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0A33E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709613638; cv=none; b=ukDsndcrjEBZrFmjAZr1dL/X3hTVZJqCVn9nJ69F4ELf/94dxaCVhl42FYun5TJPp8TEWtt+zWRo55nuEv4FzgMIK6iK8fZW/7I10QsbuGGDtnyuyywgdRhToJ3vHvTb3nCNX5ndgF4Ihdw0vxhdnZQSU5CLuKN2liWnUS8Hh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709613638; c=relaxed/simple;
	bh=cCxi0I+6/qmBkfBL687/8+v6vmDVatp6FDr9E7bw9pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c24QjrVJXK74+P5ifaGQXygh6r86aWPjAA0Uv54qgbKp/9dw4dwA/gUWGVG5nJHgzmoA3q9OmfqJZagPBBNsbKw1aqQA6Y03BQfeJFM2Vc5gXpvbPvGG7dD3cwJfDYwOKy/zkul5BINxn9O5I7j7GTYSR4JCdGIQ3qBqEqCuWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Twj8ai98; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Twj8ai98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709613636; x=1741149636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cCxi0I+6/qmBkfBL687/8+v6vmDVatp6FDr9E7bw9pQ=;
  b=Twj8ai98S0CYlF6fca6Hr0JlZltQGsx3bF0ZmObgrE+FI606CWbEwt3N
   SrYc31HvxrKDEH2gcCRJUoJVSOrsu5bHpi+ddVs6YheHbWYkU2uwV311g
   srXiE1mT2sE3DGyjFLgPr0eJsm6fa5zinQ82ikILx6+xZeyX+qG2SGRvz
   duSvteTq2uIOVhnqtUKOR91tF+D+cYrrAaz98XN2b+uABoSv8KL03a0hK
   9Y021nmSCtEZU9yi3TkSeKscs8aLkGJo06TOQphaPoTmskcG8tqsDNnPO
   uSdzjzFt60gZ+rWDnfW/pwpfjmtb119IK5vAOpqQZ9vD3gXhrGl2br66E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21672448"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21672448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 20:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9307080"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2024 20:40:32 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhMbN-00032f-1Z;
	Tue, 05 Mar 2024 04:40:29 +0000
Date: Tue, 5 Mar 2024 12:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27158/27434] /tmp/ccuRRnWa.s:440: Error:
 selected processor does not support system register name 'rvae1is'
Message-ID: <202403051220.VRQjN2A1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: de443b61072c1b4e7ffb6f41547cf14f494c9728 [27158/27434] arm64: tlb: Use the TLBI RANGE feature in arm64
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403051220.VRQjN2A1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051220.VRQjN2A1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051220.VRQjN2A1-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccuRRnWa.s: Assembler messages:
>> /tmp/ccuRRnWa.s:440: Error: selected processor does not support system register name 'rvae1is'
   /tmp/ccuRRnWa.s:456: Error: selected processor does not support system register name 'rvae1is'
   /tmp/ccuRRnWa.s:561: Error: selected processor does not support system register name 'rvae1is'
   /tmp/ccuRRnWa.s:577: Error: selected processor does not support system register name 'rvae1is'
--
   /tmp/cc3Kq0NJ.s: Assembler messages:
>> /tmp/cc3Kq0NJ.s:2643: Error: selected processor does not support system register name 'rvale1is'
   /tmp/cc3Kq0NJ.s:2659: Error: selected processor does not support system register name 'rvale1is'
   /tmp/cc3Kq0NJ.s:2705: Error: selected processor does not support system register name 'rvale1is'
   /tmp/cc3Kq0NJ.s:2721: Error: selected processor does not support system register name 'rvale1is'
   /tmp/cc3Kq0NJ.s:2865: Error: selected processor does not support system register name 'rvae1is'
   /tmp/cc3Kq0NJ.s:2881: Error: selected processor does not support system register name 'rvae1is'
   /tmp/cc3Kq0NJ.s:2920: Error: selected processor does not support system register name 'rvae1is'
   /tmp/cc3Kq0NJ.s:2936: Error: selected processor does not support system register name 'rvae1is'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
