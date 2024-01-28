Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B279DD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420719; cv=none; b=G8+vm2xV+LEw5yxEcooQFUbQI5SZngpvZPVBWRcwm/3WC8Cvv1oyTGZa3LITiMnhhZsM/9YRa8ti4MyspGdHz1dACwCO1VOxL8zAVvT5842gqFraWojPumgabfGVho7YuiG7Ik1fy+S5+2C+8skUw6A2XUA8p9MIBWUYhZD9rrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420719; c=relaxed/simple;
	bh=kkSD8aa1xrKOOGvzOsu0mTYMoj2v6YqJkY4XJhO5nGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmFnk+yKuvAkl1JUIt0bkBvq3b6C5hfkSjc/Nzt6tFxqxLONCIqz/+dQRzzT4Ef1P2FYRyuRkLJv192LXuuK3qMArMawpeR43VF3ba0wc5oozBztBWXq32JAZoDT2Vg5bu8TdhdlEFuZaz8GBe5d30KlAV3HWGfDlTx4XjNmGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPcbLBpR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPcbLBpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706420718; x=1737956718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkSD8aa1xrKOOGvzOsu0mTYMoj2v6YqJkY4XJhO5nGM=;
  b=VPcbLBpRx1W1cO5Y5qqbYPqmWY/wNEjya09SMd5gVex9Z/WwFYxCP+xC
   PZrnp0V+kfe0IRKZlQuJJ6LHNewLg3EfQHBnJkFt/zD6Bif5hlOlqQx4B
   W1//bDHRGJHrr7pFu0UHNjnCdDBTN0vbSvuGlorF/9xN7SVwMGXWUn39P
   j0tA5c0Bkau7K12MnORsH1YnsVa/KlgJwyqEj1bnnvXmbFMI0CdehlKv+
   zfhqtA/dbJPIoV5y513og1Y3oRDt9tX68OhL+/N1OAIXWxyfaGsm/Zwhg
   AYS05D77mybA0FVGRFUkai6r/MKu/WR5HYoVVyphp069TqsXUqoiFwdkh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16268324"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16268324"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 21:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910727910"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="910727910"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2024 21:45:15 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTxyj-00038M-1L;
	Sun, 28 Jan 2024 05:45:13 +0000
Date: Sun, 28 Jan 2024 13:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 22/22] fs/bcachefs/journal_io.h:68:27:
 warning: 'jset_entry_init' defined but not used
Message-ID: <202401281340.61DAWYhn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ee0f73c71a22bf7b92bb08b11cfb765d8b0caa83
commit: ee0f73c71a22bf7b92bb08b11cfb765d8b0caa83 [22/22] bcachefs: jset_entry_datetime
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240128/202401281340.61DAWYhn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281340.61DAWYhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281340.61DAWYhn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:208,
                    from fs/bcachefs/btree_iter.c:3:
   fs/bcachefs/bcachefs_format.h:221:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     221 |         struct bversion version;
         |                         ^~~~~~~
   In file included from fs/bcachefs/btree_iter.c:16:
>> fs/bcachefs/journal_io.h:68:27: warning: 'jset_entry_init' defined but not used [-Wunused-function]
      68 | static struct jset_entry *jset_entry_init(struct jset_entry **end, size_t size)
         |                           ^~~~~~~~~~~~~~~


vim +/jset_entry_init +68 fs/bcachefs/journal_io.h

    67	
  > 68	static struct jset_entry *jset_entry_init(struct jset_entry **end, size_t size)
    69	{
    70		struct jset_entry *entry = *end;
    71		unsigned u64s = DIV_ROUND_UP(size, sizeof(u64));
    72	
    73		memset(entry, 0, u64s * sizeof(u64));
    74		/*
    75		 * The u64s field counts from the start of data, ignoring the shared
    76		 * fields.
    77		 */
    78		entry->u64s = cpu_to_le16(u64s - 1);
    79	
    80		*end = vstruct_next(*end);
    81		return entry;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
