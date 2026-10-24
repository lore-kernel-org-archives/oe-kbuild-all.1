Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808657;
	b=cetkd+W2rkou/s3RKaIqSpBJ5/sKBgWVxI5jTQ3e60a6nhox7hYkc6OxjWyzYs8pc7Fg
	 HlrFROU6Ey+et5r6nmKm/JKwAuhJFBVx+tExsy4IonbC9CTtYZi368YbuA+apWnFnMCRI
	 onyxMVGWb0MSNgeeMuGngmUsKCJxY7oTN/2GFfkJ7oKCoiCfyIvLbd6Fq5fROfFwO2+Ua
	 h8upRV7h7xWQcIF1fpQvIQ/In+6i0TY+hRgFKQ70ksh3nkpjSXQvbOIum00ZsoUY38nrL
	 pmSXzCLzDCofdI0mvTu7y2vMUyJOJheNn0jF4Vq58e1NlgP9PUoTiHCk32ig1XtkMKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808657;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Vi3zavsKubHTwgYkeZXkrpxrWW1GhyaEMKvomdsA81U=;
	b=oFwvcSBaE0/33ZxTulcCSsi8BWGiyO7H4AVTAOv3oOM6p2QNAs5CypKyhbWZojBkMnVV
	 2OqRhWodoxuZXISiDYs91l+oVwS6crECqKNilL0cHBg6i46NAOFxnOy2Pk+PShjMSkV7G
	 IsR5pDGSVwmShKKgKPo6Laikltous4RX4EqJCS2TgLGXqJt/UyPcr57axEthvExwABiSB
	 E3g9ENz0lHkpZNwPHoxNChX72zsRl/0ZgwCh0v7cr7A2s9x3Xp3OOPqKaRufALx1E7wMI
	 G0ORiNTl9kpEwAisSTjBNw9vD4voiQ/L5YPoSfYXz+P7W1/iQoKaDm+gqppDEGzkEyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ihm+X6Y4;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC99606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 02:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC99606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ihm+X6Y4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792808657; x=1824344657;
  h=date:from:to:cc:subject:message-id;
  bh=d7y4Sq43t7ethoHRRx4jiGE6qPRFZ7HCCIn77OR271M=;
  b=ihm+X6Y4PNDD1RFr3Vi9pzLSNaeO5h/EP+EfiYka/Xy+rritmJ3o6Uet
   gWpM8cEEESBvXVnHv78lOxhmGV3BA6qUkdi/h7HE7TcDpvN/qho/daH3k
   fysskNSGSNnPppM98mN47ujsf/rzR0eIR+GB2JPyA+PKeUPJDGejkO8eO
   CZdRhj5aXufrRrpQuGBzuPw0/JQGVJ+YbiTWg0ynRwJwiVS3H8VHye4Us
   FRcIM1bO0kc3KeaZwvc+2QTbhBg5RHXlg6q8mcjNPe10wzetxG5mR9TeW
   L+JE8lGDqhIhyZ2/YN+hDvtOvMRBZi8bKzjRiLLGexegaBDVPW+hgb0cl
   A==;
X-CSE-ConnectionGUID: CUVu7eCiQP++BFK4dT/Fng==
X-CSE-MsgGUID: EPj1TTGkTl+hpQfIw/IE3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1463920"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1463920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:24:16 -0700
X-CSE-ConnectionGUID: x/gudlspSZ2hq9mj2zPyJQ==
X-CSE-MsgGUID: rqQL246/RDuqKvN1X4yIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3783529"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2026 19:24:15 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRQa-000000003E1-2Fgv;
	Sat, 24 Oct 2026 02:24:12 +0000
Date: Sat, 24 Oct 2026 04:23:14 +0200
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 84/98] fs/rpdfs/mkfs.c:23:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202610240418.XYDxwnYq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   8a293e5c1bf0416f4d4e116bf8693c00dbe876da
commit: ca29d34b2ba425ec26d7b54856f8ba86cb233d41 [84/98] rpdfs: update mkfs
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261024/202610240418.XYDxwnYq-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240418.XYDxwnYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240418.XYDxwnYq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from fs/rpdfs/mkfs.c:7:
   fs/rpdfs/meta.h:8:43: warning: declaration of 'struct rpdfs_iget_data' will not be visible outside of this function [-Wvisibility]
       8 | int rpdfs_folio_loc_from_block_key(struct rpdfs_iget_data *igd, pgoff_t *index,
         |                                           ^
>> fs/rpdfs/mkfs.c:23:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      23 |         if (IS_ERR(folio)) {
         |             ^~~~~~~~~~~~~
   fs/rpdfs/mkfs.c:46:9: note: uninitialized use occurs here
      46 |         return ret;
         |                ^~~
   fs/rpdfs/mkfs.c:23:2: note: remove the 'if' if its condition is always true
      23 |         if (IS_ERR(folio)) {
         |         ^~~~~~~~~~~~~~~~~~
   fs/rpdfs/mkfs.c:20:9: note: initialize the variable 'ret' to silence this warning
      20 |         int ret;
         |                ^
         |                 = 0
   3 warnings generated.


vim +23 fs/rpdfs/mkfs.c

     5	
     6	#include "format-block.h"
   > 7	#include "meta.h"
     8	#include "inode.h"
     9	#include "mkfs.h"
    10	#include "super.h"
    11	
    12	/*
    13	 * This is a hack while we're bringing the system up.
    14	 */
    15	
    16	int rpdfs_mkfs_root_inode(struct inode *inode)
    17	{
    18		struct rpdfs_inode *rinode;
    19		struct folio *folio;
    20		int ret;
    21	
    22		folio = rpdfs_meta_get_folio(inode, MGF_NEW, RPDFS_BLOCK_KEY_TYPE_INODE, 0);
  > 23		if (IS_ERR(folio)) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
