Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB08429023
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029721; cv=none; b=SrBWP5aGa2ZPZBTCfbOgPGT3zaEc8semohONSAbFccg25VbVcZmHxXtyGuVDn4XIfrr34ZkoZwrgGI+dAmGYIy9rsS8Uq6mb3/vnkagsOfVS2qYc4dOg8VIW5r/1PdZf0Js8EO5RE9IzLS/+k937p+y1N/dBmI14iGJc+9WKkTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029721; c=relaxed/simple;
	bh=DZXKoXy4i9NczYu4ZYp0wngQxkzTmYN+Y00LUAmHMT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MHMrBhl671IhAxXXiLsGHkmpkb51NW2PkvBBsBGUngDu48iB6srAt2ivWDfowupdgaCOWyRjxZhzhFQufFkCydodRvGiUTtjOHmAvuHqLjrcPhCvnEkU1tsd1rRF3yR5JVo/N6hM6uwYZjfovH2DFPbCKCQUavD9mBBhTt/AFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqKJDjfg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqKJDjfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791029712; x=1822565712;
  h=date:from:to:cc:subject:message-id;
  bh=DZXKoXy4i9NczYu4ZYp0wngQxkzTmYN+Y00LUAmHMT8=;
  b=nqKJDjfgO+2/ZVvJJ9jQvR5UjvPe2fOTD7kCbHee1bip3Ch+EeTZ3unQ
   3dWQUp/HxOOvuc42BQef5T3BK2HFqkHCo9QSwpmSkNo9wNW/S/I70TuQF
   xxEDVpLiUC9IG1IdPR/0AJ0wZUb1Zq9hswuE3hHPlw7Ewu2qWeTaB8HpO
   dP6QGHFm6Rw6I8C3yjVqZgzAqIu04Brb+cg5zLYUd/EhMQJ4l6L0zRgMF
   ZFmzDXwtmWnt6FbC/gIADJJ95s0/AXCL2kuTQlYkjLMsk02YxYx4mPoJy
   zsxN+TsJFMGvG7faBiWmDyOsvHqZxWBTusGRGhOf2nfgxMBM8V6RVBKtP
   A==;
X-CSE-ConnectionGUID: dVE4KApOQTeFklxtbJmtag==
X-CSE-MsgGUID: F6Orvz4LS/+fKptzyhUYNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90544323"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90544323"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 05:15:05 -0700
X-CSE-ConnectionGUID: yo1BUFmzQFy5BMklnD+t5w==
X-CSE-MsgGUID: 7JCOpsv4SACRgJWM4wHyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="471407"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 05:15:03 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCydo-0000000012x-2Zgj;
	Sat, 03 Oct 2026 12:15:00 +0000
Date: Sat, 03 Oct 2026 14:14:41 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-nonuma
 1/51] include/linux/nodemask.h:427:40: sparse: sparse: incompatible types for
 operation (+):
Message-ID: <202610031434.ab68Fb7T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-nonuma
head:   eab7c347997a7af3a93bcc337d581efae7dfbdc0
commit: 34c989b219c17a0f72992e4a6ef7e9053bfa27ba [1/51] mm: publish and clear node memory states via helpers
config: powerpc64-randconfig-r2300-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031434.ab68Fb7T-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031434.ab68Fb7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610031434.ab68Fb7T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:184:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:184:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:526:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:640:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:640:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:642:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:638:22: sparse: note: previously declared as:
   include/linux/bitmap.h:638:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:697:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:697:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:699:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: note: previously declared as:
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:759:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:838:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:838:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:838:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:838:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:830:23: sparse: note: previously declared as:
   include/linux/bitmap.h:830:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:839:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:839:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:839:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:839:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:839:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:830:34: sparse: note: previously declared as:
   include/linux/bitmap.h:830:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:866:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:866:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:871:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:871:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:871:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:865:23: sparse: note: previously declared as:
   include/linux/bitmap.h:865:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:873:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:873:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:863:23: sparse: note: previously declared as:
   include/linux/bitmap.h:863:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:874:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:874:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:864:23: sparse: note: previously declared as:
   include/linux/bitmap.h:864:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:875:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:412:31: sparse: sparse: undefined identifier 'NR_NODE_STATES'
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression type
>> include/linux/nodemask.h:427:40: sparse: sparse: incompatible types for operation (+):
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression
   include/linux/nodemask.h:427:40: sparse:    struct nodemask_t extern [addressable] [toplevel] [usertype] node_states[0]
   include/linux/nodemask.h:427:40: sparse:    incomplete type enum node_states state
   include/linux/nodemask.h:427:40: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:529:9: sparse: sparse: symbol 'node_clear_state' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/nodemask.h:529:9: sparse:    int static [signed] [toplevel] node_clear_state( ... )
   include/linux/nodemask.h:425:29: sparse: note: previously declared as:
   include/linux/nodemask.h:425:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] node_clear_state( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:76:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec1.c:77:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:78:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:78:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec1.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec1.c:84:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec1.c:85:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec1.c:86:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec1.c:87:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec1.c:87:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec1.c:85)
   lib/raid/raid6/powerpc/altivec1.c:88:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec1.c:88:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec1.c:86)
   lib/raid/raid6/powerpc/altivec1.c:89:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec1.c:92:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:92:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec1.c:74:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:74:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec1.c:103:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:103:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
