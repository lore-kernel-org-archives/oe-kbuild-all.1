Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0669A49
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 05:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680757902; x=1712293902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V5chsu4WeXk9npFRIIvxS1433bK/50+KdihNiz13gIY=;
  b=LoSgKi8LqkyrtnPZyxITD+u1tLoe0Ko18Jod+u0oPGryn8LLD5l+GLMI
   XiXUXgT01JRGAddOtVpEuXFVmhxwxXOlfn2NbjaAqSjMUHYdAwvXFOKNj
   bdaNjKPVSP8pBKHk+TP1jOh/Q5aiDT9ZIbGrvqG6+94wTjxaqE3MamF/m
   IoQS1U/jB9RqfZUj3WUqwP6wbSG7lGn/8fce7GQARQEXsJeQXqFaxhHXM
   9RDJQ29FG1ANf9lUstMcuclI+yn8pTxiLXZUghoCPHmtPOW7Lz3gO5xA5
   /RIBEskxNRP3rLs6e4N+eBpqAA4UT+7CyOs1CAvA3e0NA83UUNsFLmC87
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407734342"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="407734342"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 22:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680525263"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="680525263"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 22:11:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkHuL-000R4x-1s;
	Thu, 06 Apr 2023 05:11:37 +0000
Date: Thu, 6 Apr 2023 13:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.4.y 4087/9999]
 drivers/net/bonding/bond_main.c:4844:17: warning: 'strncpy' specified bound
 16 equals destination size
