Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E41FCCE9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293540; cv=none; b=FdoB9TTrw4mTwy876KjF+Ywti66E145DNz/qlqgtOihfxr7lfFt9QhNe4tTNjZ2Y6LYEGsnBnwJXjeQhCWFL0T8Fm83AKdNXie8TJiEZs0YJzRgfJmBiMowKPZFR+R0jpfM7mea/YU5dZ8aYRmRVyp5y2b4xFnNpdhxgd7f6LMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293540; c=relaxed/simple;
	bh=DWNDWKA4I1dybfRunxuhrjCBmx0mAqCgcoRXRegFAKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bU+VuoJGL0hGFr0KSRYGXYFiAUs6dhyffq2F6VnrfVWVFHFjg45SymBcx9as23JuXfxcnv4VWzOLZm4tdhTdwwOIQrUprEHm8BsQ0zNakl4o2AjNu1i3db5aHI8cZNSRFBRVi+2r0NKj/UrD3N600SyCKaUQWhCmHvNaOOW9x7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk5erTB3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk5erTB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739293539; x=1770829539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWNDWKA4I1dybfRunxuhrjCBmx0mAqCgcoRXRegFAKc=;
  b=Zk5erTB3JDMA0ymuRN2OTYagoWdjfogthhiFPX08ECFB+VEFavCk2Qr5
   VAIxnmwfXp9MIuh7ThrgAzIf25N+ebaZXyVLHGePS+G6VQpCUwOXaTi/K
   5rl2TJecne7jHarQSV/fsBHgGtkq414Lptkn6f5HnwlD3uuUmCcJWo1d7
   ebg8Yo6+pgB/XmhkBUHn5RBXVPwlOHfBd6L70bCb/zNYA4xHOpVd7/ld9
   ue9I98fq4XVhOLdA122pUIAiSJ9rhFSd1fI823w49f++UW6VTwfxR73Zj
   m8UmbFa/hKbyN5AfWtkYIKsQaSYYJ8XGbmDBRYqvn/SEYWXkFxoL5fzLr
   g==;
X-CSE-ConnectionGUID: P0EBEpXySv+aVlbZ+yZ8lQ==
X-CSE-MsgGUID: 2sHV+QowQ9mT28XaxSDN9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40048226"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="40048226"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:05:38 -0800
X-CSE-ConnectionGUID: kJzosWA6SgmQBtZc60dGWA==
X-CSE-MsgGUID: sDaKUKaVTbGtD5U9g0hrxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112546839"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2025 09:05:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ththW-0014TZ-0K;
	Tue, 11 Feb 2025 17:05:34 +0000
Date: Wed, 12 Feb 2025 01:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 22/25] security/apparmor/lib.c:93:
 warning: Excess function parameter 'str_size' description in
 'val_mask_to_str'
Message-ID: <202502120008.Ta0MXCyl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   3e45553acb14692519db853e4b5be35b45e46ad0
commit: 04fe43104e4ed103a8b55c21d1bc354fac409421 [22/25] apparmor: Modify mismatched function name
config: i386-buildonly-randconfig-002-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120008.Ta0MXCyl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120008.Ta0MXCyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120008.Ta0MXCyl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/lib.c:93: warning: Function parameter or struct member 'size' not described in 'val_mask_to_str'
   security/apparmor/lib.c:93: warning: Function parameter or struct member 'table' not described in 'val_mask_to_str'
>> security/apparmor/lib.c:93: warning: Excess function parameter 'str_size' description in 'val_mask_to_str'
>> security/apparmor/lib.c:93: warning: Excess function parameter 'chrs' description in 'val_mask_to_str'


vim +93 security/apparmor/lib.c

71e6cff3e0dde6f John Johansen 2022-09-23   83  
71e6cff3e0dde6f John Johansen 2022-09-23   84  /**
04fe43104e4ed10 Jiapeng Chong 2025-01-21   85   * val_mask_to_str - convert a perm mask to its short string
71e6cff3e0dde6f John Johansen 2022-09-23   86   * @str: character buffer to store string in (at least 10 characters)
71e6cff3e0dde6f John Johansen 2022-09-23   87   * @str_size: size of the @str buffer
71e6cff3e0dde6f John Johansen 2022-09-23   88   * @chrs: NUL-terminated character buffer of permission characters
71e6cff3e0dde6f John Johansen 2022-09-23   89   * @mask: permission mask to convert
71e6cff3e0dde6f John Johansen 2022-09-23   90   */
71e6cff3e0dde6f John Johansen 2022-09-23   91  static int val_mask_to_str(char *str, size_t size,
71e6cff3e0dde6f John Johansen 2022-09-23   92  			   const struct val_table_ent *table, u32 mask)
71e6cff3e0dde6f John Johansen 2022-09-23  @93  {
71e6cff3e0dde6f John Johansen 2022-09-23   94  	const struct val_table_ent *ent;
71e6cff3e0dde6f John Johansen 2022-09-23   95  	int total = 0;
71e6cff3e0dde6f John Johansen 2022-09-23   96  
71e6cff3e0dde6f John Johansen 2022-09-23   97  	for (ent = table; ent->str; ent++) {
71e6cff3e0dde6f John Johansen 2022-09-23   98  		if (ent->value && (ent->value & mask) == ent->value) {
71e6cff3e0dde6f John Johansen 2022-09-23   99  			int len = scnprintf(str, size, "%s%s", total ? "," : "",
71e6cff3e0dde6f John Johansen 2022-09-23  100  					    ent->str);
71e6cff3e0dde6f John Johansen 2022-09-23  101  			size -= len;
71e6cff3e0dde6f John Johansen 2022-09-23  102  			str += len;
71e6cff3e0dde6f John Johansen 2022-09-23  103  			total += len;
71e6cff3e0dde6f John Johansen 2022-09-23  104  			mask &= ~ent->value;
71e6cff3e0dde6f John Johansen 2022-09-23  105  		}
71e6cff3e0dde6f John Johansen 2022-09-23  106  	}
71e6cff3e0dde6f John Johansen 2022-09-23  107  
71e6cff3e0dde6f John Johansen 2022-09-23  108  	return total;
71e6cff3e0dde6f John Johansen 2022-09-23  109  }
71e6cff3e0dde6f John Johansen 2022-09-23  110  

:::::: The code at line 93 was first introduced by commit
:::::: 71e6cff3e0dde6f6a3355d6c73ca3e176567995e apparmor: Improve debug print infrastructure

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
