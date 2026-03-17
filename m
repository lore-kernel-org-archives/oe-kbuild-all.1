Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B133F369
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773775596; cv=none; b=aEwCUvYWK2teGkUXyRc6+wEb0LmgBydHf4xn2Q7KcsXxCyJq+YN8q5XBajE1q+eSTe8QsmHaB5DLylwowODp8Qw3Me/dLoNWfXHIXiHuxnle87lFAAXpPOjmVYhVhV2rAJom/aXU0o8+P7G2pFNla5X9rvzUpeElENuvNZQnoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773775596; c=relaxed/simple;
	bh=wASyRvxIU+Hs+R88GpgttmjQt11sCBcESHCZ3BrAZ9c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TfMpjvHS9szk1gh+dKFG0YmygtSrWpUZ5nscPTTgId8amBgUF6rTMbo/bSOrzftKBxq4IQqDDlxHMmSz21yb4raAfm81XwgEtStRARBSOiKjFVlffSiZGTuvMiOpJ6e/61mfEiwqltwqBeuDuY+CGAaSA+fo2UDvQwdIrd5TSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPTMdgeB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPTMdgeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773775594; x=1805311594;
  h=date:from:to:cc:subject:message-id;
  bh=wASyRvxIU+Hs+R88GpgttmjQt11sCBcESHCZ3BrAZ9c=;
  b=cPTMdgeBRZW3v6RfO4+9f2X8FCu1NdbQayYZqP87GmZaXMEC5l7At6b3
   CKPKp1Y02dthxh5eJ+4z4OSQFOpIoUcJUlwVURzDGj5lsqVzZr03+DfRZ
   zZLsiomQaFBqU5QqL8dLOgB51jS9ShCX3kE5EkO5rE76hILTOVNdU6DWI
   9sQpTEmBX/eCY5/3flr24vXQy71hcRNUyDbeuQnDlCLp5YNE1W+xyWMVo
   166zgobBqLjmacvWB02xPRyhI8UAx/aepaN8v/hWG7BXUM2P9wManwnqf
   Yil1kOEFlE6HQ1m/g8EhTCVGRMI7VuFUDOAq0lobVPfYj1eyHAKQhVFOa
   g==;
X-CSE-ConnectionGUID: 70c+3JpuSva8SyT08Vp15Q==
X-CSE-MsgGUID: 8WZF/rSiSoaxRgnf+UJBeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74793388"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74793388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 12:26:34 -0700
X-CSE-ConnectionGUID: zyIT0XgtQcm/shXXE9Pa8w==
X-CSE-MsgGUID: beEbjWVCTb6RPE2tubSo0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222344561"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2026 12:26:33 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2a3i-000000001sV-0dc2;
	Tue, 17 Mar 2026 19:26:30 +0000
Date: Wed, 18 Mar 2026 03:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
Subject: samples/tsm-mr/tsm_mr_sample.c:52:undefined reference to
 `crypto_alloc_shash'
Message-ID: <202603180323.NgdTrvDk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: f6953f1f9ec4ad68651d7c677f0c065cb4c1edf7 tsm-mr: Add tsm-mr sample code
date:   10 months ago
config: i386-randconfig-r134-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180323.NgdTrvDk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180323.NgdTrvDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180323.NgdTrvDk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: samples/tsm-mr/tsm_mr_sample.o: in function `sample_report_extend_mr':
>> samples/tsm-mr/tsm_mr_sample.c:52:(.text+0x4f): undefined reference to `crypto_alloc_shash'
   ld: samples/tsm-mr/tsm_mr_sample.c:60:(.text+0x9d): undefined reference to `crypto_shash_update'
   ld: samples/tsm-mr/tsm_mr_sample.c:62:(.text+0xb6): undefined reference to `crypto_shash_finup'
   ld: samples/tsm-mr/tsm_mr_sample.o: in function `sample_report_refresh':
   samples/tsm-mr/tsm_mr_sample.c:29:(.text+0x104): undefined reference to `crypto_alloc_shash'
>> ld: samples/tsm-mr/tsm_mr_sample.c:35:(.text+0x12b): undefined reference to `crypto_shash_tfm_digest'


vim +52 samples/tsm-mr/tsm_mr_sample.c

    23	
    24	static int sample_report_refresh(const struct tsm_measurements *tm)
    25	{
    26		struct crypto_shash *tfm;
    27		int rc;
    28	
    29		tfm = crypto_alloc_shash(hash_algo_name[HASH_ALGO_SHA512], 0, 0);
    30		if (IS_ERR(tfm)) {
    31			pr_err("crypto_alloc_shash failed: %ld\n", PTR_ERR(tfm));
    32			return PTR_ERR(tfm);
    33		}
    34	
  > 35		rc = crypto_shash_tfm_digest(tfm, (u8 *)&sample_report,
    36					     offsetof(typeof(sample_report),
    37						      report_digest),
    38					     sample_report.report_digest);
    39		crypto_free_shash(tfm);
    40		if (rc)
    41			pr_err("crypto_shash_tfm_digest failed: %d\n", rc);
    42		return rc;
    43	}
    44	
    45	static int sample_report_extend_mr(const struct tsm_measurements *tm,
    46					   const struct tsm_measurement_register *mr,
    47					   const u8 *data)
    48	{
    49		SHASH_DESC_ON_STACK(desc, 0);
    50		int rc;
    51	
  > 52		desc->tfm = crypto_alloc_shash(hash_algo_name[mr->mr_hash], 0, 0);
    53		if (IS_ERR(desc->tfm)) {
    54			pr_err("crypto_alloc_shash failed: %ld\n", PTR_ERR(desc->tfm));
    55			return PTR_ERR(desc->tfm);
    56		}
    57	
    58		rc = crypto_shash_init(desc);
    59		if (!rc)
    60			rc = crypto_shash_update(desc, mr->mr_value, mr->mr_size);
    61		if (!rc)
    62			rc = crypto_shash_finup(desc, data, mr->mr_size, mr->mr_value);
    63		crypto_free_shash(desc->tfm);
    64		if (rc)
    65			pr_err("SHA calculation failed: %d\n", rc);
    66		return rc;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
