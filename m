Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC5214A85
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 06:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720419368; cv=none; b=GaXoeLPaZGmFiGkB9exIp8PmHP4bobYb7ZTB7o/3hOafc2oIcHLIzE3GVaeGYf2eWMXYWGr6Gj3MT/a7/lU2k3UPNCle+ohm/zWD66q4QWDg7ovq4MQ3qQA31O4edSVXYRNyMPic7cuvJB5AQVQ/58IRSgL3BNhNL3bij8NBYj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720419368; c=relaxed/simple;
	bh=Vl0DS98eQpnlgpBOaIGS1kvCAN4V3Y6fN15xA6DcsFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=en15yeN36qbRyatImHpsbgyQiBD8yz/IJlUKZzPasky03nW2CSztfHZ9NOCWBZZ9WMg9txWDZkDECQ0is+UQ8+FMUTosjJI8n++94B+zkDw1mYL732KsrgojtODcs6f+G0YCvpgaFTso5sGznqU4O/XhU5l95nFKmImi3sEcfd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vw1MA2r9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vw1MA2r9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720419364; x=1751955364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vl0DS98eQpnlgpBOaIGS1kvCAN4V3Y6fN15xA6DcsFI=;
  b=Vw1MA2r9Q9MW4F68XCzeyCk3Mc92ajawzr7IakacBVO1OhjWa8wJKPNp
   uB4A5dYDLSLcvUhHZvuOQ6R0vDMz2aunJdUymynMyF9oj618LInlezi47
   C6UIUZa7b2kKUeo7luldp4u9U1SItjMdbIczL49uUYGa5aIksRspDZjYH
   NR+nrASa7qmRAeWMx7/iW49raVYsD/3fSRz/Uchjadj5NQYwD6X5Idygx
   cduRWIDHluG6+T2mMrUN1UZf3cp8qwWGpKqJpeIR57v1yx6c4+UI18DUo
   jV4nTaPoflV73jQ9hHOdLmOgElka2emN2zptbdk9KIl4RjkItldCBJcSK
   A==;
X-CSE-ConnectionGUID: n7uofEQ8SS+uY7Ju7ulCsw==
X-CSE-MsgGUID: jNi6tFTJTla1D2goVxPQ/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17735075"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17735075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 23:16:04 -0700
X-CSE-ConnectionGUID: UHpgD1lPQkieYPTeogA+qg==
X-CSE-MsgGUID: 66SnQSpaTlexQRJa0lB2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="52226341"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2024 23:16:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQhfM-000VXp-0p;
	Mon, 08 Jul 2024 06:16:00 +0000
Date: Mon, 8 Jul 2024 14:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3348/10598]
 security/integrity/ima/ima_digest_list.c:164:37: sparse: sparse: cast to
 restricted __le16
