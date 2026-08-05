Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB533A4F50
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 01:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895079; cv=none; b=XzAnLgTKzf+uhXXPbQBhvK0qE50/SGWCB50H2k66sxfRU8xAyq6xCIxDo0jE7mZ7+6FJa8CTA0CNDTcbYWY7SGWGwBM6VxR0YtvxRQ0BtAHaLflj3bCkHSr2Y3/WQTFLWSrn1C49JYJO2JgTLiHhw0No5Ct6BXfL6oAlD8J3GzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895079; c=relaxed/simple;
	bh=j9ybfLOPOjxQzF5jNSLc4mrl5v0GLm6W0DPw12uoTKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWCQdxfdCyaqlX6X6sr4Tv2nCqwqqu04PwKFJYMGAsHZRpW1hEYumGUCugd+9qyhF04CPEGn1dEldpflRIQzmQCaZ4riwR9AR5Hb4quxhepAr35z1dkKHJ3+twMJsMkU6C/3HTT0ewzDiAK5TUeWz2ATgsamkVneqjx9yg/5azc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ad7PiNV9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ad7PiNV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785895077; x=1817431077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j9ybfLOPOjxQzF5jNSLc4mrl5v0GLm6W0DPw12uoTKY=;
  b=Ad7PiNV9Omt+bjbX71d3awj5e6HuWfmgVkWxrX4jb8gncLcABnI5K6Yd
   SidVhOnaxa3wJSJIRsF1heThTH0ITaJgcS6T1B8m0fzq2kUqHwIEkvZG6
   8IOLD8xrtyI0IDO4ojjMaROWwT30BhKTBbeRCQ8U/PswitZQOnIpcl2Db
   IgKEl7RUVG/6Fotp/DeGO7/sEJ6aLCJC3H2PHjS4+iyFjG8aA+rHMqoAF
   1WDzu4hldYT3DXEe64FKBHu6yvSm9MOQoQj+XB19rQBSE6DxEsmbgGwPV
   OYg5tFgALMJn4sMSjdg4OlCF6fk7Qozk9BwULU84A6uHegoe2VDphHYyQ
   A==;
X-CSE-ConnectionGUID: QIgzkfSsSJ62jljLDa/kDw==
X-CSE-MsgGUID: m1zY5BTDSCyRvzAdhgFexw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90270693"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90270693"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:57:56 -0700
X-CSE-ConnectionGUID: Fr+/kWgkSIe5or2lU0lgHg==
X-CSE-MsgGUID: dG+JRv0IREKwHHGiYixSDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="259899187"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Aug 2026 18:57:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrQtD-00000000BDp-0KZ2;
	Wed, 05 Aug 2026 01:57:51 +0000
Date: Wed, 5 Aug 2026 09:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jiangshan Yi <yijiangshan@kylinos.cn>, kees@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	13667453960@163.com, Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: Re: [PATCH] lkdtm/core: fix resource leaks on module init error path
Message-ID: <202608050915.CRrKhB4T-lkp@intel.com>
References: <20260701151438.3772375-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701151438.3772375-1-yijiangshan@kylinos.cn>

Hi Jiangshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiangshan-Yi/lkdtm-core-fix-resource-leaks-on-module-init-error-path/20260804-225548
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260701151438.3772375-1-yijiangshan%40kylinos.cn
patch subject: [PATCH] lkdtm/core: fix resource leaks on module init error path
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050915.CRrKhB4T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050915.CRrKhB4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050915.CRrKhB4T-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/misc/lkdtm/lkdtm: section mismatch in reference: lkdtm_module_init+0x221 (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
>> WARNING: modpost: drivers/misc/lkdtm/lkdtm: section mismatch in reference: lkdtm_module_init+0x226 (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
