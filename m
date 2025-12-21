Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353C204583
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766295961; cv=none; b=BWRk7sgVxkOvRIW3MtOr/Z6DLhxXclGgO/P9zOWtKA3d21ecZP2+mlagJabS1OZ+Csi6BhHp+zajsqBXwPJPqTdf2XQa0MlaP1wUBeL6A+8wQYBQWKg6RydyHhmcgOlzsETvXcAQnCB3CIF/3h/5C/lPqPI2uKvQHGrlceyuqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766295961; c=relaxed/simple;
	bh=OROeqfWEG1k4X6b2Brp/rVXHGQy4z9G9jpiC6YMcmN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFla94kSO/4j4xVTZ0iG2iyWkXuCgrF3bofQkk7vkyj5Zf/i++YHNJgwmPw2TX5JOJtIoW3IFU2J+v2gB6EJuH7R2VtsX8f4wzAnM8hORLApOuvvx9QeeF4Fb/6ec6zw3pfbbLaHv7G7XacluouvWajECAginD++PBacp/7/cP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPdqggQn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPdqggQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766295959; x=1797831959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OROeqfWEG1k4X6b2Brp/rVXHGQy4z9G9jpiC6YMcmN0=;
  b=RPdqggQnH1stp5HNnCNYOoTKHRvTnb0lG/1abQ+HuYY3ml1PEA4ggBhb
   0K2a+ZTEkeFsAD4uYqZ5BP6gXuy1RH1o6X42HtHnfSWDREdkaBUeS/hEB
   eGPAm2wrHH8+xF3Bz9JmGkAstuzsupB0zE57DZoVREoh3DGO46GbKqQOQ
   LCLfWr/gLxyJiml+g1lLM/ORYX4gAhekD8YC1dGRsWZI/HKejdhkrrT1n
   VmmDIWKkTcj/pB+sj4J4jb6DDDqAB8CULCqTjGrAY0L5aSS/Ow0WtQEa7
   7QuO23rOAGFVDqIK0HB4fquNVcwtRkQvyZWXN07Yg1daEAYwPScZD8DRO
   A==;
X-CSE-ConnectionGUID: /iOTyUiSR4WN9jJAYVFiCQ==
X-CSE-MsgGUID: 7RkDAzTsQ9a7zIbQqbGteg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78831859"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78831859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 21:45:58 -0800
X-CSE-ConnectionGUID: 7DlBzMezR6adI148uGbcyA==
X-CSE-MsgGUID: KhNVufBRS4GQtidkQbgHmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200122726"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 21:45:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCGR-000000005Lb-1Zds;
	Sun, 21 Dec 2025 05:45:55 +0000
Date: Sun, 21 Dec 2025 13:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3557/3557]
 security/integrity/ima/ima_digest_list.c:164:37: sparse: sparse: cast to
 restricted __le16
Message-ID: <202512211327.X52XldqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 5fbe16a682d5af0c2f7145096851e31e3c921d64 [3557/3557] ima: Execute parser to upload digest lists not recognizable by the kernel
config: arm64-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251221/202512211327.X52XldqR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211327.X52XldqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211327.X52XldqR-lkp@intel.com/

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