--
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:184:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:184:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:526:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:640:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:640:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:642:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:638:22: sparse: note: previously declared as:
   include/linux/bitmap.h:638:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:697:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:697:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:699:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: note: previously declared as:
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:759:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:838:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:838:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:838:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:838:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:830:23: sparse: note: previously declared as:
   include/linux/bitmap.h:830:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:839:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:839:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:839:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:839:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:839:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:830:34: sparse: note: previously declared as:
   include/linux/bitmap.h:830:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:866:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:866:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:871:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:871:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:871:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:865:23: sparse: note: previously declared as:
   include/linux/bitmap.h:865:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:873:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:873:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:863:23: sparse: note: previously declared as:
   include/linux/bitmap.h:863:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:874:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:874:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:864:23: sparse: note: previously declared as:
   include/linux/bitmap.h:864:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:875:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:412:31: sparse: sparse: undefined identifier 'NR_NODE_STATES'
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression type
>> include/linux/nodemask.h:427:40: sparse: sparse: incompatible types for operation (+):
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression
   include/linux/nodemask.h:427:40: sparse:    struct nodemask_t extern [addressable] [toplevel] [usertype] node_states[0]
   include/linux/nodemask.h:427:40: sparse:    incomplete type enum node_states state
   include/linux/nodemask.h:427:40: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:529:9: sparse: sparse: symbol 'node_clear_state' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/nodemask.h:529:9: sparse:    int static [signed] [toplevel] node_clear_state( ... )
   include/linux/nodemask.h:425:29: sparse: note: previously declared as:
   include/linux/nodemask.h:425:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] node_clear_state( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:79:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec4.c:80:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:81:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:85:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/altivec4.c:85:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:85:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:86:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec4.c:86:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:86:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:87:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec4.c:87:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:87:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:90:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:90:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:91:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:91:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:92:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:92:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:93:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:94:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:95:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:96:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:97:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:98:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:99:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:100:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:101:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:102:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:103:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:104:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:105:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:105:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:97)
   lib/raid/raid6/powerpc/altivec4.c:106:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:106:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:98)
   lib/raid/raid6/powerpc/altivec4.c:107:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:107:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:99)
   lib/raid/raid6/powerpc/altivec4.c:108:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:108:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:100)
   lib/raid/raid6/powerpc/altivec4.c:109:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:109:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:101)
   lib/raid/raid6/powerpc/altivec4.c:110:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:110:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:102)
   lib/raid/raid6/powerpc/altivec4.c:111:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:111:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:103)
   lib/raid/raid6/powerpc/altivec4.c:112:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:112:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:104)
   lib/raid/raid6/powerpc/altivec4.c:113:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:85)
   lib/raid/raid6/powerpc/altivec4.c:115:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:115:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:86)
   lib/raid/raid6/powerpc/altivec4.c:116:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:116:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:87)
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
--
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:184:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:184:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:526:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:640:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:640:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:642:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:638:22: sparse: note: previously declared as:
   include/linux/bitmap.h:638:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:697:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:697:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:699:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: note: previously declared as:
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:759:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:838:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:838:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:838:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:838:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:830:23: sparse: note: previously declared as:
   include/linux/bitmap.h:830:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:839:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:839:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:839:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:839:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:839:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:830:34: sparse: note: previously declared as:
   include/linux/bitmap.h:830:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:866:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:866:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:871:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:871:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:871:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:865:23: sparse: note: previously declared as:
   include/linux/bitmap.h:865:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:873:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:873:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:863:23: sparse: note: previously declared as:
   include/linux/bitmap.h:863:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:874:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:874:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:864:23: sparse: note: previously declared as:
   include/linux/bitmap.h:864:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:875:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:412:31: sparse: sparse: undefined identifier 'NR_NODE_STATES'
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression type
>> include/linux/nodemask.h:427:40: sparse: sparse: incompatible types for operation (+):
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression
   include/linux/nodemask.h:427:40: sparse:    struct nodemask_t extern [addressable] [toplevel] [usertype] node_states[0]
   include/linux/nodemask.h:427:40: sparse:    incomplete type enum node_states state
   include/linux/nodemask.h:427:40: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:529:9: sparse: sparse: symbol 'node_clear_state' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/nodemask.h:529:9: sparse:    int static [signed] [toplevel] node_clear_state( ... )
   include/linux/nodemask.h:425:29: sparse: note: previously declared as:
   include/linux/nodemask.h:425:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] node_clear_state( ... )
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:83:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec8.c:84:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:85:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec8.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec8.c:89:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/altivec8.c:89:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:89:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:90:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec8.c:90:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:90:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:91:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec8.c:91:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:91:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:92:23: sparse: sparse: undefined identifier 'wp4'
   lib/raid/raid6/powerpc/altivec8.c:92:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:92:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:93:23: sparse: sparse: undefined identifier 'wp5'
   lib/raid/raid6/powerpc/altivec8.c:93:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:93:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:94:23: sparse: sparse: undefined identifier 'wp6'
   lib/raid/raid6/powerpc/altivec8.c:94:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:94:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:95:23: sparse: sparse: undefined identifier 'wp7'
   lib/raid/raid6/powerpc/altivec8.c:95:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:95:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:98:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:98:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:99:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:99:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:100:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:100:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:101:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:101:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:102:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:102:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:103:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:103:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:104:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:104:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:105:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:106:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:107:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:108:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:109:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:110:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:111:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:112:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:113:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:114:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:115:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:116:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:117:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:118:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:119:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:120:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:121:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:122:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:123:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:124:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:125:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:126:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:127:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:128:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:129:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:129:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:113)
   lib/raid/raid6/powerpc/altivec8.c:130:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:130:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:114)
   lib/raid/raid6/powerpc/altivec8.c:131:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:131:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:115)
   lib/raid/raid6/powerpc/altivec8.c:132:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:132:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:116)
   lib/raid/raid6/powerpc/altivec8.c:133:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:133:25: sparse: sparse: symbol 'w24' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:117)
   lib/raid/raid6/powerpc/altivec8.c:134:31: sparse: sparse: undefined identifier '__builtin_vec_and'
