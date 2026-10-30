Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393493;
	b=PLRL32MiIhtvTCpDEDByG4PKjOtDIMDCuOJ19opTyASm50ODd/zQHCMV8cymowCEnl1B
	 p1J2Vayg282Y4IZp/HFxVTx4AZJWR8SCP4PwR7rC1eXUnhBMKiqBoIItFURsGD2HuHGPo
	 cehJjPZsCKHZvysA9ZU6oo48aZefj54SZdMhUzisHSqjz/pLOPju75uOXVWyVjhP5PSN7
	 /cTw236IiAFHtqMFeQPeBZWMO3CpMXXXYQkvF9oN0tu7qd1pqvSIvOQnabq+vW4fzuS6h
	 BmAU0EfKE5AOZ1yXetQOFV0pbJjEw3RxbiQPmFJ/zKy6YJagm78YZmx5DNshMUxxREw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393493;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8MmheY1J0fnFvfCkklte/0VJF1pjsR4jXH0DgNE0uqs=;
	b=I4IWEPZh7naTTW50iULJlmhpIdYOS1Bc93iWhubKlfE0ImDW8oa1YX+lfWgyPa7+zsNx
	 O3YesfYnKBdbdMVmOmpHWkUkhgMpN2DwcbesZiEypjdNpOSRGAbsgfO6nCJNdXiEbPlKi
	 OE3BCsbbS/k4ipy5MSRdWUlgoAcXSqzlDBHEk2tIcwstMkfM9VZfA5dZmsZn2EWH2vyo8
	 g2oZcHpqduMnb3as2UGHvLdnmRe6tAOZRLbydkVt0Pny940FemSbdbk3aBKHT3rfsWVvv
	 wuKpTASg7D+YGhi3LeiJxYw3zZ2rQu6McfdCNZOeeycM8+N9O1PYG7VBGyLQcMTn3Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AgMOoXN3;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9447606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 20:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9447606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AgMOoXN3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793393491; x=1824929491;
  h=date:from:to:cc:subject:message-id;
  bh=TeXaw3ek4xQghaW/Br3D2GmWQiG9KHm5SXCWKbElxtg=;
  b=AgMOoXN3FC1c+QbXnWESc61C8nxWJs+IyBbzGYM/G0TqBlLXGSsI9/Aw
   tgQ944SyPX3rZw6Q9OxF5xlfcR3bAzNQUIJwxPjiEE1YRIDfgCoodYJD1
   Zr1ol/W61TQ1eImnolbXRgwTH0HObwE5uJNZhseJWj+O0lDMkA+zCQe36
   xLCzEyzlu1YxYSINTB/U+ESPwc7fJFyFiOWJLtLNVaMK1QByCOAE5338i
   rx6IpEQsr1Yw2aSxyOSZHl0mHEqcszGgkCq28wbf3iyCCl8rqHbxNSvsZ
   mil/gQ6f/NsbqUOOqFe86bJmSd3qVjl1+n6+o+v8vBP3I0CZu2CcN6MdF
   Q==;
X-CSE-ConnectionGUID: QQZ/scN6RGqHl+G8G5xeww==
X-CSE-MsgGUID: Fe8YtcuJSiqkYdMZqA6SLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2191205"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2191205"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 13:51:30 -0700
X-CSE-ConnectionGUID: fNcWbgGLR4GVLsGIdDOScQ==
X-CSE-MsgGUID: QnqyfUU6TNCK1VBmkanruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5675395"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Oct 2026 13:51:29 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMtZO-000000005h1-46Ak;
	Fri, 30 Oct 2026 20:51:26 +0000
Date: Fri, 30 Oct 2026 21:51:09 +0100
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 38/215] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202610302147.qjeOzXxi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   67065b51dbefd899d6f23f460bf8f7153c0015c0
commit: b289486b2187a4fb0d676dc96e66a08f7ea17253 [38/215] drm: apple: DCP AFK/EPIC support
reproduce: (https://download.01.org/0day-ci/archive/20261030/202610302147.qjeOzXxi-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#599: FILE: drivers/gpu/drm/apple/afk.c:554:
+	 * which will contain the real data.
+	*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
