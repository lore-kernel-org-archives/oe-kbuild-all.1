Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCB329C66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593671; cv=none; b=AzOrP7z+D6RFBLa4HU8Ue3kNonXYiQcHjaruI2wtr+vIVpGM11PSrcDLwhH/jqwPtV8XbJUMyXwYEEryGrK3JTOUOPn1TjCtvBKeK+j+jcEKQCSEaBTwmEqfvgeNRRawhDt5yLXuB62h3IW3JwY71GJIu9NujA/6LsdaXIGxH10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593671; c=relaxed/simple;
	bh=DO7i4uLOh67ZHX1D5u1eSZdX6VFOaiyrFHJaPqUKdDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=osCqHxO9lB/Rjlv/nGU9c4r43crufSfXX1QG+UsK/wYDNCxbUymljZtqBarTFSXL7r/LTFSIEmFXjtMCM08iCem2m6PpFgqjR3GuAitFqtp3aHLSvCCS0sQG/343MCPfUmrzyxGsQZgS2EZAM5N4kYV/kKpMW7iU89O7V7SBm1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3latQEn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3latQEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781593667; x=1813129667;
  h=date:from:to:cc:subject:message-id;
  bh=DO7i4uLOh67ZHX1D5u1eSZdX6VFOaiyrFHJaPqUKdDQ=;
  b=Z3latQEno4qpaUEh9XhuaP6lIz1UARRjvrXYyxP1ISbhSMx1ufkJaGUY
   tpjEwHGnB8q7fyloE5L9r8wg4SLJrm1UZMCEiJM4taLJ2ZU5KMKEph9Mj
   UrZLEo2s4tCCn98CMuUtg/fNjaMl7hubjZ1AVAY/bXKtPamsxiOUvlvnG
   9k5dHCIg35iYz6NK6eP5+DmKqCqv7f1LPTD05bh0iknSACvkZzwtOZ/Xk
   b9JqphNdaXfxXDy4Ibga1VOcuCRLzeOwUvUKTgZ+0af8rAXpUMDWfRAbg
   gUxOSnd6S1GSLlYYqNF/Wqwoi7crbKIH+AksxOurj7fCfWMghZ04FHYS7
   A==;
X-CSE-ConnectionGUID: Lprc4gzXTZC0bD/ifd5bUQ==
X-CSE-MsgGUID: YjMIWVYPRH+kHZy/oIYciA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69894376"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="69894376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:07:46 -0700
X-CSE-ConnectionGUID: je4NXZSiT4iSrQ7I1CynfQ==
X-CSE-MsgGUID: yWigjwefQlaEs/9oRO1gOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="277885072"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2026 00:07:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZNte-00000000Spy-2YYd;
	Tue, 16 Jun 2026 07:07:42 +0000
Date: Tue, 16 Jun 2026 15:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13509/14023]
 security/apparmor/af_unix.c:764:50: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202606161437.mRNYm8q9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
commit: 4483efe4f21510b30c24bc97d9fd0e8feab94125 [13509/14023] apparmor: fix shadowing of plabel that prevents cache from being updated
config: powerpc-randconfig-r122-20260615 (https://download.01.org/0day-ci/archive/20260616/202606161437.mRNYm8q9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161437.mRNYm8q9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161437.mRNYm8q9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/af_unix.c:764:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct aa_label *l @@     got struct aa_label [noderef] __rcu *label @@
   security/apparmor/af_unix.c:764:50: sparse:     expected struct aa_label *l
   security/apparmor/af_unix.c:764:50: sparse:     got struct aa_label [noderef] __rcu *label

vim +764 security/apparmor/af_unix.c

   705	
   706	/* This fn is only checked if something has changed in the security
   707	 * boundaries. Otherwise cached info off file is sufficient
   708	 */
   709	int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
   710			      const char *op, u32 request, struct file *file)
   711	{
   712		struct socket *sock = (struct socket *) file->private_data;
   713		struct sockaddr_un *addr, *peer_addr;
   714		int addrlen, peer_addrlen;
   715		struct aa_label *plabel = NULL;
   716		struct sock *peer_sk = NULL;
   717		u32 sk_req = request & ~NET_PEER_MASK;
   718		struct path path;
   719		bool is_sk_fs;
   720		int error = 0;
   721	
   722		AA_BUG(!label);
   723		AA_BUG(!sock);
   724		AA_BUG(!sock->sk);
   725		AA_BUG(sock->sk->sk_family != PF_UNIX);
   726	
   727		/* investigate only using lock via unix_peer_get()
   728		 * addr only needs the memory barrier, but need to investigate
   729		 * path
   730		 */
   731		unix_state_lock(sock->sk);
   732		peer_sk = unix_peer(sock->sk);
   733		if (peer_sk)
   734			sock_hold(peer_sk);
   735	
   736		is_sk_fs = is_unix_fs(sock->sk);
   737		addr = aa_sunaddr(unix_sk(sock->sk), &addrlen);
   738		path = unix_sk(sock->sk)->path;
   739		unix_state_unlock(sock->sk);
   740	
   741		if (is_sk_fs && peer_sk)
   742			sk_req = request;
   743		if (sk_req) {
   744				error = aa_unix_label_sk_perm(subj_cred, label, op,
   745							      sk_req, sock->sk,
   746							      is_sk_fs ? &path : NULL);
   747		}
   748		if (!peer_sk)
   749			goto out;
   750	
   751		peer_addr = aa_sunaddr(unix_sk(peer_sk), &peer_addrlen);
   752	
   753		struct path peer_path;
   754	
   755		peer_path = unix_sk(peer_sk)->path;
   756		if (!is_sk_fs && is_unix_fs(peer_sk)) {
   757			last_error(error,
   758				   unix_fs_perm(op, request, subj_cred, label,
   759						is_unix_fs(peer_sk) ? &peer_path : NULL));
   760		} else if (!is_sk_fs) {
   761			struct aa_sk_ctx *pctx = aa_sock(peer_sk);
   762	
   763			rcu_read_lock();
 > 764			plabel = aa_get_newest_label(pctx->label);
   765			rcu_read_unlock();
   766			/* no fs check of aa_unix_peer_perm because conditions above
   767			 * ensure they will never be done
   768			 */
   769			last_error(error,
   770				xcheck(unix_peer_perm(subj_cred, label, op,
   771						      MAY_READ | MAY_WRITE, sock->sk,
   772						      is_sk_fs ? &path : NULL,
   773						      peer_addr, peer_addrlen,
   774						      is_unix_fs(peer_sk) ?
   775								&peer_path : NULL,
   776						      plabel),
   777				       unix_peer_perm(file->f_cred, plabel, op,
   778						      MAY_READ | MAY_WRITE, peer_sk,
   779						      is_unix_fs(peer_sk) ?
   780								&peer_path : NULL,
   781						      addr, addrlen,
   782						      is_sk_fs ? &path : NULL,
   783						      label)));
   784			if (!error && !__aa_subj_label_is_cached(plabel, label))
   785				update_peer_ctx(peer_sk, pctx, label);
   786		}
   787		sock_put(peer_sk);
   788	
   789	out:
   790	
   791		/* update peer cache to latest successful perm check */
   792		if (error == 0)
   793			update_sk_ctx(sock->sk, label, plabel);
   794		aa_put_label(plabel);
   795	
   796		return error;
   797	}
   798	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
