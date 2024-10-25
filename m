Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE7175A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729848357; cv=none; b=E7ZZu0Vugzd484IgyXIAihPwt3OXG86KHiuWyACsl6W17tgX7st4fTSWn3wjy42RsB2Ag3L3QXha0uDSFCWVgl20ZN4O7Xl0olHMEz6ri0l60V9fW0inCa+oTSJrMdWZkMgvDBThLkMVr/kJCPtGnfRzjsLkfAmrnb/TdL2Hf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729848357; c=relaxed/simple;
	bh=zevIMvxwkG/4NSYXVpdr9cizqW/LkoCAuW6zVdC6OkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JEDLCEToDWiIHu5vHeB3FaGjsowpFfcMs9V65iY6IGigUBTf4YQgQV0ZbmGwmkShPkMh4IGJrDyO5Ecv5b7L/odczNDEWl4eIb/wjB5v9PSNhjVHeFwyWItm63mojNsHrjydeHQRV7GP6ndy+JGnkd/9cSKtXOPSQdH+OSvRXeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ll2MCI08; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ll2MCI08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729848355; x=1761384355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zevIMvxwkG/4NSYXVpdr9cizqW/LkoCAuW6zVdC6OkE=;
  b=ll2MCI08yElmtqR5K02LpMp/tDe2n2IjreMAY39Yju8+9oWHA5jcqr2h
   2+LWCuOVbpnHSOv4TzdSa0rGinY6edS70HAayt9tcNpwJlImYGjL401F5
   dohbumvx9TeJAIE5+n0ypbGZy07dUi3Blx3bDTKAZ2hKEUg1ySDt7Jsyo
   i/68ikaw7QN0EYk1dkPK0kj7Jl2NgleCFNgUwWhse2ISzDnAiiN7Nu7v+
   15m5J44qRtUAWh8THRsQTk5bc+rkiWd//E19+ZptWyA+v9vL7HNrBImsz
   csc6xHLrzp3lwWQZNlNXjjqVYG/bikaNmN90DH+ZAaiAJ/egFsWX19tza
   A==;
X-CSE-ConnectionGUID: 2zttH1+uTv64tD2GwK+FUQ==
X-CSE-MsgGUID: TNUCCEukTnm9Ahxny2M0BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40127756"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40127756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:25:55 -0700
X-CSE-ConnectionGUID: AAq1wKhyRGG6Exjn9wv4ug==
X-CSE-MsgGUID: DX9OLNrWRsazBrV9vj/Z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118324764"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2024 02:25:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GZr-000Xys-1p;
	Fri, 25 Oct 2024 09:25:51 +0000
Date: Fri, 25 Oct 2024 17:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5e 74/102] lib/dynamic_debug.c:1773:27: error:
 'struct ddebug_table' has no member named 'num_ddebugs'
Message-ID: <202410251739.UyYA2tQB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5e
head:   95ff6ff44a0206ea02936387ab66f6c39cfd20c7
commit: 02dffe3046c29ba88fdcb6767e037a75ad4aaac9 [74/102] dyndbg: don't close trace instance when in use
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241025/202410251739.UyYA2tQB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251739.UyYA2tQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251739.UyYA2tQB-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_table_free':
>> lib/dynamic_debug.c:1773:27: error: 'struct ddebug_table' has no member named 'num_ddebugs'
    1773 |         for (i = 0; i < dt->num_ddebugs; i++) {
         |                           ^~
>> lib/dynamic_debug.c:1774:40: error: 'struct ddebug_table' has no member named 'ddebugs'
    1774 |                 dst = get_trace_dst(&dt->ddebugs[i]);
         |                                        ^~


vim +1773 lib/dynamic_debug.c

  1768	
  1769	static void ddebug_table_free(struct ddebug_table *dt)
  1770	{
  1771		int dst, i;
  1772	
> 1773		for (i = 0; i < dt->num_ddebugs; i++) {
> 1774			dst = get_trace_dst(&dt->ddebugs[i]);
  1775			if (dst)
  1776				trc_tbl.buf[dst].use_cnt--;
  1777		}
  1778	
  1779		list_del_init(&dt->link);
  1780		kfree(dt);
  1781	}
  1782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
