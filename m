Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D3128819
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 05:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973595; cv=none; b=qKZudxU6Bq5SF1xJZKHuGgGUpze1eVbjdAP6WfqEM17DLjOOmm0coTFbagJ231ZhAsVNfrAGIpvWYku6J+5DGwVbBn2txg4ybjGUZEqO9toVqybxZPH3Ovu23z0xttFCPtjxStCTOApEy1/Ea/twPSOOS/Qqo5gq8h7o88Y7dRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973595; c=relaxed/simple;
	bh=0sWbMdXTADZ8lofTDSqbAwRyijB9F1NqgdodUG7vzfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZQyQCZGmvq1KufMVdXv6oqGR9Sj6S1i6MiobhC0O7Ymme2foqrSMmLySL3riDgNckwOlOlV3cvo222IuhTaG/0SWv3s9MBUZoMadNpXSWuzsKiWKIAWyieM4j+vy9v7jJE6Sw8jQeVPbXAY7VAXkonLgqnF5iPQSzjUiVdkbpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEM50h83; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEM50h83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761973594; x=1793509594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0sWbMdXTADZ8lofTDSqbAwRyijB9F1NqgdodUG7vzfM=;
  b=dEM50h83AMkUaeirU8YwKSTJmZihei2Z5uSfMJL6cLjDDMBiG04/yZOn
   nhmdqdgjYpFukOligLHszXIZGAbx3C4TzeCVUwnOwJLvAEw/HVDRDSTqu
   fFr7qaPNvPWZqBHJHHsNRKeHgVdgpPixXIByg+GDsvsDvqLoeFWi1+P7F
   zfhdbNvUYNd/zdlmmku/Me4OEY1KqFlxMVoZ4r/aQkRbEZaqqq2v5V+xK
   yw3ZR9keCKm+sUEs5BXt+Y64ZAuqKeu/4rF+12KxwFfPNI71moj1Pvkyj
   J6QHrlAIdXofRSaIeIhL5/ZSLixjP+wxbHymqtPmP69+Ey/Y54Fn/FOJf
   A==;
X-CSE-ConnectionGUID: IV8a6GnAStq2w3MId1FnBA==
X-CSE-MsgGUID: KXXVOPelT861MzZSdT6kWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75483566"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75483566"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 22:06:33 -0700
X-CSE-ConnectionGUID: hq+dI8vSQ7ujbRG87/aAOA==
X-CSE-MsgGUID: 1dgAhmSlSASDelcEQPlt4w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2025 22:06:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF3oe-000Nvc-0a;
	Sat, 01 Nov 2025 05:06:22 +0000
Date: Sat, 1 Nov 2025 13:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 716/734]
 fs/bcachefs/data/rebalance.c:41:5-8: Unneeded variable: "ret". Return "0" on
 line 52
Message-ID: <202511011251.Au2L1yVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   a5c118bb023e015f927cdc18a3b70179870b4049
commit: eccf5fb92ae10f0f99987ed4bd8fb2de330ab6be [716/734] bcachefs: bch2_extent_rebalance_validate()
config: sparc-randconfig-r051-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011251.Au2L1yVB-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011251.Au2L1yVB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/rebalance.c:41:5-8: Unneeded variable: "ret". Return "0" on line 52

vim +41 fs/bcachefs/data/rebalance.c

    35	
    36	int bch2_extent_rebalance_validate(struct bch_fs *c,
    37					   struct bkey_s_c k,
    38					   struct bkey_validate_context from,
    39					   const struct bch_extent_rebalance *r)
    40	{
  > 41		int ret = 0;
    42	
    43		bkey_fsck_err_on(r->pending && !(r->need_rb & BIT(BCH_REBALANCE_background_target)),
    44				 c, extent_rebalance_bad_pending,
    45				 "pending incorrectly set");
    46	
    47		bkey_fsck_err_on(r->hipri && !(r->need_rb & BIT(BCH_REBALANCE_data_replicas)),
    48				 c, extent_rebalance_bad_pending,
    49				 "hipri incorrectly set");
    50	
    51	fsck_err:
  > 52		return ret;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
