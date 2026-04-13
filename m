Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7B33BD624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085026; cv=none; b=ZFjQItQnEs44Wa/EEYHEeGIdzevCstelPBYRypOLxe3KxjURQkhLRvuxj87uMDosJUJ5iDX5LHHKdJN0FpSKblcKx8qOG162zBPIX4FJ4lyX29wmpAgHBUeBg7WgzaXyLyLx/+jN/zbMWScflQ0U8cDcbVRg0Yx3Nt9X5T+KTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085026; c=relaxed/simple;
	bh=tpdycPkLieidUuhtfGSH1wsCTz3Ypm5980b58yPf+1k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jr+aul8TBV0Jjhg2ByNJxhS7tf9J17ii74AXKDMZfrSSoOPdl94sYz8FYH2n5VczBtCaXLCbcaHOxAlv9zXHYQZ/kxqAP8xtP7pJwd9HWibNhWv62ATgVYCOtv+pro3+964JWT7ChvxngMTXKMUzbVXRwmaBnsd7x2jlmhUmJpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVNZ8WY8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVNZ8WY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776085026; x=1807621026;
  h=date:from:to:cc:subject:message-id;
  bh=tpdycPkLieidUuhtfGSH1wsCTz3Ypm5980b58yPf+1k=;
  b=ZVNZ8WY8RtWAm6tSvAgh59vvyC7YWetaJbpu3L/SWFuN3rGQU5fIrjhQ
   P9g3kcDY74tOYv59Aan/ywOtkaw/hBSkyDlHPb59fcBIoHQ2ArP95FZs8
   woZ8g8ad+7/ZTR4RgjyxyP1pllutvB3Bqc08uR9ch7kt/r54Jxwr/rrVk
   DkG6FwbEyMrOYlSq6CKttJ93x87yRd0geEVM37ChvUVVWjePeOdyeEbi4
   fc1hWlrruNTMhgF0Bt3ni8qZut5vzImxTWo8ObNoT821dpsz7E9jmPOpg
   2N/RFuitazkDa90dV8xbuW1dtbN6DIqHFxqdppMo1N4NjUQjVlbpCaZKJ
   A==;
X-CSE-ConnectionGUID: 2Owv6mr4QcWzdRpz9K0nEQ==
X-CSE-MsgGUID: UqcQ20chT1ivsoZvpSlNPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="99662460"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="99662460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 05:57:05 -0700
X-CSE-ConnectionGUID: xxNKoMF+QrO2qqLGtw+83g==
X-CSE-MsgGUID: udMtFZ66RR2CrXr+kk39sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="226613413"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Apr 2026 05:57:03 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCGqa-000000000Wl-2XSG;
	Mon, 13 Apr 2026 12:57:00 +0000
Date: Mon, 13 Apr 2026 20:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [linux-next:master 10302/13443] Warning:
 fs/f2fs/segment.c:1883 function parameter 'need_check' not described in
 'f2fs_issue_discard_timeout'
Message-ID: <202604132002.7PnxOfTf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66672af7a095d89f082c5327f3b15bc2f93d558e
commit: 6af249c996f7d73a3435f9e577956fa259347d18 [10302/13443] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
config: i386-randconfig-014-20260413 (https://download.01.org/0day-ci/archive/20260413/202604132002.7PnxOfTf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132002.7PnxOfTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132002.7PnxOfTf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/f2fs/segment.c:1883 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'
>> Warning: fs/f2fs/segment.c:1883 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
