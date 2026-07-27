Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE143CB918
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182639; cv=none; b=dtBM+iFebzUcj0thw/fpK8nUdmt/qodCVhtQCvgFgVoeCkDxZDzSeBxdeZeXjCSkBYLIT/GfPxm7vcjwJ94Z4OGmwEnL9iCmkT0pwiRLYS3Z6Ta2F0OUrWMjZLHodgxaHsNXYDgti9PKRMK2ZD1mc4z0Y+S8fiP00RzIKaXlcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182639; c=relaxed/simple;
	bh=C8ZspH4Q7IJ9qoQuCCHl6S4Ba1B9jhoMOp2hl9SEBBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MWbWUe7GXTxO3EVn27q5iPcH7RO+bdyQVQe5c21vXzeHcSfOa5CZoVbzKAxLkaPO6mN6cBMNPk02AbU2+5aGKUw7Ni97Kwkr88wlMJmRXuDBwp6VcCZWrI44VPMhT0SIMC/lETrbxh7CoJLfdoL3miKvETT7jnMChuqlBEYLOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/itYSpY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/itYSpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785182637; x=1816718637;
  h=date:from:to:cc:subject:message-id;
  bh=C8ZspH4Q7IJ9qoQuCCHl6S4Ba1B9jhoMOp2hl9SEBBM=;
  b=d/itYSpY5UFsMPzibks1HIvkmELrHymMjhQX3EmvH4dt4ylD6tuHnLbc
   PGN1GwZePr2cKfgLbkaCg9dRwRWHkwH6oewWUqIQalQuQf3wIQ3/4baeI
   TmU1f7wKz1Wv19cm3l7rE7m+5zoSPl2USPfL2dZFmGPFsHUUXRGcwL38Z
   JZuI+nVSqSEfMkwlgCXW06AaC3COuytDORPC2SzkXRczQwatnf0J+RDP1
   k+8gtaBvgdqVvMo7/8BXkj5vYTxZzayikoZoKTZK9T666Vi10Csxs0Yo/
   ZcK09upDVBK8Ov11/9HLvIqg+DBcJPghecMmuJi9iprBu0iPNH8JHY0nq
   w==;
X-CSE-ConnectionGUID: MVcy5hZKSxuRjwegIbkBRg==
X-CSE-MsgGUID: MD44I6Z5SNynZNi6o7/MXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103301345"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103301345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 13:03:57 -0700
X-CSE-ConnectionGUID: ar1HdW09QlSFJSOBjyXI5Q==
X-CSE-MsgGUID: k7GbPbSSR+eGobh0QizTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263283811"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2026 13:03:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woRYH-00000000dSy-0RM5;
	Mon, 27 Jul 2026 20:03:53 +0000
Date: Tue, 28 Jul 2026 04:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 164/164]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202607280337.awR6xuLf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   23918d7eab97daf57988a8a538a870c4e862b525
commit: b4f36e791b05f368a838ea83b520a8d881bc6b63 [164/164] firmware: add r3mini phy firmware
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260728/202607280337.awR6xuLf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280337.awR6xuLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280337.awR6xuLf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
