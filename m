Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C351BCA1C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 03:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366618; cv=none; b=X4DUuTfYcEYnoeoufXfxgZTU7hGV2xjJWPXbeEuWDyfGLYsTX6Nv5rop7192nG/smfdkvtrvLGHaRA5aL6s4pvlIrC9Zft7TLAmZ8GotguBv6ANTCEGsqooCOdxCZFycj1AXnL6tgGea6AGQEJvFsn5BnvwaS3/LKJyHzDT7So4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366618; c=relaxed/simple;
	bh=2ktT7M/v6mkuhOADPzzJ2teRR9xqSlsC8eE+XFFDCmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Up6oryVbeY5EUrQh0IAM9ECYr6A0PQRVem7LlUUNKrmLcVY/pDxxJcAiqluKqUXCZkUiAawRQocGtMV658utaIsFqQIxktB1q+CLOpb+jflU0MewNnLESsrXCrMFt3jRn3sScoSCV2kzioM7soDrio7YEmYbjZUcGggG2TFdN0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcGm2x0/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcGm2x0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747366616; x=1778902616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ktT7M/v6mkuhOADPzzJ2teRR9xqSlsC8eE+XFFDCmc=;
  b=YcGm2x0/9/3GZcA4lQrveL2/2gMmA2Xo+VD3JiHx28jnefHUlwuVucJV
   rFvD2ggBh/8nhHLLcgFhaitOqKn2rlEQusYw1M6DtDSWgwc6Qs84AG/AU
   lC91iv1kWWE/KDWhMGKBWkyyWY5kYGX4ynou2K+tMqLgMg3uf4kHQxrj2
   6muW23w+zZc7nIkiGg9y/c2fUQFrLoeT96yr0tH/P3QjehfEv2Rh3papY
   rXDVmjcdk5wj7uLBgqJpPsFyUaa6Dyiv9L9FBtecQsUFNlMeQxsgwzu2r
   iut/34OhNUqqCts9fx0vFTmeXouu/bH6hM1YB3fW7XgqGZUzkwmyDAggV
   w==;
X-CSE-ConnectionGUID: /fKFFjgQTTCjA/ajtq1nEQ==
X-CSE-MsgGUID: OZ764FOURMGLxlnU7mhvaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60667360"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60667360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 20:36:55 -0700
X-CSE-ConnectionGUID: J24cD7izS4OtpBsKfK2eGQ==
X-CSE-MsgGUID: 4zya5XVgRWG1HwBGoVTa6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138611541"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2025 20:36:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFlsS-000Ixp-2F;
	Fri, 16 May 2025 03:36:52 +0000
Date: Fri, 16 May 2025 11:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-final 5/5]
 drivers/virt/coco/guest/tsm-mr.c:231:19: error: 'struct attribute_group' has
 no member named 'bin_attrs_new'; did you mean 'bin_attrs'?
Message-ID: <202505161154.JB7RP5uo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-final
head:   ec736d2ecd3dd88a7df03b27d0aa941113b58149
commit: ec736d2ecd3dd88a7df03b27d0aa941113b58149 [5/5] sysfs: remove attribute_group::bin_attrs_new
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250516/202505161154.JB7RP5uo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161154.JB7RP5uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161154.JB7RP5uo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_create_attribute_group':
   drivers/virt/coco/guest/tsm-mr.c:212:28: error: 'struct bin_attribute' has no member named 'read_new'
     212 |                         bap->read_new = tm_digest_read;
         |                            ^~
   drivers/virt/coco/guest/tsm-mr.c:217:28: error: 'struct bin_attribute' has no member named 'write_new'
     217 |                         bap->write_new = tm_digest_write;
         |                            ^~
>> drivers/virt/coco/guest/tsm-mr.c:231:19: error: 'struct attribute_group' has no member named 'bin_attrs_new'; did you mean 'bin_attrs'?
     231 |         ctx->agrp.bin_attrs_new = no_free_ptr(attrs);
         |                   ^~~~~~~~~~~~~
         |                   bin_attrs
   drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_free_attribute_group':
>> drivers/virt/coco/guest/tsm-mr.c:247:33: error: 'const struct attribute_group' has no member named 'bin_attrs_new'; did you mean 'bin_attrs'?
     247 |                 kfree(attr_grp->bin_attrs_new);
         |                                 ^~~~~~~~~~~~~
         |                                 bin_attrs


vim +231 drivers/virt/coco/guest/tsm-mr.c

