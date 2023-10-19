Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990738C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7Blb/TJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697677481; x=1729213481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6D17xD20qVz7TuhP7QTPURn0gJ9gWhdd39tmiAP+AJk=;
  b=J7Blb/TJ+ZL5GJXXm7I+W6t9xT3fPK9t3sV4z/CpFFm/rWG0mnt/AewQ
   ScC9sa21OaiqP9Tz138kvDLA0wHyCgnqoVtEYsGur3l+c7j/iAnID5EJw
   Hu74Q5yys5+oI5g2HRRhgMe7VP4q9/MclBAOvK1FYIKXdEx/G1qJ9rp3P
   Xl0rsF/l+hrodLxfjPeWOU3YgdlM6HvufPnyJ58wSb0OmiY5gdRhMarmf
   hAOws4BMmt56IVMC4zv1TR9wdtXQAD8O8hV2qoiw6EoT5Cg91YVlmT6rU
   8PYpDmj49gz5f8SezhG5AM5Gkz8Ys45BeFL+G1jb9Q9N9r4GJLOjaXgyl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417257819"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="417257819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 18:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791818880"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="791818880"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 18:04:38 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtHSl-0001MW-1w;
	Thu, 19 Oct 2023 01:04:35 +0000
Date: Thu, 19 Oct 2023 09:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com, rajvi.jingar@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V4 03/17] platform/x86/intel/vsec: Use cleanup.h
Message-ID: <202310190857.Vc2mlWmN-lkp@intel.com>
References: <20231018231624.1044633-4-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018231624.1044633-4-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f720b21ec5af466e50e99dc517af267b67d248c]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Move-structures-to-header/20231019-071914
base:   3f720b21ec5af466e50e99dc517af267b67d248c
patch link:    https://lore.kernel.org/r/20231018231624.1044633-4-david.e.box%40linux.intel.com
patch subject: [PATCH V4 03/17] platform/x86/intel/vsec: Use cleanup.h
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190857.Vc2mlWmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190857.Vc2mlWmN-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#32: FILE: drivers/platform/x86/intel/vsec.c:151:
+	struct intel_vsec_device __free(kfree) *intel_vsec_dev = NULL;
 	                                       ^

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#33: FILE: drivers/platform/x86/intel/vsec.c:152:
+	struct resource __free(kfree) *res = NULL;
 	                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
