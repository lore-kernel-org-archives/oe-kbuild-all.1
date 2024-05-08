Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C34750A7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715172573; cv=none; b=YYmTx6jyyx0JLguo3Chb9vRjRWpE0Qyfd8Ezu1et0ZjjDG95WqiwxFBdyvTenIsygW3BD8nRo6YP6FcF5KUU19JyVfCeTpXPfqWKHijpX182kH7GdAgD/aDYKwkf1lqzF5jmasfR4JG722XL8vWvOqQ2lHHWX1RXBUxmqAN0bKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715172573; c=relaxed/simple;
	bh=2jJheCeW5tvfZFKHpEIYS5AwqrlqEEl4zmne2T4P7U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDVcMQLSIGpok+Y9w3lAiZKn0LSmcH7WWft5xfMDnMGIy8c8LrdonBF7+9KITBGnd+kqdtZ85ToNtCVzotJtNHhBswk8nw+IVxIZ6Rg7pLGxqAbxUyyY7YxWuvdp9QyazRyiZq9BWh3Omm8c6zUQOwPHUIGnJqxjWwLba05vjlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaUlEJmU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaUlEJmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715172572; x=1746708572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2jJheCeW5tvfZFKHpEIYS5AwqrlqEEl4zmne2T4P7U8=;
  b=jaUlEJmU3L0NGA7ODdbkIiAyzEKZ+js0huilIaE/P2bzgJDoTloko4pE
   AXyLze6Kwr23CnLP9/wT7HlAzgWn23rPJ94a7ya3QkCNr4I+I4FH5ELmA
   rSWBd/QhcKbgjX5vXp91jmbn9dfT4vS/p5n8LWYh+wrfJHvZ9XNpw8iV0
   YmArXvv8271R4bbLzUb4Yz+iV14tHyhyt1ew44+McXNfbZgROB/+Mdw1h
   ntHypTUFIKU0YRBaN43wZnH0GVcYo11N92Qr/t2gpS8eAWURtjlJgwGRS
   GLosqBi4Tv30oeSlXX8uS6oH4pwMSRzKfM9gYEMEOEYNpxWqqlg1FpMGu
   A==;
X-CSE-ConnectionGUID: J+epXXMDQFuGZztj5WnKgw==
X-CSE-MsgGUID: Yu8VsadLQYyyo/ooFlhS7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14845816"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="14845816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 05:49:32 -0700
X-CSE-ConnectionGUID: P78WPo+DR7WwWQunfhRF9A==
X-CSE-MsgGUID: ypwnBYD7Tjen+BNmMwthQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="29395487"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2024 05:49:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4gjf-0003Q9-2R;
	Wed, 08 May 2024 12:49:27 +0000
Date: Wed, 8 May 2024 20:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11033/12060] fs/bcachefs/sb-clean.c:286:55:
 sparse: sparse: cast to restricted __le16
Message-ID: <202405082039.0al6Fpg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: f39055220f6f98a180e3503fe05bbf9921c425c8 [11033/12060] bcachefs: Add missing validation for superblock section clean
config: x86_64-randconfig-121-20240508 (https://download.01.org/0day-ci/archive/20240508/202405082039.0al6Fpg8-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082039.0al6Fpg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082039.0al6Fpg8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb-clean.c: note: in included file:
   fs/bcachefs/bcachefs.h:1027:9: sparse: sparse: array of flexible structures
   fs/bcachefs/sb-clean.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:800:38: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1459:38: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb-clean.c:286:55: sparse: sparse: cast to restricted __le16

vim +286 fs/bcachefs/sb-clean.c

   268	
   269	static int bch2_sb_clean_validate(struct bch_sb *sb,
   270					  struct bch_sb_field *f,
   271					  struct printbuf *err)
   272	{
   273		struct bch_sb_field_clean *clean = field_to_type(f, clean);
   274	
   275		if (vstruct_bytes(&clean->field) < sizeof(*clean)) {
   276			prt_printf(err, "wrong size (got %zu should be %zu)",
   277			       vstruct_bytes(&clean->field), sizeof(*clean));
   278			return -BCH_ERR_invalid_sb_clean;
   279		}
   280	
   281		for (struct jset_entry *entry = clean->start;
   282		     entry != vstruct_end(&clean->field);
   283		     entry = vstruct_next(entry)) {
   284			if ((void *) vstruct_next(entry) > vstruct_end(&clean->field)) {
   285				prt_str(err, "entry type ");
 > 286				bch2_prt_jset_entry_type(err, le16_to_cpu(entry->type));
   287				prt_str(err, " overruns end of section");
   288				return -BCH_ERR_invalid_sb_clean;
   289			}
   290		}
   291	
   292		return 0;
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
