Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D65154BB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq0awlP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701618537; x=1733154537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rTXkXe84fKCKWIgjxlTWsd7qjtszTAoU0qEs/cHZZbM=;
  b=mq0awlP6K+qAm+SzUXr7mvuYofnsWqtBrDuR0f5oU5n+5KL8TKf2lJ9a
   2z+VuGxU2r+TE1BNfjsd0GWw0+jfc62gUoHb+/qstdWGpGd1z5AZuMQ9S
   gzst8CkUscBm70QA/shNPWjssapte9XRfU3VH/qkqUEYzxoQjvE32HVPN
   dB3AZhki7qEegwVntKut2fWni1l/yL4stmh2aP4p1gFoJCl/EWYaCwAKI
   iqUc7tUTwxtcXkL149tGvBOVb1rB0T/a0cauxEn16JrlMayE7xzncdXaG
   nbhd3fwt+EMcs84IXzJONtfOpRZijaAVEy9yNmGZVc0DLOCpbJkiio7W8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378683559"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="378683559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 07:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="893737728"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="893737728"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Dec 2023 07:48:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9oi9-0006nU-1P;
	Sun, 03 Dec 2023 15:48:49 +0000
Date: Sun, 3 Dec 2023 23:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: kernel/irq/irqdomain.c:70: warning: Function parameter or member
 'fwnode' not described in 'irq_domain_free_fwnode'
Message-ID: <202312032328.bQoJiekV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: b145dcc45a6af0abfcf9b4de8006d40559c50fc6 irqdomain: Add a fwnode_handle allocator
date:   8 years ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231203/202312032328.bQoJiekV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312032328.bQoJiekV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312032328.bQoJiekV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/of.h:21,
                    from include/linux/irqdomain.h:37,
                    from kernel/irq/irqdomain.c:8:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
>> kernel/irq/irqdomain.c:70: warning: Function parameter or member 'fwnode' not described in 'irq_domain_free_fwnode'
   kernel/irq/irqdomain.c:98: warning: Function parameter or member 'fwnode' not described in '__irq_domain_add'
   kernel/irq/irqdomain.c:98: warning: Excess function parameter 'of_node' description in '__irq_domain_add'
   kernel/irq/irqdomain.c:779: warning: Function parameter or member 'd' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:779: warning: Function parameter or member 'ctrlr' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:779: warning: Function parameter or member 'intspec' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:779: warning: Function parameter or member 'intsize' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:779: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:779: warning: Function parameter or member 'out_type' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:798: warning: Function parameter or member 'd' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:798: warning: Function parameter or member 'ctrlr' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:798: warning: Function parameter or member 'intspec' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:798: warning: Function parameter or member 'intsize' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:798: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:798: warning: Function parameter or member 'out_type' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:822: warning: Function parameter or member 'd' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:822: warning: Function parameter or member 'ctrlr' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:822: warning: Function parameter or member 'intspec' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:822: warning: Function parameter or member 'intsize' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:822: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:822: warning: Function parameter or member 'out_type' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1258: warning: Function parameter or member 'domain' not described in 'irq_domain_alloc_irqs_parent'
   kernel/irq/irqdomain.c:1280: warning: Function parameter or member 'domain' not described in 'irq_domain_free_irqs_parent'


vim +70 kernel/irq/irqdomain.c

    63	
    64	/**
    65	 * irq_domain_free_fwnode - Free a non-OF-backed fwnode_handle
    66	 *
    67	 * Free a fwnode_handle allocated with irq_domain_alloc_fwnode.
    68	 */
    69	void irq_domain_free_fwnode(struct fwnode_handle *fwnode)
  > 70	{
    71		struct irqchip_fwid *fwid;
    72	
    73		if (WARN_ON(fwnode->type != FWNODE_IRQCHIP))
    74			return;
    75	
    76		fwid = container_of(fwnode, struct irqchip_fwid, fwnode);
    77		kfree(fwid->name);
    78		kfree(fwid);
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
