Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F6E13D638
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023940; cv=none; b=IF3L20XEkIcY32m9Zu7aO4c+29TLci5aN6uLpfXRdcatpg1A5SVfIKW4C6E7+Jp/msD4/0PeEAzaPAH/Et9geUIb86Vt8x3MWFReydhCw6olJlLtv6GgrBNSA9FQQyr6PxwnTXDmumcW0Fhhxnj5duog086Xy7T/Xpd6Vx5T6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023940; c=relaxed/simple;
	bh=r86QZV1S7zpO3CXlnwUU58l/iax1eNy2cv03MCtDTpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/0P0rI4z5Eha+e1WfgoyojF7qrBR5LTeArhQg70WG69uyhWa58zUhms5+vt8HJ91wwe6MGsnYI0VBCPZMaSewn4Ihg25+/RZclixsXezj8L/5pc8wWSNVX6IuQju0uiO2wnbbSclFnzKdm+Lkc4Infwp0gysVQsO+a6m8Eh1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G82+5R5b; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G82+5R5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758023938; x=1789559938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r86QZV1S7zpO3CXlnwUU58l/iax1eNy2cv03MCtDTpk=;
  b=G82+5R5bJPkuNv53sGp7rr9Mwynd9igAc2JjhRyd2DkCKtNyMODqsO1/
   uTLL4EDQ0SZ4C3ZhGzJ7VT/+VAQKc1STujEB1guz4TPsucfbeEvBXLo13
   BrbF5tepr5Qtw++fXgsqszbsLjq0z+BH7hBoiIHpgMRl8kg+s9EfIZmDM
   F0T0drIP8cHnyJLH1eB4JvwhpJIxJlcFXenzTyj7m/gIKjwansJd2ceAX
   fdFfK2xprUJcmy7IHueYCDOSijurNt55WN3nbIKvhtePWsfRz1ckM4uPI
   0k9iT59MkEo/umHGemcAUXvq9Do9mfFu+thkETa2eRpWcNnsXbtrpVvS5
   A==;
X-CSE-ConnectionGUID: mtftdlAUTr2xfE2/5EulNQ==
X-CSE-MsgGUID: OrAgiFemRp23tL0pbp1ZlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="82896895"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="82896895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 04:58:57 -0700
X-CSE-ConnectionGUID: 0GejUQGgQLC62jRMcgXrfA==
X-CSE-MsgGUID: 9OivPlyWT1a8+OkV0RIyHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="212089208"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2025 04:58:55 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyUKi-0000Eh-29;
	Tue, 16 Sep 2025 11:58:52 +0000
Date: Tue, 16 Sep 2025 19:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Donald Dutile <ddutile@redhat.com>
Subject: [jgunthorpe:pcie_switch_groups 6/13] drivers/pci/search.c:116:31:
 error: return type is an incomplete type
