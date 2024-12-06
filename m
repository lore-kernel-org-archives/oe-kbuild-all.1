Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBCC57CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 01:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733447787; cv=none; b=DA48VEglbR0gRxVliy7RojpCvwuRrrBf3hOmfktXoRnjrtd/GIZ918mSOQwwgtjXiBOG3UfzJ1sjpXbnusDlC+6U6fqF3dYelyxb5qqgnQt3Qp11NtQxzdiPRRx9zEfFKkjuAsb7ZIwMUvHaiEZOU9kHpqeWFyqskCe2x6ce/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733447787; c=relaxed/simple;
	bh=sLR8E+lmh4dy/7O2FoXSwBx3oEHxExmHd+6niT9p1MM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHDHKZMCRP3zukUwECIKkgo9q8zH0i3zdmLwGL1wQUdE8rfAMJgPYpN5ueENe+ZjVj4e0RqTJmrA7aoyH84nNNUdQw7G5GTlZOlAYCWsUlwaqXQstYms70jzLFbqKSXnKG+gSahEA/BNr3LEz+ILP3X0aLdeB330UwsuDyX7jQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUaulWG+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUaulWG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733447785; x=1764983785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLR8E+lmh4dy/7O2FoXSwBx3oEHxExmHd+6niT9p1MM=;
  b=VUaulWG+8qjAh1hjb5nTc3VMfDJPShoTeReYpHqiFFmBWao7CAWuN4cU
   9QhzLctqBBmkLvXf4TsETo1rhk+YDYZxtRfQO5l3wL0adEmm39RPpn3Lb
   aIXZkEk3AESu21Mv2myfOgF+CXlysKEeoluc1QZby1v1NfYXfx9hXH5ul
   0BzsN6JjsYmAYrHLqWI+VjY9T/i4hl/cKvKVuHOxMCxJYwqMFwNNYXERl
   Ww5kkd+pV3C/+n8LH1RhHfI8Ugv6vrBHTEmnMSVgj2pj7VPlQaWZEev2x
   FWPauL4Xc8VsO1SW2ngg/lDB6pnMlIdgAGzNlWrK48daoGfSqNp5EYGdG
   Q==;
X-CSE-ConnectionGUID: b1hMCJipQXWblUQNOdL8ew==
X-CSE-MsgGUID: QIlrlQIKQI+40UZeyNyyzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="21382889"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="21382889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 17:16:24 -0800
X-CSE-ConnectionGUID: 4m10QJvfRg+HTh+OSaI0NQ==
X-CSE-MsgGUID: 9nqBoSMZR+W+iHQh5YKewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94076029"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 17:16:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJMxA-0000ZL-2L;
	Fri, 06 Dec 2024 01:16:20 +0000
Date: Fri, 6 Dec 2024 09:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/reflink.c:37:5-8: Unneeded variable: "ret". Return "0"
 on line 44
Message-ID: <202412060918.rLfiJdqQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: 074cbcdaeee433a02d6d0565b936bee0915cc5da bcachefs: fsck_err()s don't need to manually check c->sb.version anymore
date:   11 months ago
config: arm64-randconfig-r062-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060918.rLfiJdqQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060918.rLfiJdqQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/reflink.c:37:5-8: Unneeded variable: "ret". Return "0" on line 44

vim +37 fs/bcachefs/reflink.c

    31	
    32	int bch2_reflink_p_invalid(struct bch_fs *c, struct bkey_s_c k,
    33				   enum bkey_invalid_flags flags,
    34				   struct printbuf *err)
    35	{
    36		struct bkey_s_c_reflink_p p = bkey_s_c_to_reflink_p(k);
  > 37		int ret = 0;
    38	
    39		bkey_fsck_err_on(le64_to_cpu(p.v->idx) < le32_to_cpu(p.v->front_pad),
    40				 c, err, reflink_p_front_pad_bad,
    41				 "idx < front_pad (%llu < %u)",
    42				 le64_to_cpu(p.v->idx), le32_to_cpu(p.v->front_pad));
    43	fsck_err:
  > 44		return ret;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
