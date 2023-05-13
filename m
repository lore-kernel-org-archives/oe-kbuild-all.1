Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1CA21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 04:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683953286; x=1715489286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g69d7UNOOAmR8a/vlnrTiHSRqIN0yQQJqaT1ENEhE9c=;
  b=cOJX/5jO3ZoQ0wIbMrKGvS3XmHYujJnRd8/y7LR6PYvmw34f5cs1CQdI
   doLQRJTTvOMB1gXsXhXo3avwmb0umX+tFcIC2x0OOaON7UQ0/oQImjZh4
   TLI2bVycmd7uXMDq3B5qJfS8A5FLC5P08fJ1hwSag9jmepekYYmZWsKy+
   +Uckn/terLhajJqHgVOQA4L8OWGSkVMysdAQDmB8wgTV6jOUYbmtpLSyF
   rgq8EOvh/MdazBSLSNcEU+BN1HJazh95CJh4bCATdp23EbMT8N0J2v0GO
   cGEnXz29i+P3RUuyIvWblel1Adlm8UBzFi2d3XQgOdjIHYUZEE9U4CWBs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="416567162"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="416567162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 21:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="770018139"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="770018139"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 21:48:04 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxhAp-0005KG-1v;
	Sat, 13 May 2023 04:48:03 +0000
Date: Sat, 13 May 2023 12:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1004/2056] lib/maple_tree.c:6251:7: warning: no
 previous prototype for 'mas_find_range_rev'
Message-ID: <202305131224.zRZiy5ir-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e922ba281a8d84f640d8c8e18a385d032c19e185
commit: ffd97c0e1cac202f40acf8dfbc1c0664295c4f44 [1004/2056] maple_tree: add mas_prev_range() and mas_find_range_rev interface
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230513/202305131224.zRZiy5ir-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ffd97c0e1cac202f40acf8dfbc1c0664295c4f44
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ffd97c0e1cac202f40acf8dfbc1c0664295c4f44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131224.zRZiy5ir-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/maple_tree.c:4606:7: warning: no previous prototype for 'mas_prev_slot' [-Wmissing-prototypes]
    4606 | void *mas_prev_slot(struct ma_state *mas, unsigned long min, bool empty)
         |       ^~~~~~~~~~~~~
   lib/maple_tree.c:4758:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4758 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^~~~~~~~~~~~~
>> lib/maple_tree.c:6251:7: warning: no previous prototype for 'mas_find_range_rev' [-Wmissing-prototypes]
    6251 | void *mas_find_range_rev(struct ma_state *mas, unsigned long min)
         |       ^~~~~~~~~~~~~~~~~~


vim +/mas_find_range_rev +6251 lib/maple_tree.c

  6237	
  6238	/**
  6239	 * mas_find_range_rev: On the first call, find the first non-null entry at or
  6240	 * below mas->index down to %min.  Otherwise advance to the previous slot after
  6241	 * mas->index down to %min.
  6242	 * @mas: The maple state
  6243	 * @min: The minimum value to check.
  6244	 *
  6245	 * Must hold rcu_read_lock or the write lock.
  6246	 * If an entry exists, last and index are updated accordingly.
  6247	 * May set @mas->node to MAS_NONE.
  6248	 *
  6249	 * Return: The entry or %NULL.
  6250	 */
> 6251	void *mas_find_range_rev(struct ma_state *mas, unsigned long min)
  6252	{
  6253		void *entry;
  6254	
  6255		if (mas_find_rev_setup(mas, min, &entry))
  6256			return entry;
  6257	
  6258		/* Retries on dead nodes handled by mas_prev_slot */
  6259		return mas_prev_slot(mas, min, true);
  6260	}
  6261	EXPORT_SYMBOL_GPL(mas_find_range_rev);
  6262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
