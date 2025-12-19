Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4B35950
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766129947; cv=none; b=foA/wBBHbUPm3bOdCgX2YmiQaKh1vxXF5HUcDylv0a3dt8LTMKgdkE3gGfO3sUq0BWP2W5Ud4ouG/ogm0v7pWFEHP7DBTNV/KGqLEhJSpwMvMg9yDNTTFyXPZzrqJsir2M8HQMZgAS6u42uWEIt4A8lPEmqGZaFZEzWYLy57GC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766129947; c=relaxed/simple;
	bh=k5w/Nmm9zUX2n8cP3miHrRQed0CxQtILb7u7PsbGz3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4vYOTLbErWoAjG8DriZcTWnzSgANMdwBs2+eSK/IRvVa3LRywa22ZRfkeYB9QVpjkR1AnG5qR7elfsdwcXSdlmWE2ikFpLxDuY+uD/67WtSPESz2oyT+URwqaYi/TuReTrzM6xN9whPWJHib0In48oNID/j1769GBoaYZdFUV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKdde8ej; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKdde8ej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766129945; x=1797665945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5w/Nmm9zUX2n8cP3miHrRQed0CxQtILb7u7PsbGz3I=;
  b=EKdde8ejtHZ41b/jq/peCGWAnYOaqUwjJXAalPzce9WOhBlWw7hLwl89
   4yIg/We4Szz+KPrvJ074TUy1orYxkytLAS4Wd7baSENMpHn2e9mWI+U88
   rMXSNwvj2OAQsFIB/uGItpTNiSLpm7KiyPE5Chu1qnvDyeWMnuU+xx9zA
   wUM8L7mNX5oWAQFn9haF7cjqG0/Z77I4VYVKk5ykbOeITWU7bbpqSCQdr
   Xk/hVGRl+ctJ4fw3X7aktNe0c2hj0fUNmz7u9ZYs4BB/cHD8fqBZc43W6
   Xc94JAexkKBJoyJXE1eEslMTdq+VQL5YBGw2PG5U2gNmstZRskwUiu0ez
   Q==;
X-CSE-ConnectionGUID: fLrXuv4RQLOgF8NM4lo+5g==
X-CSE-MsgGUID: l+PpmTI+SwWOGsWe67IPjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67983761"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67983761"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 23:39:04 -0800
X-CSE-ConnectionGUID: p9M1mMRxRgilzUaeKkZKwA==
X-CSE-MsgGUID: 3ngMkR7nQ8SPUCn8YUYxQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203186696"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 23:39:02 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWV4l-000000003Dp-45gE;
	Fri, 19 Dec 2025 07:38:59 +0000
Date: Fri, 19 Dec 2025 15:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/4]
 drivers/crypto/ccp/hygon/ccp-mdev.c:1151:15: warning: no previous prototype
 for 'ccp_pin_memory'
Message-ID: <202512191516.bhvnkwTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a2dd3d028a03896d70974c70f36eebc729c1d69f
commit: 12a5b4fb5dc94317ff37f389fd2965cc7f7cafe4 [0/4] anolis: crypto: ccp: add ccp-mdev functionality to the ccp module.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191516.bhvnkwTG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191516.bhvnkwTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191516.bhvnkwTG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/ccp-mdev.c:1151:15: warning: no previous prototype for 'ccp_pin_memory' [-Wmissing-prototypes]
    1151 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~


vim +/ccp_pin_memory +1151 drivers/crypto/ccp/hygon/ccp-mdev.c

  1150	
> 1151	struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
  1152				unsigned long ulen, unsigned long *n)
  1153	{
  1154		struct page **pages;
  1155		unsigned long npages, size;
  1156		unsigned long first, last;
  1157		int npinned;
  1158	
  1159		if (ulen == 0 || uaddr + ulen < uaddr)
  1160			return NULL;
  1161	
  1162		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1163		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1164		npages = (last - first + 1);
  1165	
  1166		if (WARN_ON_ONCE(npages > INT_MAX))
  1167			return NULL;
  1168	
  1169		size = npages * sizeof(struct page *);
  1170		if (size > PAGE_SIZE)
  1171			pages = vmalloc(size);
  1172		else
  1173			pages = kmalloc(size, GFP_KERNEL);
  1174	
  1175		if (!pages)
  1176			return NULL;
  1177	
  1178		/* Pin the user virtual address. */
  1179		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1180		if (npinned != npages)
  1181			goto err;
  1182	
  1183		*n = npages;
  1184		return pages;
  1185	
  1186	err:
  1187		if (npinned > 0)
  1188			unpin_user_pages(pages, npinned);
  1189		kvfree(pages);
  1190		return NULL;
  1191	}
  1192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
