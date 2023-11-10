Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F621079D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 06:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG4MU2z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699598031; x=1731134031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UcyO2pk3EyIevztdKzcr3aFhpegG/JvQLD8cR0YtNYE=;
  b=cG4MU2z7BtkSPIZw1tJvUXhG7jjBUnWYCYI81zeUicaSFtSVu6BrvQvk
   o+cPgavXK5BGmfD3YhpPic5girWjwJ0eRT1GPsqKA4n98BsWzcHwrjmLT
   CT/Sb6AYqfNXYBAa8KK8oQ4ys6332WdKDeVAXHjzGIlf2LT0O87m8vOjR
   953WqquyAS2JBagjLPKVHe7qgMVXvMchIZMf8o5tz/niCk/OZrPkN4oup
   zXiQ9tkG2LxNfpL8JB0rAKkEAup84tCJYQrMBQ7t7IScb1vfaS+A5rSQh
   KVWc8mNl8823hFJvc19BhJ34g6WYBZoUU0Y4VmMZ90eP7bo6MNz4qpZH0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393014366"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="393014366"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 22:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="834073027"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="834073027"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2023 22:33:49 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1L5P-0009Sk-1x;
	Fri, 10 Nov 2023 06:33:47 +0000
Date: Fri, 10 Nov 2023 14:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] wifi: mac80211: use wiphy locked debugfs for
 sdata/link
Message-ID: <202311101458.nTUgKNEi-lkp@intel.com>
References: <20231109222251.f6f6241e2541.I99a21601e124f5ac4e161ad32b19949e7896e390@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109222251.f6f6241e2541.I99a21601e124f5ac4e161ad32b19949e7896e390@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main wireless/main linus/master next-20231110]
[cannot apply to v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/debugfs-fix-automount-d_fsdata-usage/20231110-054024
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231109222251.f6f6241e2541.I99a21601e124f5ac4e161ad32b19949e7896e390%40changeid
patch subject: [RFC PATCH 6/6] wifi: mac80211: use wiphy locked debugfs for sdata/link
config: arm64-randconfig-002-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101458.nTUgKNEi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101458.nTUgKNEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101458.nTUgKNEi-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/mac80211/debugfs_netdev.c: In function 'ieee80211_if_read_sdata':
>> net/mac80211/debugfs_netdev.c:54:16: error: implicit declaration of function 'wiphy_locked_debugfs_read' [-Werror=implicit-function-declaration]
      54 |         return wiphy_locked_debugfs_read(sdata->local->hw.wiphy,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c: In function 'ieee80211_if_write_sdata':
>> net/mac80211/debugfs_netdev.c:90:16: error: implicit declaration of function 'wiphy_locked_debugfs_write' [-Werror=implicit-function-declaration]
      90 |         return wiphy_locked_debugfs_write(sdata->local->hw.wiphy,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/wiphy_locked_debugfs_read +54 net/mac80211/debugfs_netdev.c

    40	
    41	static ssize_t ieee80211_if_read_sdata(
    42		struct file *file,
    43		char __user *userbuf,
    44		size_t count, loff_t *ppos,
    45		ssize_t (*format)(const struct ieee80211_sub_if_data *sdata, char *, int))
    46	{
    47		struct ieee80211_sub_if_data *sdata = file->private_data;
    48		struct ieee80211_if_read_sdata_data data = {
    49			.format = format,
    50			.sdata = sdata,
    51		};
    52		char buf[200];
    53	
  > 54		return wiphy_locked_debugfs_read(sdata->local->hw.wiphy,
    55						 file, buf, sizeof(buf),
    56						 userbuf, count, ppos,
    57						 ieee80211_if_read_sdata_handler,
    58						 &data);
    59	}
    60	
    61	struct ieee80211_if_write_sdata_data {
    62		ssize_t (*write)(struct ieee80211_sub_if_data *, const char *, int);
    63		struct ieee80211_sub_if_data *sdata;
    64	};
    65	
    66	static ssize_t ieee80211_if_write_sdata_handler(struct wiphy *wiphy,
    67							struct file *file,
    68							char *buf,
    69							size_t count,
    70							void *data)
    71	{
    72		struct ieee80211_if_write_sdata_data *d = data;
    73	
    74		return d->write(d->sdata, buf, count);
    75	}
    76	
    77	static ssize_t ieee80211_if_write_sdata(
    78		struct file *file,
    79		const char __user *userbuf,
    80		size_t count, loff_t *ppos,
    81		ssize_t (*write)(struct ieee80211_sub_if_data *sdata, const char *, int))
    82	{
    83		struct ieee80211_sub_if_data *sdata = file->private_data;
    84		struct ieee80211_if_write_sdata_data data = {
    85			.write = write,
    86			.sdata = sdata,
    87		};
    88		char buf[64];
    89	
  > 90		return wiphy_locked_debugfs_write(sdata->local->hw.wiphy,
    91						  file, buf, sizeof(buf),
    92						  userbuf, count,
    93						  ieee80211_if_write_sdata_handler,
    94						  &data);
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
