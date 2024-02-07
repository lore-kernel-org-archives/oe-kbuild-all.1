Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5229DDA7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707272250; cv=none; b=Z9ve/W3mq0nkVm91ZIEFhxNaD5V+Paub9BL3mgPxtnfO36lELCn8u+IaaG0wd6uoCa6LMpwvGlylT6BYQMa/sq2x0OArZgx4fYO+L/+X7JSqAq1aqANlLQGNkXX3pCBwUFf2LUldE+x4NwsU3rqpav44OS2Fy0ys4KGfpxyI1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707272250; c=relaxed/simple;
	bh=Ew2N4SUhlbil2ffBRYkGAPGhh8qfS9dt8k4Dh2ZbYUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzpQoh4NPIHo0Ax8IDrI/B8VptqEpxXL0JIEiP+jzHvcpZv473WybAahlGab2NzGq8ADpwSsagHel/QiVHEQwblM7AS4gpkbCcd5ebBNnEUI7UW3duNg0yoh2DjBwYPtQBbGFScySOminXIQ4Lihn4O2ifUYS+H3oTX+oMfKoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a41s05xg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a41s05xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707272249; x=1738808249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ew2N4SUhlbil2ffBRYkGAPGhh8qfS9dt8k4Dh2ZbYUQ=;
  b=a41s05xgvV8DAJX09zwMeRHXnDfK8/r5ZCRNVUSopKOf5I7k4bmViMgY
   F1jvq7ThEss5gK3NCVJ9a6mA8TYg1WTHY8FvqgMNVQBtOE2CxdMvqAPT8
   jqMhjZO9QyhBGa3IzgE+SoUU84z98y7S52snAwyGDtIeNo/X0mDQc/9GO
   JU8QVKcwU08KDwSUEKbrFUj6pAHl9eKrxFNPWcMNwqRWqYfK0DM5b2QeD
   Lz6Qsqi+EAwR3XJ7/THgQlqtJ4Z0caX6tescVhqPCXwAw99kG1Qgt7N+U
   y4rJvYJG2QOb7NC0iwHH8Bz1brnUA1g8IgvbhfNuo/G3Qkc/lWzjDQXSi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23371453"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="23371453"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 18:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5821776"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2024 18:17:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXXV6-0001z6-2J;
	Wed, 07 Feb 2024 02:17:24 +0000
Date: Wed, 7 Feb 2024 10:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 11/20] lib/spdm_requester.c:640:12: warning: cast
 to smaller integer type '__le16' (aka 'unsigned short') from '__le16 *' (aka
 'unsigned short *')
Message-ID: <202402071048.lBJSQmW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

First bad commit (maybe != root cause):

tree:   https://github.com/l1k/linux spdm-future
head:   7465f757aed79b09d3374cd8837a8ce6c6f680b4
commit: b79c31b2ef9ea1fc70f9a7b4ae2741acd1130a52 [11/20] PCI/CMA: Authenticate devices on enumeration
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240207/202402071048.lBJSQmW7-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071048.lBJSQmW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071048.lBJSQmW7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/spdm_requester.c:640:12: warning: cast to smaller integer type '__le16' (aka 'unsigned short') from '__le16 *' (aka 'unsigned short *') [-Wpointer-to-int-cast]
     640 |                 u8 ver = le16_to_cpu(&rsp->version_number_entries[i]) >> 8;
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:37:50: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   1 warning generated.


vim +640 lib/spdm_requester.c

