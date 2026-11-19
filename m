Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073520;
	b=EjhPjZAE3xSFOdkbFppNkmdb935VPBdPiY+glmcoKRcTk/boxQDYjZL5BlLJOLZ7Qa/F
	 ofNIFVoeSmEewGRe4M1ODWTTIWpFrGUxXIScsfVIhK9MucN95Gt2bCfSvyedkQ3HWkPif
	 wTkPtINUEZmMt8/wo9cFDpTDN7EekyesaWTzxmWivHrl4uV/lBUqp4eSNb6q9xDb23Jto
	 HmWXO842wP5NlRAc04Nz9/gp+iAmhyrZrAd2MhDbofyra53BrUB3r5kcBI9wshT0FJ9y1
	 rF5bk3oJNgWVzEBFCh18Y7mcS0EwY2JAFzobN5noRRYbt1R0bpa9nkYKYNwpVT7fRnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073520;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LrjuX2cZLwdrkKTvRUayoVR1LfjHtb09znUMtmYjqEQ=;
	b=eFvsW4iPtB4ztviIs8vemGw4MQbilCAO3SotG2hEs3V7DuORIdiH4QARNlolZJz117xa
	 2ERDU7v2ijTXdIxsmyNRBDFv7+zLFKlxM2kTkpSueetQxyMSvQgadSFmDjmA8EhrNFhGr
	 fwbTUp9JoSQiE/k+lAwL/bR8nvvK8u0fOuQkgQMMnlr+xDbbea07CLA6p9bZo6ea60y2r
	 v36R2oDhnrS/0uEySUjNxZNz4bet4jew8cdHTSWKDPwEcZFYNlDp23vizc8BmsNkdzKdf
	 PPDWvyCP+Txp0QH1Tbla9l5NfW8ncw6oGHFIP4dqDW1wk7jiDtuUEJyNFPAm006CS+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SW9Co60r;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A260606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 07:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A260606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SW9Co60r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795073520; x=1826609520;
  h=date:from:to:cc:subject:message-id;
  bh=YgZgUwSPlcbt23sCHALd57JNERsD2sup718ArUAamg0=;
  b=SW9Co60rChQs3XQaqao7zwzdEgOuJ+yO1GjBI5CH7OrBcZqiB76yCVqC
   50o2AqceEQ4lqSc+kQeAHkiykjBZ66/5U8rAlhdmaq11PMW8u/raxgiQt
   zlIfHvP+E5OAWg2gSoNKGpORURhdv7lGwXR8xrttbQKll/aNgmPPUJIca
   rM83HzBXOby1zq9lqFZEOiwEGTmw2QY0NzKlDdMzV5nn6ZjMqN5uXIr2u
   J6N5MkrS5fHymba6IdxxWsr+Cg8XhCNRGKBxZ4M+YtalnOkygzgzUaO8L
   W2Ct4S8DyGR1WfPdhDCQGBbLKJ3whokaZWiEoDHqq5kdyfbK4W5i5O216
   A==;
X-CSE-ConnectionGUID: MJO+QJObQ3yF116AUgtELw==
X-CSE-MsgGUID: PZEk2AbMRbGTBFr8XVK4sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3832038"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3832038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:31:59 -0800
X-CSE-ConnectionGUID: YPFfAvb0Q/WQF/tA1HZXRQ==
X-CSE-MsgGUID: 97x4kWvJR5eW8ZmHzwIH5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10356349"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 23:31:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTwcd-000000003hz-1xtD;
	Thu, 19 Nov 2026 07:31:55 +0000
Date: Thu, 19 Nov 2026 08:31:11 +0100
From: kernel test robot <lkp@intel.com>
To: Ding Feng <dingf3ng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.5.misc 29/29] fs/read_write.c:1723
 generic_write_check_limits() warn: always true condition '(limit <= ((~0 >>
 1))) => (0-u32max <= s64max)'
Message-ID: <20261119082737.Tk1x2Z7m-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git vfs-7.5.misc
head:   bc0dc43794630fd5c38369d19e91477d2a197328
commit: bc0dc43794630fd5c38369d19e91477d2a197328 [29/29] fs: ignore RLIMIT_FSIZE above LLONG_MAX in generic_write_check_limits()
config: m68k-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119082737.Tk1x2Z7m-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119082737.Tk1x2Z7m-lkp@intel.com/

smatch warnings:
fs/read_write.c:1723 generic_write_check_limits() warn: always true condition '(limit <= ((~0 >> 1))) => (0-u32max <= s64max)'

vim +1723 fs/read_write.c

  1710	
  1711	/*
  1712	 * Don't operate on ranges the page cache doesn't support, and don't exceed the
  1713	 * LFS limits.  If pos is under the limit it becomes a short access.  If it
  1714	 * exceeds the limit we return -EFBIG.
  1715	 */
  1716	int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
  1717	{
  1718		struct inode *inode = file->f_mapping->host;
  1719		loff_t max_size = inode->i_sb->s_maxbytes;
  1720		unsigned long limit = rlimit(RLIMIT_FSIZE);
  1721	
  1722		/* No file position reaches a limit above LLONG_MAX. */
> 1723		if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
  1724			if (pos >= (loff_t)limit) {
  1725				send_sig(SIGXFSZ, current, 0);
  1726				return -EFBIG;
  1727			}
  1728			*count = min(*count, (loff_t)limit - pos);
  1729		}
  1730	
  1731		if (!(file->f_flags & O_LARGEFILE))
  1732			max_size = MAX_NON_LFS;
  1733	
  1734		if (unlikely(pos >= max_size))
  1735			return -EFBIG;
  1736	
  1737		*count = min(*count, max_size - pos);
  1738	
  1739		return 0;
  1740	}
  1741	EXPORT_SYMBOL_GPL(generic_write_check_limits);
  1742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
