Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111613DD52C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776274713; cv=none; b=ImZhF+sfjIBHnGSqd8fIWuTsltV7s9WhbQhv6MHG84+QGuqug7T8mbH14XTH06DkDwV6CKmXHqy3a6CWgtvJRxETItniUnDhqECD1+XM1EDKqUsg8Zo0T+XCvXFJYZB+JAH3wcukj/L8GxBlgMyHvjsaVtfViSNCUxw3Vtmj3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776274713; c=relaxed/simple;
	bh=tXHDus9noYnuFXutPcjeepWVAguTQEhV6on5Em+56Hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nGhP8oquuwmY40ZfynwReXh/E8OupSPd1OKQJak6UeKfmoLzD8v6q1tDbDt8AUBirod6CesyDPT0xNDoYGEE50YjvO9G1UbEkqxCeRZvze9vXX2DQ1vJzy7w2JA427kBZdufokbySp1thiM8dmPBohpsGyG6KtT1TKNFOLGzMfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsHkgo5L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsHkgo5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776274711; x=1807810711;
  h=date:from:to:cc:subject:message-id;
  bh=tXHDus9noYnuFXutPcjeepWVAguTQEhV6on5Em+56Hg=;
  b=jsHkgo5LLAy2ANV7E/RuIBjxnSM2teVPnUuzoc6DzlHJ3D1J3WDiqWBJ
   /KG85vq9QKqhRaOGzjWft4Fu3ym9EGsnhIFr85hE9kyXTYUG6TYbA8OML
   SpJABvjIBkQFaVuvJDHxHXzHzTXbJLPvwNrGQDfghx8IjtX+iPiu6o/wo
   2fFopjlBPEFPuMsKcfhxtIJp2MD1K0WDdP9D5JRR5iDKE22/cRG62F2b8
   ROkhkCFw1oN2v9nnfY4hHVKP5OmlcgPbZvup5JFeDXHi1PTrfag3rK41i
   8n3YeViUp+D1Zvs2Py1yXA+J/Dl9VJOofBb0AKFKng2xrfoeEuuH1oySj
   w==;
X-CSE-ConnectionGUID: JuvfGE0bQ4q/11MuShowtw==
X-CSE-MsgGUID: H5LpQdTOQeOrlkomv21YPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76429583"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76429583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 10:38:30 -0700
X-CSE-ConnectionGUID: XX3exI3QSeWdGF732RaycQ==
X-CSE-MsgGUID: Qqia/R8lTsuhae/fz846rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253920535"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2026 10:38:28 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD4C2-000000000ly-0riY;
	Wed, 15 Apr 2026 17:38:26 +0000
Date: Thu, 16 Apr 2026 01:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 59/63] fs/rpdfs/block.c:1807:6:
 warning: variable 'flush' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202604160107.DFwXchBt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   fd587c46f2541a1e4a4d5c23a54b77b72a83d638
commit: b2c9c2ab7080f178bd2ba1763ec033fb9ec54acf [59/63] rpdfs: strictly send one confirm per revoke
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260416/202604160107.DFwXchBt-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160107.DFwXchBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160107.DFwXchBt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   fs/rpdfs/block.c:374:6: warning: variable 'now' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     374 |         if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
         |             ^~~~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:377:15: note: uninitialized use occurs here
     377 |         WARN_ON_ONCE(now < 0);
         |                      ^~~
   fs/rpdfs/block.c:374:6: note: remove the '&&' if its condition is always true
     374 |         if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:372:9: note: initialize the variable 'now' to silence this warning
     372 |         s64 now;
         |                ^
         |                 = 0
>> fs/rpdfs/block.c:1807:6: warning: variable 'flush' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1807 |         if (!bk->confirm_mode) {
         |             ^~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:1819:6: note: uninitialized use occurs here
    1819 |         if (flush)
         |             ^~~~~
   fs/rpdfs/block.c:1807:2: note: remove the 'if' if its condition is always true
    1807 |         if (!bk->confirm_mode) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
    1808 |                 get_block(bk);
    1809 |                 bk->confirm_mode = cm->mode;
    1810 |                 flush = bk->dirty;
    1811 |                 ret = try_send_confirm(rfi, bk);
    1812 |         } else {
         |           ~~~~~~
    1813 |                 ret = -EPROTO;
         |                 ~~~~~~~~~~~~~~
    1814 |         }
         |         ~
   fs/rpdfs/block.c:1793:12: note: initialize the variable 'flush' to silence this warning
    1793 |         bool flush;
         |                   ^
         |                    = 0
   3 warnings generated.


vim +1807 fs/rpdfs/block.c

  1769	
  1770	/*
  1771	 * Revocations are only received for previously granted modes.  They
  1772	 * should only decrease our granted mode.  We will only receive one
  1773	 * revoke mode at a time.
  1774	 *
  1775	 * However, we can free clean blocks under memory pressure.  Then we can
  1776	 * allocate a new block that is being acquired.  We can receive a revoke
  1777	 * for the old block number that was freed at any point in that life
  1778	 * cycle.  We need to be forgiving of the state of blocks when we
  1779	 * receive a revocation.
  1780	 *
  1781	 * We must send a confirmation for every revoke we receive, and we have
  1782	 * to wait until users of the revoked mode (including dirty blocks) have
  1783	 * finished.  We record that we need to confirm the mode and this
  1784	 * pending confirmation stops future incompatible users.
  1785	 */
  1786	static int recv_block_revoke_mode(struct rpdfs_fs_info *rfi, struct rpdfs_net_message_desc *md)
  1787	{
  1788		struct rpdfs_block_info *binf = RPDFS_BINF(rfi);
  1789		struct rpdfs_msg_cache_mode *cm = md->ctl_buf;
  1790		u64 bnr = le64_to_cpu(cm->bnr);
  1791		struct rpdfs_block *bk;
  1792		bool preloaded;
  1793		bool flush;
  1794		int ret;
  1795	
  1796		bk = lookup_block(binf, bnr);
  1797		if (!bk) {
  1798			/* no block, we shrank, send immediate confirmation */
  1799			ret = send_block_cache_mode(rfi, bnr, RPDFS_MSG_BLOCK_CONFIRM_MODE,
  1800						    cm->mode, GFP_NOFS);
  1801			goto out;
  1802		}
  1803	
  1804		preloaded = rpdfs_net_preload(rfi, GFP_NOFS) == 0;
  1805	
  1806		write_seqlock(&bk->seqlock);
> 1807		if (!bk->confirm_mode) {
  1808			get_block(bk);
  1809			bk->confirm_mode = cm->mode;
  1810			flush = bk->dirty;
  1811			ret = try_send_confirm(rfi, bk);
  1812		} else {
  1813			ret = -EPROTO;
  1814		}
  1815		write_sequnlock(&bk->seqlock);
  1816	
  1817		if (preloaded)
  1818			rpdfs_net_preload_end(rfi);
  1819		if (flush)
  1820			queue_block_flush(binf, bk);
  1821	
  1822		if (ret == 0)
  1823			wake_up_all(&bk->waitq);
  1824		put_block(bk);
  1825	out:
  1826		return ret;
  1827	}
  1828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
