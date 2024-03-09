Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A161E4AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710020205; cv=none; b=omX5rSu7Rmm/BF+MPezJlX3aHxfpwjLX66qUVj1W+HTgUL5tYX5VBkTKaD8QEDnpDCeBd/rKU2he2GsBsKAPGRFUpGr36Jy0qUNFs7Fy9Yf3gLdK9FH2Vk9bd2m/jRMuIEXbRBtf3JEEmXep4Tf2+AqGU75ibEpvw0bJeK2m/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710020205; c=relaxed/simple;
	bh=0kOK/CKTijK+m5kE27GYk11V+X80gz1b8D9qNMvpKGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cuuBONAOHCFOH7MglxSDgBw7gGlEwSoqqMY5lXOy5/iyxT+Gy42G7bUkk3lu17JG8J8Df0TI8WWOoF201MwKarSD6PEbgsW+5F6fwb9J5LaASEvIUyg3GSmBaxFNozxoisf+BsI6AjeqC4JnOjyb2pH2fCtjEU84CU5PWpKk+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjMvr2Uv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjMvr2Uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710020202; x=1741556202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kOK/CKTijK+m5kE27GYk11V+X80gz1b8D9qNMvpKGg=;
  b=bjMvr2UvVUjEz3as5UcWoeBu+1UiXwx9tBvlPqn1bwMmQzmP8oKJbqss
   Pj2LbTNa/o87zeQOMMl/Dj/axPC0APIUnoCZ6KN5YmC+EXXU0EWM9kB26
   s5Qab6K0LGYVk4wCLEeOEamh+VpP6/Ozjklq4uvDOrvF+LwJq+Xe/cMxG
   fnGmNy2C9Rv8qUBybCWQeAJGjPeHw06tiF8mbtGUipE2rzdlFHKVbGcjl
   PvMDaV1KxOVWxnid8YxP07YHfRxN8gXNjucycVtg1ULR1AZzAYHW44UvB
   h7yGo0zloB8coF6Jc5eRRkzcRU2Rkt1Uwr3hZow++WBdZ4eYy7UYKdMeF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8541360"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8541360"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 13:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="11220311"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Mar 2024 13:36:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj4Mw-0007fb-1i;
	Sat, 09 Mar 2024 21:36:38 +0000
Date: Sun, 10 Mar 2024 05:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/21] sparc64-linux-ld:
 page-writeback.c:undefined reference to `__tracepoint_netfs_folio'
Message-ID: <202403100546.LuL58Zf4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   4b19245d19affeb7108cfd195f1523e575ca62ce
commit: 4b19245d19affeb7108cfd195f1523e575ca62ce [21/21] netfs: Use writeback_iter() and improve the writeback algorithm
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240310/202403100546.LuL58Zf4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100546.LuL58Zf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100546.LuL58Zf4-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: mm/page-writeback.o: in function `writeback_get_folio':
   page-writeback.c:(.text+0x1d78): undefined reference to `__tracepoint_netfs_folio'
>> sparc64-linux-ld: page-writeback.c:(.text+0x1d98): undefined reference to `__tracepoint_netfs_folio'
   sparc64-linux-ld: page-writeback.c:(.text+0x1f1c): undefined reference to `__tracepoint_netfs_folio'
>> sparc64-linux-ld: page-writeback.c:(.text+0x1f7c): undefined reference to `__traceiter_netfs_folio'
   sparc64-linux-ld: page-writeback.c:(.text+0x2008): undefined reference to `__traceiter_netfs_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
