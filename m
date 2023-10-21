Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A2263F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AC/uzaOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697859106; x=1729395106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AJm1d0TtiGT+nfwxRJ8OmAx+QnT2JvrRoV8Ug2vH88w=;
  b=AC/uzaOP5DPYPbJDzlpA7U9mgNsbWM3WAAcjXw1XPvIh0NDN9JADQRU1
   KDlIGkkVUBV5NyYayhsc/AhxZAvDWgoOZ+D2NmUrkqnqUeaWz8CYMd7lk
   4SZXEabLissvdS941pUwNHSik+ZrDF6VbWZYm/jFV4XH0F0gmF2LIIpuN
   +yogxUNokZ8jgMMZI/mrPT62BPu4jbB1HaWRMeaGfmJfxYuLmajI0YvDx
   ZE8ER2MZtY214djBQLzwHIOtST6KK/pjlgch9OL4HC5kpbUgUTxl8s2H9
   bM+738FOV1pkBLVswpbMwU3GbhCRs5EGNDwCZbmCBDkiB7+RQj5f2Dp2K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="383813511"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="383813511"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 20:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881242730"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="881242730"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Oct 2023 20:31:44 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu2iE-0004Kw-10;
	Sat, 21 Oct 2023 03:31:42 +0000
Date: Sat, 21 Oct 2023 11:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] erofs: simplify compression configuration parser
Message-ID: <202310211151.sklVyQL9-lkp@intel.com>
References: <20231021020109.1646299-1-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021020109.1646299-1-hsiangkao@linux.alibaba.com>

Hi Gao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gao-Xiang/erofs-simplify-compression-configuration-parser/20231021-100253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20231021020109.1646299-1-hsiangkao%40linux.alibaba.com
patch subject: [PATCH] erofs: simplify compression configuration parser
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211151.sklVyQL9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211151.sklVyQL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211151.sklVyQL9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/decompressor.c:27:5: warning: no previous prototype for 'z_erofs_load_lz4_config' [-Wmissing-prototypes]
      27 | int z_erofs_load_lz4_config(struct super_block *sb,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/z_erofs_load_lz4_config +27 fs/erofs/decompressor.c

d67aee76d41861 Gao Xiang    2021-12-28  26  
5d50538fc567c6 Huang Jianan 2021-03-29 @27  int z_erofs_load_lz4_config(struct super_block *sb,
51fd9879fa6135 Gao Xiang    2023-10-21  28  			    struct erofs_super_block *dsb, void *data, int size)
5d50538fc567c6 Huang Jianan 2021-03-29  29  {
4fea63f7d76e42 Gao Xiang    2021-04-07  30  	struct erofs_sb_info *sbi = EROFS_SB(sb);
51fd9879fa6135 Gao Xiang    2023-10-21  31  	struct z_erofs_lz4_cfgs *lz4 = data;
46249cded18ac0 Gao Xiang    2021-03-29  32  	u16 distance;
46249cded18ac0 Gao Xiang    2021-03-29  33  
46249cded18ac0 Gao Xiang    2021-03-29  34  	if (lz4) {
46249cded18ac0 Gao Xiang    2021-03-29  35  		if (size < sizeof(struct z_erofs_lz4_cfgs)) {
46249cded18ac0 Gao Xiang    2021-03-29  36  			erofs_err(sb, "invalid lz4 cfgs, size=%u", size);
46249cded18ac0 Gao Xiang    2021-03-29  37  			return -EINVAL;
46249cded18ac0 Gao Xiang    2021-03-29  38  		}
46249cded18ac0 Gao Xiang    2021-03-29  39  		distance = le16_to_cpu(lz4->max_distance);
4fea63f7d76e42 Gao Xiang    2021-04-07  40  
4fea63f7d76e42 Gao Xiang    2021-04-07  41  		sbi->lz4.max_pclusterblks = le16_to_cpu(lz4->max_pclusterblks);
4fea63f7d76e42 Gao Xiang    2021-04-07  42  		if (!sbi->lz4.max_pclusterblks) {
4fea63f7d76e42 Gao Xiang    2021-04-07  43  			sbi->lz4.max_pclusterblks = 1;	/* reserved case */
4fea63f7d76e42 Gao Xiang    2021-04-07  44  		} else if (sbi->lz4.max_pclusterblks >
3acea5fc335420 Jingbo Xu    2023-03-13  45  			   erofs_blknr(sb, Z_EROFS_PCLUSTER_MAX_SIZE)) {
4fea63f7d76e42 Gao Xiang    2021-04-07  46  			erofs_err(sb, "too large lz4 pclusterblks %u",
4fea63f7d76e42 Gao Xiang    2021-04-07  47  				  sbi->lz4.max_pclusterblks);
4fea63f7d76e42 Gao Xiang    2021-04-07  48  			return -EINVAL;
4fea63f7d76e42 Gao Xiang    2021-04-07  49  		}
46249cded18ac0 Gao Xiang    2021-03-29  50  	} else {
14373711dd54be Gao Xiang    2021-03-29  51  		distance = le16_to_cpu(dsb->u1.lz4_max_distance);
4fea63f7d76e42 Gao Xiang    2021-04-07  52  		sbi->lz4.max_pclusterblks = 1;
46249cded18ac0 Gao Xiang    2021-03-29  53  	}
5d50538fc567c6 Huang Jianan 2021-03-29  54  
4fea63f7d76e42 Gao Xiang    2021-04-07  55  	sbi->lz4.max_distance_pages = distance ?
5d50538fc567c6 Huang Jianan 2021-03-29  56  					DIV_ROUND_UP(distance, PAGE_SIZE) + 1 :
5d50538fc567c6 Huang Jianan 2021-03-29  57  					LZ4_MAX_DISTANCE_PAGES;
4fea63f7d76e42 Gao Xiang    2021-04-07  58  	return erofs_pcpubuf_growsize(sbi->lz4.max_pclusterblks);
5d50538fc567c6 Huang Jianan 2021-03-29  59  }
5d50538fc567c6 Huang Jianan 2021-03-29  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
