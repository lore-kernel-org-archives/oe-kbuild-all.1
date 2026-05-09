Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6936E466
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328328; cv=none; b=bEASbHa3RbYpe03ezFcAOeCTRJrq1WNJpJUW+Ou/qIvw5BHRGc6dsteaPT226Wgmp1O/JFOSlt2fmxo8H8IryHBJc7cCdTiwqVDr1xeZLowIwmwRBuQa6InbC4nY+r4FerBCETP7ozxygpU6UT5QJuh8TjvmC35veZs8Jlk5F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328328; c=relaxed/simple;
	bh=7DKnbXgIAcWl1rf2TaQnRZw8/AwhJkBcRqsQaUPSU9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=opDp8357EXBFPamBm2EHpchTzJbOa2t1zkVyPDAODLcpFhXYdc9/dq6R2xF+CezBJwGjBcrax1s6lE7g9rOOY4N2U61qq4xj+g6lZOOTVonGfL6YdgIQy6WMuKhZ+HMx2TCCM/F57jPvVoYCOoUNQorSSIWNf9FrNhzc2vgz0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLNUjFuf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLNUjFuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778328327; x=1809864327;
  h=date:from:to:cc:subject:message-id;
  bh=7DKnbXgIAcWl1rf2TaQnRZw8/AwhJkBcRqsQaUPSU9U=;
  b=RLNUjFufYoVL8IR1fcbgl+SGx6gNIkGyWbwHkAlzmoLsAeMQXgCD7LCZ
   hYOJq9dXkNlyGZooAbBvZ51gDyjZchV+ACw7VHdMrxEqwB5sy1A79Frl5
   13DPEOuAvMCMYCXetF77+9rTudBHr2a15CY/wB/LBLPI36XrIUfBILkyc
   ucqDxzhXYV+aG6s5kePPzUd2OTLDTkCeGvnUrbFdH2yLCOvP7Et2qlk3B
   LKHU+W4JbDdLgOohdo+YsLdG0Ym5o5B3FDRhf3cTQ4mwgAufk0bP5kGYd
   y+dK2C4EP8VWOvmZI0PJEnf+WfH1+ZxZfUQH9DOg5ZyKkhO8LAS6h2aq5
   Q==;
X-CSE-ConnectionGUID: SgGZ6Jr8Rx6zkjcJ4xud6A==
X-CSE-MsgGUID: xZDn404ZTJWKpZFxoG7qrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78426961"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="78426961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:05:27 -0700
X-CSE-ConnectionGUID: KVXdWGAeRviUmM7RybwPFQ==
X-CSE-MsgGUID: 4FH5/73nQKKcbcxDPpMPtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="275127381"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2026 05:05:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLgQs-000000007QD-3ju4;
	Sat, 09 May 2026 12:05:22 +0000
Date: Sat, 09 May 2026 14:04:35 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/240-isp 25/53] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091423.quPX1WV2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   50d4a0c32a10908320be6a9f3971221f726d4a20
commit: 46d44c1ff38b67c7b5140c238ed82f9ad6b62642 [25/53] media: apple: isp: Remove ioread/iowrite and stop doing raw address translation
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091423.quPX1WV2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#487: FILE: drivers/media/platform/apple/isp/isp-ipc.c:252:
+		/* Only enabled in debug builds so it shouldn't matter, but
+		* the LOG surface is always the first surface requested.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
