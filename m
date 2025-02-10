Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56B1C5F0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182622; cv=none; b=KVpC7e8LJLpcdgq14J4lBZudO4YORj0Z4TGCi9JRDERWcb3Fh4RLN57FmiC2bIJMePqDKBEXJRAdb//ZYg24uQewMTvMLd19/qsFHORadR1g3UtFQtvWwC5IBPZNX9HyYZNSGXxhiHR05+Lv+3nJY8QkKLxXceRlFdgllq/7YZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182622; c=relaxed/simple;
	bh=tKgl7eRZJWGSHvA1Ej6bP6htTfzMWLLPKVh/nd3ZRgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3UemUFk9xaL+YAvlnYnPMcxXvQIMsnc+OoJzQJmpjeAbBPSl0fCfyLu0OAeSfmdzHHly24gLANLmczu18ya+BknpE4EMtp1eDvZa0esU+ov0ssD/LFlGz8NF80AFGKBqrrjdSis75HdbITheRkDF12pzlY5hmxrSscNr9370KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWVlNVU7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWVlNVU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739182620; x=1770718620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKgl7eRZJWGSHvA1Ej6bP6htTfzMWLLPKVh/nd3ZRgw=;
  b=XWVlNVU7U7a9os3SdVLg+xq7KPU3kkX0+VO+DISqRLtjylAIuq4EvfR+
   Oc99wQgmc0Gcc6Kj2MFgsXBJp+Q9i+3C0QtjdttzNqTyCrKCYJ5bgBQ1G
   sFJg30myTL8bFNVpkIuM5wj0z9xqb3Na4EwieHxcA5/Q7ij8zN03fRG4k
   6lqaALWzZGIntwjbtwFQYPggmXTWQoWYEBmIF6Zg/jR3sKC3KorIYcpEp
   SsNn1g+ipElRAMtZfFh31eYuK6FkulatZR3i9mCYUfDhT5g2S0lR1kxjD
   +LJJOyDm05O0vaGbi/QTZ4pAZ3s/KJXJP9Cp+vaDJih23QA496+ePlSmQ
   g==;
X-CSE-ConnectionGUID: GuGAGVvUQfeCxXW3HAnyPw==
X-CSE-MsgGUID: 6JxSEdgwQ8iIxtsNTG7RvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39867566"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39867566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:16:57 -0800
X-CSE-ConnectionGUID: ISJls7L6R5ezQr/lnxhXkg==
X-CSE-MsgGUID: uWuQnJfxTs6y9qEqECkWGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112083317"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 02:16:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thQqU-0012ZJ-1C;
	Mon, 10 Feb 2025 10:16:54 +0000
Date: Mon, 10 Feb 2025 18:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pkshih-rtw:rtw-next 21/49]
 drivers/net/wireless/realtek/rtw89/debug.c:164:21: error: implicit
 declaration of function 'wiphy_locked_debugfs_read'
Message-ID: <202502101810.3CUpUL7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/pkshih/rtw rtw-next
head:   6b39cc01af66a32c4d03952e0b3aae19cdf4b66e
commit: 8fdf78f3cd5f87eced0c4f7eed7160a2ec31a008 [21/49] wifi: rtw89: debugfs: use wiphy_locked_debugfs_{read,write}() if needed
config: loongarch-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101810.3CUpUL7p-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101810.3CUpUL7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101810.3CUpUL7p-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtw89/debug.c: In function 'rtw89_debugfs_file_read':
>> drivers/net/wireless/realtek/rtw89/debug.c:164:21: error: implicit declaration of function 'wiphy_locked_debugfs_read' [-Wimplicit-function-declaration]
     164 |                 n = wiphy_locked_debugfs_read(rtwdev->hw->wiphy, file, buf, bufsz,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/debug.c: In function 'rtw89_debugfs_file_write':
>> drivers/net/wireless/realtek/rtw89/debug.c:204:21: error: implicit declaration of function 'wiphy_locked_debugfs_write' [-Wimplicit-function-declaration]
     204 |                 n = wiphy_locked_debugfs_write(rtwdev->hw->wiphy,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/wiphy_locked_debugfs_read +164 drivers/net/wireless/realtek/rtw89/debug.c

   140	
   141	static ssize_t rtw89_debugfs_file_read(struct file *file, char __user *userbuf,
   142					       size_t count, loff_t *ppos)
   143	{
   144		struct rtw89_debugfs_priv *debugfs_priv = file->private_data;
   145		struct rtw89_debugfs_priv_opt *opt = &debugfs_priv->opt;
   146		struct rtw89_dev *rtwdev = debugfs_priv->rtwdev;
   147		size_t bufsz = opt->rsize ? opt->rsize : PAGE_SIZE;
   148		char *buf;
   149		ssize_t n;
   150	
   151		if (!debugfs_priv->rbuf)
   152			debugfs_priv->rbuf = devm_kzalloc(rtwdev->dev, bufsz, GFP_KERNEL);
   153	
   154		buf = debugfs_priv->rbuf;
   155		if (!buf)
   156			return -ENOMEM;
   157	
   158		if (*ppos) {
   159			n = debugfs_priv->rused;
   160			goto out;
   161		}
   162	
   163		if (opt->rlock) {
 > 164			n = wiphy_locked_debugfs_read(rtwdev->hw->wiphy, file, buf, bufsz,
   165						      userbuf, count, ppos,
   166						      rtw89_debugfs_file_read_helper,
   167						      debugfs_priv);
   168			debugfs_priv->rused = n;
   169	
   170			return n;
   171		}
   172	
   173		n = rtw89_debugfs_file_read_helper(rtwdev->hw->wiphy, file, buf, bufsz,
   174						   debugfs_priv);
   175		debugfs_priv->rused = n;
   176	
   177	out:
   178		return simple_read_from_buffer(userbuf, count, ppos, buf, n);
   179	}
   180	
   181	static ssize_t rtw89_debugfs_file_write_helper(struct wiphy *wiphy, struct file *file,
   182						       char *buf, size_t count, void *data)
   183	{
   184		struct rtw89_debugfs_priv *debugfs_priv = data;
   185		struct rtw89_dev *rtwdev = debugfs_priv->rtwdev;
   186	
   187		return debugfs_priv->cb_write(rtwdev, debugfs_priv, buf, count);
   188	}
   189	
   190	static ssize_t rtw89_debugfs_file_write(struct file *file,
   191						const char __user *userbuf,
   192						size_t count, loff_t *loff)
   193	{
   194		struct rtw89_debugfs_priv *debugfs_priv = file->private_data;
   195		struct rtw89_debugfs_priv_opt *opt = &debugfs_priv->opt;
   196		struct rtw89_dev *rtwdev = debugfs_priv->rtwdev;
   197		char *buf __free(kfree) = kmalloc(count + 1, GFP_KERNEL);
   198		ssize_t n;
   199	
   200		if (!buf)
   201			return -ENOMEM;
   202	
   203		if (opt->wlock) {
 > 204			n = wiphy_locked_debugfs_write(rtwdev->hw->wiphy,
   205						       file, buf, count + 1,
   206						       userbuf, count,
   207						       rtw89_debugfs_file_write_helper,
   208						       debugfs_priv);
   209			return n;
   210		}
   211	
   212		if (copy_from_user(buf, userbuf, count))
   213			return -EFAULT;
   214	
   215		buf[count] = '\0';
   216	
   217		return debugfs_priv->cb_write(rtwdev, debugfs_priv, buf, count);
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
