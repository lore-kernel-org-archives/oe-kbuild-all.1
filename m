Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC518DF8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525692; cv=none; b=WZ78c00HMwP0UIpHtO2Qh7z/wLM5FT0h3oQyEc2UryT+03gUiOszosKDrBVll04FjA5yVJwBJ2VZoVRgWVXS2hnGxjr59YPrSSodHYfmCT/1GP4bpb4rU4BQYqE+7+52h8r4z4O01APnmz9uLlSDzZu4iPB1nopx9GkqJy/iS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525692; c=relaxed/simple;
	bh=ZTVfELwRea8ruAriIptbpFNZg5YwqG4JSf4AbFoX0KY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7EgDHYfYgBes8zIg63gldYLpx84BL7o6AfSOB7SDEKTK4IlLpnR1k4eV1Z0F2cT/hekFY1lgwleJTi6k/vIu4Srzeocl/kIu4TRG/saogx8VUfMVoNiqR52bOmEy8iaX7GFRNfXiheFIFvUShq/CO4pIg1m7WCkxgH+cIp5gqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3UZ3vMo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3UZ3vMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745525691; x=1777061691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTVfELwRea8ruAriIptbpFNZg5YwqG4JSf4AbFoX0KY=;
  b=k3UZ3vMoGC+/IOZharcZ0hA+p18K4Evy248wAc8OQORGq9Oqz00Rj97o
   OnWNJEeBsjamQONburPqwhnN37tw+aHILUgx8eV/Tv4k0ay1Ik4YkAHEn
   Ta7fOKNpgZxkt37wtUJk+PGeODTOq7/ZD2NQoYkfiEBAjhOkIeU8we5k4
   g9yBQWEQUyCZlfOOsCJ5jurUKLXBo682owToPsIiUf3YFHEveUu9ie4ud
   w6B4XwRhC3p5W/HUq16JApe/Se7j8CNCrBoEVIboDpUfLE7aGug4XchXw
   WmBFcUni/ZEjGUB8fFteMSiqNKd/BE45/JlS3skgAbg7mIF5f9Ofjpt0l
   A==;
X-CSE-ConnectionGUID: l+PfS+7iROCM5FSr0I4A2w==
X-CSE-MsgGUID: uC5PJ8/ARsqLtRuHWaoQ2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47064594"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="47064594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:14:50 -0700
X-CSE-ConnectionGUID: nGEce9vST1KJ4chT1YPTOA==
X-CSE-MsgGUID: DCsEaCTlQz6VAYoTPRnMrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="133639199"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2025 13:14:49 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u82y6-0004YB-2F;
	Thu, 24 Apr 2025 20:14:46 +0000
Date: Fri, 25 Apr 2025 04:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:for-next 13/116] fs/bcachefs/str_hash.h:48:18:
 warning: unused variable 'casefold_opt'
Message-ID: <202504250412.YbXv7Fwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs for-next
head:   ea1555f2339e57ac4e0f902fc71ef8069198c713
commit: 5154dc1063e80b35677b5a86d0614522529889ca [13/116] bcachefs: Casefold is now a regular opts.h option
config: arc-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250412.YbXv7Fwk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250412.YbXv7Fwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250412.YbXv7Fwk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fsck.h:5,
                    from fs/bcachefs/chardev.c:9:
   fs/bcachefs/str_hash.h: In function 'bch2_hash_info_init':
>> fs/bcachefs/str_hash.h:48:18: warning: unused variable 'casefold_opt' [-Wunused-variable]
      48 |         unsigned casefold_opt = bi->bi_casefold
         |                  ^~~~~~~~~~~~


vim +/casefold_opt +48 fs/bcachefs/str_hash.h

    43	
    44	static inline struct bch_hash_info
    45	bch2_hash_info_init(struct bch_fs *c, const struct bch_inode_unpacked *bi)
    46	{
    47		/* inode apts are stored with a +1 bias: 0 means "unset, use fs opt" */
  > 48		unsigned casefold_opt = bi->bi_casefold
    49			? bi->bi_casefold - 1
    50			: c->opts.casefold;
    51	
    52		struct bch_hash_info info = {
    53			.type = INODE_STR_HASH(bi),
    54	#ifdef CONFIG_UNICODE
    55			.cf_encoding = casefold_opt ? c->cf_encoding : NULL,
    56	#endif
    57			.siphash_key = { .k0 = bi->bi_hash_seed }
    58		};
    59	
    60		if (unlikely(info.type == BCH_STR_HASH_siphash_old)) {
    61			u8 digest[SHA256_DIGEST_SIZE];
    62	
    63			sha256((const u8 *)&bi->bi_hash_seed,
    64			       sizeof(bi->bi_hash_seed), digest);
    65			memcpy(&info.siphash_key, digest, sizeof(info.siphash_key));
    66		}
    67	
    68		return info;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
