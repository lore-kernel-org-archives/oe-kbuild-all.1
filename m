Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE951A304A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781763141; cv=none; b=SPfgbwT0fRBpvE5o7vCqGlnNW/cQNAHmVn2FeCmkD538lgDZCGiofYwHbWWUmzZSZVarfiEF1+QgEXWjcgKOt4piPnQ968oQi4FL1uDnOmMKfeaWND8NMSqB//5LuAE80lJAMglaZs2d93CfgLSXDIhD7UH1aAu8BvyT7hwGu3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781763141; c=relaxed/simple;
	bh=jp9iFiy8LomeuIHiIu4QCU9dNLN2Qe3zorDYXs9TLos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R0ly9A5u24V+TfkGuIRYAQmpw9lK+xJu3FiJyjevyba/G2UtUJB0sJJhKiy9dxEtdPYNhVt5+dcB8YSH3LkzH4wH7gYFnekHQL9eqN+Isfhf2cSjnkcgRwalvBBxXugA41DIBCLAGeYEzXnr0EKhWE79YoggSu0k+uGMA48alXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdJAmYEJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdJAmYEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781763140; x=1813299140;
  h=date:from:to:cc:subject:message-id;
  bh=jp9iFiy8LomeuIHiIu4QCU9dNLN2Qe3zorDYXs9TLos=;
  b=CdJAmYEJeIvLZDBxlReNxzSqOChspiJyiGASDqfdI8RHD9HLs++sRVDO
   BObc+4j2CNvt8LK1mRKfbuUGjLFbNOooN1FVdptOYt75UmVlN5nxU85OP
   xRRtqGuj6tjGtjm0kLZu4FYj2O632NxGLDUJaeXmNKBf8ecmO4W5EFl5H
   cNr7vAaqW0nOHFQMYraLh83JDHJxbg+MszriGL1oEf6w4qW1Y3r3JGK2r
   Qc2lbuvHDxL/O9PSVXdKzVBuJq4gdahsxn3n18D7DuUVeJ2McjRWjfF1G
   P36aWZEgxuUvgEqG9uFNb0Ck3GXPkylD69c5Sr4bU6H6CwTpK7Bal1+RR
   Q==;
X-CSE-ConnectionGUID: lALKStPBSCaBLOw4wJFVYA==
X-CSE-MsgGUID: Zm7Zh+fZSg6ascJXcXIwEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82785391"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82785391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:12:19 -0700
X-CSE-ConnectionGUID: xSyc5wdsRkqz1J5gippurQ==
X-CSE-MsgGUID: gQZH7qafTwqKPi4xGJlS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="250168083"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2026 23:12:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5z6-000000005Th-3J7j;
	Thu, 18 Jun 2026 06:12:16 +0000
Date: Thu, 18 Jun 2026 08:11:40 +0200
From: kernel test robot <lkp@intel.com>
To: Jane Chu <jane.chu@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/filemap.c:2768:undefined reference to
 `is_raw_hwpoison_page_in_folio'
Message-ID: <202606180853.3higmX1J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jane-Chu/mm-memory-failure-make-is_raw_hwpoison_page_in_hugepage-general-purpose/20260618-012902
head:   ad6812ce0c4c46ffdd13060f0251f31b3412017b
commit: 12e5a24644d326a21bd49526746156ea59e376c4 mm: factor out adjust_range_hwpoison() from hugetlbfs
date:   13 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260618/202606180853.3higmX1J-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180853.3higmX1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180853.3higmX1J-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: mm/filemap.o: in function `adjust_range_hwpoison':
>> mm/filemap.c:2768:(.text+0x1df4): undefined reference to `is_raw_hwpoison_page_in_folio'
>> s390x-linux-gnu-ld: mm/filemap.c:2777:(.text+0x1e2e): undefined reference to `is_raw_hwpoison_page_in_folio'
   s390x-linux-gnu-ld: mm/filemap.c:2777:(.text+0x1e58): undefined reference to `is_raw_hwpoison_page_in_folio'
   s390x-linux-gnu-ld: mm/filemap.c:2777:(.text+0x1e92): undefined reference to `is_raw_hwpoison_page_in_folio'
   s390x-linux-gnu-ld: mm/filemap.c:2777:(.text+0x1eb4): undefined reference to `is_raw_hwpoison_page_in_folio'


vim +2768 mm/filemap.c

  2752	
  2753	/**
  2754	 * adjust_range_hwpoison - adjust clean readable range to avoid hwpoison.
  2755	 * @folio: folio that contains hwpoison(s).
  2756	 * @offset: bytes into the folio where subsequent read starts.
  2757	 * @bytes: number of bytes wish to read.
  2758	 *
  2759	 * Return: adjusted total number of bytes starting off @offset that can be
  2760	 * safely read from the @folio.
  2761	 */
  2762	size_t adjust_range_hwpoison(struct folio *folio, size_t offset,
  2763			size_t bytes)
  2764	{
  2765		struct page *page = folio_page(folio, offset / PAGE_SIZE);
  2766		size_t safe_bytes;
  2767	
> 2768		if (is_raw_hwpoison_page_in_folio(page))
  2769			return 0;
  2770	
  2771		/* Safe to read the remaining bytes in this page. */
  2772		safe_bytes = PAGE_SIZE - (offset % PAGE_SIZE);
  2773		page++;
  2774	
  2775		/* Check each remaining page as long as we are not done yet. */
  2776		for (; safe_bytes < bytes; safe_bytes += PAGE_SIZE, page++)
> 2777			if (is_raw_hwpoison_page_in_folio(page))
  2778				break;
  2779	
  2780		return min(safe_bytes, bytes);
  2781	}
  2782	EXPORT_SYMBOL_GPL(adjust_range_hwpoison);
  2783	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
