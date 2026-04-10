Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8273D411F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835215; cv=none; b=I2yeRL0n8NEwPQ0MD7Zv9YNL539c95I6nJ0FPQRjvtRX23oREMBee+0YWv/Fko41DuJymZPN2kgCPUNjwywb/U3a/5zpjC4hk44/dTCLAgvpU6y2H79DjK2lZnqmMSHe7exhxbqyoUEzrZJ6ujWJMBFMJShtYbC45a6eyE44ZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835215; c=relaxed/simple;
	bh=N/FjQLxN4VE+D1NzSUlME8ZdTs6wywymF82Q0YuVDMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBqkMRda8g9s62Jq7P7J2uJPvpJW2OUr4ChCBiwgwMksHMTmhMsC+sgtjXOArwwE5Qg0AOekk7CJOYIQruGP2p9j2bVnkAhfVENQfH/VMJtKgXRN5ngDdN9JGd8i0TYI/VgM7jIXxjpTuY5JJaafYltDPMerBZmkYWuwfceHysw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYIE9mbj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYIE9mbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775835214; x=1807371214;
  h=date:from:to:cc:subject:message-id;
  bh=N/FjQLxN4VE+D1NzSUlME8ZdTs6wywymF82Q0YuVDMw=;
  b=cYIE9mbjv2fcZ8gz/GZs4GgkRPVnnw0HzMIf8buYuQgmtDf+jw7Sju8E
   rC9l2Z+t9ULZNSiRZz5pnYw8und52SulebfmturBVq5N6OGm0qw1JygXv
   GlZC3GPxWgI7RBfStb3L8AHVwO2E6B2LP48nlgr2SqpYN9NcfgS6iEZ1h
   iMz64vNKjET1moCp47AHcb3NFxnvVWm7DDwQxG3op3I/ucsPiiukqlMVX
   X2fmhD/Ys2PiLjEizRSR1Ok3Aic4MGy6uGgx5RFGPBFlS2X5qW9HQehSN
   Zm9lE65xSyd9karThot3sLhEwBSvgA2gat+gHPdh2Y/hyx5RGAK2wEjhB
   Q==;
X-CSE-ConnectionGUID: B/cNT+UHQKaVqv9KUP7LPg==
X-CSE-MsgGUID: mGkUKRckTxGi2uPUjiCgAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="64389420"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="64389420"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 08:33:33 -0700
X-CSE-ConnectionGUID: zFkFohXpRTm+aFvKKs97dg==
X-CSE-MsgGUID: 88NJCnyKSByk6Cijq3T4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233501498"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2026 08:32:52 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBDqj-000000003tB-1QG3;
	Fri, 10 Apr 2026 15:32:49 +0000
Date: Fri, 10 Apr 2026 23:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/25] fs/nfsd/nfs4state.c:3472:17:
 error: implicit declaration of function 'nfsd4_run_cb_notify'; did you mean
 'nfsd4_run_cb'?
Message-ID: <202604102350.elj4EXAn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: c82fe07f3cc730c342db68b5cb4cab81c8f6763c [13/25] nfsd: add data structures for handling CB_NOTIFY
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260410/202604102350.elj4EXAn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102350.elj4EXAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102350.elj4EXAn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4state.c: In function 'nfsd4_cb_notify_release':
>> fs/nfsd/nfs4state.c:3472:17: error: implicit declaration of function 'nfsd4_run_cb_notify'; did you mean 'nfsd4_run_cb'? [-Wimplicit-function-declaration]
    3472 |                 nfsd4_run_cb_notify(ncn);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 nfsd4_run_cb


vim +3472 fs/nfsd/nfs4state.c

  3461	
  3462	static void
  3463	nfsd4_cb_notify_release(struct nfsd4_callback *cb)
  3464	{
  3465		struct nfsd4_cb_notify *ncn =
  3466				container_of(cb, struct nfsd4_cb_notify, ncn_cb);
  3467		struct nfs4_delegation *dp =
  3468				container_of(ncn, struct nfs4_delegation, dl_cb_notify);
  3469	
  3470		/* Drain events that arrived while this callback was in flight */
  3471		if (ncn->ncn_evt_cnt > 0)
> 3472			nfsd4_run_cb_notify(ncn);
  3473		nfs4_put_stid(&dp->dl_stid);
  3474	}
  3475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