--
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:184:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:184:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:526:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:640:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:640:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:642:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:638:22: sparse: note: previously declared as:
   include/linux/bitmap.h:638:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:642:9: sparse: note: previously declared as:
   include/linux/bitmap.h:642:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:697:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:697:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:241:29: sparse: note: previously declared as:
   include/linux/bitmap.h:241:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:699:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:695:22: sparse: note: previously declared as:
   include/linux/bitmap.h:695:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:699:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:699:9: sparse: note: previously declared as:
   include/linux/bitmap.h:699:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:759:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:838:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:838:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:838:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:838:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:830:23: sparse: note: previously declared as:
   include/linux/bitmap.h:830:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:839:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:839:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:839:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:839:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:839:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:830:34: sparse: note: previously declared as:
   include/linux/bitmap.h:830:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:866:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:866:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:871:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:871:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:871:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:865:23: sparse: note: previously declared as:
   include/linux/bitmap.h:865:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:873:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:873:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:863:23: sparse: note: previously declared as:
   include/linux/bitmap.h:863:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:874:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:874:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:864:23: sparse: note: previously declared as:
   include/linux/bitmap.h:864:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:875:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:412:31: sparse: sparse: undefined identifier 'NR_NODE_STATES'
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression type
>> include/linux/nodemask.h:427:40: sparse: sparse: incompatible types for operation (+):
   include/linux/nodemask.h:412:31: sparse: sparse: bad constant expression
   include/linux/nodemask.h:427:40: sparse:    struct nodemask_t extern [addressable] [toplevel] [usertype] node_states[0]
   include/linux/nodemask.h:427:40: sparse:    incomplete type enum node_states state
   include/linux/nodemask.h:427:40: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:529:9: sparse: sparse: symbol 'node_clear_state' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/nodemask.h:529:9: sparse:    int static [signed] [toplevel] node_clear_state( ... )
   include/linux/nodemask.h:425:29: sparse: note: previously declared as:
   include/linux/nodemask.h:425:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] node_clear_state( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:77:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec2.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:79:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:83:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/altivec2.c:83:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:83:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:86:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:86:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:87:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:88:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:89:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:90:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:91:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:92:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:93:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec2.c:93:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:89)
   lib/raid/raid6/powerpc/altivec2.c:94:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec2.c:94:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:90)
   lib/raid/raid6/powerpc/altivec2.c:95:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:95:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:91)
   lib/raid/raid6/powerpc/altivec2.c:96:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:96:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:92)
   lib/raid/raid6/powerpc/altivec2.c:97:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:83)
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )

vim +427 include/linux/nodemask.h

13808910713a98 Christoph Lameter 2007-10-16  424  
54c9e0085bd101 Yury Norov        2024-07-18  425  static __always_inline void node_clear_state(int node, enum node_states state)
13808910713a98 Christoph Lameter 2007-10-16  426  {
13808910713a98 Christoph Lameter 2007-10-16 @427  	__node_clear(node, &node_states[state]);
13808910713a98 Christoph Lameter 2007-10-16  428  }
13808910713a98 Christoph Lameter 2007-10-16  429  

:::::: The code at line 427 was first introduced by commit
:::::: 13808910713a98cc1159291e62cdfec92cc94d05 Memoryless nodes: Generic management of nodemasks for various purposes

:::::: TO: Christoph Lameter <clameter@sgi.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
