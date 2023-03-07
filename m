Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586BAD49
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678204152; x=1709740152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3edgdJsiTQ4SKFuvc73XnK2GTHJ0B21nW0PP2OLxYnE=;
  b=AEkw8n5G+o0IiIzM8Ddwgm9fu/KsJOhsQm3bneu7AdLiz2X60Go/hZx0
   XD8iTQKcn3F6ItDdjtYhNcFAehnA+gYHC7o2sr8tAPZa1kXk8igBD63IT
   9uyoUdDVEzHYs7McbP1o2yL5GSlmi6+yHD/wok0HgcPD/JKUT7uF1ZHWT
   MgpeTYFbOI+SfaM73P/ejBeerS0XKw0jneyG5LBQ+RlBxe2iU2Gm76ilD
   7vt3eHF++BO7/S6z+d55t3VmsDyI4fK9Yqav0G0u4Q+2vK3kaFMm2j/U3
   JTVSZlyzLmzQ9x9/brRkTU52Wfc4qe8BdNzz5XUuU0MKKzCKQ4eWRizPm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337402691"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="337402691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 07:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626583037"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="626583037"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 07:49:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZZYs-0001R1-0C;
	Tue, 07 Mar 2023 15:49:10 +0000
Date: Tue, 7 Mar 2023 23:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 353/362] kernel/irq/irqdesc.c:686:22:
 warning: assignment to 'struct irq_desc *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202303072345.8JJDbdLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   0611c6d676d5a83fe19b4a45aa27c12b0e443f96
commit: fe54ee952d7c8b87ef1403edac3dbfb7cb62359e [353/362] genirq: Use irq_resolve_mapping() to implement __handle_domain_irq() and co
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230307/202303072345.8JJDbdLK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=fe54ee952d7c8b87ef1403edac3dbfb7cb62359e
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout fe54ee952d7c8b87ef1403edac3dbfb7cb62359e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash kernel/irq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072345.8JJDbdLK-lkp@intel.com/

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
