Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA2836308D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120592; cv=none; b=EbmZ1fc4VlYjMmsNkuKxiZ9cIkLrgWxmhN08L47QTZwXiaJlrjt6HkDpHnTAwO8R3GGJozyt5wCUbtqELzOptONczFHTBqwMMEj2pV97J4ilko0pmbcpmmiO4LON+zJpWNAZTcrshXkvD/zRMVqt7LRQtQyjDOiUA2RuvCbmANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120592; c=relaxed/simple;
	bh=VfCbDuLVwicV6y/zk26qKuKtNDkHSFgTmCokI8xPTh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNC1hGMPP9vVmHPoke9xYQKvFMHAwhv/LTmoz4iKVSuMGITu/1UVKhCw7Lq2oRseN9QXL4PMRZy6LTcZVNQ6iXajj4pvIii2rbi6ZJVOOS9cRHalppKl9SxFqKtFDMlEwcLRW0KjlpsFgQEkIlMV0dLoz07MLZwUXHcjmvPTtNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2+nn8//; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2+nn8//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782120591; x=1813656591;
  h=date:from:to:cc:subject:message-id;
  bh=VfCbDuLVwicV6y/zk26qKuKtNDkHSFgTmCokI8xPTh0=;
  b=A2+nn8//4JLUEZlMMMvJKkCzMHulnFoUZiUITr00kyrUF3YsgEUjs9Iq
   F1kH8GdtgUCk87uQ5JRupSC3yqJmY67wOme+rkSAprLi3mjk/1RsjVnPJ
   B8xqPnnVDg3FD+yWrKnpFZxzhQGPgrBUj5NwqRaSd0gJdsS89/Hckr023
   I+b3WIcC3UOdojxGoXGaDaZ7eJw6mNs8bWSezHoGlWEeFnIcVW7JVLL1k
   0T4vFttqYxeCMywhHyOaeAnL5gVMbXrKiBCbGl8BP4Z2UutcInBztsCAL
   F42X4+gkNSWQD4unJb/X2pE2phkWOn2xhRi10wxqnyjctoQBWqhtSRXOx
   w==;
X-CSE-ConnectionGUID: sJoFjArXS1iw1kM59HFR8A==
X-CSE-MsgGUID: VQ2DBPUsT1mPJ3cocE+0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93500782"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93500782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:29:50 -0700
X-CSE-ConnectionGUID: yO6DqO12T0aturO1MyX1zw==
X-CSE-MsgGUID: Rlg8k0URSrOlUHypNJCjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249235265"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 02:29:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbayQ-000000000tM-2KVN;
	Mon, 22 Jun 2026 09:29:46 +0000
Date: Mon, 22 Jun 2026 17:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13069/14705]
 security/apparmor/af_unix.c:764:50: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202606221759.PO245n0z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ce97bd3c4f18608335e709c24d6a40e7036cab8
commit: 4483efe4f21510b30c24bc97d9fd0e8feab94125 [13069/14705] apparmor: fix shadowing of plabel that prevents cache from being updated
config: powerpc-randconfig-r122-20260615 (https://download.01.org/0day-ci/archive/20260622/202606221759.PO245n0z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221759.PO245n0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221759.PO245n0z-lkp@intel.com/

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
