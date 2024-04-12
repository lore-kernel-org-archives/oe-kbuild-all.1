Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0558DBA40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712919465; cv=none; b=C6h1w8h7qyQky2+wo/v0wMUZqv7qHnTTYP86XPcIIRP0e8hTOI2DMDymFlAtl6C97MYKn36z2gR2/cAFhGdZaL3bn8n3630B6Iw7YptW1rMy1YgBXTPtzpBm3pZTbHTLHzUDndnf8RFc/cB2o2Ooj38F///FSxwaL6p5kOVO9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712919465; c=relaxed/simple;
	bh=Zfu3DUNFgkPGuEpeZ+L5KimV9Llu7Jr6MEXpJtmAjYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jm7l6zyvYBJdZjS/tG+n1pl49+6bM/gC6iLk4+WiZfFqN49sWfmjgU7fuSfTx9QVKEVJXwtG57gLc8pk3AzYWx1QHt7ExkgOs4/mpQCbgdfngegIVtWjxdLb8pY5BtQrivwknZu0J7q/gfI/3wdQMdbGxxUicz7z/NUxhND12+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NM283C0M; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NM283C0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712919464; x=1744455464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zfu3DUNFgkPGuEpeZ+L5KimV9Llu7Jr6MEXpJtmAjYw=;
  b=NM283C0MpA7R8hW4P1JK4PElBVnIVYVo8LaEftYItfytTx5kohxnuQ+a
   N4x+vHR1Aun/CySVKwlbnW1MnlHHpn/8SItS8qVTDQsQAOwIgaFstONv1
   TyTHsRKCRuqAY5GVDzfVgEGQsHYFEpJks/ReWNJTZDjQfzCezoP21WwEC
   UBuZoixwgaVY9tAnlAb+qFzOC4rKDWl5Mcmm4uVbHeX/AgxgAOOEtwe/8
   rj2iz78raHGLM9D9rxSrBavLn/owBmGkr6MBP3pgxBmlMPZtR8anGFynF
   aP8kcrTX1gSrvp8SPAcuCDfuLUraWhU+ZCLXa1eX6ynDkE9YnQO2T0DFh
   g==;
X-CSE-ConnectionGUID: bRibG5NmTDeWh8CsLUREVg==
X-CSE-MsgGUID: dTBnU29qTtuYgxAKmQUF1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8539033"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8539033"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:57:43 -0700
X-CSE-ConnectionGUID: EWHuNamvSQiYltmIvkFaqw==
X-CSE-MsgGUID: S+u1jRldS4CXRL4n0MUM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="52358595"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2024 03:57:42 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvEbE-0009h9-08;
	Fri, 12 Apr 2024 10:57:40 +0000
Date: Fri, 12 Apr 2024 18:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 22/46] lib/spdm/req-sysfs.c:176:55: warning:
 omitting the parameter name in a function definition is a C2x extension
Message-ID: <202404121811.DTbeyf2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   04f0af4bcc5b52f17682de7c27eb469f6f794197
commit: f94b1e338bc3a4fc1bdc262899734d0699b9a747 [22/46] PCI/CMA: Expose in sysfs a log of received signatures
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240412/202404121811.DTbeyf2a-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121811.DTbeyf2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121811.DTbeyf2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/spdm/req-sysfs.c:176:55: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     176 | static ssize_t spdm_read_combined_prefix(struct file *, struct kobject *,
         |                                                       ^
   lib/spdm/req-sysfs.c:176:73: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     176 | static ssize_t spdm_read_combined_prefix(struct file *, struct kobject *,
         |                                                                         ^
   2 warnings generated.


vim +176 lib/spdm/req-sysfs.c

   175	
 > 176	static ssize_t spdm_read_combined_prefix(struct file *, struct kobject *,
   177						 struct bin_attribute *attr,
   178						 char *buf, loff_t off, size_t count)
   179	{
   180		struct spdm_log_entry *log = attr->private;
   181	
   182		/*
   183		 * SPDM 1.0 and 1.1 do not add a combined prefix to the hash
   184		 * before computing the signature, so return an empty file.
   185		 */
   186		if (log->version <= 0x11)
   187			return 0;
   188	
   189		void *tmp __free(kfree) = kmalloc(SPDM_COMBINED_PREFIX_SZ, GFP_KERNEL);
   190		if (!tmp)
   191			return -ENOMEM;
   192	
   193		spdm_create_combined_prefix(log->version, log->spdm_context.var, tmp);
   194		memcpy(buf, tmp + off, count);
   195		return count;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
