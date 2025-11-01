Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B908821
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001580; cv=none; b=pq2afc3oZWEx2JlvfVePyCtvLwKxf9cw6sbbBChJ1ZUpSOR53/TJD9Hi19QSzPgF1+AZ2puDx9l/W1ygPUQTDXcyJzkH+Y3l9E4+PoitIlupSQPQFPMAyEw4KgDMkXBU6meHyXdc8r8BbCSJd4neIOrWNh/RiU+pVKohmHhCgTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001580; c=relaxed/simple;
	bh=2Az4hoyhX1A6/JNjPSAO9lyUkr70i8F/6pWVSUMh478=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxFf25+5I1CQg59J24X0Kwjb4qJxTudEFHHg+m7OtJo6aRJ904Gthd1FU7AIzZf05uT6rjV0ukkuibtjKN2W741MDm2oWyumioXfI8uoml3W6ewqdhxiptNRA/xs4HbisFQSF9tTOiBpU9+jH3vjPcECL43XsURwH44n/ozERwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMJQni7V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMJQni7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762001579; x=1793537579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Az4hoyhX1A6/JNjPSAO9lyUkr70i8F/6pWVSUMh478=;
  b=bMJQni7VxkQSiWZqkCo8+c6CIKV7LgTMnBBhrepjE1VzxQTcIUg4U3sV
   Ax5NSsv8jrxqB+hr3F+47L1POmt1N0nanJP7bSxqK04x7CHmtLxiStYzA
   2lDhrHkxXsiYwGJ1Q9zJpUkvQK/TM7oU8qA17y5PqimzqbEJeDOwLy1O4
   vOhaDYSbRSveG6B37FEgWKthM0rM52Xsw9gBaRVzLPD5Z79cPdt3F4t1B
   XMPxUejNAQzbdtjpMttCR6i6wuqS7A/qblFe5k0TsJCLo2Iq9g7Y4Dqt7
   hu/vh96QxiODbFoxtftje+yo8FVJqBKNLD2Y2LVI+epU2gak0h2+ImMbt
   Q==;
X-CSE-ConnectionGUID: yxf0VpSbRYi72RvZGy5dMw==
X-CSE-MsgGUID: jolf+94iSyWdCky3ELsQ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75595425"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="75595425"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 05:52:59 -0700
X-CSE-ConnectionGUID: WzmgcRlXSVmdgSBtUq4TNQ==
X-CSE-MsgGUID: Wpmjk/OpRkOxDlXQrRt+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186785910"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Nov 2025 05:52:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFB6F-000OGs-0u;
	Sat, 01 Nov 2025 12:52:55 +0000
Date: Sat, 1 Nov 2025 20:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 3/3] mm/ksm.c:146: warning: Function
 parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
Message-ID: <202511012032.pfyh2rwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   02259332e0e29b30ceaaeed8ebc2f06afcc07a50
commit: ef314e56b70f4662163f3e1e094bcfa9627674c5 [3/3] anolis: kabi: reserve some space for kABI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251101/202511012032.pfyh2rwb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012032.pfyh2rwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012032.pfyh2rwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:146: warning: Function parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'


vim +146 mm/ksm.c

31dbd01f314364b Izik Eidus   2009-09-21  128  
31dbd01f314364b Izik Eidus   2009-09-21  129  /**
31dbd01f314364b Izik Eidus   2009-09-21  130   * struct ksm_scan - cursor for scanning
31dbd01f314364b Izik Eidus   2009-09-21  131   * @mm_slot: the current mm_slot we are scanning
31dbd01f314364b Izik Eidus   2009-09-21  132   * @address: the next address inside that to be scanned
6514d511dbe5a77 Hugh Dickins 2009-12-14  133   * @rmap_list: link to the next rmap to be scanned in the rmap_list
31dbd01f314364b Izik Eidus   2009-09-21  134   * @seqnr: count of completed full scans (needed when removing unstable node)
31dbd01f314364b Izik Eidus   2009-09-21  135   *
31dbd01f314364b Izik Eidus   2009-09-21  136   * There is only the one ksm_scan instance of this cursor structure.
31dbd01f314364b Izik Eidus   2009-09-21  137   */
31dbd01f314364b Izik Eidus   2009-09-21  138  struct ksm_scan {
21fbd59136e0773 Qi Zheng     2022-08-31  139  	struct ksm_mm_slot *mm_slot;
31dbd01f314364b Izik Eidus   2009-09-21  140  	unsigned long address;
21fbd59136e0773 Qi Zheng     2022-08-31  141  	struct ksm_rmap_item **rmap_list;
31dbd01f314364b Izik Eidus   2009-09-21  142  	unsigned long seqnr;
ef314e56b70f466 Guixin Liu   2024-08-26  143  
ef314e56b70f466 Guixin Liu   2024-08-26  144  	CK_KABI_RESERVE(1)
ef314e56b70f466 Guixin Liu   2024-08-26  145  	CK_KABI_RESERVE(2)
31dbd01f314364b Izik Eidus   2009-09-21 @146  };
31dbd01f314364b Izik Eidus   2009-09-21  147  

:::::: The code at line 146 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