Message-ID: <202304061336.p4OPwkHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Heiko,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
commit: 43dd03f088191e6c85529e649ebb5c54994486ee [4087/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-buildonly-randconfig-r005-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061336.p4OPwkHi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=43dd03f088191e6c85529e649ebb5c54994486ee
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 43dd03f088191e6c85529e649ebb5c54994486ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061336.p4OPwkHi-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                         ^~~~~~~~~~~~
   include/net/sch_generic.h:868:9: note: in expansion of macro 'this_cpu_inc'
     868 |         this_cpu_inc(sch->cpu_qstats->qlen);
         |         ^~~~~~~~~~~~
   include/net/sch_generic.h: In function 'qdisc_qstats_cpu_qlen_dec':
   arch/s390/include/asm/percpu.h:74:28: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      74 |             ((szcast)val__ > -129) && ((szcast)val__ < 128)) {          \
         |                            ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
      91 | #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:25: note: in expansion of macro 'this_cpu_add_8'
     380 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:519:41: note: in expansion of macro 'this_cpu_add'
     519 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:521:41: note: in expansion of macro 'this_cpu_sub'
     521 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/net/sch_generic.h:873:9: note: in expansion of macro 'this_cpu_dec'
     873 |         this_cpu_dec(sch->cpu_qstats->qlen);
         |         ^~~~~~~~~~~~
   include/net/sch_generic.h: In function 'qdisc_qstats_cpu_requeues_inc':
   arch/s390/include/asm/percpu.h:74:28: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      74 |             ((szcast)val__ > -129) && ((szcast)val__ < 128)) {          \
         |                            ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
      91 | #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:25: note: in expansion of macro 'this_cpu_add_8'
     380 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro 'this_cpu_add'
     520 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/net/sch_generic.h:878:9: note: in expansion of macro 'this_cpu_inc'
     878 |         this_cpu_inc(sch->cpu_qstats->requeues);
         |         ^~~~~~~~~~~~
   include/net/sch_generic.h: In function 'qdisc_qstats_cpu_drop':
   arch/s390/include/asm/percpu.h:74:28: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      74 |             ((szcast)val__ > -129) && ((szcast)val__ < 128)) {          \
         |                            ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
      91 | #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:25: note: in expansion of macro 'this_cpu_add_8'
     380 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro 'this_cpu_add'
     520 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/net/sch_generic.h:903:9: note: in expansion of macro 'this_cpu_inc'
     903 |         this_cpu_inc(sch->cpu_qstats->drops);
         |         ^~~~~~~~~~~~
   include/net/sch_generic.h: In function 'qdisc_update_stats_at_enqueue':
   arch/s390/include/asm/percpu.h:74:28: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      74 |             ((szcast)val__ > -129) && ((szcast)val__ < 128)) {          \
         |                            ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
      91 | #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:25: note: in expansion of macro 'this_cpu_add_8'
     380 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/net/sch_generic.h:1102:17: note: in expansion of macro 'this_cpu_add'
    1102 |                 this_cpu_add(sch->cpu_qstats->backlog, pkt_len);
         |                 ^~~~~~~~~~~~
   include/net/sch_generic.h: In function 'mini_qdisc_qstats_cpu_drop':
   arch/s390/include/asm/percpu.h:74:28: warning: comparison is always true due to limited range of data type [-Wtype-limits]
      74 |             ((szcast)val__ > -129) && ((szcast)val__ < 128)) {          \
         |                            ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
      91 | #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:25: note: in expansion of macro 'this_cpu_add_8'
     380 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro 'this_cpu_add'
     520 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/net/sch_generic.h:1270:9: note: in expansion of macro 'this_cpu_inc'
    1270 |         this_cpu_inc(miniq->cpu_qstats->drops);
         |         ^~~~~~~~~~~~
   drivers/net/bonding/bond_main.c: In function 'bond_check_params.constprop':
>> drivers/net/bonding/bond_main.c:4844:17: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
    4844 |                 strncpy(params->primary, primary, IFNAMSIZ);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +4844 drivers/net/bonding/bond_main.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  4466  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4467  static int bond_check_params(struct bond_params *params)
^1da177e4c3f41 Linus Torvalds       2005-04-16  4468  {
5a5c5fd48e3bcd nikolay@redhat.com   2013-05-18  4469  	int arp_validate_value, fail_over_mac_value, primary_reselect_value, i;
f3253339a47ff3 stephen hemminger    2014-03-04  4470  	struct bond_opt_value newval;
f3253339a47ff3 stephen hemminger    2014-03-04  4471  	const struct bond_opt_value *valptr;
72ccc471e13b82 Jarod Wilson         2017-05-19  4472  	int arp_all_targets_value = 0;
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4473  	u16 ad_actor_sys_prio = 0;
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4474  	u16 ad_user_port_key = 0;
72ccc471e13b82 Jarod Wilson         2017-05-19  4475  	__be32 arp_target[BOND_MAX_ARP_TARGETS] = { 0 };
dc9c4d0fe023b5 Mahesh Bandewar      2017-03-08  4476  	int arp_ip_count;
dc9c4d0fe023b5 Mahesh Bandewar      2017-03-08  4477  	int bond_mode	= BOND_MODE_ROUNDROBIN;
dc9c4d0fe023b5 Mahesh Bandewar      2017-03-08  4478  	int xmit_hashtype = BOND_XMIT_POLICY_LAYER2;
dc9c4d0fe023b5 Mahesh Bandewar      2017-03-08  4479  	int lacp_fast = 0;
f13ad104b4e886 Nikolay Aleksandrov  2017-09-12  4480  	int tlb_dynamic_lb;
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4481  
547942cace50e5 Nikolay Aleksandrov  2014-09-15  4482  	/* Convert string parameters. */
^1da177e4c3f41 Linus Torvalds       2005-04-16  4483  	if (mode) {
2b3798d5e1377c Nikolay Aleksandrov  2014-01-22  4484  		bond_opt_initstr(&newval, mode);
2b3798d5e1377c Nikolay Aleksandrov  2014-01-22  4485  		valptr = bond_opt_parse(bond_opt_get(BOND_OPT_MODE), &newval);
2b3798d5e1377c Nikolay Aleksandrov  2014-01-22  4486  		if (!valptr) {
2b3798d5e1377c Nikolay Aleksandrov  2014-01-22  4487  			pr_err("Error: Invalid bonding mode \"%s\"\n", mode);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4488  			return -EINVAL;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4489  		}
2b3798d5e1377c Nikolay Aleksandrov  2014-01-22  4490  		bond_mode = valptr->value;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4491  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4492  
169a3e66637c66 Jay Vosburgh         2005-06-26  4493  	if (xmit_hash_policy) {
e79c1055749e31 Debabrata Banerjee   2018-05-14  4494  		if (bond_mode == BOND_MODE_ROUNDROBIN ||
e79c1055749e31 Debabrata Banerjee   2018-05-14  4495  		    bond_mode == BOND_MODE_ACTIVEBACKUP ||
e79c1055749e31 Debabrata Banerjee   2018-05-14  4496  		    bond_mode == BOND_MODE_BROADCAST) {
a4aee5c808fc5b Joe Perches          2009-12-13  4497  			pr_info("xmit_hash_policy param is irrelevant in mode %s\n",
169a3e66637c66 Jay Vosburgh         2005-06-26  4498  				bond_mode_name(bond_mode));
169a3e66637c66 Jay Vosburgh         2005-06-26  4499  		} else {
a4b32ce7f891d5 Nikolay Aleksandrov  2014-01-22  4500  			bond_opt_initstr(&newval, xmit_hash_policy);
a4b32ce7f891d5 Nikolay Aleksandrov  2014-01-22  4501  			valptr = bond_opt_parse(bond_opt_get(BOND_OPT_XMIT_HASH),
a4b32ce7f891d5 Nikolay Aleksandrov  2014-01-22  4502  						&newval);
a4b32ce7f891d5 Nikolay Aleksandrov  2014-01-22  4503  			if (!valptr) {
a4aee5c808fc5b Joe Perches          2009-12-13  4504  				pr_err("Error: Invalid xmit_hash_policy \"%s\"\n",
169a3e66637c66 Jay Vosburgh         2005-06-26  4505  				       xmit_hash_policy);
169a3e66637c66 Jay Vosburgh         2005-06-26  4506  				return -EINVAL;
169a3e66637c66 Jay Vosburgh         2005-06-26  4507  			}
a4b32ce7f891d5 Nikolay Aleksandrov  2014-01-22  4508  			xmit_hashtype = valptr->value;
169a3e66637c66 Jay Vosburgh         2005-06-26  4509  		}
169a3e66637c66 Jay Vosburgh         2005-06-26  4510  	}
169a3e66637c66 Jay Vosburgh         2005-06-26  4511  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4512  	if (lacp_rate) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4513  		if (bond_mode != BOND_MODE_8023AD) {
a4aee5c808fc5b Joe Perches          2009-12-13  4514  			pr_info("lacp_rate param is irrelevant in mode %s\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4515  				bond_mode_name(bond_mode));
^1da177e4c3f41 Linus Torvalds       2005-04-16  4516  		} else {
d3131de76b1b1a Nikolay Aleksandrov  2014-01-22  4517  			bond_opt_initstr(&newval, lacp_rate);
d3131de76b1b1a Nikolay Aleksandrov  2014-01-22  4518  			valptr = bond_opt_parse(bond_opt_get(BOND_OPT_LACP_RATE),
d3131de76b1b1a Nikolay Aleksandrov  2014-01-22  4519  						&newval);
d3131de76b1b1a Nikolay Aleksandrov  2014-01-22  4520  			if (!valptr) {
a4aee5c808fc5b Joe Perches          2009-12-13  4521  				pr_err("Error: Invalid lacp rate \"%s\"\n",
d3131de76b1b1a Nikolay Aleksandrov  2014-01-22  4522  				       lacp_rate);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4523  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4524  			}
d3131de76b1b1a Nikolay Aleksandrov  2014-01-22  4525  			lacp_fast = valptr->value;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4526  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4527  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4528  
fd989c83325cb3 Jay Vosburgh         2008-11-04  4529  	if (ad_select) {
548d28bd0eac84 Nikolay Aleksandrov  2014-07-13  4530  		bond_opt_initstr(&newval, ad_select);
9e5f5eebe765b3 Nikolay Aleksandrov  2014-01-22  4531  		valptr = bond_opt_parse(bond_opt_get(BOND_OPT_AD_SELECT),
9e5f5eebe765b3 Nikolay Aleksandrov  2014-01-22  4532  					&newval);
9e5f5eebe765b3 Nikolay Aleksandrov  2014-01-22  4533  		if (!valptr) {
9e5f5eebe765b3 Nikolay Aleksandrov  2014-01-22  4534  			pr_err("Error: Invalid ad_select \"%s\"\n", ad_select);
fd989c83325cb3 Jay Vosburgh         2008-11-04  4535  			return -EINVAL;
fd989c83325cb3 Jay Vosburgh         2008-11-04  4536  		}
9e5f5eebe765b3 Nikolay Aleksandrov  2014-01-22  4537  		params->ad_select = valptr->value;
9e5f5eebe765b3 Nikolay Aleksandrov  2014-01-22  4538  		if (bond_mode != BOND_MODE_8023AD)
91565ebbcc5aea Joe Perches          2014-02-15  4539  			pr_warn("ad_select param only affects 802.3ad mode\n");
fd989c83325cb3 Jay Vosburgh         2008-11-04  4540  	} else {
fd989c83325cb3 Jay Vosburgh         2008-11-04  4541  		params->ad_select = BOND_AD_STABLE;
fd989c83325cb3 Jay Vosburgh         2008-11-04  4542  	}
fd989c83325cb3 Jay Vosburgh         2008-11-04  4543  
f584130616dfae Nicolas de Pesloüan  2009-08-28  4544  	if (max_bonds < 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4545  		pr_warn("Warning: max_bonds (%d) not in range %d-%d, so it was reset to BOND_DEFAULT_MAX_BONDS (%d)\n",
b8a9787eddb0e4 Jay Vosburgh         2008-06-13  4546  			max_bonds, 0, INT_MAX, BOND_DEFAULT_MAX_BONDS);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4547  		max_bonds = BOND_DEFAULT_MAX_BONDS;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4548  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4549  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4550  	if (miimon < 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4551  		pr_warn("Warning: miimon module parameter (%d), not in range 0-%d, so it was reset to 0\n",
b98d9c66e1c382 Nikolay Aleksandrov  2014-01-22  4552  			miimon, INT_MAX);
b98d9c66e1c382 Nikolay Aleksandrov  2014-01-22  4553  		miimon = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4554  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4555  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4556  	if (updelay < 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4557  		pr_warn("Warning: updelay module parameter (%d), not in range 0-%d, so it was reset to 0\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4558  			updelay, INT_MAX);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4559  		updelay = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4560  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4561  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4562  	if (downdelay < 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4563  		pr_warn("Warning: downdelay module parameter (%d), not in range 0-%d, so it was reset to 0\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4564  			downdelay, INT_MAX);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4565  		downdelay = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4566  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4567  
b3c898e20b1881 Debabrata Banerjee   2018-05-16  4568  	if ((use_carrier != 0) && (use_carrier != 1)) {
b3c898e20b1881 Debabrata Banerjee   2018-05-16  4569  		pr_warn("Warning: use_carrier module parameter (%d), not of valid value (0/1), so it was set to 1\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4570  			use_carrier);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4571  		use_carrier = 1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4572  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4573  
ad246c992bea6d Ben Hutchings        2011-04-26  4574  	if (num_peer_notif < 0 || num_peer_notif > 255) {
91565ebbcc5aea Joe Perches          2014-02-15  4575  		pr_warn("Warning: num_grat_arp/num_unsol_na (%d) not in range 0-255 so it was reset to 1\n",
ad246c992bea6d Ben Hutchings        2011-04-26  4576  			num_peer_notif);
ad246c992bea6d Ben Hutchings        2011-04-26  4577  		num_peer_notif = 1;
ad246c992bea6d Ben Hutchings        2011-04-26  4578  	}
ad246c992bea6d Ben Hutchings        2011-04-26  4579  
834db4bcdf937b dingtianhong         2013-12-21  4580  	/* reset values for 802.3ad/TLB/ALB */
267bed777a5f8a Veaceslav Falico     2014-05-15  4581  	if (!bond_mode_uses_arp(bond_mode)) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4582  		if (!miimon) {
91565ebbcc5aea Joe Perches          2014-02-15  4583  			pr_warn("Warning: miimon must be specified, otherwise bonding will not detect link failure, speed and duplex which are essential for 802.3ad operation\n");
91565ebbcc5aea Joe Perches          2014-02-15  4584  			pr_warn("Forcing miimon to 100msec\n");
fe9d04afe9bee0 dingtianhong         2013-11-22  4585  			miimon = BOND_DEFAULT_MIIMON;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4586  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4587  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4588  
bb1d912323d5dd Andy Gospodarek      2010-06-02  4589  	if (tx_queues < 1 || tx_queues > 255) {
91565ebbcc5aea Joe Perches          2014-02-15  4590  		pr_warn("Warning: tx_queues (%d) should be between 1 and 255, resetting to %d\n",
bb1d912323d5dd Andy Gospodarek      2010-06-02  4591  			tx_queues, BOND_DEFAULT_TX_QUEUES);
bb1d912323d5dd Andy Gospodarek      2010-06-02  4592  		tx_queues = BOND_DEFAULT_TX_QUEUES;
bb1d912323d5dd Andy Gospodarek      2010-06-02  4593  	}
bb1d912323d5dd Andy Gospodarek      2010-06-02  4594  
ebd8e4977a87cb Andy Gospodarek      2010-06-02  4595  	if ((all_slaves_active != 0) && (all_slaves_active != 1)) {
91565ebbcc5aea Joe Perches          2014-02-15  4596  		pr_warn("Warning: all_slaves_active module parameter (%d), not of valid value (0/1), so it was set to 0\n",
91565ebbcc5aea Joe Perches          2014-02-15  4597  			all_slaves_active);
ebd8e4977a87cb Andy Gospodarek      2010-06-02  4598  		all_slaves_active = 0;
ebd8e4977a87cb Andy Gospodarek      2010-06-02  4599  	}
ebd8e4977a87cb Andy Gospodarek      2010-06-02  4600  
c2952c314b4fe6 Flavio Leitner       2010-10-05  4601  	if (resend_igmp < 0 || resend_igmp > 255) {
91565ebbcc5aea Joe Perches          2014-02-15  4602  		pr_warn("Warning: resend_igmp (%d) should be between 0 and 255, resetting to %d\n",
c2952c314b4fe6 Flavio Leitner       2010-10-05  4603  			resend_igmp, BOND_DEFAULT_RESEND_IGMP);
c2952c314b4fe6 Flavio Leitner       2010-10-05  4604  		resend_igmp = BOND_DEFAULT_RESEND_IGMP;
c2952c314b4fe6 Flavio Leitner       2010-10-05  4605  	}
c2952c314b4fe6 Flavio Leitner       2010-10-05  4606  
aa59d8517d1017 Nikolay Aleksandrov  2014-01-22  4607  	bond_opt_initval(&newval, packets_per_slave);
aa59d8517d1017 Nikolay Aleksandrov  2014-01-22  4608  	if (!bond_opt_parse(bond_opt_get(BOND_OPT_PACKETS_PER_SLAVE), &newval)) {
73958329ea1fe0 Nikolay Aleksandrov  2013-11-05  4609  		pr_warn("Warning: packets_per_slave (%d) should be between 0 and %u resetting to 1\n",
73958329ea1fe0 Nikolay Aleksandrov  2013-11-05  4610  			packets_per_slave, USHRT_MAX);
73958329ea1fe0 Nikolay Aleksandrov  2013-11-05  4611  		packets_per_slave = 1;
73958329ea1fe0 Nikolay Aleksandrov  2013-11-05  4612  	}
73958329ea1fe0 Nikolay Aleksandrov  2013-11-05  4613  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4614  	if (bond_mode == BOND_MODE_ALB) {
a4aee5c808fc5b Joe Perches          2009-12-13  4615  		pr_notice("In ALB mode you might experience client disconnections upon reconnection of a link if the bonding module updelay parameter (%d msec) is incompatible with the forwarding delay time of the switch\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4616  			  updelay);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4617  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4618  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4619  	if (!miimon) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4620  		if (updelay || downdelay) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4621  			/* just warn the user the up/down delay will have
^1da177e4c3f41 Linus Torvalds       2005-04-16  4622  			 * no effect since miimon is zero...
^1da177e4c3f41 Linus Torvalds       2005-04-16  4623  			 */
91565ebbcc5aea Joe Perches          2014-02-15  4624  			pr_warn("Warning: miimon module parameter not set and updelay (%d) or downdelay (%d) module parameter is set; updelay and downdelay have no effect unless miimon is set\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4625  				updelay, downdelay);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4626  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4627  	} else {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4628  		/* don't allow arp monitoring */
^1da177e4c3f41 Linus Torvalds       2005-04-16  4629  		if (arp_interval) {
91565ebbcc5aea Joe Perches          2014-02-15  4630  			pr_warn("Warning: miimon (%d) and arp_interval (%d) can't be used simultaneously, disabling ARP monitoring\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4631  				miimon, arp_interval);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4632  			arp_interval = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4633  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4634  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4635  		if ((updelay % miimon) != 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4636  			pr_warn("Warning: updelay (%d) is not a multiple of miimon (%d), updelay rounded to %d ms\n",
91565ebbcc5aea Joe Perches          2014-02-15  4637  				updelay, miimon, (updelay / miimon) * miimon);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4638  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4639  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4640  		updelay /= miimon;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4641  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4642  		if ((downdelay % miimon) != 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4643  			pr_warn("Warning: downdelay (%d) is not a multiple of miimon (%d), downdelay rounded to %d ms\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4644  				downdelay, miimon,
^1da177e4c3f41 Linus Torvalds       2005-04-16  4645  				(downdelay / miimon) * miimon);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4646  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4647  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4648  		downdelay /= miimon;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4649  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4650  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4651  	if (arp_interval < 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4652  		pr_warn("Warning: arp_interval module parameter (%d), not in range 0-%d, so it was reset to 0\n",
7bdb04ed0dbf9f Nikolay Aleksandrov  2014-01-22  4653  			arp_interval, INT_MAX);
7bdb04ed0dbf9f Nikolay Aleksandrov  2014-01-22  4654  		arp_interval = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4655  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4656  
5a5c5fd48e3bcd nikolay@redhat.com   2013-05-18  4657  	for (arp_ip_count = 0, i = 0;
5a5c5fd48e3bcd nikolay@redhat.com   2013-05-18  4658  	     (arp_ip_count < BOND_MAX_ARP_TARGETS) && arp_ip_target[i]; i++) {
89015c18ff34a3 dingtianhong         2013-12-04  4659  		__be32 ip;
547942cace50e5 Nikolay Aleksandrov  2014-09-15  4660  
547942cace50e5 Nikolay Aleksandrov  2014-09-15  4661  		/* not a complete check, but good enough to catch mistakes */
89015c18ff34a3 dingtianhong         2013-12-04  4662  		if (!in4_pton(arp_ip_target[i], -1, (u8 *)&ip, -1, NULL) ||
2807a9feb23936 Veaceslav Falico     2014-05-15  4663  		    !bond_is_ip_target_ok(ip)) {
91565ebbcc5aea Joe Perches          2014-02-15  4664  			pr_warn("Warning: bad arp_ip_target module parameter (%s), ARP monitoring will not be performed\n",
5a5c5fd48e3bcd nikolay@redhat.com   2013-05-18  4665  				arp_ip_target[i]);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4666  			arp_interval = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4667  		} else {
0afee4e8b9fe4b Veaceslav Falico     2013-06-24  4668  			if (bond_get_targets_ip(arp_target, ip) == -1)
5a5c5fd48e3bcd nikolay@redhat.com   2013-05-18  4669  				arp_target[arp_ip_count++] = ip;
0afee4e8b9fe4b Veaceslav Falico     2013-06-24  4670  			else
91565ebbcc5aea Joe Perches          2014-02-15  4671  				pr_warn("Warning: duplicate address %pI4 in arp_ip_target, skipping\n",
0afee4e8b9fe4b Veaceslav Falico     2013-06-24  4672  					&ip);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4673  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4674  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4675  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4676  	if (arp_interval && !arp_ip_count) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4677  		/* don't allow arping if no arp_ip_target given... */
91565ebbcc5aea Joe Perches          2014-02-15  4678  		pr_warn("Warning: arp_interval module parameter (%d) specified without providing an arp_ip_target parameter, arp_interval was reset to 0\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4679  			arp_interval);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4680  		arp_interval = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4681  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4682  
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4683  	if (arp_validate) {
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4684  		if (!arp_interval) {
a4aee5c808fc5b Joe Perches          2009-12-13  4685  			pr_err("arp_validate requires arp_interval\n");
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4686  			return -EINVAL;
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4687  		}
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4688  
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4689  		bond_opt_initstr(&newval, arp_validate);
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4690  		valptr = bond_opt_parse(bond_opt_get(BOND_OPT_ARP_VALIDATE),
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4691  					&newval);
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4692  		if (!valptr) {
a4aee5c808fc5b Joe Perches          2009-12-13  4693  			pr_err("Error: invalid arp_validate \"%s\"\n",
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4694  			       arp_validate);
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4695  			return -EINVAL;
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4696  		}
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4697  		arp_validate_value = valptr->value;
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4698  	} else {
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4699  		arp_validate_value = 0;
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4700  	}
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4701  
8599b52e14a161 Veaceslav Falico     2013-06-24  4702  	if (arp_all_targets) {
edf36b24c58dbb Nikolay Aleksandrov  2014-01-22  4703  		bond_opt_initstr(&newval, arp_all_targets);
edf36b24c58dbb Nikolay Aleksandrov  2014-01-22  4704  		valptr = bond_opt_parse(bond_opt_get(BOND_OPT_ARP_ALL_TARGETS),
edf36b24c58dbb Nikolay Aleksandrov  2014-01-22  4705  					&newval);
edf36b24c58dbb Nikolay Aleksandrov  2014-01-22  4706  		if (!valptr) {
8599b52e14a161 Veaceslav Falico     2013-06-24  4707  			pr_err("Error: invalid arp_all_targets_value \"%s\"\n",
8599b52e14a161 Veaceslav Falico     2013-06-24  4708  			       arp_all_targets);
8599b52e14a161 Veaceslav Falico     2013-06-24  4709  			arp_all_targets_value = 0;
edf36b24c58dbb Nikolay Aleksandrov  2014-01-22  4710  		} else {
edf36b24c58dbb Nikolay Aleksandrov  2014-01-22  4711  			arp_all_targets_value = valptr->value;
8599b52e14a161 Veaceslav Falico     2013-06-24  4712  		}
8599b52e14a161 Veaceslav Falico     2013-06-24  4713  	}
8599b52e14a161 Veaceslav Falico     2013-06-24  4714  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4715  	if (miimon) {
a4aee5c808fc5b Joe Perches          2009-12-13  4716  		pr_info("MII link monitoring set to %d ms\n", miimon);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4717  	} else if (arp_interval) {
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4718  		valptr = bond_opt_get_val(BOND_OPT_ARP_VALIDATE,
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4719  					  arp_validate_value);
a4aee5c808fc5b Joe Perches          2009-12-13  4720  		pr_info("ARP monitoring set to %d ms, validate %s, with %d target(s):",
162288810c9ebd Nikolay Aleksandrov  2014-01-22  4721  			arp_interval, valptr->string, arp_ip_count);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4722  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4723  		for (i = 0; i < arp_ip_count; i++)
90194264ceffdf Joe Perches          2014-02-15  4724  			pr_cont(" %s", arp_ip_target[i]);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4725  
90194264ceffdf Joe Perches          2014-02-15  4726  		pr_cont("\n");
^1da177e4c3f41 Linus Torvalds       2005-04-16  4727  
b8a9787eddb0e4 Jay Vosburgh         2008-06-13  4728  	} else if (max_bonds) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4729  		/* miimon and arp_interval not set, we need one so things
^1da177e4c3f41 Linus Torvalds       2005-04-16  4730  		 * work as expected, see bonding.txt for details
^1da177e4c3f41 Linus Torvalds       2005-04-16  4731  		 */
90194264ceffdf Joe Perches          2014-02-15  4732  		pr_debug("Warning: either miimon or arp_interval and arp_ip_target module parameters must be specified, otherwise bonding will not detect link failures! see bonding.txt for details\n");
^1da177e4c3f41 Linus Torvalds       2005-04-16  4733  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4734  
ec0865a94991d1 Veaceslav Falico     2014-05-15  4735  	if (primary && !bond_mode_uses_primary(bond_mode)) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  4736  		/* currently, using a primary only makes sense
^1da177e4c3f41 Linus Torvalds       2005-04-16  4737  		 * in active backup, TLB or ALB modes
^1da177e4c3f41 Linus Torvalds       2005-04-16  4738  		 */
91565ebbcc5aea Joe Perches          2014-02-15  4739  		pr_warn("Warning: %s primary device specified but has no effect in %s mode\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  4740  			primary, bond_mode_name(bond_mode));
^1da177e4c3f41 Linus Torvalds       2005-04-16  4741  		primary = NULL;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4742  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4743  
a549952ad323d6 Jiri Pirko           2009-09-25  4744  	if (primary && primary_reselect) {
388d3a6d4aa356 Nikolay Aleksandrov  2014-01-22  4745  		bond_opt_initstr(&newval, primary_reselect);
388d3a6d4aa356 Nikolay Aleksandrov  2014-01-22  4746  		valptr = bond_opt_parse(bond_opt_get(BOND_OPT_PRIMARY_RESELECT),
388d3a6d4aa356 Nikolay Aleksandrov  2014-01-22  4747  					&newval);
388d3a6d4aa356 Nikolay Aleksandrov  2014-01-22  4748  		if (!valptr) {
a4aee5c808fc5b Joe Perches          2009-12-13  4749  			pr_err("Error: Invalid primary_reselect \"%s\"\n",
388d3a6d4aa356 Nikolay Aleksandrov  2014-01-22  4750  			       primary_reselect);
a549952ad323d6 Jiri Pirko           2009-09-25  4751  			return -EINVAL;
a549952ad323d6 Jiri Pirko           2009-09-25  4752  		}
388d3a6d4aa356 Nikolay Aleksandrov  2014-01-22  4753  		primary_reselect_value = valptr->value;
a549952ad323d6 Jiri Pirko           2009-09-25  4754  	} else {
a549952ad323d6 Jiri Pirko           2009-09-25  4755  		primary_reselect_value = BOND_PRI_RESELECT_ALWAYS;
a549952ad323d6 Jiri Pirko           2009-09-25  4756  	}
a549952ad323d6 Jiri Pirko           2009-09-25  4757  
3915c1e8634a32 Jay Vosburgh         2008-05-17  4758  	if (fail_over_mac) {
1df6b6aa334c99 Nikolay Aleksandrov  2014-01-22  4759  		bond_opt_initstr(&newval, fail_over_mac);
1df6b6aa334c99 Nikolay Aleksandrov  2014-01-22  4760  		valptr = bond_opt_parse(bond_opt_get(BOND_OPT_FAIL_OVER_MAC),
1df6b6aa334c99 Nikolay Aleksandrov  2014-01-22  4761  					&newval);
1df6b6aa334c99 Nikolay Aleksandrov  2014-01-22  4762  		if (!valptr) {
a4aee5c808fc5b Joe Perches          2009-12-13  4763  			pr_err("Error: invalid fail_over_mac \"%s\"\n",
1df6b6aa334c99 Nikolay Aleksandrov  2014-01-22  4764  			       fail_over_mac);
3915c1e8634a32 Jay Vosburgh         2008-05-17  4765  			return -EINVAL;
3915c1e8634a32 Jay Vosburgh         2008-05-17  4766  		}
1df6b6aa334c99 Nikolay Aleksandrov  2014-01-22  4767  		fail_over_mac_value = valptr->value;
3915c1e8634a32 Jay Vosburgh         2008-05-17  4768  		if (bond_mode != BOND_MODE_ACTIVEBACKUP)
91565ebbcc5aea Joe Perches          2014-02-15  4769  			pr_warn("Warning: fail_over_mac only affects active-backup mode\n");
3915c1e8634a32 Jay Vosburgh         2008-05-17  4770  	} else {
3915c1e8634a32 Jay Vosburgh         2008-05-17  4771  		fail_over_mac_value = BOND_FOM_NONE;
3915c1e8634a32 Jay Vosburgh         2008-05-17  4772  	}
dd957c57c52a39 Jay Vosburgh         2007-10-09  4773  
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4774  	bond_opt_initstr(&newval, "default");
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4775  	valptr = bond_opt_parse(
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4776  			bond_opt_get(BOND_OPT_AD_ACTOR_SYS_PRIO),
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4777  				     &newval);
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4778  	if (!valptr) {
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4779  		pr_err("Error: No ad_actor_sys_prio default value");
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4780  		return -EINVAL;
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4781  	}
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4782  	ad_actor_sys_prio = valptr->value;
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4783  
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4784  	valptr = bond_opt_parse(bond_opt_get(BOND_OPT_AD_USER_PORT_KEY),
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4785  				&newval);
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4786  	if (!valptr) {
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4787  		pr_err("Error: No ad_user_port_key default value");
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4788  		return -EINVAL;
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4789  	}
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4790  	ad_user_port_key = valptr->value;
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4791  
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4792  	bond_opt_initstr(&newval, "default");
f13ad104b4e886 Nikolay Aleksandrov  2017-09-12  4793  	valptr = bond_opt_parse(bond_opt_get(BOND_OPT_TLB_DYNAMIC_LB), &newval);
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4794  	if (!valptr) {
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4795  		pr_err("Error: No tlb_dynamic_lb default value");
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4796  		return -EINVAL;
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4797  	}
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4798  	tlb_dynamic_lb = valptr->value;
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4799  
3a7129e52766f0 dingtianhong         2013-12-21  4800  	if (lp_interval == 0) {
91565ebbcc5aea Joe Perches          2014-02-15  4801  		pr_warn("Warning: ip_interval must be between 1 and %d, so it was reset to %d\n",
3a7129e52766f0 dingtianhong         2013-12-21  4802  			INT_MAX, BOND_ALB_DEFAULT_LP_INTERVAL);
3a7129e52766f0 dingtianhong         2013-12-21  4803  		lp_interval = BOND_ALB_DEFAULT_LP_INTERVAL;
3a7129e52766f0 dingtianhong         2013-12-21  4804  	}
3a7129e52766f0 dingtianhong         2013-12-21  4805  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4806  	/* fill params struct with the proper values */
^1da177e4c3f41 Linus Torvalds       2005-04-16  4807  	params->mode = bond_mode;
169a3e66637c66 Jay Vosburgh         2005-06-26  4808  	params->xmit_policy = xmit_hashtype;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4809  	params->miimon = miimon;
ad246c992bea6d Ben Hutchings        2011-04-26  4810  	params->num_peer_notif = num_peer_notif;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4811  	params->arp_interval = arp_interval;
f5b2b966f032f2 Jay Vosburgh         2006-09-22  4812  	params->arp_validate = arp_validate_value;
8599b52e14a161 Veaceslav Falico     2013-06-24  4813  	params->arp_all_targets = arp_all_targets_value;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4814  	params->updelay = updelay;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4815  	params->downdelay = downdelay;
07a4ddec3ce9b0 Vincent Bernat       2019-07-02  4816  	params->peer_notif_delay = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4817  	params->use_carrier = use_carrier;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4818  	params->lacp_fast = lacp_fast;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4819  	params->primary[0] = 0;
a549952ad323d6 Jiri Pirko           2009-09-25  4820  	params->primary_reselect = primary_reselect_value;
3915c1e8634a32 Jay Vosburgh         2008-05-17  4821  	params->fail_over_mac = fail_over_mac_value;
bb1d912323d5dd Andy Gospodarek      2010-06-02  4822  	params->tx_queues = tx_queues;
ebd8e4977a87cb Andy Gospodarek      2010-06-02  4823  	params->all_slaves_active = all_slaves_active;
c2952c314b4fe6 Flavio Leitner       2010-10-05  4824  	params->resend_igmp = resend_igmp;
655f8919d549ad stephen hemminger    2011-06-22  4825  	params->min_links = min_links;
3a7129e52766f0 dingtianhong         2013-12-21  4826  	params->lp_interval = lp_interval;
73958329ea1fe0 Nikolay Aleksandrov  2013-11-05  4827  	params->packets_per_slave = packets_per_slave;
8b426dc54cf405 Mahesh Bandewar      2017-03-08  4828  	params->tlb_dynamic_lb = tlb_dynamic_lb;
6791e4661c4bd3 Mahesh Bandewar      2015-05-09  4829  	params->ad_actor_sys_prio = ad_actor_sys_prio;
74514957552edd Mahesh Bandewar      2015-05-09  4830  	eth_zero_addr(params->ad_actor_system);
d22a5fc0c32edc Mahesh Bandewar      2015-05-09  4831  	params->ad_user_port_key = ad_user_port_key;
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4832  	if (packets_per_slave > 0) {
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4833  		params->reciprocal_packets_per_slave =
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4834  			reciprocal_value(packets_per_slave);
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4835  	} else {
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4836  		/* reciprocal_packets_per_slave is unused if
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4837  		 * packets_per_slave is 0 or 1, just initialize it
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4838  		 */
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4839  		params->reciprocal_packets_per_slave =
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4840  			(struct reciprocal_value) { 0 };
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4841  	}
809fa972fd90ff Hannes Frederic Sowa 2014-01-22  4842  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4843  	if (primary) {
^1da177e4c3f41 Linus Torvalds       2005-04-16 @4844  		strncpy(params->primary, primary, IFNAMSIZ);
^1da177e4c3f41 Linus Torvalds       2005-04-16  4845  		params->primary[IFNAMSIZ - 1] = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4846  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  4847  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4848  	memcpy(params->arp_targets, arp_target, sizeof(arp_target));
^1da177e4c3f41 Linus Torvalds       2005-04-16  4849  
^1da177e4c3f41 Linus Torvalds       2005-04-16  4850  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  4851  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  4852  

:::::: The code at line 4844 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
