Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5742AA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732981301; cv=none; b=LjixzHvllcjL0Uo3njit2vn+73KgtckTaMCW8TtDRVzEOE99Ma3wt6B5rfRgZs+N/8IignrhBc0/e0kFQbYphP943NOzU4QhHo8PAQzCaNKPSFcJ8EXtXz/sDqAySEaEmAvKj6K4Rd5u9lALKhV/wNqlrjnNgDw5Dv8qd40kioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732981301; c=relaxed/simple;
	bh=oPf4gw3dbjUjnmtpaGRCi/4jiGfijl1FSOL1OFombhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqkeUEN5MSuelT98+y+AFXSm0leu8e1eH9kSJt2lrmeks3OqN3NZgS/3B1Glr6A7bTkSm8W7XSd8dqsLId6fQ/yS6nJxLzt+pb4w16p0pudSnr7a5pKfrj7fkQePoIn91IkKN+0Nqcco8SOXf9YE2FxOZ4EAbJziEHI0BJBKXbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9Y8opmC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9Y8opmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732981299; x=1764517299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPf4gw3dbjUjnmtpaGRCi/4jiGfijl1FSOL1OFombhI=;
  b=Q9Y8opmCVixt06LsGb21aQnMz2/DOk+5FPpLp2c6GttNabO+bWt1Ts+w
   po5Gs356LemiD1NFLZkGnU5WaZoMOqjSudj8aAJMeFN18CWXUPXgrvQ+p
   7ic8SQZokg4dv3RbCweiYG9eGyAXZ7phOLsWDNn4iLhpJUjSnL7717nYZ
   kdpmVKOwzTS7aEU+0osrvGkjxEXrCTz1tQ2NaacCwrGICom6CeSKVUeC4
   xEAxSSrTACREymnjDo+gTE+200UX+qMFNpQsuRWCElIukt63oftCCaWaL
   697u/yVk69B28KeXdrqFMYm9brDhi0FiDbTmvqtyyZQs7VNA3/wRBKCEW
   g==;
X-CSE-ConnectionGUID: c8QoRKbFRzm8MyWBQsnwvA==
X-CSE-MsgGUID: o9JkNr16SCaIj5cOpbgVCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36964363"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="36964363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 07:41:38 -0800
X-CSE-ConnectionGUID: H1a9EL6VQVG8scQVcd4oOw==
X-CSE-MsgGUID: NKiE375OS8GYcd/t1oC/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="93174942"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Nov 2024 07:41:36 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHPau-0000ll-22;
	Sat, 30 Nov 2024 15:41:22 +0000
Date: Sat, 30 Nov 2024 23:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: JP Abgrall <jpa@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Alistair Strachan <astrachan@google.com>
Subject: net/netfilter/xt_quota2.c:172:37: warning: 'q2_counter_fops' defined
 but not used
Message-ID: <202411302355.9b9JQRtF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JP,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 10cda83af99dd606e19a39bb97cf1d90bf2b0f36 ANDROID: netfilter: xt_quota2: adding the original quota2 from xtables-addons
date:   6 years ago
config: arm-randconfig-003-20241122 (https://download.01.org/0day-ci/archive/20241130/202411302355.9b9JQRtF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411302355.9b9JQRtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411302355.9b9JQRtF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/xt_quota2.c:172:37: warning: 'q2_counter_fops' defined but not used [-Wunused-const-variable=]
     172 | static const struct file_operations q2_counter_fops = {
         |                                     ^~~~~~~~~~~~~~~
   net/netfilter/xt_quota2.c:48: warning: Cannot understand  * @lock:       lock to protect quota writers from each other
    on line 48 - I thought it was a doc line
   net/netfilter/xt_quota2.c:206: warning: Function parameter or member 'q' not described in 'q2_get_counter'
   net/netfilter/xt_quota2.c:206: warning: Excess function parameter 'name' description in 'q2_get_counter'


vim +/q2_counter_fops +172 net/netfilter/xt_quota2.c

   171	
 > 172	static const struct file_operations q2_counter_fops = {
   173		.read		= quota_proc_read,
   174		.write		= quota_proc_write,
   175		.llseek		= default_llseek,
   176	};
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