1dd2850424470c Jonathan Cameron 2022-09-06  612  
1dd2850424470c Jonathan Cameron 2022-09-06  613  static int spdm_get_version(struct spdm_state *spdm_state,
1dd2850424470c Jonathan Cameron 2022-09-06  614  			    void *transcript, size_t *transcript_sz)
1dd2850424470c Jonathan Cameron 2022-09-06  615  {
1dd2850424470c Jonathan Cameron 2022-09-06  616  	struct spdm_get_version_rsp *rsp = transcript;
1dd2850424470c Jonathan Cameron 2022-09-06  617  	u8 version = SPDM_MIN_VER;
1dd2850424470c Jonathan Cameron 2022-09-06  618  	bool foundver = false;
1dd2850424470c Jonathan Cameron 2022-09-06  619  	int rc, length, i;
1dd2850424470c Jonathan Cameron 2022-09-06  620  
1dd2850424470c Jonathan Cameron 2022-09-06  621  	/*
1dd2850424470c Jonathan Cameron 2022-09-06  622  	 * Bypass spdm_exchange() to be able to set version = 0x10.
1dd2850424470c Jonathan Cameron 2022-09-06  623  	 * rsp buffer is large enough for the maximum possible 255 entries.
1dd2850424470c Jonathan Cameron 2022-09-06  624  	 */
1dd2850424470c Jonathan Cameron 2022-09-06  625  	rc = __spdm_exchange(spdm_state, &spdm_get_version_req,
1dd2850424470c Jonathan Cameron 2022-09-06  626  			     sizeof(spdm_get_version_req), rsp,
1dd2850424470c Jonathan Cameron 2022-09-06  627  			     struct_size(rsp, version_number_entries, 255));
1dd2850424470c Jonathan Cameron 2022-09-06  628  	if (rc < 0)
1dd2850424470c Jonathan Cameron 2022-09-06  629  		return rc;
1dd2850424470c Jonathan Cameron 2022-09-06  630  
1dd2850424470c Jonathan Cameron 2022-09-06  631  	length = rc;
1dd2850424470c Jonathan Cameron 2022-09-06  632  	if (length < sizeof(*rsp) ||
1dd2850424470c Jonathan Cameron 2022-09-06  633  	    length < struct_size(rsp, version_number_entries,
1dd2850424470c Jonathan Cameron 2022-09-06  634  				 rsp->version_number_entry_count)) {
1dd2850424470c Jonathan Cameron 2022-09-06  635  		dev_err(spdm_state->dev, "Truncated version response\n");
1dd2850424470c Jonathan Cameron 2022-09-06  636  		return -EIO;
1dd2850424470c Jonathan Cameron 2022-09-06  637  	}
1dd2850424470c Jonathan Cameron 2022-09-06  638  
1dd2850424470c Jonathan Cameron 2022-09-06  639  	for (i = 0; i < rsp->version_number_entry_count; i++) {
1dd2850424470c Jonathan Cameron 2022-09-06 @640  		u8 ver = le16_to_cpu(&rsp->version_number_entries[i]) >> 8;
1dd2850424470c Jonathan Cameron 2022-09-06  641  
1dd2850424470c Jonathan Cameron 2022-09-06  642  		if (ver >= version && ver <= SPDM_MAX_VER) {
1dd2850424470c Jonathan Cameron 2022-09-06  643  			foundver = true;
1dd2850424470c Jonathan Cameron 2022-09-06  644  			version = ver;
1dd2850424470c Jonathan Cameron 2022-09-06  645  		}
1dd2850424470c Jonathan Cameron 2022-09-06  646  	}
1dd2850424470c Jonathan Cameron 2022-09-06  647  	if (!foundver) {
1dd2850424470c Jonathan Cameron 2022-09-06  648  		dev_err(spdm_state->dev, "No common supported version\n");
1dd2850424470c Jonathan Cameron 2022-09-06  649  		return -EPROTO;
1dd2850424470c Jonathan Cameron 2022-09-06  650  	}
1dd2850424470c Jonathan Cameron 2022-09-06  651  	spdm_state->version = version;
1dd2850424470c Jonathan Cameron 2022-09-06  652  
1dd2850424470c Jonathan Cameron 2022-09-06  653  	/*
1dd2850424470c Jonathan Cameron 2022-09-06  654  	 * Stash VERSION response in transcript buffer
1dd2850424470c Jonathan Cameron 2022-09-06  655  	 * for later consumption by spdm_start_hash() when hash algo is known.
1dd2850424470c Jonathan Cameron 2022-09-06  656  	 */
1dd2850424470c Jonathan Cameron 2022-09-06  657  	*transcript_sz = struct_size(rsp, version_number_entries,
1dd2850424470c Jonathan Cameron 2022-09-06  658  				     rsp->version_number_entry_count);
1dd2850424470c Jonathan Cameron 2022-09-06  659  
1dd2850424470c Jonathan Cameron 2022-09-06  660  	return 0;
1dd2850424470c Jonathan Cameron 2022-09-06  661  }
1dd2850424470c Jonathan Cameron 2022-09-06  662  

:::::: The code at line 640 was first introduced by commit
:::::: 1dd2850424470c3e0da2018d6b23c0de0ceb2917 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
