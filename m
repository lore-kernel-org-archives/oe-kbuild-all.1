Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954322E11B8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774790182; cv=none; b=MxUbkQiomCYzH0dUoSLtRr8RSo5QtJzmLNWy6RZpABpG46SMT7aOvnXGlqszJCNxV1W4281qiJgymP2QjC7zCy48yoVXGb8vDEJh3gHP+N13dMHHaYbQZOEzXWBcLRwxJniBr9SNkCpTdNO5xkjR/EIWF0fFaZNRbW7DyBwhrAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774790182; c=relaxed/simple;
	bh=ElTp1yZ1rm3TMc9/7lKWViuVgYea9Z7q6TD/55iwt7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxCbjfmI2YP+wlViCdRGSF14dGPXoakxSAIuBR0lStlmt85Fclcj8PUGIpQEEylgDcbiw/k2SS6pxEc513rK1nPpD3ibRYV1/1Fz+ypyOjRA+kVR3Vq//Qb9UtEO7Ng2OTW3SYkc69NU9eGYFk07pTCc7XsIM+ionddZcIWS5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyC4c1ZA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyC4c1ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774790180; x=1806326180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ElTp1yZ1rm3TMc9/7lKWViuVgYea9Z7q6TD/55iwt7E=;
  b=IyC4c1ZAo1CztzhLLZpnGTTIgKfVFJelGr9grylXsOlxN+jjgVlEauEl
   rBZjGkZVHJ3u2Mv1ttB3y7VqN+1PkOylmXKEMnnj0ewUc5D2LcYdNh87K
   cGm+QEaKbDYXZeeUZDCPu0wv0cPBuVfqMUF4NwnpQCAWyvFApIRLWJqWC
   xRj9Q3x41JAV4YrCeUNvdocci+mgw6wz4qj8mgo0fy3cY5rSNdqwagp+n
   B5paNatWn3QHy+uPgAB/fIzkNIWvgjgtKzL2SZHzbbnWTeZFQgn6iT8CX
   No6FOAOlgSZggCwHTMLFIRaB+P6Th+QFsf/UCOGVMkHLocd84InfvCjr6
   A==;
X-CSE-ConnectionGUID: m44C8SjPTgiA99m2IdTthA==
X-CSE-MsgGUID: nKSvZ/7sSIK3raZbS+9Okg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93183228"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="93183228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 06:16:19 -0700
X-CSE-ConnectionGUID: P+jH1pgIQKq8Nf/RjdIIBA==
X-CSE-MsgGUID: cxcBb/vrSe2fJXMuNz6y1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="221394069"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 06:16:18 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6pzz-00000000CNZ-3Uap;
	Sun, 29 Mar 2026 13:16:15 +0000
Date: Sun, 29 Mar 2026 21:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 05/11] landlock: Enforce namespace entry
 restrictions
Message-ID: <202603292125.BD9fYQyL-lkp@intel.com>
References: <20260312100444.2609563-6-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312100444.2609563-6-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5dfb8077be2bbe2c3b9477da759e80fa9f98da42]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/security-add-LSM-blob-and-hooks-for-namespaces/20260314-205540
base:   5dfb8077be2bbe2c3b9477da759e80fa9f98da42
patch link:    https://lore.kernel.org/r/20260312100444.2609563-6-mic%40digikod.net
patch subject: [RFC PATCH v1 05/11] landlock: Enforce namespace entry restrictions
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260329/202603292125.BD9fYQyL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603292125.BD9fYQyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603292125.BD9fYQyL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from security/landlock/setup.c:9:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct perm_rules) == sizeof(u64)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   security/landlock/access.h:86:1: note: in expansion of macro 'static_assert'
      86 | static_assert(sizeof(struct perm_rules) == sizeof(u64));
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c4 Ian Abbott       2017-07-10  60  
6bab69c65013bed Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013bed Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013bed Rasmus Villemoes 2019-03-07  63   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013bed Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013bed Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013bed Rasmus Villemoes 2019-03-07  67   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013bed Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013bed Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013bed Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013bed Rasmus Villemoes 2019-03-07  72   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013bed Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013bed Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013bed Rasmus Villemoes 2019-03-07  76   */
6bab69c65013bed Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013bed Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013bed Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79d Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
