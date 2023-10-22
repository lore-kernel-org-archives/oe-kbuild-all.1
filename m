Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0610F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OchdOPtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697953365; x=1729489365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qamfwDVoy7ZlipJGXOekOL8I8D7gc82uzwNDPDUYlmE=;
  b=OchdOPtBuJIR/XpnFnoByWCY0VC2ANnFpKUxjhUNNyHQj0PXmlA97hMr
   m4GCrVnTka3zviSsD/8/JzHIt9F3dH37QznDMDyADj0xcb1779jQ0BI1b
   NMNuLSnhM8jQ+E/NYE7WCaygZDV3izfokXxP7icJ5Lq++MjXv/A+gdTXe
   2UOpt/hOSUkAmC/W0lzqSFfQbEMR7umBeZDgY9YpAOga0/VgLBQVYBnw+
   /rgQes5bA69AuURLEYNYphMXJEN2eyWjBI3WV/YSe7pjam2gvPEFUhnXx
   e5jUrY8srShlUJVr6lQAUihQqKi0RQAwsNjcEFpUbY7Wsp6jhp8pGNT1k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="417813004"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="417813004"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 22:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089125817"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089125817"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2023 22:42:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quREX-0005de-0z;
	Sun, 22 Oct 2023 05:42:41 +0000
Date: Sun, 22 Oct 2023 13:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org
Subject: [xiang-erofs:dev-test 3/3] fs/erofs/decompressor.c:27:5: warning: no
 previous declaration for 'z_erofs_load_lz4_config'
Message-ID: <202310221347.8YPc9FUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   06c538a759ebdac1c80d73fee3b423f38910a729
commit: 06c538a759ebdac1c80d73fee3b423f38910a729 [3/3] erofs: simplify compression configuration parser
config: i386-buildonly-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221347.8YPc9FUC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221347.8YPc9FUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221347.8YPc9FUC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/decompressor.c:27:5: warning: no previous declaration for 'z_erofs_load_lz4_config' [-Wmissing-declarations]
    int z_erofs_load_lz4_config(struct super_block *sb,
        ^~~~~~~~~~~~~~~~~~~~~~~


vim +/z_erofs_load_lz4_config +27 fs/erofs/decompressor.c

d67aee76d41861 Gao Xiang    2021-12-28  26  
5d50538fc567c6 Huang Jianan 2021-03-29 @27  int z_erofs_load_lz4_config(struct super_block *sb,
06c538a759ebda Gao Xiang    2023-10-21  28  			    struct erofs_super_block *dsb, void *data, int size)
5d50538fc567c6 Huang Jianan 2021-03-29  29  {
4fea63f7d76e42 Gao Xiang    2021-04-07  30  	struct erofs_sb_info *sbi = EROFS_SB(sb);
06c538a759ebda Gao Xiang    2023-10-21  31  	struct z_erofs_lz4_cfgs *lz4 = data;
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

:::::: The code at line 27 was first introduced by commit
:::::: 5d50538fc567c6f3692dec1825fb38c5a0884d93 erofs: support adjust lz4 history window size

:::::: TO: Huang Jianan <huangjianan@oppo.com>
:::::: CC: Gao Xiang <hsiangkao@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
