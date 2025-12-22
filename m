Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81A29A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 23:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766445947; cv=none; b=SxEwfnCfntmIGxxGHZTCNI5nv3whGdPXRfrCyujHr2IJedCrHJMMq19/0tUvD/movHG/RQrdbJyfjbG9yrCCNnZEwBUkhbnfQdrYo7eQ8BTnq2mxfQ2mBZd0cku7h/AWoBcvaDzvWvG5ZsUMWo9d7kH4sU9U9kC5Jq6wrk2NEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766445947; c=relaxed/simple;
	bh=DUpRXBpvwymXB4nM4M2mrIfLEIJpegxsQJUc3X4B7/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PsXsG0UEXUJPh/4FE74RbZKK8ej9yLkK9eE7k7dC7NWWH/q56E/h4euQFJuKpFJPh+V6xfc3GjdmxcE8ngr+sgLZnHi/uMhmgVDqAL5z2xKJazaZ99+JCUTadRcA1E+ZBN/Lgk2GTI8tQEOvvgIUyftOwMAkZYO81oOTrwWiA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQyzgJH8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQyzgJH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766445946; x=1797981946;
  h=date:from:to:cc:subject:message-id;
  bh=DUpRXBpvwymXB4nM4M2mrIfLEIJpegxsQJUc3X4B7/M=;
  b=kQyzgJH8s0S2BDMJkWvSeiQCxrKW7iR9nbQxCrFWN+xBqIXz0sWlr6GH
   4d31nN/k++DXq0xKqYrqf0IKt0tPOfgZl3xXsNxIlrXjpgmvhoNvEIorQ
   2Xj/E7c4ED/QZFhxhv+oEcEt5eiWH9YBx4SMERM5CSx3NXnhw/UDzu/4J
   WFOoBhquZb1+k9wGpGXiYLZw38siCXLxdYyhxMj/NqFc3SyNwNyztcwwc
   6qpC4dUfem8W9Zu1OVB6qMA+TKaxPCok2+5DexWcDbvAGSWjeiZsNnPkm
   G7DbrRd2a8DTpI3nDQdryrEhUfoxxi3IVmPHGMZVl2z8yADWtgqtbVWSD
   g==;
X-CSE-ConnectionGUID: BDYnEwi3SAqZb2zDQX2Naw==
X-CSE-MsgGUID: izMNv+juSGuBZVUHy0M+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78932430"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="78932430"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:25:46 -0800
X-CSE-ConnectionGUID: AorVxuK/SVe4uYOH5iejBQ==
X-CSE-MsgGUID: 6UZEjgvCSU+7yF9Mm3iEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204164822"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 15:25:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpHZ-000000001Dd-3VN1;
	Mon, 22 Dec 2025 23:25:41 +0000
Date: Tue, 23 Dec 2025 07:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3557/3557]
 security/integrity/ima/ima_digest_list.c:164:37: sparse: sparse: cast to
 restricted __le16
Message-ID: <202512230715.3UJUkD3z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 5fbe16a682d5af0c2f7145096851e31e3c921d64 [3557/3557] ima: Execute parser to upload digest lists not recognizable by the kernel
config: arm64-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251223/202512230715.3UJUkD3z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230715.3UJUkD3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230715.3UJUkD3z-lkp@intel.com/

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
