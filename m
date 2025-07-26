Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865C2AD16
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753524387; cv=none; b=fCQCQsIR3VaHnf9IhGYPyfkMF6ZPO4TyJ/Kanb/3FQJ3hXhgl7cE6lWOl82ehHRkXvpofVfyj/YrxL8RVTPpD+dFuchHFKXBew7YNawBELdPOu2qW1LoHVPUxh/eu4BpDoKjYQtoeqfK4OdbV9tuONzHAymTYLXlt29xGXhU7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753524387; c=relaxed/simple;
	bh=EBoTE3O27LMbrY0/YAkABVcxmWa1R+mj1cuv6pKLeGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxO+/7e0OQ8Gj+ZyEgD9Cp6suSNYf330MbBi/dr1QuJ/cW639Kz4mdW8f2rUprCC8y3uXggIQKUukZyAIeRuqxosKmZ+QPSdiAzamVN/PKOmkAt+GA3Kq57w70bbAFB61DIRbdes+UXMnkxIgVy8tEgoBb7tXPcNQdmoMfiAonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAW6F+HR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAW6F+HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753524386; x=1785060386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBoTE3O27LMbrY0/YAkABVcxmWa1R+mj1cuv6pKLeGs=;
  b=XAW6F+HRgsKfmu0RnEDkJu6FOyl/TbIMf3uO4w2diEEKXzXIvyuZRgPn
   y5GKfikVP2vvDbVnZKxHG25HJ9ceiPTIOa+z3HkAxTYwXH2DrF93TB8Rb
   /eHMZDt3xTOAtY/BMOgpUrLRWNl9MV33/ZB97BvEVm7+akkHmitAIN8E8
   1EEABUDzBL5CiCjf1fU1ptWuPg4Eu/9dNH6/JodBHOQK3l1K+krSaQpjX
   fCcBguZZGIWa8mHAoOnqksYm8ZgQ+imBFoDf1eR1wsSZsJUAdfhmWTrZK
   JG67I87YvRJO8/Qv92b9d/ERCUGUyUGGSuiScS0nbJcMmML3JeHe2w644
   A==;
X-CSE-ConnectionGUID: 7OdiuxKsSNmSXGxnANscuw==
X-CSE-MsgGUID: VeXSWel5S0isW2/X2uH9yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="67197174"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67197174"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:06:25 -0700
X-CSE-ConnectionGUID: SyQaj7PsR5qcE+f1KNv5Yg==
X-CSE-MsgGUID: 9X6iGW9aRPmPWwSFxpHIbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161641079"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jul 2025 03:06:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufbnI-000LrD-2x;
	Sat, 26 Jul 2025 10:06:20 +0000
Date: Sat, 26 Jul 2025 18:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [mcgrof:20250723-migrate-folio-stats 16/16] mm/backing-dev.c:517:28:
 error: 'struct inode' has no member named 'i_wb'; did you mean 'i_sb'?
Message-ID: <202507261703.ZJ2LqmTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250723-migrate-folio-stats
head:   e857aaf49afadc31be5f460664cd176bfd972ffe
commit: e857aaf49afadc31be5f460664cd176bfd972ffe [16/16] writeback: added support to change the number of writebacks using a sysfs attribute
config: x86_64-buildonly-randconfig-001-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261703.ZJ2LqmTl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261703.ZJ2LqmTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261703.ZJ2LqmTl-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/backing-dev.c: In function 'nwritebacks_store':
>> mm/backing-dev.c:517:28: error: 'struct inode' has no member named 'i_wb'; did you mean 'i_sb'?
     517 |                 if (inode->i_wb) {
         |                            ^~~~
         |                            i_sb
   mm/backing-dev.c:519:39: error: 'struct inode' has no member named 'i_wb'; did you mean 'i_sb'?
     519 |                         wb_put(inode->i_wb);
         |                                       ^~~~
         |                                       i_sb
   mm/backing-dev.c:520:32: error: 'struct inode' has no member named 'i_wb'; did you mean 'i_sb'?
     520 |                         inode->i_wb = NULL;
         |                                ^~~~
         |                                i_sb


vim +517 mm/backing-dev.c

   482	
   483	static ssize_t nwritebacks_store(struct device *dev,
   484					 struct device_attribute *attr,
   485					 const char *buf, size_t count)
   486	{
   487		struct backing_dev_info *bdi = dev_get_drvdata(dev);
   488		unsigned int nwritebacks;
   489		ssize_t ret;
   490		struct super_block *sb = NULL;
   491		struct bdi_writeback_ctx **wb_ctx;
   492		struct bdi_writeback_ctx *bdi_wb_ctx;
   493		struct inode *inode;
   494	
   495		ret = kstrtouint(buf, 10, &nwritebacks);
   496		if (ret < 0)
   497			return ret;
   498	
   499		if (nwritebacks < 1 || nwritebacks > num_online_cpus())
   500			return -EINVAL;
   501	
   502		if (nwritebacks == bdi->nr_wb_ctx)
   503			return count;
   504	
   505		wb_ctx = wb_ctx_alloc(bdi, nwritebacks);
   506		if (!wb_ctx)
   507			return -ENOMEM;
   508	
   509		sb = freeze_bdi_super(bdi);
   510		if (!sb)
   511			return -EBUSY;
   512	
   513		spin_lock(&sb->s_inode_list_lock);
   514		list_for_each_entry(inode, &sb->s_inodes, i_sb_list) {
   515			filemap_write_and_wait(inode->i_mapping);
   516			truncate_inode_pages_final(inode->i_mapping);
 > 517			if (inode->i_wb) {
   518				WARN_ON_ONCE(!(inode->i_state & I_CLEAR));
   519				wb_put(inode->i_wb);
   520				inode->i_wb = NULL;
   521			}
   522		}
   523		spin_unlock(&sb->s_inode_list_lock);
   524	
   525		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
   526			wb_shutdown(&bdi_wb_ctx->wb);
   527			cgwb_bdi_unregister(bdi, bdi_wb_ctx);
   528		}
   529	
   530		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
   531			WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
   532			wb_exit(&bdi_wb_ctx->wb);
   533			kfree(bdi_wb_ctx);
   534		}
   535		kfree(bdi->wb_ctx);
   536	
   537		ret = bdi_set_nwritebacks(bdi, nwritebacks);
   538	
   539		bdi->wb_ctx = wb_ctx;
   540	
   541		cgwb_bdi_init(bdi);
   542		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
   543			cgwb_bdi_register(bdi, bdi_wb_ctx);
   544			set_bit(WB_registered, &bdi_wb_ctx->wb.state);
   545		}
   546	
   547		thaw_super(sb, FREEZE_HOLDER_KERNEL, NULL);
   548		deactivate_super(sb);
   549	
   550		return ret;
   551	}
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
