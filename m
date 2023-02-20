Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AE6D39
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676909965; x=1708445965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+4Isw9FTHgo6kiRIWcKFVI3qNXC5us8bJCqY9B5Yhg=;
  b=ccf8BRcWQZJJOhq6FiemsLDGBJnmXnfVb/xyvgkbSMr0tyTy0I4m8CRk
   YTZIUHiBrGRlMeeHGdXjo+SGeSbR3Jn/R17Jeqp4aVulQTZsfpzE7U+Se
   WoSHT86Mhgupwpvhk/OQ3mAnmsAzgSHCobjG3BUFWTxGhexEmcBn2pSj8
   yaOPptpgWSWkJV3Kydt93Z8C0A8V5fhujYoXWjP0tr9TkSxiN6KjmHQEX
   fAy7k8VK/pQ5QcqRA/jiQdG/wyep0yqql7j69nnwQkJbT6+KTbfuVIek/
   3iXPc2HDhmUYCcwGv3u3i0XjbPyqoMAXTrnLSEhM+Zaozq/lZ8CyxHiql
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312068256"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="312068256"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 08:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="735176277"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="735176277"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2023 08:19:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU8ss-000E2f-1M;
	Mon, 20 Feb 2023 16:19:22 +0000
Date: Tue, 21 Feb 2023 00:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [net-next:master 1/30] net/xdp/xsk.c:1322:16: error: implicit
 declaration of function 'remap_vmalloc_range'; did you mean
 'ida_alloc_range'?
Message-ID: <202302210041.kpPQLlNQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
head:   3fcdf2dfefb6313ea0395519d1784808c0b6559b
commit: 9f78bf330a66cd400b3e00f370f597e9fa939207 [1/30] xsk: support use vaddr as ring
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230221/202302210041.kpPQLlNQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?id=9f78bf330a66cd400b3e00f370f597e9fa939207
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch --no-tags net-next master
        git checkout 9f78bf330a66cd400b3e00f370f597e9fa939207
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210041.kpPQLlNQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/xdp/xsk.c: In function 'xsk_mmap':
>> net/xdp/xsk.c:1322:16: error: implicit declaration of function 'remap_vmalloc_range'; did you mean 'ida_alloc_range'? [-Werror=implicit-function-declaration]
    1322 |         return remap_vmalloc_range(vma, q->ring, 0);
         |                ^~~~~~~~~~~~~~~~~~~
         |                ida_alloc_range
   cc1: some warnings being treated as errors


vim +1322 net/xdp/xsk.c

  1289	
  1290	static int xsk_mmap(struct file *file, struct socket *sock,
  1291			    struct vm_area_struct *vma)
  1292	{
  1293		loff_t offset = (loff_t)vma->vm_pgoff << PAGE_SHIFT;
  1294		unsigned long size = vma->vm_end - vma->vm_start;
  1295		struct xdp_sock *xs = xdp_sk(sock->sk);
  1296		struct xsk_queue *q = NULL;
  1297	
  1298		if (READ_ONCE(xs->state) != XSK_READY)
  1299			return -EBUSY;
  1300	
  1301		if (offset == XDP_PGOFF_RX_RING) {
  1302			q = READ_ONCE(xs->rx);
  1303		} else if (offset == XDP_PGOFF_TX_RING) {
  1304			q = READ_ONCE(xs->tx);
  1305		} else {
  1306			/* Matches the smp_wmb() in XDP_UMEM_REG */
  1307			smp_rmb();
  1308			if (offset == XDP_UMEM_PGOFF_FILL_RING)
  1309				q = READ_ONCE(xs->fq_tmp);
  1310			else if (offset == XDP_UMEM_PGOFF_COMPLETION_RING)
  1311				q = READ_ONCE(xs->cq_tmp);
  1312		}
  1313	
  1314		if (!q)
  1315			return -EINVAL;
  1316	
  1317		/* Matches the smp_wmb() in xsk_init_queue */
  1318		smp_rmb();
  1319		if (size > q->ring_vmalloc_size)
  1320			return -EINVAL;
  1321	
> 1322		return remap_vmalloc_range(vma, q->ring, 0);
  1323	}
  1324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
