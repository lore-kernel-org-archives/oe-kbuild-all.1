Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698CFEEAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710109875; cv=none; b=mieEAOJKVuHrt7tjs2Mwl0gYlh70hGsvEn99v0qqp3b90J+vOkaKPt/j7SgLY7mJ9pwElIIpeV/2ws0cu7G9cc+SdekuaTihaPSd5Q3rF4tX2V+mckegmQOnQw9y9SC9NPWPI1TOvV1Lk7E/P6xNm3Osx0NyUZHV02mq+M8hDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710109875; c=relaxed/simple;
	bh=gdpqvawXuwuog7fZ4GDWfWKeSQJ6Mo+v8eTPshaDLCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOFAv69SDb/6uXK/dQxZn1DvQFrHMtEmjjHaVnI7Op6c55lY1LJkoSfZ7g7XIOstCjW75RDgBeLwcA2o6XIrM53gyhXYwqVo+h+RavBij0anw6J68wBiuESh/O6DEmgr1KiSd6NcxwBQn6NntLP43RGHC16anByYOIynaBdVz1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsX/b7Pp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsX/b7Pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710109873; x=1741645873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdpqvawXuwuog7fZ4GDWfWKeSQJ6Mo+v8eTPshaDLCM=;
  b=dsX/b7PpYUe+xt6PQPNzfNUUV67CJjUO/YaR7+IR0CdK75lUv589vlzm
   0ir/lf2vnha133diBte7M30uWjUhLkc4u32PKt0bklnZcQyL9zuv7UUvk
   HWjBnPKCymHdA/PlMCWlXI2KNgkckbERGqk1zBNfwiV7H69oOxX4+htst
   N60WK6lMUBo8gOOZ5P6ml8tA7IXi6072ocyU3ET09bQUICJ4cTrfJ3hRt
   Cp7nA/1JZa3Iug4Jdw1iU6DHnfQOPILlbcq6vf2fj/LUDCJp4/oWGdQo1
   QY6mId0+PTXM3EOnO4D/eTEnCGwkc+Mp1jYgI3vnQI/G5IA6RD/EXAlZv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8514498"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8514498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 15:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="41970154"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Mar 2024 15:31:11 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjRhE-0008fF-0D;
	Sun, 10 Mar 2024 22:31:08 +0000
Date: Mon, 11 Mar 2024 06:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [kees:for-next/hardening 28/42] include/linux/refcount.h:141:1:
 warning: 'no_sanitize' attribute directive ignored
Message-ID: <202403110643.27JXEVCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   6c069c8d3cfc30c5a399166b6ce63aa42a7d1dac
commit: e697572c09d21678e2e8cc1256af165106fccb7f [28/42] refcount: Annotated intentional signed integer wrap-around
config: um-randconfig-r053-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110643.27JXEVCI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110643.27JXEVCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110643.27JXEVCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/crypto.h:16:0,
                    from arch/x86/um/shared/sysdep/kernel-offsets.h:5,
                    from arch/um/kernel/asm-offsets.c:1:
>> include/linux/refcount.h:141:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:183:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:263:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
--
   In file included from include/linux/kref.h:17:0,
                    from include/linux/mm_types.h:8,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/clk/clkdev.c:9:
>> include/linux/refcount.h:141:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:183:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:263:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:3: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
      ^~~~~~~~~~
--
   In file included from include/linux/crypto.h:16:0,
                    from arch/x86/um/shared/sysdep/kernel-offsets.h:5,
                    from arch/um/kernel/asm-offsets.c:1:
>> include/linux/refcount.h:141:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:183:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:263:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
--
   In file included from include/linux/crypto.h:16:0,
                    from arch/x86/um/shared/sysdep/kernel-offsets.h:5,
                    from arch/um/kernel/asm-offsets.c:1:
>> include/linux/refcount.h:141:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:183:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   include/linux/refcount.h:263:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^


vim +/no_sanitize +141 include/linux/refcount.h

fb041bb7c0a918 Will Deacon    2019-11-21  138  
e697572c09d216 Kees Cook      2024-02-20  139  static inline __must_check __signed_wrap
e697572c09d216 Kees Cook      2024-02-20  140  bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
77e9971c79c295 Will Deacon    2019-11-21 @141  {
dcb786493f3e48 Will Deacon    2019-11-21  142  	int old = refcount_read(r);
afed7bcf9487bb Mark Rutland   2018-07-11  143  
77e9971c79c295 Will Deacon    2019-11-21  144  	do {
dcb786493f3e48 Will Deacon    2019-11-21  145  		if (!old)
dcb786493f3e48 Will Deacon    2019-11-21  146  			break;
dcb786493f3e48 Will Deacon    2019-11-21  147  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
f405df5de3170c Peter Zijlstra 2016-11-14  148  
a435b9a1435658 Peter Zijlstra 2020-07-29  149  	if (oldp)
a435b9a1435658 Peter Zijlstra 2020-07-29  150  		*oldp = old;
a435b9a1435658 Peter Zijlstra 2020-07-29  151  
1eb085d94256aa Will Deacon    2019-11-21  152  	if (unlikely(old < 0 || old + i < 0))
1eb085d94256aa Will Deacon    2019-11-21  153  		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
77e9971c79c295 Will Deacon    2019-11-21  154  
dcb786493f3e48 Will Deacon    2019-11-21  155  	return old;
77e9971c79c295 Will Deacon    2019-11-21  156  }
77e9971c79c295 Will Deacon    2019-11-21  157  

:::::: The code at line 141 was first introduced by commit
:::::: 77e9971c79c29542ab7dd4140f9343bf2ff36158 locking/refcount: Move the bulk of the REFCOUNT_FULL implementation into the <linux/refcount.h> header

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
