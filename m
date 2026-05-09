Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E143909AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778335717; cv=none; b=IXIYM1L38DXnhRWlsp4GXdzo19NGxbnZU4VNXUBikA+ZmWbtW2TXUvUyCU1AWSQw9a/2r+NTSRrccZ89WFdaLXYD1YbVOO5Uw7/ls3Xx4LbqnuufGOGW9bEKOjmpadqhzfeXBZetOwJK3b2en6ZyxrUnKUWScCJC2biivDHZ4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778335717; c=relaxed/simple;
	bh=Rh55MiVKbqfFpMYDiQpB/8hIiAVc0Bh71ky47lwA6YM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l9fcXod3OsWChW65OiGKg75whCXa9JeIACS0tUmP+qmCjC2Q1eSANIOdhe/BGbTOfrj6OccrTCukskAtoGPH7WNR57pVP/jIBe9XJaNa7X1jzGvZS4A53mZ00kH/kEJ7AJjRrgx3zA7aG9J+oy3AiS/wviNDVahOYnWFMAdsSAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/jHIV5/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/jHIV5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778335715; x=1809871715;
  h=date:from:to:cc:subject:message-id;
  bh=Rh55MiVKbqfFpMYDiQpB/8hIiAVc0Bh71ky47lwA6YM=;
  b=M/jHIV5/qpFxdZOaNVgoSNKol0CtvVKa/el/ZmHqDTAEWIXz283xvhKx
   nxF9XKBqmsQuRqZKFC3MDCIq/UZXg8SC7lREEJy347cyizHrpyRH4Ni/e
   UA/OpBXnhLPH6XU8UnC+KI75iM8WdtbCRb2l0Eaue7CsbsIjMDCv6/Iyc
   1i74Tj7LeL6ntR/OZn8YWiDd10S1arlE7C6whqeFhfxwFfBRUHeoRdpgf
   nrcXz7UPqdhJK5LFHX9P16+tgyzNoWOhnybggJ3tua3WmwxrA7FmoKbmQ
   agmCIIxtLcf/JF4EAddsp53iANfZTQ4XEv9HUhzyZEmw/ZC27P4Nzkvl4
   A==;
X-CSE-ConnectionGUID: YBPWT4f8SuqD7dKjRg7vGg==
X-CSE-MsgGUID: xWkbXN4wQ8Sm1Q73Uhh6vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="81859936"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="81859936"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 07:08:32 -0700
X-CSE-ConnectionGUID: 0gL4MoofTIyB03ZGDruHYA==
X-CSE-MsgGUID: uwob/vMlQP2exxbfVj1W8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232688044"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 07:08:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLiLx-000000007UD-3kc0;
	Sat, 09 May 2026 14:08:25 +0000
Date: Sat, 09 May 2026 16:08:02 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/001-devicetree-m3 29/30] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091625.P6hQi88h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/001-devicetree-m3
head:   629bca65f0aa29df9e9670969ce5aabd8eaa46c0
commit: 77c6937f87ebc07631cf50aed9eb471f48850aa1 [29/30] arm64: dts: apple: Initial t603[124] (M3 Max and Ultra) device trees
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091625.P6hQi88h-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#571: FILE: arch/arm64/boot/dts/apple/t6031-die0.dtsi:191:
+		/*
+		* TODO: figure out the clocking properly, there may

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3623: FILE: arch/arm64/boot/dts/apple/t6032.dtsi:308:
+			/*
+			* reg[0]: Main MMIO range (approx 1.8 MB)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
