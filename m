Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBB200CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724902485; cv=none; b=LCwaoZweaDs1K4F+a+WGSD0rPne5+9w8wg7Eq87vmfg39MvEvPJVjFOmja9s6BUt3/xTsl4F+hvi4sWwTxP15kPvApsLf3z9tclrY++9bJuL4i/kkIXAdLxcPY+1iwTJm0lgxHB20WBNEsqrB9MNb/rpEAFqYLigZ2tbVat5zww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724902485; c=relaxed/simple;
	bh=pkT+3f/uI+mzbwgmTVvJXm0kw3fpxX14MU5I5PHZcDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0MIdohWBjioMrBISKrhz8E8dl6Xb+meToBRU77a2SJXDRdiVYdKLuvbtYjVVygC2vvjSkO5AMUcmkErocp1iihErlkME9qi/uRKdV9Oqq0HfMRPJrjEpIBNafNzoLq80+67lzMEdMlaIXMRZDkxJRCp8AlwWun2XjVo/8ZADVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/i17I9j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/i17I9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724902483; x=1756438483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pkT+3f/uI+mzbwgmTVvJXm0kw3fpxX14MU5I5PHZcDk=;
  b=J/i17I9jFfVJJoPxFX26CR2hbPYu1NY83Mt2tlK5Ohyfg7BlihR77im1
   eWuB/5V1nuhyYyzKZEWrM7pbXKIBQWt7If6IgIZ0wzZ46tE3TihbCdj5s
   zPgv7XGsGL+iKeT94jQvdpE8XajCqf6tT6g4hidmxXsy2lA3eIWX00zCZ
   0XSjn2wtwh9XLGlSWAbcwvk+RoAue0z8uP6i1hDIJ8VIHsMEFHsXUfSBK
   n+U8MpdEyfwJRvDqrjjYvXRzrfoKMqrnPFsNTpWMDHNwu4UNIpoQRjZNP
   YB7KMT4N+rON21QDI2tLtbpTOQ1xlDKpgfyJ4gJEtkTLKdYucl5WPAy23
   w==;
X-CSE-ConnectionGUID: 6VaUU/4eQRuAQ1A3/UqkJQ==
X-CSE-MsgGUID: bN2JE3lUTSeH+/q7UYdSOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23427156"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23427156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 20:34:42 -0700
X-CSE-ConnectionGUID: H+WZb8fQTeaefh2I0ia48Q==
X-CSE-MsgGUID: zVx27wPTSgGzOb5vITJ4DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63427957"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Aug 2024 20:34:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjVvj-000Lck-1i;
	Thu, 29 Aug 2024 03:34:39 +0000
Date: Thu, 29 Aug 2024 11:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] kconfig: add optional selective yaml output support
Message-ID: <202408291147.Rrzo0NB6-lkp@intel.com>
References: <20240823034455.3593819-1-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034455.3593819-1-mcgrof@kernel.org>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/kbuild]
[also build test WARNING on linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Chamberlain/kconfig-add-optional-selective-yaml-output-support/20240826-123912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
patch link:    https://lore.kernel.org/r/20240823034455.3593819-1-mcgrof%40kernel.org
patch subject: [RFC] kconfig: add optional selective yaml output support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240829/202408291147.Rrzo0NB6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291147.Rrzo0NB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291147.Rrzo0NB6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/kconfig/confdata.c: In function 'conf_value_to_yaml':
>> scripts/kconfig/confdata.c:672:13: warning: implicit declaration of function 'asprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     672 |             asprintf(&yaml_value, "0x%s", val);
         |             ^~~~~~~~
         |             vsprintf


vim +672 scripts/kconfig/confdata.c

   662	
   663	static char *conf_value_to_yaml(struct symbol *sym, const char *val)
   664	{
   665		char *yaml_value = NULL;
   666	
   667		switch (sym->type) {
   668		case S_INT:
   669			yaml_value = strdup(val);
   670			break;
   671		case S_HEX:
 > 672	            asprintf(&yaml_value, "0x%s", val);
   673	            break;
   674	        case S_STRING:
   675		    /* Wrap strings in quotes */
   676	            asprintf(&yaml_value, "\"%s\"", val);
   677	            break;
   678	        case S_BOOLEAN:
   679	        case S_TRISTATE:
   680			if (strcmp(val, "y") == 0)
   681				yaml_value = strdup("True");
   682			else if (strcmp(val, "n") == 0)
   683				yaml_value = strdup("False");
   684			else
   685				yaml_value = strdup(val); /* m in tristate */
   686			break;
   687	        default:
   688			/* In case type is unknown */
   689			yaml_value = strdup(val);
   690			break;
   691		}
   692	
   693		return yaml_value;
   694	}
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