Message-ID: <202407081457.7NZpgJgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   01c2a11a75f4f8b273ef3e34cca3974b10314a3a
commit: 5fbe16a682d5af0c2f7145096851e31e3c921d64 [3348/10598] ima: Execute parser to upload digest lists not recognizable by the kernel
config: arm64-randconfig-r131-20240707 (https://download.01.org/0day-ci/archive/20240708/202407081457.7NZpgJgk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407081457.7NZpgJgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081457.7NZpgJgk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_digest_list.c:164:37: sparse: sparse: cast to restricted __le16
   security/integrity/ima/ima_digest_list.c:165:42: sparse: sparse: cast to restricted __le16
   security/integrity/ima/ima_digest_list.c:166:37: sparse: sparse: cast to restricted __le16
>> security/integrity/ima/ima_digest_list.c:167:38: sparse: sparse: cast to restricted __le32
   security/integrity/ima/ima_digest_list.c:168:40: sparse: sparse: cast to restricted __le32
>> security/integrity/ima/ima_digest_list.c:416:20: sparse: sparse: symbol 'parser_task' was not declared. Should it be static?

vim +164 security/integrity/ima/ima_digest_list.c

b3fef06570ef2b Roberto Sassu 2023-09-12  138  
b3fef06570ef2b Roberto Sassu 2023-09-12  139  int ima_parse_compact_list(loff_t size, void *buf, int op)
b3fef06570ef2b Roberto Sassu 2023-09-12  140  {
b3fef06570ef2b Roberto Sassu 2023-09-12  141  	u8 *digest;
b3fef06570ef2b Roberto Sassu 2023-09-12  142  	void *bufp = buf, *bufendp = buf + size;
b3fef06570ef2b Roberto Sassu 2023-09-12  143  	struct compact_list_hdr *hdr;
b3fef06570ef2b Roberto Sassu 2023-09-12  144  	size_t digest_len;
b3fef06570ef2b Roberto Sassu 2023-09-12  145  	int ret = 0, i;
b3fef06570ef2b Roberto Sassu 2023-09-12  146  
80701e75d21f48 Roberto Sassu 2023-09-12  147  	if (!(ima_digest_list_actions & ima_policy_flag))
80701e75d21f48 Roberto Sassu 2023-09-12  148  		return -EACCES;
80701e75d21f48 Roberto Sassu 2023-09-12  149  
b3fef06570ef2b Roberto Sassu 2023-09-12  150  	while (bufp < bufendp) {
b3fef06570ef2b Roberto Sassu 2023-09-12  151  		if (bufp + sizeof(*hdr) > bufendp) {
b3fef06570ef2b Roberto Sassu 2023-09-12  152  			pr_err("compact list, invalid data\n");
b3fef06570ef2b Roberto Sassu 2023-09-12  153  			return -EINVAL;
b3fef06570ef2b Roberto Sassu 2023-09-12  154  		}
b3fef06570ef2b Roberto Sassu 2023-09-12  155  
b3fef06570ef2b Roberto Sassu 2023-09-12  156  		hdr = bufp;
b3fef06570ef2b Roberto Sassu 2023-09-12  157  
b3fef06570ef2b Roberto Sassu 2023-09-12  158  		if (hdr->version != 1) {
b3fef06570ef2b Roberto Sassu 2023-09-12  159  			pr_err("compact list, unsupported version\n");
b3fef06570ef2b Roberto Sassu 2023-09-12  160  			return -EINVAL;
b3fef06570ef2b Roberto Sassu 2023-09-12  161  		}
b3fef06570ef2b Roberto Sassu 2023-09-12  162  
b3fef06570ef2b Roberto Sassu 2023-09-12  163  		if (ima_canonical_fmt) {
b3fef06570ef2b Roberto Sassu 2023-09-12 @164  			hdr->type = le16_to_cpu(hdr->type);
b3fef06570ef2b Roberto Sassu 2023-09-12  165  			hdr->modifiers = le16_to_cpu(hdr->modifiers);
b3fef06570ef2b Roberto Sassu 2023-09-12  166  			hdr->algo = le16_to_cpu(hdr->algo);
b3fef06570ef2b Roberto Sassu 2023-09-12 @167  			hdr->count = le32_to_cpu(hdr->count);
b3fef06570ef2b Roberto Sassu 2023-09-12  168  			hdr->datalen = le32_to_cpu(hdr->datalen);
b3fef06570ef2b Roberto Sassu 2023-09-12  169  		}
b3fef06570ef2b Roberto Sassu 2023-09-12  170  
b3fef06570ef2b Roberto Sassu 2023-09-12  171  		if (hdr->algo >= HASH_ALGO__LAST)
b3fef06570ef2b Roberto Sassu 2023-09-12  172  			return -EINVAL;
b3fef06570ef2b Roberto Sassu 2023-09-12  173  
b3fef06570ef2b Roberto Sassu 2023-09-12  174  		digest_len = hash_digest_size[hdr->algo];
b3fef06570ef2b Roberto Sassu 2023-09-12  175  
b3fef06570ef2b Roberto Sassu 2023-09-12  176  		if (hdr->type >= COMPACT__LAST) {
b3fef06570ef2b Roberto Sassu 2023-09-12  177  			pr_err("compact list, invalid type %d\n", hdr->type);
b3fef06570ef2b Roberto Sassu 2023-09-12  178  			return -EINVAL;
b3fef06570ef2b Roberto Sassu 2023-09-12  179  		}
b3fef06570ef2b Roberto Sassu 2023-09-12  180  
b3fef06570ef2b Roberto Sassu 2023-09-12  181  		bufp += sizeof(*hdr);
b3fef06570ef2b Roberto Sassu 2023-09-12  182  
b3fef06570ef2b Roberto Sassu 2023-09-12  183  		for (i = 0; i < hdr->count; i++) {
b3fef06570ef2b Roberto Sassu 2023-09-12  184  			if (bufp + digest_len > bufendp) {
b3fef06570ef2b Roberto Sassu 2023-09-12  185  				pr_err("compact list, invalid data\n");
b3fef06570ef2b Roberto Sassu 2023-09-12  186  				return -EINVAL;
b3fef06570ef2b Roberto Sassu 2023-09-12  187  			}
b3fef06570ef2b Roberto Sassu 2023-09-12  188  
b3fef06570ef2b Roberto Sassu 2023-09-12  189  			digest = bufp;
b3fef06570ef2b Roberto Sassu 2023-09-12  190  			bufp += digest_len;
b3fef06570ef2b Roberto Sassu 2023-09-12  191  
b3fef06570ef2b Roberto Sassu 2023-09-12  192  			if (op == DIGEST_LIST_OP_ADD)
b3fef06570ef2b Roberto Sassu 2023-09-12  193  				ret = ima_add_digest_data_entry(digest,
b3fef06570ef2b Roberto Sassu 2023-09-12  194  					hdr->algo, hdr->type, hdr->modifiers);
b3fef06570ef2b Roberto Sassu 2023-09-12  195  			else if (op == DIGEST_LIST_OP_DEL)
b3fef06570ef2b Roberto Sassu 2023-09-12  196  				ima_del_digest_data_entry(digest, hdr->algo,
b3fef06570ef2b Roberto Sassu 2023-09-12  197  					hdr->type);
b3fef06570ef2b Roberto Sassu 2023-09-12  198  			if (ret < 0 && ret != -EEXIST)
b3fef06570ef2b Roberto Sassu 2023-09-12  199  				return ret;
b3fef06570ef2b Roberto Sassu 2023-09-12  200  		}
b3fef06570ef2b Roberto Sassu 2023-09-12  201  
b3fef06570ef2b Roberto Sassu 2023-09-12  202  		if (i != hdr->count ||
b3fef06570ef2b Roberto Sassu 2023-09-12  203  		    bufp != (void *)hdr + sizeof(*hdr) + hdr->datalen) {
b3fef06570ef2b Roberto Sassu 2023-09-12  204  			pr_err("compact list, invalid data\n");
b3fef06570ef2b Roberto Sassu 2023-09-12  205  			return -EINVAL;
b3fef06570ef2b Roberto Sassu 2023-09-12  206  		}
b3fef06570ef2b Roberto Sassu 2023-09-12  207  	}
b3fef06570ef2b Roberto Sassu 2023-09-12  208  
b3fef06570ef2b Roberto Sassu 2023-09-12  209  	return bufp - buf;
b3fef06570ef2b Roberto Sassu 2023-09-12  210  }
80701e75d21f48 Roberto Sassu 2023-09-12  211  

:::::: The code at line 164 was first introduced by commit
:::::: b3fef06570ef2b61dd7181e5c1d128bfcbf6b2ef ima: Add parser of compact digest list

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: zgzxx <zhangguangzhi3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
