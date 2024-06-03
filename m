Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934B273FC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717398729; cv=none; b=Myn4T8o4mqmignnjm5g3+Rjf44khP/RnNq7FRS31bEHBUcIof6dLsL1P+3iKm595dFprJo2QfvbzSvMr8C9T+9r+dL/iUPNO7B09jHTxlELs/B9SdBeUeBU7r60B/YB9xcCSiMf8YjKdre2cB22XJtzcpUErTv0JV7WluNhgGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717398729; c=relaxed/simple;
	bh=8xKAThtmO+nP6xq3PEuc0y57WRJ6Cm9f0EpCwjswfp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQOJKc1dbgP52+9/GZwbQ72WwFzaYpjRjK7SDv8Bm560+eWGrlG3sdcvxjT6SabI7Vv3Q1mGBxialgNXwKkqjEM6a1Rbk01gQgObdX/Z5HHQeO3J7UYF2/Yh+YmdrkxIU+l4VlsqUJOl88cK2G7KAoY7SGfPM8BbmXo+eFd2n3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY2ABcLb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY2ABcLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717398728; x=1748934728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xKAThtmO+nP6xq3PEuc0y57WRJ6Cm9f0EpCwjswfp8=;
  b=nY2ABcLb2MkaIrU3D3K7bftz0y+O6aftfIon4m/5erUN+rmHH0sMVJUO
   CoCxVCV71FDh+7cMkBbLjfgZMsSRhSEq3KcIFyY8Or/PhDx+q1N/CjhKP
   PTDPZ9ZNCEcKHXDg2os56AjfYzrOwHFCk9ufB56/zpZ8Mb2AvIvbVq1Yo
   kNNG2Or8GFxzlZkSeED4h2nQW6k39g+31++/WAvaw6ZNYydV7V1gvJjw4
   1oYA38Sg6twQPUTt/2TA6yFXdzt/fE6p7bBoBPdxhGlNtxBrFVoZXaGXL
   XiqHnVXpb2LsdVcPC2t8gVt7cGmalj4kk3WCv9luxqQyz1TxxNj7NRGN/
   w==;
X-CSE-ConnectionGUID: lxjeto9wQz2JH1NSK63ScQ==
X-CSE-MsgGUID: 1ULh5hbVTkmb/IKZVfHD7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14038041"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="14038041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:12:07 -0700
X-CSE-ConnectionGUID: uDaaJNoHS5GFG3C+KXFqdg==
X-CSE-MsgGUID: 9lAtVjanQjK94iY/R/ewQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36873456"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2024 00:12:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE1rP-000L8u-1M;
	Mon, 03 Jun 2024 07:12:03 +0000
Date: Mon, 3 Jun 2024 15:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 61/61] fs/bcachefs/error.c:121:3: error:
 a label can only be part of a statement and a declaration is not a statement
Message-ID: <202406031517.ZxReYOVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c39351763cb597c4b0882f00fc043ebcf00e3c62
commit: c39351763cb597c4b0882f00fc043ebcf00e3c62 [61/61] bcachefs: Unlock trans when waiting for user input in fsck
config: x86_64-randconfig-001-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031517.ZxReYOVo-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031517.ZxReYOVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031517.ZxReYOVo-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/error.c: In function 'bch2_fsck_ask_yn':
>> fs/bcachefs/error.c:121:3: error: a label can only be part of a statement and a declaration is not a statement
     121 |   unsigned long t = unlock_long_at
         |   ^~~~~~~~
>> fs/bcachefs/error.c:125:3: error: expected expression before 'int'
     125 |   int r = bch2_stdio_redirect_readline_timeout(stdio, &line, t);
         |   ^~~
>> fs/bcachefs/error.c:126:7: error: 'r' undeclared (first use in this function)
     126 |   if (r == -ETIME) {
         |       ^
   fs/bcachefs/error.c:126:7: note: each undeclared identifier is reported only once for each function it appears in
   fs/bcachefs/error.c:121:17: warning: unused variable 't' [-Wunused-variable]
     121 |   unsigned long t = unlock_long_at
         |                 ^


vim +121 fs/bcachefs/error.c

    99	
   100	#ifdef __KERNEL__
   101	static enum ask_yn bch2_fsck_ask_yn(struct bch_fs *c, struct btree_trans *trans)
   102	{
   103		struct stdio_redirect *stdio = c->stdio;
   104	
   105		if (c->stdio_filter && c->stdio_filter != current)
   106			stdio = NULL;
   107	
   108		if (!stdio)
   109			return YN_NO;
   110	
   111		if (trans)
   112			bch2_trans_unlock(trans);
   113	
   114		unsigned long unlock_long_at = trans ? jiffies + HZ * 2 : 0;
   115		darray_char line = {};
   116		int ret;
   117	
   118		do {
   119			bch2_print(c, " (y,n, or Y,N for all errors of this type) ");
   120	rewait:
 > 121			unsigned long t = unlock_long_at
   122				? max_t(long, unlock_long_at - jiffies, 0)
   123				: MAX_SCHEDULE_TIMEOUT;
   124	
 > 125			int r = bch2_stdio_redirect_readline_timeout(stdio, &line, t);
 > 126			if (r == -ETIME) {
   127				bch2_trans_unlock_long(trans);
   128				unlock_long_at = 0;
   129				goto rewait;
   130			}
   131	
   132			if (r < 0) {
   133				ret = YN_NO;
   134				break;
   135			}
   136	
   137			darray_last(line) = '\0';
   138		} while ((ret = parse_yn_response(line.data)) < 0);
   139	
   140		darray_exit(&line);
   141		return ret;
   142	}
   143	#else
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
