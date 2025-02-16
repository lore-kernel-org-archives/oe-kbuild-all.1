Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03186344
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739686952; cv=none; b=L9uqpyugTe7C15Dn8Uv42y/UAbiKhsrjZ+baufYzPJFisUt49s6EShW74mkifYQEPUDIOuOjGi1MqFd8BqaH90vUfr+BzyjoWaNxQrYDlyt79Ce3ooSVoRxml9haR3XI3OhxNXsNwjzcBP5y1/4fReuXFx6A+RP5JmXBhqSpqFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739686952; c=relaxed/simple;
	bh=E7NCYhYeIeQngSK9f+44vS+vWj1ewPeCbwmDGA+nok4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3V/fEdRvRrV/7ZLqAP5y1nhmXxoGFAuhGEy5uQ1xIoaHE/uzHYFq/OdV+cyIpglFjw5Kyq0W/LPnaVIjMAAS/dClyFmV94pxBIxNhler5mrOmNlJf2oYXysOLgdeQi+hgK5h9ldrw9AdbcgSp8mMtfWUURnMWKlLpY3zZfHzOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq6/G+hz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq6/G+hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739686950; x=1771222950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7NCYhYeIeQngSK9f+44vS+vWj1ewPeCbwmDGA+nok4=;
  b=Mq6/G+hzNAkuSCUNUDmzUoIjoMppRCVpKtlGM/S65LnrEGs/Ln63+MAc
   rK7pKofaLJOIQJ+PQMuGf6zKBAJWHNAgwFDs5IY0ATe9ifx53egFWdJl2
   dmdvVPb6ny7eVaMndFdFWjI+x27rwyab1SdfW/7NdWBdhxONYJIkHBUxq
   oQLX/6MBgsm2+2OwWqm5K0HuyjiJ910SwQIOL4YeNazb0zI5m9cJd2blC
   9/iIEzZx2EflfNzAM6Q7kZPWKizBvQffXDyfoakO1QWxQExYKU4q2xkgf
   k3Rvss11Y6o5Lkn7ScxIcXFQdKg+QY4o7789EYFRO7B0Y43AtmVhmzZne
   A==;
X-CSE-ConnectionGUID: hGKRA2LyQOyfHMBejONurg==
X-CSE-MsgGUID: /0BamySzReOT1dKiGD1BLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51041141"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="51041141"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 22:22:29 -0800
X-CSE-ConnectionGUID: coXMUPdZQQeSdqM0zAjqmw==
X-CSE-MsgGUID: QXWo1jXXQoKOFzEfh8GQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150994574"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2025 22:22:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjY2r-001Bdz-2f;
	Sun, 16 Feb 2025 06:22:25 +0000
Date: Sun, 16 Feb 2025 14:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Ashton <joshua@froggi.es>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [koverstreet-bcachefs:bcachefs-testing 103/104]
 fs/bcachefs/dirent.c:290:46: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202502161437.UH8VP3QK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   cfaf22143ffba87f99d663472805ac45852a37e4
commit: dd28528df1d507348a493e46001249c9fba22a9e [103/104] bcachefs: bcachefs_metadata_version_casefolding
config: mips-randconfig-r112-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161437.UH8VP3QK-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502161437.UH8VP3QK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161437.UH8VP3QK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/dirent.c: note: in included file:
   fs/bcachefs/bcachefs.h:1006:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/dirent.c:290:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] d_name_len @@     got unsigned int const [usertype] len @@
   fs/bcachefs/dirent.c:290:46: sparse:     expected restricted __le16 [usertype] d_name_len
   fs/bcachefs/dirent.c:290:46: sparse:     got unsigned int const [usertype] len
>> fs/bcachefs/dirent.c:291:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] d_cf_name_len @@     got unsigned int const [usertype] len @@
   fs/bcachefs/dirent.c:291:49: sparse:     expected restricted __le16 [usertype] d_cf_name_len
   fs/bcachefs/dirent.c:291:49: sparse:     got unsigned int const [usertype] len

vim +290 fs/bcachefs/dirent.c

   282	
   283	static void dirent_init_casefolded_name(struct bkey_i_dirent *dirent,
   284						const struct qstr *name,
   285						const struct qstr *cf_name)
   286	{
   287		EBUG_ON(!dirent->v.d_casefold);
   288		EBUG_ON(!cf_name->len);
   289	
 > 290		dirent->v.d_cf_name_block.d_name_len = name->len;
 > 291		dirent->v.d_cf_name_block.d_cf_name_len = cf_name->len;
   292		memcpy(&dirent->v.d_cf_name_block.d_names[0], name->name, name->len);
   293		memcpy(&dirent->v.d_cf_name_block.d_names[name->len], cf_name->name, cf_name->len);
   294		memset(&dirent->v.d_cf_name_block.d_names[name->len + cf_name->len], 0,
   295			bkey_val_bytes(&dirent->k) -
   296			offsetof(struct bch_dirent, d_cf_name_block.d_names) -
   297			name->len + cf_name->len);
   298	
   299		EBUG_ON(bch2_dirent_get_casefold_name(dirent_i_to_s_c(dirent)).len != cf_name->len);
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
