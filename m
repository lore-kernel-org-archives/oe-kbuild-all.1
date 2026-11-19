Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053539;
	b=SaTAPbFlA1kOOQruEqCex2cwKrV0BiKAiHsSRfVvACWirp4owdgXef8AmM+TgfLELb5Y
	 lALDFZLaFzkb8sni4yifa+zsMZ2PzOtj5u0bxhU1TbyuB94NHSix/oMnNcSO6QD0SGTmj
	 cCIoKutCVj3o45mvoqWESiXjFgfhTNwlpRGl53h9TPp0t0yWRFqsWAq5MCcXY0hHbOZ/u
	 CudaAVJ1zCxsBcddI/knVGgHeAWjceLUa/tDNJuJdFlf7qaxU2SM+yi+EFDMKkTPqFEH2
	 Lxq+jHjbHH1OyaBzC8T2dUR3xYNSF2ZiJtKnYnma8SxWJihdra2XdPIaYbAQclzapJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DM+Ykx7fBNaITBLSH8zbA+cPjbXtVVWc1TBEq+XHB+Y=;
	b=aU49SLbi5RrnNNltDXwOaLA0vclv1mxpkhbLVrYSfvO65CnJal/kNtKhsNRAUEOsiPfA
	 G3F0+pOjYvOu2q00+dDKvKqV05J9Wvkjul+of5gaAP3mF9LyqoXfdbJYl5Y8MgBEEbXWC
	 kvQMsgu2RDAbbKPupbcvGwLTXcyjwv+VN6p54tU/S7Cf70V0SZReL01jJXsRTBXb0Fdfi
	 aMdW0NkfktKTTNTcFWZU0gZFDq+KMhJBOsfjR0j4ZpAGcAr7rmm8Ra1CpcHUzQ5+Mkkhl
	 2Dqn+nVOHdOjJRalpmyi5dnTAnzch9PEHeEEtLz3LroUKFlk1d/y+Ms0Sn8f/gEFLSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6Z3tAe9;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EF606A332
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 01:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2EF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6Z3tAe9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795053539; x=1826589539;
  h=date:from:to:cc:subject:message-id;
  bh=Y65oQZaFeOVn3E5JnxMbv9SDcPz/eIy0XrEzve3O7CY=;
  b=d6Z3tAe9mxNbRf1TpEaS6+KAEz6n6/QVy3utGsTFZYa/wxtl6bV87kIv
   ivjXsPkaA8g7Ow5i7lrl5Ykapmqvl0U2mj1MC91B2kk9tO2crRJhJydDY
   hmbwgv9Pwtd+c5yLxW7yxje7eTrFOUA7fa7fMxzdeF/Y5qPmlluqefcRB
   qbdsybUtqh04zjd2s6BXPMQeeFlevJZE3kKX8NxXxmK+eJYkbDIwEmUR5
   57/j/KycABQi+z8f2X1MUOTr5IarBenzyuUZNbqhb4oW9hhrs3Bpby7mi
   9S5fPG+znxz/MpkS6qOZ3iEXfuoSvRCo2Xo2E6MOb7BwDk1+h6mL34Umv
   Q==;
X-CSE-ConnectionGUID: CMtAcEu0TV6ZoxTFJRC31w==
X-CSE-MsgGUID: wgr87ubvQCucFYfXidWduQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3789630"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3789630"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:58:59 -0800
X-CSE-ConnectionGUID: LyCkTcT8TGujQETA6Rv7nQ==
X-CSE-MsgGUID: xbC2yAXdStuuZT01wJgW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10659998"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2026 17:58:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTrQM-000000003aZ-3Hkj;
	Thu, 19 Nov 2026 01:58:54 +0000
Date: Thu, 19 Nov 2026 02:58:40 +0100
From: kernel test robot <lkp@intel.com>
To: Ding Feng <dingf3ng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.5.misc 29/29] fs/read_write.c:1723:38:
 warning: result of comparison of constant 9223372036854775807 with expression
 of type 'unsigned long' is always true
Message-ID: <20261119025208.RuJOL5HF-lkp@intel.com>
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
config: mips-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119025208.RuJOL5HF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119025208.RuJOL5HF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119025208.RuJOL5HF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/read_write.c:1723:38: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
    1723 |         if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
         |                                       ~~~~~ ^  ~~~~~~~~~
   1 warning generated.


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