b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  121  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  122  /**
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  123   * tsm_mr_create_attribute_group() - creates an attribute group for measurement
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  124   * registers (MRs)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  125   * @tm: pointer to &struct tsm_measurements containing the MR definitions.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  126   *
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  127   * This function creates attributes corresponding to the MR definitions
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  128   * provided by @tm->mrs.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  129   *
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  130   * The created attributes will reference @tm and its members. The caller must
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  131   * not free @tm until after tsm_mr_free_attribute_group() is called.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  132   *
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  133   * Context: Process context. May sleep due to memory allocation.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  134   *
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  135   * Return:
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  136   * * On success, the pointer to a an attribute group is returned; otherwise
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  137   * * %-EINVAL - Invalid MR definitions.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  138   * * %-ENOMEM - Out of memory.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  139   */
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  140  const struct attribute_group *
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  141  tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  142  {
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  143  	size_t nlen;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  144  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  145  	if (!tm || !tm->mrs)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  146  		return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  147  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  148  	/* aggregated length of all MR names */
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  149  	nlen = 0;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  150  	for (size_t i = 0; i < tm->nr_mrs; ++i) {
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  151  		if ((tm->mrs[i].mr_flags & TSM_MR_F_LIVE) && !tm->refresh)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  152  			return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  153  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  154  		if ((tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) && !tm->write)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  155  			return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  156  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  157  		if (!tm->mrs[i].mr_name)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  158  			return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  159  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  160  		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  161  			continue;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  162  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  163  		if (tm->mrs[i].mr_hash >= HASH_ALGO__LAST)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  164  			return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  165  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  166  		/* MR sysfs attribute names have the form of MRNAME:HASH */
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  167  		nlen += strlen(tm->mrs[i].mr_name) + 1 +
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  168  			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  169  	}
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  170  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  171  	/*
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  172  	 * @attrs and the MR name strings are combined into a single allocation
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  173  	 * so that we don't have to free MR names one-by-one in
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  174  	 * tsm_mr_free_attribute_group()
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  175  	 */
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  176  	const struct bin_attribute **attrs __free(kfree) =
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  177  		kzalloc(sizeof(*attrs) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  178  	struct tm_context *ctx __free(kfree) =
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  179  		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  180  	char *name, *end;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  181  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  182  	if (!ctx || !attrs)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  183  		return ERR_PTR(-ENOMEM);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  184  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  185  	/* @attrs is followed immediately by MR name strings */
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  186  	name = (char *)&attrs[tm->nr_mrs + 1];
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  187  	end = name + nlen;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  188  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  189  	for (size_t i = 0; i < tm->nr_mrs; ++i) {
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  190  		struct bin_attribute *bap = &ctx->mrs[i];
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  191  
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  192  		sysfs_bin_attr_init(bap);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  193  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  194  		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  195  			bap->attr.name = tm->mrs[i].mr_name;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  196  		else if (name < end) {
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  197  			bap->attr.name = name;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  198  			name += snprintf(name, end - name, "%s:%s",
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  199  					 tm->mrs[i].mr_name,
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  200  					 hash_algo_name[tm->mrs[i].mr_hash]);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  201  			++name;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  202  		} else
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  203  			return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  204  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  205  		/* check for duplicated MR definitions */
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  206  		for (size_t j = 0; j < i; ++j)
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  207  			if (!strcmp(bap->attr.name, attrs[j]->attr.name))
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  208  				return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  209  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  210  		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  211  			bap->attr.mode |= 0444;
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  212  			bap->read_new = tm_digest_read;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  213  		}
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  214  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  215  		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  216  			bap->attr.mode |= 0200;
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  217  			bap->write_new = tm_digest_write;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  218  		}
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  219  
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  220  		bap->size = tm->mrs[i].mr_size;
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  221  		bap->private = ctx;
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  222  
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13  223  		attrs[i] = bap;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  224  	}
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  225  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  226  	if (name != end)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  227  		return ERR_PTR(-EINVAL);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  228  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  229  	init_rwsem(&ctx->rwsem);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  230  	ctx->agrp.name = "measurements";
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08 @231  	ctx->agrp.bin_attrs_new = no_free_ptr(attrs);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  232  	ctx->tm = tm;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  233  	return &no_free_ptr(ctx)->agrp;
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  234  }
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  235  EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  236  
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  237  /**
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  238   * tsm_mr_free_attribute_group() - frees the attribute group returned by
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  239   * tsm_mr_create_attribute_group()
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  240   * @attr_grp: attribute group returned by tsm_mr_create_attribute_group()
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  241   *
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  242   * Context: Process context.
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  243   */
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  244  void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  245  {
b9e22b35d4598a drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-08  246  	if (!IS_ERR_OR_NULL(attr_grp)) {
b0ca403a9e3811 drivers/virt/coco/tsm-mr.c Cedric Xing 2025-05-13 @247  		kfree(attr_grp->bin_attrs_new);

:::::: The code at line 231 was first introduced by commit
:::::: b9e22b35d4598aefed642928ed2856a9900e5b37 tsm-mr: Add TVM Measurement Register support

:::::: TO: Cedric Xing <cedric.xing@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
