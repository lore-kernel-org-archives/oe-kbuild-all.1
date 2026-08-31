Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A325B08A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 01:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141560; cv=none; b=LchNL+HMSnjWkUTo81qTNOj9jo8tjfFgky1Y9Kudn/9XRGWIjrzxeH07Q+8jzT82wrx1cWN2X4Uo76QzWvpvZDB1+swHUzwMLApKTFMxO2X9Iun4JeCM8c6xHS+HOCU43R9KXYtmyeIRqpbMof8WXWnGjvKdsPzcb1W4lAC7wdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141560; c=relaxed/simple;
	bh=VHQ+g3L9Q4zIgWAI+JXHjvHOvM6MucJxvi6GkQai5tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Txt/ZAaeGvJ9R0aoOdgiR3JuFFZFSDn3N9Aa3ix2Z+eUbmdaJVhjNQyqaExUIcSAnoIVRWQLk06o6oGJOwDAY097oZFfeq5X5rvUTqntsfgc2ovApvzxcCxozfsXmsgbLFT+1C0rMYSIYB+Pv2r+pBz1Owxbq5Uaf+sAAExmBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmLEjKUu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmLEjKUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788141558; x=1819677558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VHQ+g3L9Q4zIgWAI+JXHjvHOvM6MucJxvi6GkQai5tE=;
  b=cmLEjKUuPCN199cn9r5HjJBpyElvWZqRwb15O0QnX2ebUokqByAGPFDX
   ovoa2gkQotfDhg1UE61l6/liaOpg3Z5EBa0tINW1y2Nc8b0AmURcXWOFU
   RtwYJEKrOFSoPAiLraqomDyu+iL/8TDGhZ5dwTh/AO4H3/jFCneZxX2ah
   WBjs0yDkqWQ8sZy99ijO6+LLPIWtkQh7tB61yroj1CZyQLaWmdHH5J8b+
   lrBeMOndlqJJQj96ADio6w0l7t2CfMOkcLFSOIyYV9X78oxPpeBOwCdbW
   RZCSjyhH1W4jzKRWsnMjx8OyAS/Io4IJmRRv5Fv6dQ9K2Dw/8wa9H8cfg
   A==;
X-CSE-ConnectionGUID: DvZvkvMTSE6Z6OSw4dWkuQ==
X-CSE-MsgGUID: 4tagLNgjQi6HoSgV6YTbxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88468142"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88468142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 18:59:17 -0700
X-CSE-ConnectionGUID: 4+Z1WYBpQVSfo6PXZoWsCw==
X-CSE-MsgGUID: unh+L72tRl2mquoPj7jWQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265425602"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Aug 2026 18:59:15 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0rIn-000000000Lt-2vmq;
	Mon, 31 Aug 2026 01:59:13 +0000
Date: Mon, 31 Aug 2026 03:59:07 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 76/131] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202608310332.mBt6e6se-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: fce785fadfd6abf34e775c2793e49a37e1c426d5 [76/131] zx29 qspi driver
reproduce: (https://download.01.org/0day-ci/archive/20260831/202608310332.mBt6e6se-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#427: FILE: drivers/spi/spi-zx.c:300:
+		switch (op->addr.buswidth * op->addr.nbytes) {
+			case 1: ctrl2 |= (ADDR_BYTE_WIDTH_8 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 2: ctrl2 |= (ADDR_BYTE_WIDTH_16 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 3: ctrl2 |= (ADDR_BYTE_WIDTH_24 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 4: ctrl2 |= (ADDR_BYTE_WIDTH_32 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
