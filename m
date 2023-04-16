Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058887B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681646949; x=1713182949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qy63sKCfjZQ7nJx4mRlXD6G37Erh823M5KU6tkWeOck=;
  b=kw2G/rcm4fuy+l/yZd+aGFVvqHCx/qLtPbdg0YmhFLCogsr78thxgnVR
   OSSYTN5N5AGiHdk4T8te0MWIYCQuReKTJZ1GFQaDN7HSRrD4FMeChDGUH
   sQTDVbEghl4j77uy/wY/+jPQYaqk5q5RmJEORpG6Ufzhyw+k+K2ZorglV
   GjFZxUSy9LEfwksqQnUqk34tf1bm4FZCxDbagikExOO5/E0a2zuwKk3yV
   so+Ax6Brr87u47nZ8dGBVAQE+rLUDQAd4s0SShyZxJYy+LlWO4WMbI/vk
   6o2OFLsPZdODUn8NL5QnqoJJFkf0djNvLZ4T8s6/kbk93A8kTsoCzrDux
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="328884788"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="328884788"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 05:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="864728147"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="864728147"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Apr 2023 05:09:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po1Br-000bff-05;
	Sun, 16 Apr 2023 12:09:07 +0000
Date: Sun, 16 Apr 2023 20:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/atm/iphase.c:151 ia_hack_tcq() warn: if();
Message-ID: <202304161938.nf0USkAw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e7bb4f2461710b70887704af7f175383251088e
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   9 months ago
config: openrisc-randconfig-m031-20230416 (https://download.01.org/0day-ci/archive/20230416/202304161938.nf0USkAw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304161938.nf0USkAw-lkp@intel.com/

New smatch warnings:
drivers/atm/iphase.c:151 ia_hack_tcq() warn: if();
drivers/atm/iphase.c:562 ia_cbr_setup() warn: inconsistent indenting
drivers/atm/iphase.c:695 ia_tx_poll() warn: inconsistent indenting
drivers/atm/iphase.c:1247 rx_intr() warn: inconsistent indenting
drivers/atm/iphase.c:1558 rx_init() warn: inconsistent indenting
drivers/atm/iphase.c:1763 open_tx() warn: inconsistent indenting
drivers/atm/iphase.c:2553 ia_start() warn: inconsistent indenting
drivers/atm/iphase.c:2766 ia_ioctl() warn: inconsistent indenting
drivers/atm/iphase.c:2911 ia_pkt_tx() warn: inconsistent indenting

Old smatch warnings:
drivers/atm/iphase.c:2870 ia_ioctl() warn: inconsistent indenting

vim +151 drivers/atm/iphase.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  143  
^1da177e4c3f41 Linus Torvalds 2005-04-16  144    u_short 		desc1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  145    u_short		tcq_wr;
^1da177e4c3f41 Linus Torvalds 2005-04-16  146    struct ia_vcc         *iavcc_r = NULL; 
^1da177e4c3f41 Linus Torvalds 2005-04-16  147  
^1da177e4c3f41 Linus Torvalds 2005-04-16  148    tcq_wr = readl(dev->seg_reg+TCQ_WR_PTR) & 0xffff;
^1da177e4c3f41 Linus Torvalds 2005-04-16  149    while (dev->host_tcq_wr != tcq_wr) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  150       desc1 = *(u_short *)(dev->seg_ram + dev->host_tcq_wr);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @151       if (!desc1) ;
^1da177e4c3f41 Linus Torvalds 2005-04-16  152       else if (!dev->desc_tbl[desc1 -1].timestamp) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  153          IF_ABR(printk(" Desc %d is reset at %ld\n", desc1 -1, jiffies);)
^1da177e4c3f41 Linus Torvalds 2005-04-16  154          *(u_short *) (dev->seg_ram + dev->host_tcq_wr) = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  155       }                                 
^1da177e4c3f41 Linus Torvalds 2005-04-16  156       else if (dev->desc_tbl[desc1 -1].timestamp) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  157          if (!(iavcc_r = dev->desc_tbl[desc1 -1].iavcc)) { 
^1da177e4c3f41 Linus Torvalds 2005-04-16  158             printk("IA: Fatal err in get_desc\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  159             continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  160          }
^1da177e4c3f41 Linus Torvalds 2005-04-16  161          iavcc_r->vc_desc_cnt--;
^1da177e4c3f41 Linus Torvalds 2005-04-16  162          dev->desc_tbl[desc1 -1].timestamp = 0;
849e8caa477d72 David Howells  2008-07-30  163          IF_EVENT(printk("ia_hack: return_q skb = 0x%p desc = %d\n",
849e8caa477d72 David Howells  2008-07-30  164                                     dev->desc_tbl[desc1 -1].txskb, desc1);)
^1da177e4c3f41 Linus Torvalds 2005-04-16  165          if (iavcc_r->pcr < dev->rate_limit) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  166             IA_SKB_STATE (dev->desc_tbl[desc1-1].txskb) |= IA_TX_DONE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  167             if (ia_enque_rtn_q(&dev->tx_return_q, dev->desc_tbl[desc1 -1]) < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  168                printk("ia_hack_tcq: No memory available\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  169          } 
^1da177e4c3f41 Linus Torvalds 2005-04-16  170          dev->desc_tbl[desc1 -1].iavcc = NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  171          dev->desc_tbl[desc1 -1].txskb = NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  172       }
^1da177e4c3f41 Linus Torvalds 2005-04-16  173       dev->host_tcq_wr += 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  174       if (dev->host_tcq_wr > dev->ffL.tcq_ed) 
^1da177e4c3f41 Linus Torvalds 2005-04-16  175          dev->host_tcq_wr = dev->ffL.tcq_st;
^1da177e4c3f41 Linus Torvalds 2005-04-16  176    }
^1da177e4c3f41 Linus Torvalds 2005-04-16  177  } /* ia_hack_tcq */
^1da177e4c3f41 Linus Torvalds 2005-04-16  178  

:::::: The code at line 151 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
