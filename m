Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE3D1CEAC2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 04:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313602; cv=none; b=tcG0vjZqnRt61tH7SNOGDOPdn73nkw3tIt+4ySAYzjahOeyQ9c37sA5cyHiqoEkTyWMgUlkgPJsD5iym9i/2MrfhPWlFxAkS2v4pAiLDWbSwbIush9hO7grI0K7Qkqb77pIQh2ycthjuCkRrlnw01mFrBciw/Qlce7rcEvO5B4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313602; c=relaxed/simple;
	bh=IMOcCeLBP1MsDTNEKwkVLvfppXN9887JFD7S1GZ2Fwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qZr2wFVamlq/tpPy4ZUAFPLK5VqFPuAFmXQ758h7sGHaIH8GzgCOAkVhGVTr71osNb9VMJLhvDWz2jkp5GqLXMdwnIYlSu0ZDt9s3kSwhkt0g0hCEc8IRV9GmNE5nhdjO5CQdic5KY60r4XFN0ZZMAaa1IZS8EV3G1IMURRIExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArKYpImw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArKYpImw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783313601; x=1814849601;
  h=date:from:to:cc:subject:message-id;
  bh=IMOcCeLBP1MsDTNEKwkVLvfppXN9887JFD7S1GZ2Fwg=;
  b=ArKYpImwvd/h2XLbkKmaOOPaTQQszDV7mY4oeiek4HOnog7m5PwP7Imz
   /nHmOO+dttuab26RKl/pjLRvMQisiuw0JKz5r74I7hgtAM0Td3p4rTzQN
   OOHAi8yu2LuVGdB/a1E9JNntoFPCq/6VXzCcfR1Qo4fALw2OFJtTZzduw
   wbHlgxpmDZjay8KWC8cjWijdok17gyEkiynZkbv254xvNcXiEb3FDPX6l
   9stiulgfa4RDhkKNy9HVUwjlimOOK9rsXTrfzVrrtG6rJtZWSNAV3XAy3
   4r3y/FoY5Sj/eYh0TxeN3teXwL4DtOd5ltboS+sa7o/8Vpnl4ceKkMnck
   g==;
X-CSE-ConnectionGUID: nO5K1Iu4TPuFvg643IGnhA==
X-CSE-MsgGUID: 7FubzLCTS7+k2s3udJm5lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83712347"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83712347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 21:53:21 -0700
X-CSE-ConnectionGUID: mBm0hre8RNK4vS7b7tD4hA==
X-CSE-MsgGUID: rWolh+zQQwWV2BeQlJC0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="276826682"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jul 2026 21:53:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgbKW-0000000027d-1OV3;
	Mon, 06 Jul 2026 04:53:16 +0000
Date: Mon, 06 Jul 2026 06:52:24 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 27/66] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607060642.nsF1DiQ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   29facc8c3b3fe50f4914c90aec24a76217fa35c1
commit: dd704380d0dd31e4d36b2c27f3b8207e62596867 [27/66] hexagon: add SM8150 platform support
reproduce: (https://download.01.org/0day-ci/archive/20260706/202607060642.nsF1DiQ6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#164: FILE: arch/hexagon/boot/dts/sm8150.dts:126:
+ * each time we hit a key.
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
