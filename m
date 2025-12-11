Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D678F2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458050; cv=none; b=pceNKDMpPeRgEkoyEUpVndVmo0fnbxH15KsbFXKlVAVrfDdiprnn0TrQ0hDnwa3WR6OjbRhO7Qh0ogBvFosTEDWMEhAp+Y4hqkEwF91snPIVxr2MvfgocanohEpmmliFdizPYFQFca5v+SzzlWpW/uGOskgH2adwnc0MrMR+mEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458050; c=relaxed/simple;
	bh=E3aT9NDIcmw4WOvkDyDGiha9Nhk5Zxn5IgooNJ9FNw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aorLZPrU6K41pUvfW+jQvhL2yVelcn9IJ+miy0Dw+1LBJysepUSk6kyfo4gi2xKLUDji6Rr7N5kdaIt7SwmySqlac8n4oL+SnA2ynI1d4KL/cptWubh7V3ja8AHM7Hx/TWGG9rIMHlw+1wrXuSFakhoJye9jwLo3avEB9TzV4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AppkBcRy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AppkBcRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765458048; x=1796994048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3aT9NDIcmw4WOvkDyDGiha9Nhk5Zxn5IgooNJ9FNw4=;
  b=AppkBcRy8vzO7HLJ9MraraX9d7CiVXoWC3lBH77WGP48DXTlZMZhgrXo
   DHpjpJBjVDjEntYc+OJdhU6t9Mwh0Lsn3ImYe53mHHW07Y5QEiaun02Xc
   GBmIhQSgW/O81JXqyKRMvL+QPzai0KOlgmoyi8feqTgJXQdZn1L5HmgKE
   J+iXXkqxAeSPxKILt550RIUtKwwwNYFfu7ubnl/S3voxDaYaMj+Q+fh0H
   PsxhJB1VaBOBXAwWXhDMBuTqlpv846iPZ6utxAw9PcksXJBUzxwT4SgE0
   i8uevbA761sDgsUh4Co1FWrOgagGGHUzqjikpsiRW1diXTPOgaBZdMMx+
   w==;
X-CSE-ConnectionGUID: 3yi7zuq1Snyda0VIc3xWVA==
X-CSE-MsgGUID: ieZI5wYxSdKj47ZYZo3VNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67609111"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="67609111"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:00:48 -0800
X-CSE-ConnectionGUID: kEn5NjG5TgOzRXloRVOquQ==
X-CSE-MsgGUID: u6zaRiNWSC6iOZVOQXpoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="197272609"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 05:00:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgHk-00000000160-3QdD;
	Thu, 11 Dec 2025 13:00:44 +0000
Date: Thu, 11 Dec 2025 14:00:38 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 ./mm/ksm.c:146: warning: Function parameter or member 'CK_KABI_RESERVE(1'
 not described in 'ksm_scan'
Message-ID: <202512111404.vA9djsot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: ef314e56b70f4662163f3e1e094bcfa9627674c5 [0/25] anolis: kabi: reserve some space for kABI
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111404.vA9djsot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111404.vA9djsot-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/livepatch.h
   Error: Cannot open file ./include/linux/seqlock.h
   Error: Cannot open file ./include/linux/damon.h
   Error: Cannot open file ./include/linux/highmem.h
   Error: Cannot open file ./include/linux/highmem-internal.h
>> ./mm/ksm.c:146: warning: Function parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
   Error: Cannot open file ./include/linux/migrate.h
   Error: Cannot open file ./include/linux/ethtool.h
   Error: Cannot open file ./include/linux/ethtool.h
   Error: Cannot open file ./include/linux/ethtool.h
   Error: Cannot open file ./include/linux/ethtool.h


vim +146 ./mm/ksm.c

31dbd01f314364 Izik Eidus   2009-09-21  128  
31dbd01f314364 Izik Eidus   2009-09-21  129  /**
31dbd01f314364 Izik Eidus   2009-09-21  130   * struct ksm_scan - cursor for scanning
31dbd01f314364 Izik Eidus   2009-09-21  131   * @mm_slot: the current mm_slot we are scanning
31dbd01f314364 Izik Eidus   2009-09-21  132   * @address: the next address inside that to be scanned
6514d511dbe5a7 Hugh Dickins 2009-12-14  133   * @rmap_list: link to the next rmap to be scanned in the rmap_list
31dbd01f314364 Izik Eidus   2009-09-21  134   * @seqnr: count of completed full scans (needed when removing unstable node)
31dbd01f314364 Izik Eidus   2009-09-21  135   *
31dbd01f314364 Izik Eidus   2009-09-21  136   * There is only the one ksm_scan instance of this cursor structure.
31dbd01f314364 Izik Eidus   2009-09-21  137   */
31dbd01f314364 Izik Eidus   2009-09-21  138  struct ksm_scan {
21fbd59136e077 Qi Zheng     2022-08-31  139  	struct ksm_mm_slot *mm_slot;
31dbd01f314364 Izik Eidus   2009-09-21  140  	unsigned long address;
21fbd59136e077 Qi Zheng     2022-08-31  141  	struct ksm_rmap_item **rmap_list;
31dbd01f314364 Izik Eidus   2009-09-21  142  	unsigned long seqnr;
ef314e56b70f46 Guixin Liu   2024-08-26  143  
ef314e56b70f46 Guixin Liu   2024-08-26  144  	CK_KABI_RESERVE(1)
ef314e56b70f46 Guixin Liu   2024-08-26  145  	CK_KABI_RESERVE(2)
31dbd01f314364 Izik Eidus   2009-09-21 @146  };
31dbd01f314364 Izik Eidus   2009-09-21  147  

:::::: The code at line 146 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
