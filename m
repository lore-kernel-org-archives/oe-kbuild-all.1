Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D51B6539
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730390790; cv=none; b=XwdNbuVdbKljwXmyucpE92MkQGwiBYW5ZYoCF+tKKipqMx7tnjyYBhWDT+TQLGsk2i17B/oA24Zag016KPtlhuiTM8i4SGrQMqS8l63JkjXn7/fRzFlcqVL55id4iS3llCN5WpZXsnkH1eJA+6rtaZyVd9oJ50F8AY7HUSrVlfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730390790; c=relaxed/simple;
	bh=g1NBQ0Mgu7SieVdTmNzBg1N/34gvm6levcNozLsI+kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqAgDCDx4k36h7w8xgtHvmMWwAXhXocwPXog1qNvnXdrggpHYeNJfwgF6a9cs2Q+HsCHJq9P+i8tzV05WLk4t5Md+gBRE3j7BdKemhnFhzAtHuyrI+AKnqpRZRix5shMNt+c/7e2GwaNRQZd9BKNdKj8Hm5GD/xkEKmWYkWEgeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbx9BXIB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbx9BXIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730390788; x=1761926788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1NBQ0Mgu7SieVdTmNzBg1N/34gvm6levcNozLsI+kA=;
  b=Gbx9BXIB4T+nYj8hdoV09kdKQovg4hkXRPhoONQunZO8aM370wWCUhnx
   x1AoMj5OJM5txdyIqVZxynW2U5/GnuVHyeQpNaLDxjJIjTf3dkeoTWk/M
   VUvYMloOZ6RdsdlDhTiQrAb3mtKLZBCqLX+KIDmfTUJ1M5J3pt6Pn+SWL
   f7F8UY5x9eAIehTeioOniUc1N9+a9Ij7zD5o+vbcJtPL+dZeGUCYit3de
   CMq4slwAgHIJ4JFVC0zTqzCmVMHzVMp5Cv2tOxGr386qkkcULhe+mxzwa
   U0Q9PZVHmU5ePOXiPqdh8yLbmwCo5IuPJDHhLfY9NBJsvqaGzVd8tSpVR
   A==;
X-CSE-ConnectionGUID: 7XTooFAuR4SLWDvFQz5fmQ==
X-CSE-MsgGUID: JsjnwqLvQzGkMHj8ARPYvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30256802"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30256802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 09:05:39 -0700
X-CSE-ConnectionGUID: Ud8g+XEsREWVlNgSIDg+Qw==
X-CSE-MsgGUID: DynU15BfS+Ovx00GqT3KBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="86601548"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2024 09:05:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Xfx-000gVI-1f;
	Thu, 31 Oct 2024 16:05:33 +0000
Date: Fri, 1 Nov 2024 00:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 71/71]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:66:13: warning: variable 'ret'
 set but not used
Message-ID: <202411010018.QmnmbvuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   ee43e37385973e1a8f997188dff7a58321371b92
commit: ee43e37385973e1a8f997188dff7a58321371b92 [71/71] debug: try to add mtk debugfs for RSS
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241101/202411010018.QmnmbvuM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010018.QmnmbvuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010018.QmnmbvuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'rss_ctrl_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:66:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      66 |         int ret;
         |             ^~~


vim +/ret +66 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

    56	
    57	static ssize_t rss_ctrl_write(struct file *file, const char __user *buffer,
    58			       size_t count, loff_t *data)
    59	{
    60		char buf[32];
    61		char *p_buf;
    62		char *p_token = NULL;
    63		char *p_delimiter = " \t";
    64		long num = 4;
    65		u32 len = count;
  > 66		int ret;
    67		if (len >= sizeof(buf)) {
    68			pr_info("Input handling fail!\n");
    69			return -1;
    70		}
    71		if (copy_from_user(buf, buffer, len))
    72			return -EFAULT;
    73		buf[len] = '\0';
    74		p_buf = buf;
    75		p_token = strsep(&p_buf, p_delimiter);
    76		if (!p_token)
    77			num = 4;
    78		else
    79			ret = kstrtol(p_token, 10, &num);
    80		if (!mtk_rss_set_indr_tbl(g_eth, num))
    81			cur_rss_num = num;
    82		return count;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