Message-ID: <202509161942.u5F8vqOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   359e58e015929f167700789bde9365e492d57b00
commit: 688297d25e0f7174014a30f873b36632eae65c38 [6/13] PCI: Add pci_reachable_bus_set()
config: i386-buildonly-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161942.u5F8vqOk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161942.u5F8vqOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161942.u5F8vqOk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/search.c:11:
   include/linux/pci.h:866:9: warning: "/*" within comment [-Wcomment]
     866 |         /*
   include/linux/pci.h:871:9: warning: data definition has no type or storage class
     871 |         PCIE_ISOLATED,
         |         ^~~~~~~~~~~~~
   include/linux/pci.h:871:9: error: type defaults to 'int' in declaration of 'PCIE_ISOLATED' [-Wimplicit-int]
   include/linux/pci.h:876:9: error: type defaults to 'int' in declaration of 'PCIE_SWITCH_DSP_NON_ISOLATED' [-Wimplicit-int]
     876 |         PCIE_SWITCH_DSP_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:878:9: error: type defaults to 'int' in declaration of 'PCIE_NON_ISOLATED' [-Wimplicit-int]
     878 |         PCIE_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/pci.h:884:9: error: type defaults to 'int' in declaration of 'PCI_BUS_NON_ISOLATED' [-Wimplicit-int]
     884 |         PCI_BUS_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:889:9: error: type defaults to 'int' in declaration of 'PCI_BRIDGE_NON_ISOLATED' [-Wimplicit-int]
     889 |         PCI_BRIDGE_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:890:1: error: expected identifier or '(' before '}' token
     890 | };
         | ^
   include/linux/pci.h:1280:35: warning: 'struct pci_reachable_set' declared inside parameter list will not be visible outside of this definition or declaration
    1280 |                            struct pci_reachable_set *devfns,
         |                                   ^~~~~~~~~~~~~~~~~
>> drivers/pci/search.c:116:31: error: return type is an incomplete type
     116 | static enum pci_bus_isolation pcie_switch_isolated(struct pci_bus *bus)
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c: In function 'pcie_switch_isolated':
>> drivers/pci/search.c:137:32: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     137 |                         return PCIE_NON_ISOLATED;
         |                                ^~~~~~~~~~~~~~~~~
   drivers/pci/search.c:116:31: note: declared here
     116 | static enum pci_bus_isolation pcie_switch_isolated(struct pci_bus *bus)
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:140:32: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     140 |                         return PCIE_SWITCH_DSP_NON_ISOLATED;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:116:31: note: declared here
     116 | static enum pci_bus_isolation pcie_switch_isolated(struct pci_bus *bus)
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:142:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     142 |         return PCIE_ISOLATED;
         |                ^~~~~~~~~~~~~
   drivers/pci/search.c:116:31: note: declared here
     116 | static enum pci_bus_isolation pcie_switch_isolated(struct pci_bus *bus)
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c: At top level:
   drivers/pci/search.c:190:24: error: return type is an incomplete type
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
>> drivers/pci/search.c:190:24: error: conflicting types for 'pci_bus_isolated'; have 'void(struct pci_bus *)'
   include/linux/pci.h:1283:24: note: previous declaration of 'pci_bus_isolated' with type 'enum pci_bus_isolation(struct pci_bus *)'
    1283 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus);
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c: In function 'pci_bus_isolated':
   drivers/pci/search.c:206:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     206 |                 return PCIE_ISOLATED;
         |                        ^~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:214:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     214 |                 return PCI_BRIDGE_NON_ISOLATED;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:228:32: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     228 |                         return PCI_BRIDGE_NON_ISOLATED;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:242:32: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     242 |                         return PCIE_NON_ISOLATED;
         |                                ^~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:243:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     243 |                 return PCIE_ISOLATED;
         |                        ^~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:252:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     252 |                 return PCIE_ISOLATED;
         |                        ^~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:275:32: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     275 |                         return PCI_BRIDGE_NON_ISOLATED;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:276:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     276 |                 return PCI_BUS_NON_ISOLATED;
         |                        ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:285:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     285 |                 return PCI_BRIDGE_NON_ISOLATED;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:288:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     288 |                 return PCI_BRIDGE_NON_ISOLATED;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c:190:24: note: declared here
     190 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   drivers/pci/search.c: At top level:
>> drivers/pci/search.c:624:35: warning: 'struct pci_reachable_set' declared inside parameter list will not be visible outside of this definition or declaration
     624 |                            struct pci_reachable_set *devfns,
         |                                   ^~~~~~~~~~~~~~~~~
>> drivers/pci/search.c:623:6: error: conflicting types for 'pci_reachable_bus_set'; have 'void(struct pci_dev *, struct pci_reachable_set *, bool (*)(struct pci_dev *, struct pci_dev *))' {aka 'void(struct pci_dev *, struct pci_reachable_set *, _Bool (*)(struct pci_dev *, struct pci_dev *))'}
     623 | void pci_reachable_bus_set(struct pci_dev *start,
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1279:6: note: previous declaration of 'pci_reachable_bus_set' with type 'void(struct pci_dev *, struct pci_reachable_set *, bool (*)(struct pci_dev *, struct pci_dev *))' {aka 'void(struct pci_dev *, struct pci_reachable_set *, _Bool (*)(struct pci_dev *, struct pci_dev *))'}
    1279 | void pci_reachable_bus_set(struct pci_dev *start,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/search.c: In function 'pci_reachable_bus_set':
>> drivers/pci/search.c:628:16: error: variable 'new_devfns' has initializer but incomplete type
     628 |         struct pci_reachable_set new_devfns = {};
         |                ^~~~~~~~~~~~~~~~~
>> drivers/pci/search.c:628:34: error: storage size of 'new_devfns' isn't known
     628 |         struct pci_reachable_set new_devfns = {};
         |                                  ^~~~~~~~~~
>> drivers/pci/search.c:629:16: error: variable 'next_devfns' has initializer but incomplete type
     629 |         struct pci_reachable_set next_devfns = {};
         |                ^~~~~~~~~~~~~~~~~
>> drivers/pci/search.c:629:34: error: storage size of 'next_devfns' isn't known
     629 |         struct pci_reachable_set next_devfns = {};
         |                                  ^~~~~~~~~~~
   In file included from include/linux/bitfield.h:10,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:382,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27:
>> drivers/pci/search.c:634:23: error: expression in static assertion is not an integer
     634 |         static_assert(sizeof(next_devfns.devfns) * BITS_PER_BYTE >=
         |                       ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/pci/search.c:634:9: note: in expansion of macro 'static_assert'
     634 |         static_assert(sizeof(next_devfns.devfns) * BITS_PER_BYTE >=
         |         ^~~~~~~~~~~~~
>> drivers/pci/search.c:638:40: error: invalid use of undefined type 'struct pci_reachable_set'
     638 |         memset(devfns, 0, sizeof(devfns->devfns));
         |                                        ^~
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/pci/search.c:638:9: note: in expansion of macro 'memset'
     638 |         memset(devfns, 0, sizeof(devfns->devfns));
         |         ^~~~~~
   In file included from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35:
   drivers/pci/search.c:639:39: error: invalid use of undefined type 'struct pci_reachable_set'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |                                       ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/pci/search.c:639:9: note: in expansion of macro '__set_bit'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |         ^~~~~~~~~
   drivers/pci/search.c:639:39: error: invalid use of undefined type 'struct pci_reachable_set'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |                                       ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/pci/search.c:639:9: note: in expansion of macro '__set_bit'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |         ^~~~~~~~~
   drivers/pci/search.c:639:39: error: invalid use of undefined type 'struct pci_reachable_set'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |                                       ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/pci/search.c:639:9: note: in expansion of macro '__set_bit'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |         ^~~~~~~~~
   drivers/pci/search.c:639:39: error: invalid use of undefined type 'struct pci_reachable_set'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |                                       ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/pci/search.c:639:9: note: in expansion of macro '__set_bit'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |         ^~~~~~~~~
   drivers/pci/search.c:639:39: error: invalid use of undefined type 'struct pci_reachable_set'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |                                       ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/pci/search.c:639:9: note: in expansion of macro '__set_bit'
     639 |         __set_bit(start->devfn, devfns->devfns);
         |         ^~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12:
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   drivers/pci/search.c:652:17: note: in expansion of macro 'for_each_set_bit'
     652 |                 for_each_set_bit(devfna, next_devfns.devfns, MAX_NR_DEVFNS) {
         |                 ^~~~~~~~~~~~~~~~
   drivers/pci/search.c:660:65: error: invalid use of undefined type 'struct pci_reachable_set'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                                                 ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/pci/search.c:660:37: note: in expansion of macro 'test_bit'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                     ^~~~~~~~
   drivers/pci/search.c:660:65: error: invalid use of undefined type 'struct pci_reachable_set'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                                                 ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/pci/search.c:660:37: note: in expansion of macro 'test_bit'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                     ^~~~~~~~
   drivers/pci/search.c:660:65: error: invalid use of undefined type 'struct pci_reachable_set'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                                                 ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/pci/search.c:660:37: note: in expansion of macro 'test_bit'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                     ^~~~~~~~
   drivers/pci/search.c:660:65: error: invalid use of undefined type 'struct pci_reachable_set'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                                                 ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/pci/search.c:660:37: note: in expansion of macro 'test_bit'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                     ^~~~~~~~
   drivers/pci/search.c:660:65: error: invalid use of undefined type 'struct pci_reachable_set'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                                                 ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/pci/search.c:660:37: note: in expansion of macro 'test_bit'
     660 |                                 if (test_bit(devb->devfn, devfns->devfns))
         |                                     ^~~~~~~~
   In file included from include/linux/string.h:6:
   drivers/pci/search.c:691:51: error: invalid use of undefined type 'struct pci_reachable_set'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                                   ^~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/pci/search.c:691:51: error: invalid use of undefined type 'struct pci_reachable_set'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                                   ^~
   include/linux/array_size.h:11:48: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   In file included from include/linux/array_size.h:5:
   drivers/pci/search.c:691:51: error: invalid use of undefined type 'struct pci_reachable_set'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                                   ^~
   include/linux/compiler.h:197:84: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/compiler.h:201:35: note: in expansion of macro '__same_type'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:202:58: note: in expansion of macro '__is_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                          ^~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/pci/search.c:691:34: note: in expansion of macro 'ARRAY_SIZE'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                  ^~~~~~~~~~
   drivers/pci/search.c:691:51: error: invalid use of undefined type 'struct pci_reachable_set'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                                   ^~
   include/linux/compiler.h:197:84: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/compiler.h:201:35: note: in expansion of macro '__same_type'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:202:58: note: in expansion of macro '__is_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                          ^~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/pci/search.c:691:34: note: in expansion of macro 'ARRAY_SIZE'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                  ^~~~~~~~~~
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/pci/search.c:691:34: note: in expansion of macro 'ARRAY_SIZE'
     691 |                 for (i = 0; i != ARRAY_SIZE(devfns->devfns); i++) {
         |                                  ^~~~~~~~~~
   drivers/pci/search.c:692:31: error: invalid use of undefined type 'struct pci_reachable_set'
     692 |                         devfns->devfns[i] |= new_devfns.devfns[i];
         |                               ^~
>> drivers/pci/search.c:629:34: warning: unused variable 'next_devfns' [-Wunused-variable]
     629 |         struct pci_reachable_set next_devfns = {};
         |                                  ^~~~~~~~~~~
>> drivers/pci/search.c:628:34: warning: unused variable 'new_devfns' [-Wunused-variable]
     628 |         struct pci_reachable_set new_devfns = {};
         |                                  ^~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6:
   drivers/pci/search.c: At top level:
   drivers/pci/search.c:699:19: error: conflicting types for 'pci_reachable_bus_set'; have 'void(struct pci_dev *, struct pci_reachable_set *, bool (*)(struct pci_dev *, struct pci_dev *))' {aka 'void(struct pci_dev *, struct pci_reachable_set *, _Bool (*)(struct pci_dev *, struct pci_dev *))'}
     699 | EXPORT_SYMBOL_GPL(pci_reachable_bus_set);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/pci/search.c:699:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     699 | EXPORT_SYMBOL_GPL(pci_reachable_bus_set);
         | ^~~~~~~~~~~~~~~~~
   include/linux/pci.h:1279:6: note: previous declaration of 'pci_reachable_bus_set' with type 'void(struct pci_dev *, struct pci_reachable_set *, bool (*)(struct pci_dev *, struct pci_dev *))' {aka 'void(struct pci_dev *, struct pci_reachable_set *, _Bool (*)(struct pci_dev *, struct pci_dev *))'}
    1279 | void pci_reachable_bus_set(struct pci_dev *start,
         |      ^~~~~~~~~~~~~~~~~~~~~
..


vim +116 drivers/pci/search.c

c25dc82899e67a Alex Williamson 2014-05-22  115  
516f3934ddf718 Jason Gunthorpe 2025-06-27 @116  static enum pci_bus_isolation pcie_switch_isolated(struct pci_bus *bus)
516f3934ddf718 Jason Gunthorpe 2025-06-27  117  {
516f3934ddf718 Jason Gunthorpe 2025-06-27  118  	struct pci_dev *pdev;
516f3934ddf718 Jason Gunthorpe 2025-06-27  119  
516f3934ddf718 Jason Gunthorpe 2025-06-27  120  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  121  	 * Within a PCIe switch we have an internal bus that has the Upstream
516f3934ddf718 Jason Gunthorpe 2025-06-27  122  	 * Port as the bridge and a set of Downstream Ports bridging to the
516f3934ddf718 Jason Gunthorpe 2025-06-27  123  	 * egress ports.
516f3934ddf718 Jason Gunthorpe 2025-06-27  124  	 *
516f3934ddf718 Jason Gunthorpe 2025-06-27  125  	 * Each DSP has an ACS setting which controls where its traffic is
516f3934ddf718 Jason Gunthorpe 2025-06-27  126  	 * permitted to go. Any DSP with a permissive ACS setting can send
516f3934ddf718 Jason Gunthorpe 2025-06-27  127  	 * traffic flowing upstream back downstream through another DSP.
516f3934ddf718 Jason Gunthorpe 2025-06-27  128  	 *
516f3934ddf718 Jason Gunthorpe 2025-06-27  129  	 * Thus any permissive DSP spoils the whole bus.
516f3934ddf718 Jason Gunthorpe 2025-06-27  130  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  131  	guard(rwsem_read)(&pci_bus_sem);
516f3934ddf718 Jason Gunthorpe 2025-06-27  132  	list_for_each_entry(pdev, &bus->devices, bus_list) {
516f3934ddf718 Jason Gunthorpe 2025-06-27  133  		/* Don't understand what this is, be conservative */
516f3934ddf718 Jason Gunthorpe 2025-06-27  134  		if (!pci_is_pcie(pdev) ||
516f3934ddf718 Jason Gunthorpe 2025-06-27  135  		    pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
516f3934ddf718 Jason Gunthorpe 2025-06-27  136  		    pdev->dma_alias_mask)
516f3934ddf718 Jason Gunthorpe 2025-06-27 @137  			return PCIE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  138  
516f3934ddf718 Jason Gunthorpe 2025-06-27  139  		if (!pci_acs_enabled(pdev, PCI_ACS_ISOLATED))
516f3934ddf718 Jason Gunthorpe 2025-06-27  140  			return PCIE_SWITCH_DSP_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  141  	}
516f3934ddf718 Jason Gunthorpe 2025-06-27  142  	return PCIE_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  143  }
516f3934ddf718 Jason Gunthorpe 2025-06-27  144  
516f3934ddf718 Jason Gunthorpe 2025-06-27  145  static bool pci_has_mmio(struct pci_dev *pdev)
516f3934ddf718 Jason Gunthorpe 2025-06-27  146  {
516f3934ddf718 Jason Gunthorpe 2025-06-27  147  	unsigned int i;
516f3934ddf718 Jason Gunthorpe 2025-06-27  148  
516f3934ddf718 Jason Gunthorpe 2025-06-27  149  	for (i = 0; i <= PCI_ROM_RESOURCE; i++) {
516f3934ddf718 Jason Gunthorpe 2025-06-27  150  		struct resource *res = pci_resource_n(pdev, i);
516f3934ddf718 Jason Gunthorpe 2025-06-27  151  
516f3934ddf718 Jason Gunthorpe 2025-06-27  152  		if (resource_size(res) && resource_type(res) == IORESOURCE_MEM)
516f3934ddf718 Jason Gunthorpe 2025-06-27  153  			return true;
516f3934ddf718 Jason Gunthorpe 2025-06-27  154  	}
516f3934ddf718 Jason Gunthorpe 2025-06-27  155  	return false;
516f3934ddf718 Jason Gunthorpe 2025-06-27  156  }
516f3934ddf718 Jason Gunthorpe 2025-06-27  157  
516f3934ddf718 Jason Gunthorpe 2025-06-27  158  /**
516f3934ddf718 Jason Gunthorpe 2025-06-27  159   * pci_bus_isolated - Determine how isolated connected devices are
516f3934ddf718 Jason Gunthorpe 2025-06-27  160   * @bus: The bus to check
516f3934ddf718 Jason Gunthorpe 2025-06-27  161   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  162   * A bus is considered isolating if upstream directed transactions mastered
516f3934ddf718 Jason Gunthorpe 2025-06-27  163   * on the bus always continue to travel upstream. If the bus permits upstream
516f3934ddf718 Jason Gunthorpe 2025-06-27  164   * directed transactions to travel back downstream then it is a non-isolating
516f3934ddf718 Jason Gunthorpe 2025-06-27  165   * bus.
516f3934ddf718 Jason Gunthorpe 2025-06-27  166   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  167   * We consider isolation on a bus by bus basis. If the bus will permit a
516f3934ddf718 Jason Gunthorpe 2025-06-27  168   * upstream directed transaction to on anything other than the IOMMU then the
516f3934ddf718 Jason Gunthorpe 2025-06-27  169   * bus is not isolating.
516f3934ddf718 Jason Gunthorpe 2025-06-27  170   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  171   * Non-isolation includes all the downstream devices on this bus, and it may
516f3934ddf718 Jason Gunthorpe 2025-06-27  172   * include the upstream bridge or port that is creating this bus.
516f3934ddf718 Jason Gunthorpe 2025-06-27  173   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  174   * The various cases are returned in an enum.
516f3934ddf718 Jason Gunthorpe 2025-06-27  175   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  176   * Broadly speaking this function evaluates the ACS settings in a PCIe switch to
516f3934ddf718 Jason Gunthorpe 2025-06-27  177   * determine if a PCIe switch is configured to have full isolation.
516f3934ddf718 Jason Gunthorpe 2025-06-27  178   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  179   * Old PCI/PCI-X buses cannot have isolation due to their physical properties,
516f3934ddf718 Jason Gunthorpe 2025-06-27  180   * but they do have some aliasing properties that affect group creation.
516f3934ddf718 Jason Gunthorpe 2025-06-27  181   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  182   * pci_bus_isolated() does not consider loopback internal to devices, like
516f3934ddf718 Jason Gunthorpe 2025-06-27  183   * multi-function devices performing a self-loopback. The caller must check
516f3934ddf718 Jason Gunthorpe 2025-06-27  184   * this separately. It does not considering alasing within the bus.
516f3934ddf718 Jason Gunthorpe 2025-06-27  185   *
516f3934ddf718 Jason Gunthorpe 2025-06-27  186   * It does not currently support the ACS P2P Egress Control Vector, Linux does
516f3934ddf718 Jason Gunthorpe 2025-06-27  187   * not yet have any way to enable this feature. EC will create subsets of the
516f3934ddf718 Jason Gunthorpe 2025-06-27  188   * bus that are isolated from other subsets.
516f3934ddf718 Jason Gunthorpe 2025-06-27  189   */
516f3934ddf718 Jason Gunthorpe 2025-06-27 @190  enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
516f3934ddf718 Jason Gunthorpe 2025-06-27  191  {
516f3934ddf718 Jason Gunthorpe 2025-06-27  192  	struct pci_dev *bridge = bus->self;
516f3934ddf718 Jason Gunthorpe 2025-06-27  193  	int type;
516f3934ddf718 Jason Gunthorpe 2025-06-27  194  
516f3934ddf718 Jason Gunthorpe 2025-06-27  195  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  196  	 * This bus was created by pci_register_host_bridge(). The spec provides
516f3934ddf718 Jason Gunthorpe 2025-06-27  197  	 * no way to tell what kind of bus this is, for PCIe we expect this to
516f3934ddf718 Jason Gunthorpe 2025-06-27  198  	 * be internal to the Root Complex and not covered by any spec behavior.
516f3934ddf718 Jason Gunthorpe 2025-06-27  199  	 * Linux has historically been optimistic about this bus and treated it
516f3934ddf718 Jason Gunthorpe 2025-06-27  200  	 * as isolating. Given that the behavior of the Root Complex and the ACS
516f3934ddf718 Jason Gunthorpe 2025-06-27  201  	 * behavior of RCiEP's is explicitly not specified we hope that the
516f3934ddf718 Jason Gunthorpe 2025-06-27  202  	 * implementation is directing everything that reaches the root bus to
516f3934ddf718 Jason Gunthorpe 2025-06-27  203  	 * the IOMMU.
516f3934ddf718 Jason Gunthorpe 2025-06-27  204  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  205  	if (pci_is_root_bus(bus))
516f3934ddf718 Jason Gunthorpe 2025-06-27  206  		return PCIE_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  207  
516f3934ddf718 Jason Gunthorpe 2025-06-27  208  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  209  	 * bus->self is only NULL for SRIOV VFs, it represents a "virtual" bus
516f3934ddf718 Jason Gunthorpe 2025-06-27  210  	 * within Linux to hold any bus numbers consumed by VF BDFs. Caller must
516f3934ddf718 Jason Gunthorpe 2025-06-27  211  	 * use pci_physfn() to get the bus for calling this function.
516f3934ddf718 Jason Gunthorpe 2025-06-27  212  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  213  	if (WARN_ON(!bridge))
516f3934ddf718 Jason Gunthorpe 2025-06-27  214  		return PCI_BRIDGE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  215  
516f3934ddf718 Jason Gunthorpe 2025-06-27  216  	if (!pci_is_pcie(bridge)) {
516f3934ddf718 Jason Gunthorpe 2025-06-27  217  		/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  218  		 * The bridge is not a PCIe bridge therefore this bus is
516f3934ddf718 Jason Gunthorpe 2025-06-27  219  		 * PCI/PCI-X.
516f3934ddf718 Jason Gunthorpe 2025-06-27  220  		 *
516f3934ddf718 Jason Gunthorpe 2025-06-27  221  		 * PCI does not have anything like ACS. Any downstream device
516f3934ddf718 Jason Gunthorpe 2025-06-27  222  		 * can bus master an address that any other downstream device
516f3934ddf718 Jason Gunthorpe 2025-06-27  223  		 * can claim. No isolation is possible.
516f3934ddf718 Jason Gunthorpe 2025-06-27  224  		 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  225  		if (bridge->dev_flags & PCI_DEV_FLAG_PCIE_BRIDGE_ALIAS)
516f3934ddf718 Jason Gunthorpe 2025-06-27  226  			type = PCI_EXP_TYPE_PCI_BRIDGE;
516f3934ddf718 Jason Gunthorpe 2025-06-27  227  		else
516f3934ddf718 Jason Gunthorpe 2025-06-27  228  			return PCI_BRIDGE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  229  	} else {
516f3934ddf718 Jason Gunthorpe 2025-06-27  230  		type = pci_pcie_type(bridge);
516f3934ddf718 Jason Gunthorpe 2025-06-27  231  	}
516f3934ddf718 Jason Gunthorpe 2025-06-27  232  
516f3934ddf718 Jason Gunthorpe 2025-06-27  233  	switch (type) {
516f3934ddf718 Jason Gunthorpe 2025-06-27  234  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  235  	 * Since PCIe links are point to point Root Ports are isolated if there
516f3934ddf718 Jason Gunthorpe 2025-06-27  236  	 * is no internal loopback to the Root Port's MMIO. Like MFDs assume if
516f3934ddf718 Jason Gunthorpe 2025-06-27  237  	 * there is no ACS cap then there is no loopback.
516f3934ddf718 Jason Gunthorpe 2025-06-27  238  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  239  	case PCI_EXP_TYPE_ROOT_PORT:
516f3934ddf718 Jason Gunthorpe 2025-06-27  240  		if (bridge->acs_cap &&
516f3934ddf718 Jason Gunthorpe 2025-06-27  241  		    !pci_acs_enabled(bridge, PCI_ACS_ISOLATED))
516f3934ddf718 Jason Gunthorpe 2025-06-27  242  			return PCIE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  243  		return PCIE_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  244  
516f3934ddf718 Jason Gunthorpe 2025-06-27  245  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  246  	 * Since PCIe links are point to point a DSP is always considered
516f3934ddf718 Jason Gunthorpe 2025-06-27  247  	 * isolated. The internal bus of the switch will be non-isolated if the
516f3934ddf718 Jason Gunthorpe 2025-06-27  248  	 * DSP's have any ACS that allows upstream traffic to flow back
516f3934ddf718 Jason Gunthorpe 2025-06-27  249  	 * downstream to any DSP, including back to this DSP or its MMIO.
516f3934ddf718 Jason Gunthorpe 2025-06-27  250  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  251  	case PCI_EXP_TYPE_DOWNSTREAM:
516f3934ddf718 Jason Gunthorpe 2025-06-27  252  		return PCIE_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  253  
516f3934ddf718 Jason Gunthorpe 2025-06-27  254  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  255  	 * bus is the internal bus of a PCIe switch where DSP ACS rules apply.
516f3934ddf718 Jason Gunthorpe 2025-06-27  256  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  257  	case PCI_EXP_TYPE_UPSTREAM:
516f3934ddf718 Jason Gunthorpe 2025-06-27  258  		return pcie_switch_isolated(bus);
516f3934ddf718 Jason Gunthorpe 2025-06-27  259  
516f3934ddf718 Jason Gunthorpe 2025-06-27  260  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  261  	 * PCIe to PCI/PCI-X - this bus is PCI.
516f3934ddf718 Jason Gunthorpe 2025-06-27  262  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  263  	case PCI_EXP_TYPE_PCI_BRIDGE:
516f3934ddf718 Jason Gunthorpe 2025-06-27  264  		/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  265  		 * A PCIe bridge will use the subordinate bus number with a 0
516f3934ddf718 Jason Gunthorpe 2025-06-27  266  		 * devfn as the RID in some cases. This causes all subordinate
516f3934ddf718 Jason Gunthorpe 2025-06-27  267  		 * devfns to alias with 0, which is the same grouping as
516f3934ddf718 Jason Gunthorpe 2025-06-27  268  		 * PCI_BUS_NON_ISOLATED. The RID of the bridge itself is only
516f3934ddf718 Jason Gunthorpe 2025-06-27  269  		 * used by the bridge.
516f3934ddf718 Jason Gunthorpe 2025-06-27  270  		 *
516f3934ddf718 Jason Gunthorpe 2025-06-27  271  		 * However, if the bridge has MMIO then we will assume the MMIO
516f3934ddf718 Jason Gunthorpe 2025-06-27  272  		 * is not isolated due to no ACS controls on this bridge type.
516f3934ddf718 Jason Gunthorpe 2025-06-27  273  		 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  274  		if (pci_has_mmio(bridge))
516f3934ddf718 Jason Gunthorpe 2025-06-27  275  			return PCI_BRIDGE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  276  		return PCI_BUS_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  277  
516f3934ddf718 Jason Gunthorpe 2025-06-27  278  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  279  	 * PCI/PCI-X to PCIe - this bus is PCIe. We already know there must be a
516f3934ddf718 Jason Gunthorpe 2025-06-27  280  	 * PCI bus upstream of this bus, so just return non-isolated. If
516f3934ddf718 Jason Gunthorpe 2025-06-27  281  	 * upstream is PCI-X the PCIe RID should be preserved, but for PCI the
516f3934ddf718 Jason Gunthorpe 2025-06-27  282  	 * RID will be lost.
516f3934ddf718 Jason Gunthorpe 2025-06-27  283  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  284  	case PCI_EXP_TYPE_PCIE_BRIDGE:
516f3934ddf718 Jason Gunthorpe 2025-06-27  285  		return PCI_BRIDGE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  286  
516f3934ddf718 Jason Gunthorpe 2025-06-27  287  	default:
516f3934ddf718 Jason Gunthorpe 2025-06-27  288  		return PCI_BRIDGE_NON_ISOLATED;
516f3934ddf718 Jason Gunthorpe 2025-06-27  289  	}
516f3934ddf718 Jason Gunthorpe 2025-06-27  290  }
516f3934ddf718 Jason Gunthorpe 2025-06-27  291  

:::::: The code at line 116 was first introduced by commit
:::::: 516f3934ddf7189eb3e137e05ef645a5b9b8e83b PCI: Add pci_bus_isolated()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
