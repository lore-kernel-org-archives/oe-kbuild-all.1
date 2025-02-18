Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F497E0E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739847308; cv=none; b=ij8r0Iun7sKD3z01+cMotjyjMuyo+JSApCl54it8hPiMb+UoOx3+ijX5mS7hRpfk/dsuBRD6+ooGw6+pl3/OPJy0gJYFNADw9o512xLcnZs4xtRI40OOPWEW4PD93WvDU+3sy9N4Y0+hgMV/K9iTVzxTW77wxi/v7YASgedk7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739847308; c=relaxed/simple;
	bh=51wf1vQcwtYGqAkOb9ELsKdcga09UkRW47uDzzWrt8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgewiTESe3Pj51gmhreqc4fqD1wiGw+3a+T8h0TT1WNNhKOqlQTMxg5q9pPFQvBEEzopi22+JI57FTLgL8rfoGZnTB3P1vyOhr7zhVJSR59oRJAMX9Mzhj5FIs/LaoYN8+PXk7JFHFYL9yn4GdfFNqQxXIQ+0PigUC2KXeV7Ht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvmG8rZc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvmG8rZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739847307; x=1771383307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=51wf1vQcwtYGqAkOb9ELsKdcga09UkRW47uDzzWrt8s=;
  b=DvmG8rZceT/9UpEOdlJZ79vY7XMyIjIJ+/aIAyEvZta1I4hMBu2yGAzI
   AEoBBenTRa78wXLMJZAe8GwifegBdhwaE+uqKETQ/nKk/s/V6Edxz8qZd
   yz1EqN0HnPcpsLxrltBf4pLl4AL9RDqMVAT1FOTtYyxN8Vp2cASAayaVf
   BWfc43VK+jGDUOx2aIG+91XvuyH5SHNL6qoPezBGNrPdIjsf/clV643TU
   D0qHfJ61tevA1v6uVh/XtAg30XhvYRuvPjVuj1fKoYTsKPbB/vACrdWCZ
   BPjn91c3O4XoDXe5d3IYYesao7j4CGU/qNGqdAPyD0Dy6EmLmRz6lZO7u
   Q==;
X-CSE-ConnectionGUID: V2fJJ4pXQjKV8jHTzFpC6g==
X-CSE-MsgGUID: x0vr/YQYSrmrWyPjRt7Hww==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51960526"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51960526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 18:55:06 -0800
X-CSE-ConnectionGUID: nic+9FyRQJak/sQvANB4sw==
X-CSE-MsgGUID: h/r+3JEXRk6sA9LGeDoOVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151459567"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 18:55:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkDlG-00005v-2n;
	Tue, 18 Feb 2025 02:55:02 +0000
Date: Tue, 18 Feb 2025 10:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 05/10] pstore: implement core area registration
Message-ID: <202502181022.PsKoqf9f-lkp@intel.com>
References: <20250217101706.2104498-6-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217101706.2104498-6-eugen.hristev@linaro.org>

Hi Eugen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.14-rc3 next-20250217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/pstore-zone-move-pstore_device_info-into-zone-header/20250217-182615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20250217101706.2104498-6-eugen.hristev%40linaro.org
patch subject: [RFC][PATCH 05/10] pstore: implement core area registration
config: i386-buildonly-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181022.PsKoqf9f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181022.PsKoqf9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181022.PsKoqf9f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/pstore/platform.c: In function 'pstore_unregister_core_area':
>> fs/pstore/platform.c:316:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     316 |         int ret;
         |             ^~~
--
>> fs/pstore/zone.c:40: warning: Function parameter or struct member 'data_ptr' not described in 'psz_buffer'
   fs/pstore/zone.c:142: warning: Function parameter or struct member 'dmszs' not described in 'psz_context'
   fs/pstore/zone.c:142: warning: Function parameter or struct member 'dmapped_max_cnt' not described in 'psz_context'


vim +/ret +316 fs/pstore/platform.c

   312	
   313	int pstore_unregister_core_area(const char *handle, void *area, size_t size)
   314	{
   315		struct rec_list_t *rec_element, *tmp;
 > 316		int ret;
   317	
   318		if (!psinfo || !psinfo->unregister_dmr)
   319			return -EAGAIN;
   320	
   321		mutex_lock(&ps_dmr_lock);
   322		list_for_each_entry_safe(rec_element, tmp, &rec_list, list) {
   323			struct pstore_record *record;
   324	
   325			record = &rec_element->rec;
   326	
   327			if (record->buf == area) {
   328				ret = psinfo->unregister_dmr(record);
   329				list_del(&rec_element->list);
   330				mutex_unlock(&ps_dmr_lock);
   331				return 0;
   332			}
   333		}
   334	
   335		mutex_unlock(&ps_dmr_lock);
   336		return 0;
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
