Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314F1DED4C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766987228; cv=none; b=CpyfsUfcMPKmdSIIPoNwfskKg/RCBXAeWlbrx2K2e7ku74z3ZsZSbqY7nh/JemTnMpllQ64cbC5CSiIBHdpXPY90/YNLmdgjg/RhbJVeNLTxHDz5ZDhe6IdLydaIuW0eaDAewnf+WGEJSfqPY84BiXaMkbla3PX3gH+pi98+TaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766987228; c=relaxed/simple;
	bh=JsufpplmVEKeE/aFKbHaEGt2hJRoghvChWth398+Lt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TDDQ4LepCxozh9i8KJaL6BD+SIjT64RpHnthYB8dMhZYok4eo9w1b/wpcYUzyFe5UxUpJvfd+96UN+2r3cGoYTFYKQF6aF21a5ktwywNqPxCS8b5J7w2kFwrqApeWggLBShMZIeE/l2L9/QNjxmcDCJyffD/dXm3cpsn+wwgbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YATKrZ2H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YATKrZ2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766987227; x=1798523227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JsufpplmVEKeE/aFKbHaEGt2hJRoghvChWth398+Lt0=;
  b=YATKrZ2HQEWeWtt14Ib6ntwjQwHzia9o+yymyNVS6rqdUsb729zlN7o6
   9eYhlUPNtdOJ5W0YOp/9FdjlNaV/pQZJK257MaSUWxzci10o5dJ9FcE8P
   S7lgxppDS1r3sfEmPB15Qiu8heksi+gt7aXWV6uNuljtGb61AKsoKkomJ
   9gsxpbHTOdsOrXpDZqn4BH9aOx3K9y53/dR/hHfIzdxWvhvFf5/vM6zR+
   UWTXu7Or7ma3Sr6VhK/0TbWz/b4E0k4fzLRLfruzjcV2hwlJWWJyslUn2
   zAQL1LgIVXuJ/t0N1EH7IrpAvtcZsiD4yQ8ZW7zkBwP3fMUU13CiIx06V
   g==;
X-CSE-ConnectionGUID: r4Mk6xRUTyWMneAV31Lzgw==
X-CSE-MsgGUID: FBXrm8X4QfOYZeFexgK95w==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79327463"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="79327463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 21:47:03 -0800
X-CSE-ConnectionGUID: M+YwX7SHTPumeuoL3Kpmxg==
X-CSE-MsgGUID: UTRRnTIDQwe/QLA6/Iv8Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="199973969"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Dec 2025 21:47:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va65r-000000007h2-2oq1;
	Mon, 29 Dec 2025 05:46:59 +0000
Date: Mon, 29 Dec 2025 06:46:38 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 116/131] htmldocs: Documentation/driver-api/basics:75:
 ./kernel/signal.c:5541: WARNING: Bullet list ends without a blank line;
 unexpected unindent. [docutils]
Message-ID: <202512290609.gq1OqhDT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 6048f4565a51ae25f1fb6627c89d9133eaf2d3a2 [116/131] kernel/api: add API specification for sys_rt_sigqueueinfo
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512290609.gq1OqhDT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512290609.gq1OqhDT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:75: ./kernel/signal.c:5438: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5442: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5443: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5533: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5538: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/driver-api/basics:75: ./kernel/signal.c:5541: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5601: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5662: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5673: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5681: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5686: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
