Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751938BED
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678300619; x=1709836619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hT8wlYkyxW9U8JdUt+0WBMZ3DxOnLtguokqb6ov/JAM=;
  b=bSeZjoXTzFZAAUUxHb88k29BmZPys72X3dWaklffvkYYaZxnf1mFSgoM
   E96ae4eKpURng+IF45/ScYpYKc394xX6fGSnNolpFEAoUGDG1kx8NpvEu
   4+TsAy6JElngMQ4AvOpKwC1WCN5R8Xs2xvC52O26pSIEHis3gGJ4VBh/u
   a1hG9UaSAueEexDi0MN0I29RCtwHlY1/CKkzWtKSYUj4Vq0WWaWjMTgsS
   +clqCX6+Mf9Eu8Hg5JiiK7lV1SNsl8PFe7oEXxc/OY13hG7wzgJb+VLcJ
   r3tJslXft1BA1ZOa9ubA3IGYooQmWw4WEigUThpClefLGsPgh/1YN+JMO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315901737"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315901737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 10:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677088548"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="677088548"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 10:36:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZyel-0002L7-0y;
	Wed, 08 Mar 2023 18:36:55 +0000
Date: Thu, 9 Mar 2023 02:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 431/450] kernel/irq/irqdesc.c:686:22:
 warning: assignment to 'struct irq_desc *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202303090239.hFef3ALR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   466e66e57f1a7f9cf8ddeb5e946ab80c625d56b1
commit: e050af0e59fcfe1da4763021a0d23213fbbf19fe [431/450] genirq: Use irq_resolve_mapping() to implement __handle_domain_irq() and co
config: arm-randconfig-r046-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090239.hFef3ALR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=e050af0e59fcfe1da4763021a0d23213fbbf19fe
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout e050af0e59fcfe1da4763021a0d23213fbbf19fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/irq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090239.hFef3ALR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/irqdesc.c: In function '__handle_domain_irq':
   kernel/irq/irqdesc.c:686:24: error: implicit declaration of function 'irq_resolve_mapping'; did you mean 'irq_create_mapping'? [-Werror=implicit-function-declaration]
     686 |                 desc = irq_resolve_mapping(domain, hwirq);
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        irq_create_mapping
>> kernel/irq/irqdesc.c:686:22: warning: assignment to 'struct irq_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     686 |                 desc = irq_resolve_mapping(domain, hwirq);
         |                      ^
   kernel/irq/irqdesc.c: In function 'handle_domain_nmi':
   kernel/irq/irqdesc.c:733:14: warning: assignment to 'struct irq_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     733 |         desc = irq_resolve_mapping(domain, hwirq);
         |              ^
   cc1: some warnings being treated as errors


vim +686 kernel/irq/irqdesc.c

   664	
   665	#ifdef CONFIG_HANDLE_DOMAIN_IRQ
   666	/**
   667	 * __handle_domain_irq - Invoke the handler for a HW irq belonging to a domain
   668	 * @domain:	The domain where to perform the lookup
   669	 * @hwirq:	The HW irq number to convert to a logical one
   670	 * @lookup:	Whether to perform the domain lookup or not
   671	 * @regs:	Register file coming from the low-level handling code
   672	 *
   673	 * Returns:	0 on success, or -EINVAL if conversion has failed
   674	 */
   675	int __handle_domain_irq(struct irq_domain *domain, unsigned int hwirq,
   676				bool lookup, struct pt_regs *regs)
   677	{
   678		struct pt_regs *old_regs = set_irq_regs(regs);
   679		struct irq_desc *desc;
   680		int ret = 0;
   681	
   682		irq_enter();
   683	
   684		if (likely(IS_ENABLED(CONFIG_IRQ_DOMAIN) && lookup)) {
   685			/* The irqdomain code provides boundary checks */
 > 686			desc = irq_resolve_mapping(domain, hwirq);
   687		} else {
   688			/*
   689			 * Some hardware gives randomly wrong interrupts.  Rather
   690			 * than crashing, do something sensible.
   691			 */
   692			if (unlikely(!hwirq || hwirq >= nr_irqs)) {
   693				ack_bad_irq(hwirq);
   694				desc = NULL;
   695			} else {
   696				desc = irq_to_desc(hwirq);
   697			}
   698		}
   699	
   700		if (likely(desc))
   701			handle_irq_desc(desc);
   702		else
   703			ret = -EINVAL;
   704	
   705		irq_exit();
   706		set_irq_regs(old_regs);
   707		return ret;
   708	}
   709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
